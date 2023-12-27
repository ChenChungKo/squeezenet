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


module lsu_ic_unbalance (
  clk,
  reset,
  i_id,  
  i_avm_waitrequest, 
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,   
  i_avm_write, 
  i_avm_burstcount,
  i_avm_readdata, 
  i_avm_return_valid,  
  o_avm_waitrequest, 
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,
  o_avm_write,
  o_avm_burstcount,
  o_avm_readdata, 
  o_avm_readdatavalid, 
  o_id,  
  // write
  i_avm_writedata,
  o_avm_writedata
);      

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;   
parameter ID_WIDTH = 1;
parameter FIFO_DEPTH = 64;  
parameter FIFO_AF_THRESH = FIFO_DEPTH - 8;
parameter PIPELINE_RD_RETURN = 0;
parameter DEVICE =  "Stratix V";


localparam FIFO_AW = $clog2(FIFO_DEPTH);
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQUEST_FIFO_AW = 8;
localparam REQUEST_FIFO_DEPTH = 2**REQUEST_FIFO_AW;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W;
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH_WIDER = (REQ_WIDTH_WRITE >  REQ_WIDTH_READ)?  REQ_WIDTH_WRITE : REQ_WIDTH_READ;
localparam REQ_WIDTH = REQ_WIDTH_WIDER + 1;

input                            clk;  
input                            reset;   
input      [ID_WIDTH-1:0]        i_id [2];
input                            i_avm_waitrequest;     
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [2];     
input      [AWIDTH-1:0]          i_avm_address         [2];     
input                            i_avm_read            [2];     
input                            i_avm_write           [2];   
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [2];     
input      [MWIDTH-1:0]          i_avm_readdata;     
input                            i_avm_return_valid;     
output                           o_avm_waitrequest     [2];     
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output     reg                   o_avm_read;          
output     reg                   o_avm_write;
output     [BURST_CNT_W-1:0]     o_avm_burstcount;           
output     reg [MWIDTH-1:0]      o_avm_readdata;     
output     reg                   o_avm_readdatavalid   [2];     
input     [MWIDTH-1:0]           i_avm_writedata [2];
output    [MWIDTH-1:0]           o_avm_writedata;
output    [ID_WIDTH-1:0]         o_id;

wire [REQ_WIDTH-1:0]             i_req [2];                
wire                             i_avm_request [2];
reg                              R_i_waitrequest, port_to_fifo;
reg  [BURST_CNT_W-1:0]           wr_cnt;
reg                              wr_finish;
reg                              wr_port; 
reg  [BURST_CNT_W-1:0]           cnt;
wire                             rd_enable;
wire                             fifo_stall;
reg                              R_rd_fifo, port_valid;
wire                             rd_fifo;
wire                             port;  
wire [BURST_CNT_W-1:0]           burst_cnt;
wire                             fifo_empty, fifo_af;
wire                             o_avm_read_en;     
reg  [REQ_WIDTH-1:0]             request_dout;

assign i_avm_request[0] = i_avm_read[0] | i_avm_write[0];
assign i_avm_request[1] = i_avm_read[1] | i_avm_write[1];
assign fifo_stall = !i_avm_return_valid;
assign rd_enable = cnt == burst_cnt & !(R_rd_fifo & burst_cnt > 1);    
assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_avm_writedata[0], i_avm_byteenable[0], i_id[0], i_avm_read[0]} ;
assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_avm_writedata[1], i_avm_byteenable[1], i_id[1], i_avm_read[1]} ;                                                       
assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout[REQ_WIDTH-1:1];         


assign o_avm_waitrequest[0] = wr_port | i_avm_request[1] | R_i_waitrequest;
assign o_avm_waitrequest[1] = R_i_waitrequest; // port [1] has priority

always @(posedge clk) begin    
  o_avm_readdata <= i_avm_readdata;  
  request_dout <= i_avm_request[1]? i_req[1] : i_req[0];
  port_to_fifo <= i_avm_request[1]; 
end


always @(posedge clk or posedge reset) begin 
  if(reset) begin
    wr_port <= 1'b1;
    wr_cnt <= 1;
    wr_finish <= 1'b1;
    R_i_waitrequest <= 1'b0;
    o_avm_read <= 1'b0;                 
    o_avm_write <= 1'b0;
  end    
  else begin   
    R_i_waitrequest <= i_avm_waitrequest | fifo_af;    
    if(i_avm_request[1]) begin
      if(i_avm_write[1]) begin
        wr_cnt <= (wr_cnt == i_avm_burstcount[1])? 1 : wr_cnt + 1'b1;
        wr_finish <= wr_cnt == i_avm_burstcount[1];
      end
      wr_port <= 1'b1;
    end    
    else if(wr_finish & i_avm_request[0]) begin
      wr_port <= 1'b0;
    end   
    o_avm_read  <= i_avm_read[1] | i_avm_read[0] & !o_avm_waitrequest[0];    
    o_avm_write <= i_avm_write[1] | i_avm_write[0] & !o_avm_waitrequest[0];    
  end 
end   
                               

// read back
always @(posedge clk or posedge reset) begin
  if(reset) begin
    cnt <= 0;    
    R_rd_fifo <= 1'b0;   
    port_valid <= 1'b0;
    o_avm_readdatavalid[0] <= 1'b0;
    o_avm_readdatavalid[1] <= 1'b0;                       
  end
  else begin        
    R_rd_fifo <= rd_fifo & !fifo_empty;
    
    if(rd_fifo & !fifo_empty) port_valid <= 1'b1;
    else if(cnt == burst_cnt & i_avm_return_valid & fifo_empty) port_valid <= 1'b0; 
    
    if(rd_fifo & !fifo_empty) begin cnt <= 1; end
    else if(i_avm_return_valid & cnt < burst_cnt) cnt <= cnt + 1;       
    
    o_avm_readdatavalid[0] <= i_avm_return_valid === 1'b1 & !port;
    o_avm_readdatavalid[1] <= i_avm_return_valid === 1'b1 &  port; 
  end
end
   
  
generate
if(PIPELINE_RD_RETURN) begin : GEN_PIPELINE_RETURN
  assign rd_fifo = i_avm_return_valid & cnt == burst_cnt |  !port_valid;
  scfifo #(
    .add_ram_output_register ( "ON"),
    .intended_device_family ( DEVICE),
    .lpm_numwords (FIFO_DEPTH),  
    .lpm_widthu (FIFO_AW),
    .lpm_showahead ( "OFF"),
    .lpm_type ( "scfifo"),
    .lpm_width (1+BURST_CNT_W),  
    .almost_full_value(FIFO_AF_THRESH),
    .overflow_checking ( "OFF"),
    .underflow_checking ( "ON"),
    .use_eab ( "ON")
  ) burst_cnt_fifo (
    .clock (clk),
    .data ({port_to_fifo, o_avm_burstcount}), 
    .wrreq (o_avm_read),
    .rdreq (rd_fifo),  
    .empty (fifo_empty), 
    .q ({port, burst_cnt}),
    .almost_full (fifo_af), 
    .aclr (reset)
  );    
end
else begin : GEN_DISABLE_PIPELINE_RD_RETURN
  assign fifo_af  = 1'b0;
end
endgenerate


endmodule 
