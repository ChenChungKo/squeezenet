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


// This module is used for sw-dimm-partiton. 
// It has two features: 
// [1] data reordering is disabled 
// [2] each load LSU has a counter to make sure bank switch is allowed to happen only when all the previous requests have returned.

module lsu_swdimm_token_ring (
  clk,
  reset,
  // from LSU
  i_rd_byteenable,
  i_rd_address, 
  i_rd_request,          
  i_rd_burstcount,  
  i_wr_byteenable,
  i_wr_address, 
  i_wr_request,          
  i_wr_burstcount,
  i_wr_writedata,  
  // from MEM
  i_avm_waitrequest,
  i_avm_readdata, 
  i_avm_return_valid,        
  // to MEM  
  o_id,              
  o_avm_byteenable,          
  o_avm_address,              
  o_avm_read,        
  o_avm_write,             
  o_avm_burstcount,
  o_avm_writedata,
  // to kernel
  o_rd_waitrequest,
  o_wr_waitrequest,
  o_avm_readdata,
  o_avm_readdatavalid,
  o_avm_writeack
);


parameter AWIDTH = 32;            
parameter MWIDTH_BYTES = 64;     
parameter BURST_CNT_W = 5;          
parameter NUM_RD_PORT = 2;
parameter NUM_WR_PORT = 2;
parameter NUM_DIMM = 1;
parameter DISABLE_ROOT_FIFO = 0;
parameter MAX_MEM_DELAY = 64;
parameter ENABLE_READ_FAST = 0;
parameter HIGH_FMAX = 0;                   // 1 = optimized, highly pipelined mode, at the expense of area.
parameter ROOT_FIFO_AW = 8;               // Token root FIFO address width; FIFO depth = 2**ROOT_FIFO_AW
parameter RD_ROOT_FIFO_AW = 7; 
parameter ENABLE_DUAL_RING = 0;   
parameter ENABLE_MULTIPLE_WR_RING = 0;
parameter ENABLE_LAST_WAIT = 0;
parameter  PIPELINE_RD_RETURN = 0;            // 1 = Route the read-return data to the LSUs in a pipelined vine (may help with performance). 0 = fan-out to all LSUs.

localparam RESET_TYPE = HIGH_FMAX ? "SYNC" : "ASYNC";
localparam MWIDTH=8*MWIDTH_BYTES;
localparam NUM_ID = NUM_RD_PORT+NUM_WR_PORT;
localparam NUM_DIMM_W = $clog2(NUM_DIMM);
localparam RD_ID_WIDTH = (NUM_RD_PORT==1)?  1 : $clog2(NUM_RD_PORT);
localparam WR_ID_WIDTH = (NUM_WR_PORT==1)?  1 : $clog2(NUM_WR_PORT);
localparam ID_WIDTH = (RD_ID_WIDTH > WR_ID_WIDTH)? RD_ID_WIDTH : WR_ID_WIDTH;
localparam CNT_WIDTH = 8;
// avoid modelsim compile error
localparam P_NUM_RD_PORT   = (NUM_RD_PORT > 0)?   NUM_RD_PORT   : 1;   
localparam P_NUM_WR_PORT   = (NUM_WR_PORT > 0)?   NUM_WR_PORT   : 1;   
   

input  clk;
input  reset;   // reset is synchronous (if HIGH_FMAX==1), asynchronous otherwise
// from LSU
input  [MWIDTH_BYTES-1:0] i_rd_byteenable [P_NUM_RD_PORT];
input  [AWIDTH-1:0] i_rd_address [P_NUM_RD_PORT]; 
input  i_rd_request [P_NUM_RD_PORT];          
input  [BURST_CNT_W-1:0] i_rd_burstcount [P_NUM_RD_PORT];  
input  [MWIDTH_BYTES-1:0] i_wr_byteenable [P_NUM_WR_PORT]; 
input  [AWIDTH-1:0] i_wr_address [P_NUM_WR_PORT];
input  i_wr_request [P_NUM_WR_PORT];         
input  [BURST_CNT_W-1:0] i_wr_burstcount [P_NUM_WR_PORT];
input  [MWIDTH-1:0] i_wr_writedata [P_NUM_WR_PORT];
// from MEM
input  i_avm_waitrequest [NUM_DIMM];             
input  [MWIDTH-1:0] i_avm_readdata [NUM_DIMM];            
input  i_avm_return_valid [NUM_DIMM];                   
// to MEM                
output  [ID_WIDTH-1:0] o_id [NUM_DIMM];
output  [MWIDTH_BYTES-1:0] o_avm_byteenable [NUM_DIMM];            
output  [AWIDTH-NUM_DIMM_W-1:0] o_avm_address [NUM_DIMM];                
output  o_avm_read [NUM_DIMM];                   
output  o_avm_write [NUM_DIMM];                          
output  [BURST_CNT_W-1:0] o_avm_burstcount [NUM_DIMM];  
output  [MWIDTH-1:0] o_avm_writedata [NUM_DIMM];  
// to kernel
output  o_rd_waitrequest [P_NUM_RD_PORT]; 
output  o_wr_waitrequest [P_NUM_WR_PORT]; 
output  [MWIDTH-1:0] o_avm_readdata [P_NUM_RD_PORT];     
output  o_avm_readdatavalid [P_NUM_RD_PORT]; 
output  o_avm_writeack [P_NUM_WR_PORT];

integer i, j;
wire  i_read  [P_NUM_RD_PORT];  
wire  to_lsu_rd_waitrequest [P_NUM_RD_PORT];
wire  avm_read [NUM_DIMM]; 

