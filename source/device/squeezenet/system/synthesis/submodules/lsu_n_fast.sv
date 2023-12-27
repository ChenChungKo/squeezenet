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


// This block is used for load ring.
// The datapath for load ring is much narrower compared with store ring
// In most cases, it does not need a group of 2-to-1 MUX to pipeline the selected request.
// Instead, a N-to-1 one clock cycle delay MUX is enough.
// It is optional, enabled by setting lsu_ic_top.ENABLE_READ_FAST
// Please see the comments on RESET_PIPE_DEPTH. If the RESET_PIPE_DEPTH of lsu_token_ring is increased, it must be increased here too.


module lsu_n_fast (
  clk,
  reset,
  i_token,
  i_ext_id,
  i_ext_address,
  i_ext_read,        
  i_ext_burstcount,
  o_ext_waitrequest,  
  i_avm_waitrequest, 
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,        
  i_avm_write,        
  i_avm_burstcount,
  o_avm_waitrequest, 
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,       
  o_avm_write,    
  o_avm_request,
  o_avm_burstcount,
  o_id,
  o_token,
  // write
  i_avm_writedata,
  o_avm_writedata
);

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;                             
parameter NUM_PORT = 10; 
parameter NUM_DIMM = 2;
parameter START_ID = 0;
parameter READ = 1;   
parameter ENABLE_DATA_REORDER = 0;
parameter OPEN_RING = 0;  
parameter START_ACTIVE = 0;
parameter ID_WIDTH = (NUM_PORT+START_ID == 1 )? 1 : $clog2(NUM_PORT+START_ID);
parameter ENABLE_LAST_WAIT = 0;
parameter  HIGH_FMAX = 0;                      // 1 = optimized, highly pipelined mode, only sclrs (no aclrs) at the expense of area.

localparam MWIDTH=8*MWIDTH_BYTES;
localparam DIMM_W = $clog2(NUM_DIMM);
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W + ID_WIDTH;          
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH = READ? REQ_WIDTH_READ : REQ_WIDTH_WRITE;


input                            clk;  
input                            reset;   // reset is synchronous if HIGH_FMAX==1, asynchronous otherwise
// from another open ring part
input      [ID_WIDTH-1:0]        i_ext_id;
input      [AWIDTH-1:0]          i_ext_address;
input                            i_ext_read;        
input      [BURST_CNT_W-1:0]     i_ext_burstcount;
// from LSUs
input                            i_token;
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [NUM_PORT];     
input      [AWIDTH-1:0]          i_avm_address         [NUM_PORT];     
input                            i_avm_read            [NUM_PORT];     
input                            i_avm_write           [NUM_PORT];   
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [NUM_PORT];  
// to LSUs
output    reg                    o_avm_waitrequest     [NUM_PORT];   
output    reg                    o_token;
// from memory
input                            i_avm_waitrequest [NUM_DIMM];     
// to another open ring
output    reg                    o_ext_waitrequest [NUM_DIMM]; // delayed i_avm_waitrequest
// to memory 
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output                           o_avm_read;
output                           o_avm_write;               
output                           o_avm_request;  
output     [BURST_CNT_W-1:0]     o_avm_burstcount;
output     [ID_WIDTH-1:0]        o_id;
// write
input     [MWIDTH-1:0]           i_avm_writedata [NUM_PORT];
output    [MWIDTH-1:0]           o_avm_writedata;

localparam RESET_TYPE = HIGH_FMAX? "SYNC" : "ASYNC";

integer i;
genvar z, z0;
wire i_avm_request  [NUM_PORT];   
wire [ID_WIDTH-1:0] i_id [NUM_PORT];      
wire [REQ_WIDTH-1:0] i_req [NUM_PORT];  
wire [REQ_WIDTH-1:0] ext_req;     
reg  active;
reg  [ID_WIDTH-1:0]  ptr;    
wire [REQ_WIDTH-1:0] request_dout;
wire [0:NUM_DIMM-1] backpressure_stall [NUM_PORT];
wire backpressure [NUM_PORT]; 
reg  avm_read [NUM_PORT];
reg  avm_write [NUM_PORT];
reg  avm_request [NUM_PORT];
wire avm_read_wire;
wire avm_write_wire;
wire avm_request_wire;                
reg  avm_read_p;        
reg  avm_write_p;       
reg  avm_request_p;     
reg  [BURST_CNT_W-1:0] wr_cnt; 
reg  wr_burst_done;
wire pass_token;

