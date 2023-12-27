// (C) 1992-2018 Intel Corporation.                            
// Intel, the Intel logo, Intel, MegaCore, NIOS II, Quartus and TalkBack words    
// and logos are trademarks of Intel Corporation or its subsidiaries in the U.S.  
// and/or other countries. Other marks and brands may be claimed as the property  
// of others. See Trademarks on intel.com for full list of Intel trademarks or    
// the Trademarks & Brands Names Database (if Intel) or See www.Intel.com/legal (if Altera) 
// Your use of Intel Corporation's design tools, logic functions and other        
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Intel MegaCore Function License Agreement, or other applicable      
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Intel and sold by    
// Intel or its authorized distributors.  Please refer to the applicable          
// agreement for further details.                                                 


// This is a basic block in token ring. It has two sets of input signals: one set is from a LSU; and the other is from the previous lsu_ic_token it connects to.
// The output is registered. It selects the input based on if it owns token. 
// Token is passed to the next lsu_ic_token block if it owns th token and the LSU it serves has no active request.  
// Please see the comments on RESET_PIPE_DEPTH. If the RESET_PIPE_DEPTH of lsu_token_ring is increased, it must be increased here too.

module lsu_ic_token (
  clk,
  reset,
  i_token,
  i_id,  
  i_avm_waitrequest, // backpressure from root FIFO
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,  
  i_avm_write,
  i_avm_burstcount,
  o_avm_waitrequest_0, 
  o_avm_waitrequest_1,
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,
  o_avm_write,
  o_avm_burstcount,
  o_id,
  o_index,
  o_token,
  o_active,
  // write
  i_avm_writedata,
  o_avm_writedata
);      

parameter AWIDTH=32;           
parameter NUM_DIMM = 1;         
parameter MWIDTH_BYTES=64;     
parameter BURST_CNT_W=6;   
parameter READ = 1; 
parameter START_ACTIVE = 0;
parameter ID_WIDTH = 1;
parameter FIFO_DEPTH = 64;  
parameter ENABLE_LAST_WAIT = 0;
parameter ENABLE_DATA_REORDER = 0;
parameter HIGH_FMAX = 0;

localparam RESET_TYPE = HIGH_FMAX ? "SYNC" : "ASYNC";
localparam FIFO_AW = $clog2(FIFO_DEPTH);
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQUEST_FIFO_AW = 8;
localparam REQUEST_FIFO_DEPTH = 2**REQUEST_FIFO_AW;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W + ID_WIDTH;          
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH_WIDER = (REQ_WIDTH_WRITE >  REQ_WIDTH_READ)?  REQ_WIDTH_WRITE : REQ_WIDTH_READ;
localparam REQ_WIDTH = (READ? REQ_WIDTH_READ : REQ_WIDTH_WRITE);
localparam DIMM_W = $clog2(NUM_DIMM);

input                            clk;  
input                            reset;   // reset is synchronous if (HIGH_FMAX=1), asynchronous otherwise
input                            i_token;
input      [ID_WIDTH-1:0]        i_id [2];
input                            i_avm_waitrequest     [NUM_DIMM];     
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [2];     
input      [AWIDTH-1:0]          i_avm_address         [2];     
input                            i_avm_read            [2];     
input                            i_avm_write           [2];    
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [2];      
output     reg                   o_avm_waitrequest_0   [NUM_DIMM];     
output     reg                   o_avm_waitrequest_1;  
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;   
output     reg                   o_avm_read;               
output     reg                   o_avm_write;          
output     [BURST_CNT_W-1:0]     o_avm_burstcount;           
input      [MWIDTH-1:0]          i_avm_writedata[2];
output     [MWIDTH-1:0]          o_avm_writedata;
output     [ID_WIDTH-1:0]        o_id;
output     reg                   o_token;
output                           o_active;
output     reg [ID_WIDTH-1:0]    o_index;


integer i;
genvar z;
reg                              active;
wire      [REQ_WIDTH-1:0]        i_req [2];              
reg       [REQ_WIDTH-1:0]        request_dout;
wire      [0:NUM_DIMM-1]         backpressure;  
wire                             backpressure_stall;  
wire                             pass_token;

localparam  NUM_RESET_COPIES = 1;
/* Longer pipe depth to hold this module in reset longer than the rest of the interconnect. ("Rest of the interconnect" is defined as everything other than lsu_n_fast and lsu_ic_token. If the RESET_PIPE_DEPTH
    of the rest of the interconnect increases, it must be increased here too).
    During reset, the LSUs are waitrequested (stalled) so staying in reset longer ensures that when we come out of reset
    and begin accepting requests from the LSU that the rest of the interconnect is ready to accept these requests.
*/
localparam  RESET_PIPE_DEPTH = 25;  
logic [NUM_RESET_COPIES-1:0]srst_pipe_out;
  