// dimm switch guard
wire [0:NUM_RD_PORT-1] rd_accept;
wire [0:NUM_RD_PORT-1] switch_wait;
reg  [CNT_WIDTH-1:0] pending_rd [P_NUM_RD_PORT];      
reg  [0:NUM_RD_PORT-1] pending_af; 
reg  [NUM_DIMM_W-1:0] pending_dimm_num [P_NUM_RD_PORT];           
reg  [0:NUM_RD_PORT-1]  wait_rd;

// read back data
wire id_af [NUM_DIMM]; 
wire ring_i_stall [NUM_DIMM]; 
reg  [MWIDTH-1:0] rd_data [NUM_DIMM];                   
      

wire avm_writeack [NUM_DIMM][P_NUM_WR_PORT];
wire [0:NUM_DIMM-1] v_avm_writeack [P_NUM_WR_PORT];
reg [0:NUM_DIMM-1] R_valid;

localparam  NUM_RESET_COPIES = 1;
localparam  RESET_PIPE_DEPTH = 5;
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

always @(posedge clk) begin
  for(i=0; i<NUM_DIMM; i=i+1) rd_data[i] <= i_avm_readdata[i];
  for(i=0; i<NUM_RD_PORT; i=i+1) begin
    if(rd_accept[i]) pending_dimm_num[i] <= i_rd_address[i][AWIDTH-1:AWIDTH-NUM_DIMM_W];
  end
end   

genvar z, z0;
generate    
  for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_MERGE_RD        
    assign i_read[z] = i_rd_request[z] & !switch_wait[z];        
    assign o_rd_waitrequest[z] = to_lsu_rd_waitrequest[z] | switch_wait[z];           
    assign rd_accept[z] = i_rd_request[z] & !o_rd_waitrequest[z];    
    assign switch_wait[z] = wait_rd[z] & pending_dimm_num[z] !== i_rd_address[z][AWIDTH-1:AWIDTH-NUM_DIMM_W] | pending_af[z];// may not need pending_af    
  end
endgenerate

lsu_token_ring #(
   .AWIDTH(AWIDTH),
   .MWIDTH_BYTES(MWIDTH_BYTES),
   .BURST_CNT_W(BURST_CNT_W),
   .NUM_RD_PORT(NUM_RD_PORT),
   .NUM_WR_PORT(NUM_WR_PORT),
   .NUM_DIMM(NUM_DIMM),
   .MAX_MEM_DELAY(MAX_MEM_DELAY),     
   .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),    
   .ENABLE_DUAL_RING(ENABLE_DUAL_RING),
   .ENABLE_MULTIPLE_WR_RING(ENABLE_MULTIPLE_WR_RING),
   .ROOT_FIFO_AW(ROOT_FIFO_AW),
   .RD_ROOT_FIFO_AW(RD_ROOT_FIFO_AW),
   .ENABLE_READ_FAST(ENABLE_READ_FAST),
   .DISABLE_ROOT_FIFO(DISABLE_ROOT_FIFO),
   .PIPELINE_RD_RETURN(PIPELINE_RD_RETURN),
   .HIGH_FMAX(HIGH_FMAX)
 ) lsu_token_ring (
  .clk              (clk),
  .reset            (reset),
  .i_rd_byteenable  (i_rd_byteenable),
  .i_rd_address     (i_rd_address),
  .i_rd_request     (i_read),
  .i_rd_burstcount  (i_rd_burstcount),
  .i_wr_byteenable  (i_wr_byteenable),
  .i_wr_address     (i_wr_address),
  .i_wr_request     (i_wr_request),
  .i_wr_burstcount  (i_wr_burstcount),
  .i_wr_writedata   (i_wr_writedata),
  .i_avm_waitrequest(i_avm_waitrequest),
  .i_avm_readdata   (i_avm_readdata),
  .i_avm_return_valid(i_avm_return_valid),
  .o_avm_byteenable (o_avm_byteenable),
  .o_avm_address    (o_avm_address),
  .o_avm_read       (o_avm_read),
  .o_avm_write      (o_avm_write),
  .o_avm_burstcount (o_avm_burstcount),
  .o_avm_writedata  (o_avm_writedata),
  .o_avm_readdata   (o_avm_readdata),
  .o_avm_readdatavalid(o_avm_readdatavalid),
  .o_id             (o_id),
  .o_avm_writeack   (o_avm_writeack),
  .o_rd_waitrequest (to_lsu_rd_waitrequest),
  .o_wr_waitrequest (o_wr_waitrequest)
);


// ----------------------------
// Generate read pending count   
// ----------------------------   
always @(posedge clk or posedge arst) begin
  if(arst) begin
    for(i=0; i<NUM_RD_PORT; i=i+1)  begin
      pending_rd[i] <= 0;
      wait_rd[i] <= 1'b0;
      pending_af[i] <= 1'b0;
    end
  end
  else begin          
    for(i=0; i<NUM_RD_PORT; i=i+1) begin
      pending_af[i] <= pending_rd[i][CNT_WIDTH-1];
      case({rd_accept[i], o_avm_readdatavalid[i]})         
        2'b01: begin pending_rd[i] <= pending_rd[i] - 1'b1;                       wait_rd[i] <= pending_rd[i] > 1; end   
        2'b10: begin pending_rd[i] <= pending_rd[i] + i_rd_burstcount[i];         wait_rd[i] <= 1'b1; end
        2'b11: begin pending_rd[i] <= pending_rd[i] + i_rd_burstcount[i] - 1'b1;  wait_rd[i] <= 1'b1; end
      endcase           
    end       
    if(srst[0]) begin
      for(i=0; i<NUM_RD_PORT; i=i+1)  begin
        pending_rd[i] <= 0;
        wait_rd[i] <= 1'b0;
        pending_af[i] <= 1'b0;
      end
    end    
  end  
end

endmodule