localparam  NUM_RESET_COPIES = 1;
/* Longer pipe depth to hold this module in reset longer than the rest of the interconnect ("Rest of the interconnect" is defined as everything other than lsu_n_fast and lsu_ic_token. If the RESET_PIPE_DEPTH
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

assign avm_read_wire    = active & !o_avm_waitrequest[ptr] & i_avm_read[ptr];       
assign avm_write_wire   = active & !o_avm_waitrequest[ptr] & i_avm_write[ptr];      
assign avm_request_wire = active & !o_avm_waitrequest[ptr] & i_avm_request[ptr];   
assign ext_req = {i_ext_address, i_ext_burstcount, {MWIDTH{1'b0}}, {MWIDTH_BYTES{1'b1}}, i_ext_id};   

always @(posedge clk or posedge arst) begin 
  if(arst) begin 
    avm_read_p    <= 1'b0;
    avm_write_p   <= 1'b0;
    avm_request_p <= 1'b0;         
     for(i=0; i<NUM_DIMM; i=i+1) begin
      o_ext_waitrequest[i] <= 1'b0;
    end
    for(i=0; i<NUM_PORT; i=i+1) begin
      avm_read[i] <= 0;
      avm_write[i] <= 0;
      avm_request[i] <= 0;
    end    
  end
  else begin  
    avm_read_p    <= avm_read_wire;      
    avm_write_p   <= avm_write_wire;    
    avm_request_p <= avm_request_wire;  
    for(i=0; i<NUM_DIMM; i=i+1) begin
      o_ext_waitrequest[i] <= i_avm_waitrequest[i];
    end
    
    for(i=0; i<NUM_PORT; i=i+1) begin
      if(active & i==ptr) begin
        avm_read[i]    <=  avm_read_wire;  
        avm_write[i]   <=  avm_write_wire;  
        avm_request[i] <=  avm_request_wire;
      end
      else if(i>0) begin
        avm_read[i]  <= avm_read[i-1];
        avm_write[i] <= avm_write[i-1];
        avm_request[i] <= avm_request[i-1];
      end
      else begin
        avm_read[0]  <= i_ext_read;
        avm_write[0] <= 1'b0;
        avm_request[0] <= i_ext_read;
      end
    end
    // synchronous reset (these assignments override the assignments above if srst is asserted)
    if(srst[0]) begin 
      avm_read_p    <= 1'b0;
      avm_write_p   <= 1'b0;
      avm_request_p <= 1'b0;         
       for(i=0; i<NUM_DIMM; i=i+1) begin
        o_ext_waitrequest[i] <= 1'b0;
      end
      for(i=0; i<NUM_PORT; i=i+1) begin
        avm_read[i] <= 0;
        avm_write[i] <= 0;
        avm_request[i] <= 0;
      end    
    end    
  end
end


generate
if(ENABLE_LAST_WAIT) begin : GEN_ENABLE_LAST_WAIT  
  always @(posedge clk or posedge arst) begin 
    if(arst) begin
      ptr <= 0;
      active <= START_ACTIVE;
      o_avm_waitrequest[0] <= 1'b1; // Stall the LSU while in reset
      for(i=1; i<NUM_PORT; i=i+1) o_avm_waitrequest[i] <= 1'b1;      
      o_token <= 1'b0;
    end
    else begin
      o_token <= 1'b0;    
      if(i_token) active <= 1'b1;        
      if(pass_token) begin           
        if(ptr == NUM_PORT-1) begin if (!o_avm_waitrequest[NUM_PORT-1] | !active & !i_token) ptr <= '0;end
        else if(active) ptr <= ptr + 1'b1;
        if(ptr == NUM_PORT-1 & !o_avm_waitrequest[NUM_PORT-1]) begin
          o_token <= active;
          active <= !OPEN_RING; 
        end
      end 
      
      for(i=0; i<NUM_PORT; i=i+1) begin
        if(i==ptr) o_avm_waitrequest[i] <= !active & !i_token | backpressure[i] | ((ptr < NUM_PORT - 1)? !i_avm_request[i] : !i_avm_request[i] & !o_avm_waitrequest[i]);     
        else o_avm_waitrequest[i] <= 1'b1;
      end
      // synchronous reset (these assignments override the assignments above if srst is asserted)
      if(srst[0]) begin
        ptr <= 0;
        active <= START_ACTIVE;
        o_avm_waitrequest[0] <= 1'b1; // Stall the LSU while in reset
        for(i=1; i<NUM_PORT; i=i+1) o_avm_waitrequest[i] <= 1'b1;      
        o_token <= 1'b0;
      end      
    end 
  end  
end
else begin : GEN_DISABLE_LAST_WAIT
  always @(posedge clk or posedge arst) begin 
    if(arst) begin
      ptr <= 0;
      active <= START_ACTIVE;
      o_avm_waitrequest[0] <= 1'b1; // Stall the LSU while in reset
      for(i=1; i<NUM_PORT; i=i+1) o_avm_waitrequest[i] <= 1'b1;
      o_token <= 1'b0;
    end
    else begin
      o_token <= 1'b0;    
      if(i_token) active <= 1'b1;       
      if(pass_token) begin
        if(ptr == NUM_PORT - 1) begin
          o_token <= active | i_token;
          active <= !OPEN_RING; 
          ptr <= '0;
        end
        else if(active) ptr <= ptr + 1'b1;
      end         
      
      for(i=0; i<NUM_PORT; i=i+1) begin
        if(i==ptr) o_avm_waitrequest[i] <= !active & !i_token | backpressure[i] | pass_token;     
        else o_avm_waitrequest[i] <= 1'b1;
      end
      // synchronous reset (these assignments override the assignments above if srst is asserted)
      if(srst[0]) begin
        ptr <= 0;
        active <= START_ACTIVE;
        o_avm_waitrequest[0] <= 1'b1; // Stall the LSU while in reset
        for(i=1; i<NUM_PORT; i=i+1) o_avm_waitrequest[i] <= 1'b1;
        o_token <= 1'b0;
      end      
    end 
  end
end
  
for(z=0; z<NUM_PORT; z=z+1) begin : GEN_STALL
  if(NUM_DIMM > 1 & !ENABLE_DATA_REORDER) begin : GEN_MULTIPLE_DIMM
    for(z0=0; z0<NUM_DIMM; z0=z0+1) begin : GEN_
      assign backpressure_stall[z][z0] = i_avm_waitrequest[z0] & i_avm_address[z][AWIDTH-1:AWIDTH-DIMM_W] == z0;   
    end
  end
  else begin : GEN_SINGLE_DIMM
    for(z0=0; z0<NUM_DIMM; z0=z0+1) begin : GEN_
      assign backpressure_stall[z][z0] = i_avm_waitrequest[z0];
    end
  end
  assign backpressure[z] = |backpressure_stall[z];
  assign i_avm_request[z] = i_avm_read[z] | i_avm_write[z];
end
if(READ) begin : ENABLE_READ    
  assign pass_token = !i_avm_request[ptr] | backpressure[ptr];
  for(z=0; z<NUM_PORT; z=z+1) begin : GEN_I_DATA  
    assign i_id[z] = START_ID + z;
    assign i_req[z] = {i_avm_address[z], i_avm_burstcount[z], i_id[z]};   
    assign {o_avm_address, o_avm_burstcount, o_id} = request_dout;
    assign o_avm_byteenable = {MWIDTH_BYTES{1'b1}};    
  end
end
else begin : ENABLE_WRITE 
  assign pass_token = active & (!i_avm_request[ptr] | backpressure[ptr] & wr_burst_done);
  for(z=0; z<NUM_PORT; z=z+1) begin : GEN_I_DATA         
    assign i_id[z] = START_ID + z;      
    assign i_req[z] = {i_avm_address[z], i_avm_burstcount[z], i_avm_writedata[z], i_avm_byteenable[z], i_id[z]};                     
    assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout;        
  end
  always @(posedge clk or posedge arst) begin 
    if(arst) begin 
      wr_cnt <= 1;
      wr_burst_done <= 1'b1;
    end    
    else begin
      if(avm_write_wire) begin
        wr_cnt <= (wr_cnt == i_avm_burstcount[ptr])? 1 : wr_cnt + 1'b1;     
        if(!o_avm_waitrequest[ptr] & wr_cnt == i_avm_burstcount[ptr] & backpressure[ptr])  wr_burst_done <= 1'b1;  // make sure that token is not passed to the next LSU until the burst write is fully processed for the current one       
        else wr_burst_done <= 1'b0;                   
      end
      else if(!backpressure[ptr] &  i_token) begin
        wr_burst_done  <= 1'b0;
      end
      // synchronous reset (these assignments override the assignments above if srst is asserted)      
      if(srst[0]) begin 
        wr_cnt <= 1;
        wr_burst_done <= 1'b1;
      end        
    end
  end // end always
end

reg  [REQ_WIDTH-1:0] R_req;
assign request_dout = R_req;
assign o_avm_read = avm_read_p;
assign o_avm_write = avm_write_p;
assign o_avm_request = avm_request_p;
always @(posedge clk) begin
  R_req <= i_req[ptr];  // N-to-1 MUX
end

endgenerate

endmodule
