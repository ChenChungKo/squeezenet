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


// the top MUX that selects requests between load and store

module lsu_ic_hybrid (
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
parameter UNBALANCE = 0;
parameter DEVICE =  "Stratix V";


localparam FIFO_AW = $clog2(FIFO_DEPTH);
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQUEST_FIFO_AW = 8;
localparam REQUEST_FIFO_DEPTH = 2**REQUEST_FIFO_AW;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W;
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH_WIDER = (REQ_WIDTH_WRITE >  REQ_WIDTH_READ)?  REQ_WIDTH_WRITE : REQ_WIDTH_READ;
localparam REQ_WIDTH = REQ_WIDTH_WIDER;

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
output                           o_avm_read;          
output                           o_avm_write;
output     [BURST_CNT_W-1:0]     o_avm_burstcount;           
output     [MWIDTH-1:0]          o_avm_readdata;     
output                           o_avm_readdatavalid   [2];     
input     [MWIDTH-1:0]           i_avm_writedata [2];
output    [MWIDTH-1:0]           o_avm_writedata;
output    [ID_WIDTH-1:0]         o_id;


generate

if(UNBALANCE) begin : GEN_UNBALANCE
  lsu_ic_unbalance #(
     .AWIDTH(AWIDTH),
     .MWIDTH_BYTES(MWIDTH_BYTES),
     .BURST_CNT_W(BURST_CNT_W),
     .ID_WIDTH(ID_WIDTH),
     .FIFO_DEPTH(FIFO_DEPTH),
     .FIFO_AF_THRESH(FIFO_AF_THRESH),
     .PIPELINE_RD_RETURN(PIPELINE_RD_RETURN),
     .DEVICE(DEVICE)
   ) lsu_ic_unbalance (
    .clk                (clk),
    .reset              (reset),
    .i_id               (i_id),
    .i_avm_waitrequest  (i_avm_waitrequest),
    .i_avm_byteenable   (i_avm_byteenable),
    .i_avm_address      (i_avm_address),
    .i_avm_read         (i_avm_read),
    .i_avm_write        (i_avm_write),
    .i_avm_burstcount   (i_avm_burstcount),
    .i_avm_readdata     (i_avm_readdata),
    .i_avm_return_valid (i_avm_return_valid),
    .o_avm_waitrequest  (o_avm_waitrequest),
    .o_avm_byteenable   (o_avm_byteenable),
    .o_avm_address      (o_avm_address),
    .o_avm_read         (o_avm_read),
    .o_avm_write        (o_avm_write),
    .o_avm_burstcount   (o_avm_burstcount),
    .o_avm_readdata     (o_avm_readdata),
    .o_avm_readdatavalid(o_avm_readdatavalid),
    .i_avm_writedata    (i_avm_writedata),
    .o_avm_writedata    (o_avm_writedata),
    .o_id               (o_id)
  );  
end
else begin : GEN_NORMAL
  wire [REQ_WIDTH-1:0]             i_req [2];
  wire                             i_avm_request [2];
  wire                             switch;
  reg                              wr_port;  
  wire [BURST_CNT_W-1:0]           wr_burstcount;
  wire                             rd_en;
  wire [AWIDTH-1:0]                fin_avm_address ;
  wire [BURST_CNT_W-1:0]           fin_avm_burstcount ;
  wire [MWIDTH-1:0]                fin_avm_data ;
  wire [MWIDTH_BYTES-1:0]          fin_avm_byteenable ;
  wire [ID_WIDTH-1:0]              fin_id;
  reg  [REQ_WIDTH-1:0]             fin ;
  reg                              fin_valid;      
  wire                             valid_request;        
  reg                              o_avm_request;         
  reg                              avm_read, avm_write;
  reg  [0:1]                       avm_waitrequest;
  reg  [REQ_WIDTH-1:0]             request_dout;
  
  assign rd_en = !o_avm_request |  i_avm_waitrequest === 1'b0; // "===" is used to avoid 'X' propagation in datapath when i_avm_waitrequest from other module is 'x'
  assign switch = !i_avm_request[wr_port];
  assign valid_request = fin_valid | i_avm_request[wr_port];
  
  assign i_avm_request[0] = i_avm_read[0];
  assign i_avm_request[1] = i_avm_write[1];
  assign o_avm_waitrequest[0] = avm_waitrequest[0];
  assign o_avm_waitrequest[1] = avm_waitrequest[1];
  assign o_avm_read = avm_read;
  assign o_avm_write = avm_write;
  assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_avm_writedata[0], i_avm_byteenable[0], i_id[0]};
  assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_avm_writedata[1], i_avm_byteenable[1], i_id[1]};
  assign {fin_avm_address, fin_avm_burstcount, fin_avm_data, fin_avm_byteenable, fin_id} = fin;                                                
  assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout;           
    
  always @(posedge clk) begin
    if(i_avm_request[wr_port] & !avm_waitrequest[wr_port]) fin <= i_req[wr_port];    
    if(rd_en & valid_request) request_dout <= fin_valid? fin : i_req[wr_port];      
  end
  
  always @(posedge clk or posedge reset) begin 
    if(reset) begin
      wr_port <= 1'b0;     
      avm_read <= 1'b0;      
      avm_write <= 1'b0;               
      fin_valid <= 1'b0;        
      o_avm_request <= 1'b0;
      avm_waitrequest <= 2'b0;
    end    
    else begin       
      if(!rd_en & i_avm_request[wr_port] & !avm_waitrequest[wr_port]) fin_valid <= 1'b1;
      else if(rd_en) fin_valid <= 1'b0;
      if(rd_en) begin
        avm_read <= valid_request & !wr_port;  
        avm_write <= valid_request & wr_port;  
        o_avm_request <= valid_request;  
      end  
      
      if(!rd_en & valid_request) avm_waitrequest[wr_port] <= 1'b1;
      else if(!switch) avm_waitrequest[wr_port] <= 1'b0;   
      else begin 
        wr_port <= !wr_port;
        avm_waitrequest[wr_port] <= 1'b1;
        avm_waitrequest[!wr_port] <= 1'b0;
      end
    end 
  end 
end
endgenerate

endmodule 