acl_fanout_pipeline #(
  .PIPE_DEPTH (RESET_PIPE_DEPTH),
  .NUM_COPIES (NUM_RESET_COPIES)
)
 local_reset_fanout_pipeline (
  .clk(clk),
  .in(reset),
  .out(srst_pipe_out)
);    

logic [NUM_RESET_COPIES-1:0]srst; // synchronous reset
logic arst; // asynchronous reset

// connect either arst or srst to the input reset signal, tie the other off to a constant so it will get synthesized away
generate
  if (RESET_TYPE=="ASYNC") begin
     assign arst = reset;
     assign srst = '0;
  end else begin  // Synchronous reset
     assign arst = 1'b0;
     assign srst = srst_pipe_out;
  end
endgenerate


assign o_active = active;  
// Stall if any bank is stalling us
assign backpressure_stall = |backpressure;
  
always @(posedge clk) begin
  request_dout <= active? i_req[1] : i_req[0];      
end

always @(posedge clk or posedge arst) begin 
  if(arst) begin
    for(i=0; i<NUM_DIMM; i=i+1) o_avm_waitrequest_0[i] <= 1'b0;
    o_avm_waitrequest_1 <= !START_ACTIVE;             
    o_avm_read <= 1'b0;
    o_avm_write <= 1'b0;
    active <= START_ACTIVE;
    o_token <= 1'b0;
    o_index <= '0;
  end    
  else begin       
    o_token <= 1'b0;      
    if(ENABLE_LAST_WAIT) begin
      if(i_token) begin
        active <= 1'b1; 
        o_index <= i_id[1];
      end   
      else if(active) begin
        o_token <= pass_token;
        active <= !pass_token;
        if(pass_token) o_index <= '0;
      end
    end
    else begin
      if(pass_token) begin
        active <= 1'b0;
        o_token <= active | i_token;  // Pass the token along.
        o_index <= '0;
      end
      else if(i_token)  begin
        active <= 1'b1;
        o_index <= i_id[1];
      end
    end
    o_avm_waitrequest_0  <= i_avm_waitrequest; // pass the backpressure to the next node
    // Waitrequest backpressure to the LSU if we don't have the token, or if we're stalled, or if we're about to pass the token
    o_avm_waitrequest_1 <= !active & (!i_token | ENABLE_LAST_WAIT == 0) | backpressure_stall | pass_token & active;               
    o_avm_read  <= active & !o_avm_waitrequest_1 & i_avm_read[1] | i_avm_read[0];  
    o_avm_write <= active & !o_avm_waitrequest_1 & i_avm_write[1] | i_avm_write[0];  

    // synchronous reset (these assignments override the assignments above if srst is asserted)
    if(srst[0]) begin
      for(i=0; i<NUM_DIMM; i=i+1) o_avm_waitrequest_0[i] <= 1'b0;
      o_avm_waitrequest_1 <= 1'b1;  // Stall the LSU while the interconnect is in reset          
      o_avm_read <= 1'b0;
      o_avm_write <= 1'b0;
      active <= START_ACTIVE;
      o_token <= 1'b0;
      o_index <= '0;
    end  

  end
end

generate
  if(NUM_DIMM > 1 & !ENABLE_DATA_REORDER & READ) begin : GEN_MULTIPLE_STALL
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
      assign backpressure[z] = i_avm_waitrequest[z] & i_avm_address[1][AWIDTH-1:AWIDTH-DIMM_W] == z;      
    end
  end
  else begin : GEN_SINGLE_STALL
    // Create a backpressure signal, per bank.
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
      assign backpressure[z] = i_avm_waitrequest[z];
    end
  end
  if(READ) begin : ENABLE_READ    
    // Pass the token if the connnect LSU has no requests to issue or if we're stalled
    assign pass_token = !i_avm_read[1] | backpressure_stall;
    assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_id[0]};
    assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_id[1]};  
    assign {o_avm_address, o_avm_burstcount, o_id} = request_dout;
    assign o_avm_byteenable = {MWIDTH_BYTES{1'b1}};    
  end
  else begin : ENABLE_WRITE        
    assign pass_token = !i_avm_write[1];
    assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_avm_writedata[0], i_avm_byteenable[0], i_id[0]} ;
    assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_avm_writedata[1], i_avm_byteenable[1], i_id[1]} ;                                                 
    assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout;    
  end
endgenerate
endmodule
