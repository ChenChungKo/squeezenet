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


// This module is a token ring that includes the following major sub-blocks
// [1] read ring / write ring, connected to LSUs
// [2] one root FIFO per bank; root FIFO buffers memory access requests and generate backpressure
// [3] data reordering block - optional
// The timing of reset is specific. lsu_ic_token and lsu_n_fast are held in reset longer than all other modules. This is done by setting the RESET_PIPE_DEPTH in those modules
// to be larger than the RESET_PIPE_DEPTH in this module. This relationship must be maintained if the reset_pipe_depth is changed.

`timescale 1ns / 1ns  
module lsu_token_ring (
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
  o_avm_byteenable,          
  o_avm_address,              
  o_avm_read,        
  o_avm_write,             
  o_avm_burstcount,
  o_avm_writedata,
  o_id, // Not used
  // to kernel
  o_rd_waitrequest,
  o_wr_waitrequest,
  o_avm_writeack,
  o_avm_readdata,
  o_avm_readdatavalid
);


parameter AWIDTH = 32;            
parameter MWIDTH_BYTES = 64;     
parameter BURST_CNT_W = 5;          
parameter NUM_RD_PORT = 2;
parameter NUM_WR_PORT = 2;
parameter START_ID = 0;
parameter ENABLE_READ_FAST = 0;
parameter HIGH_FMAX = 0;  // 1 = optimized, highly pipelined, at the expense of area
parameter DISABLE_ROOT_FIFO = 0;
parameter ROOT_FIFO_AW = 8;               // Token root FIFO address width; FIFO depth = 2**ROOT_FIFO_AW
parameter RD_ROOT_FIFO_AW = 7; 
parameter ENABLE_LAST_WAIT = 0;
parameter MAX_MEM_DELAY = 128; 
parameter RETURN_DATA_FIFO_DEPTH = 128;   // Read data reordering FIFO depth. Must be at least (MAX_BURST * (5+NUM_DATA_AF_COMPARE_STAGES))
parameter PIPELINE_RD_RETURN = 0;
parameter ENABLE_DATA_REORDER = 0;
parameter NUM_DIMM = 2;
parameter ENABLE_DUAL_RING = 0;
parameter ENABLE_MULTIPLE_WR_RING = 0;
parameter NUM_REORDER = 1;

localparam MWIDTH=8*MWIDTH_BYTES;
localparam NUM_ID = NUM_RD_PORT+NUM_WR_PORT;
localparam DISABLE_WR_RING = NUM_WR_PORT==0; 
localparam ENABLE_MULTIPLE_WR_RING_INT = ENABLE_MULTIPLE_WR_RING & ENABLE_DUAL_RING & !DISABLE_WR_RING & NUM_DIMM > 1;
localparam WR_ENABLE = NUM_WR_PORT > 0;
localparam RD_ID_WIDTH = (NUM_RD_PORT==1)?  1 : $clog2(NUM_RD_PORT);
localparam WR_ID_WIDTH = (NUM_WR_PORT==1)?  1 : $clog2(NUM_WR_PORT);
localparam ID_WIDTH = (RD_ID_WIDTH > WR_ID_WIDTH)? RD_ID_WIDTH : WR_ID_WIDTH;
localparam WR_RING_ID_WIDTH = ENABLE_DUAL_RING? WR_ID_WIDTH : ID_WIDTH;
localparam DIMM_W = $clog2(NUM_DIMM);
localparam P_DIMM_W = (DIMM_W == 0)? 1 : DIMM_W; // Used to workaround Modelsim compilation error when DIMM_W==0
localparam MAX_BURST = 2 ** (BURST_CNT_W-1);
/* Data width of the wr-root FIFO. The data written contains (MSB to LSB):
  - End-of-Burst flag (1+), only in HIGH_FMAX mode
  - Byte enable (MWIDTH_BYTES)
  - Address, without the bank select bits (AWIDTH - DIMM_W)
  - Burstcount (BURST_CNT_W)
  - Write data (MWIDTH)
*/
localparam WRITE_ROOT_FIFO_WIDTH = (HIGH_FMAX? 1 : 0) + MWIDTH_BYTES + (AWIDTH - DIMM_W) + BURST_CNT_W + MWIDTH ;
localparam ROOT_FIFO_DEPTH = 2 ** ROOT_FIFO_AW;
localparam RD_ROOT_FIFO_DEPTH = 2 ** RD_ROOT_FIFO_AW;
localparam NUM_REORDER_INT = (NUM_REORDER > NUM_RD_PORT)? NUM_RD_PORT : NUM_REORDER;
localparam PENDING_CNT_W = $clog2(RETURN_DATA_FIFO_DEPTH);
localparam RD_WIDTH = (NUM_REORDER == 1)? 1 :$clog2(NUM_RD_PORT%NUM_REORDER + NUM_RD_PORT/NUM_REORDER +1);

// avoid modelsim compile error
localparam P_NUM_RD_PORT = (NUM_RD_PORT > 0)? NUM_RD_PORT : 1;   
localparam P_NUM_WR_PORT = (NUM_WR_PORT > 0)? NUM_WR_PORT : 1;   

`ifdef SIMONLY
  localparam SIM = 1;
`else
  localparam SIM = 0;
`endif

input  clk;
input  reset; // reset is synchronous if HIGH_FMAX == 1, asynchronous otherwise
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
/* If HIGH_FMAX==1, this input must have a waitrequest-allowance of at least (WAIT_REQUEST_INPUT_PIPE_DEPTH + 1 + NUM_AVM_OUTPUT_PIPE_STAGES + 3).
    This is because the waitrequest input is internally pipelined by WAIT_REQUEST_INPUT_PIPE_DEPTH stages, it takes 1 additional cycle to stop
    reading from the root FIFOs, and the output data pipeline (which may be full of feedforward data) is NUM_AVM_OUTPUT_PIPE_STAGES deep.
    + 3 is for margin.
*/
input  i_avm_waitrequest [NUM_DIMM];   
input  [MWIDTH-1:0] i_avm_readdata [NUM_DIMM];            
input  i_avm_return_valid [NUM_DIMM];                         
// to MEM                
output  [MWIDTH_BYTES-1:0] o_avm_byteenable [NUM_DIMM];            
output  [AWIDTH-DIMM_W-1:0] o_avm_address [NUM_DIMM];                
output  o_avm_read [NUM_DIMM];                   
output  o_avm_write [NUM_DIMM];                          
output  [BURST_CNT_W-1:0] o_avm_burstcount [NUM_DIMM];  
output  [MWIDTH-1:0] o_avm_writedata [NUM_DIMM];  
output  [ID_WIDTH-1:0] o_id [NUM_DIMM];
// to kernel
output  logic o_rd_waitrequest [P_NUM_RD_PORT]; 
output  logic o_wr_waitrequest [P_NUM_WR_PORT]; 
output  reg o_avm_writeack [P_NUM_WR_PORT];
output  [MWIDTH-1:0] o_avm_readdata [P_NUM_RD_PORT];     
output  o_avm_readdatavalid [P_NUM_RD_PORT]; 

genvar z, z0;
generate
  if (HIGH_FMAX == 0) begin
    integer i, j;
    wire rd_o_token;
    wire [RD_ID_WIDTH-1:0] rd_o_id;
    wire [AWIDTH-1:0] rd_address;       
    wire rd_request;
    wire rd_waitrequest [NUM_DIMM]; 
    wire rd_root_af [NUM_DIMM];
    wire [BURST_CNT_W-1:0] rd_burstcount;                   
    wire ic_read [P_NUM_WR_PORT];       
    wire ic_write [P_NUM_RD_PORT];      
    wire [MWIDTH_BYTES-1:0] wr_byteenable;
    wire [AWIDTH-1:0] wr_address;
    wire wr_read;
    wire wr_write;
    wire wr_request;
    wire [BURST_CNT_W-1:0] wr_burstcount;
    wire [WR_ID_WIDTH-1:0] wr_id;
    wire [MWIDTH-1:0] wr_writedata;
    wire [WRITE_ROOT_FIFO_WIDTH-1:0] wr_fin [NUM_DIMM];
    wire [WRITE_ROOT_FIFO_WIDTH-1:0] wr_fout [NUM_DIMM];
    wire wr_fifo_empty [NUM_DIMM];
    wire wr_root_af [NUM_DIMM];
    wire wr_wr_root_en [NUM_DIMM];
    wire rd_wr_root_en [NUM_DIMM];
    reg  wr_out_en [NUM_DIMM];
    wire rd_fifo_empty [NUM_DIMM];
    wire wr_rd_root_en [NUM_DIMM];
    wire rd_rd_root_en [NUM_DIMM];                   
    reg  rd_out_en [NUM_DIMM];
    wire [RD_ID_WIDTH-1:0] fout_id[NUM_DIMM];
    wire wr_dimm_en [NUM_DIMM];
    wire [AWIDTH-DIMM_W-1:0] top_rd_address [NUM_DIMM];        
    wire [BURST_CNT_W-1:0] top_rd_burstcount [NUM_DIMM];
    wire [RD_ID_WIDTH-1:0] fout_rd_id [NUM_DIMM];  
    wire [0:NUM_DIMM-1] id_af;      
    wire [RD_WIDTH-1:0]rd_bank[NUM_DIMM];
    logic [0:NUM_DIMM-1] data_af;          
    wire [MWIDTH-1:0] rd_data [NUM_DIMM][P_NUM_RD_PORT]; 
    reg  [MWIDTH-1:0] R_avm_readdata [P_NUM_RD_PORT];           
    reg  R_avm_readdatavalid [P_NUM_RD_PORT];  
    wire rd_data_valid [NUM_DIMM][P_NUM_RD_PORT];           
    wire [0:NUM_DIMM-1] v_rd_data_en [P_NUM_RD_PORT]; 
    wire [AWIDTH-DIMM_W-1:0] wr_ring_o_addr [NUM_DIMM];
    wire [BURST_CNT_W-1:0] wr_ring_o_burstcount [NUM_DIMM];
    wire [MWIDTH-1:0] wr_ring_o_writedata [NUM_DIMM];
    wire [MWIDTH_BYTES-1:0] wr_ring_o_byteenable [NUM_DIMM]; 
    reg  [PENDING_CNT_W-1:0] max_pending [NUM_DIMM];
    reg  [BURST_CNT_W-1:0] wr_cnt [NUM_DIMM];
    logic [0:NUM_DIMM-1] wr_done, wr_en, error_0, error_1;            
    logic [0:NUM_DIMM-1] debug_bubble;                                                        
  
    assign wr_request = wr_read | wr_write;

    if(NUM_ID == 1) begin : GEN_SINGLE_PORT          
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
        assign o_avm_byteenable[z]    = (NUM_RD_PORT == 1)? '1 : i_wr_byteenable[0];  
        assign o_avm_address[z]       = (NUM_RD_PORT == 1)? i_rd_address[0][AWIDTH-DIMM_W-1:0]  : i_wr_address[0][AWIDTH-DIMM_W-1:0];
        assign o_avm_burstcount[z]    = (NUM_RD_PORT == 1)? i_rd_burstcount[0] : i_wr_burstcount[0];                  
        assign o_avm_writedata[z]     = i_wr_writedata[0];   
        assign o_id[z]                = START_ID;       
      end    
      assign o_avm_read[0]       = (NUM_RD_PORT == 1)? i_rd_request[0] & !i_rd_address[0][AWIDTH-1] : 1'b0;
      assign o_avm_write[0]      = (NUM_RD_PORT == 1)? 1'b0 : i_wr_request[0] & !i_wr_address[0][AWIDTH-1];       
      assign o_avm_read[1]       = (NUM_RD_PORT == 1)? i_rd_request[0] & i_rd_address[0][AWIDTH-1] : 1'b0;
      assign o_avm_write[1]      = (NUM_RD_PORT == 1)? 1'b0 : i_wr_request[0] & i_wr_address[0][AWIDTH-1];                
      assign o_rd_waitrequest[0] = i_avm_waitrequest[0] & !i_rd_address[0][AWIDTH-1] | i_avm_waitrequest[1] & i_rd_address[0][AWIDTH-1];
      assign o_wr_waitrequest[0] = i_avm_waitrequest[0] & !i_wr_address[0][AWIDTH-1] | i_avm_waitrequest[1] & i_wr_address[0][AWIDTH-1];
      assign rd_burstcount = i_rd_burstcount[0];     
      assign rd_o_id       = 1'b0;     
      assign rd_request    = (o_avm_read[0] | o_avm_read[1]) & !o_rd_waitrequest[0];    
      assign rd_address    = i_rd_address[0];                
      
    end
    else begin : GEN_MULTIPLE_PORT
      for(z=0; z<NUM_WR_PORT; z=z+1) begin : GEN_WR_DUMMY
        assign ic_read[z] = 1'b0;  
      end
      for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_DUMMY
        assign ic_write[z] = 1'b0;  
      end
      
      if(NUM_RD_PORT > 0) begin : GEN_ENABLE_RD      
        lsu_n_token #(
           .AWIDTH(AWIDTH),       
           .MWIDTH_BYTES(MWIDTH_BYTES),
           .BURST_CNT_W(BURST_CNT_W),
           .NUM_PORT(NUM_RD_PORT),
           .START_ID(START_ID),      
           .OPEN_RING(!DISABLE_WR_RING & !ENABLE_DUAL_RING),
           .SINGLE_STALL((DISABLE_WR_RING | ENABLE_DUAL_RING) & ENABLE_DATA_REORDER), // wr_root_af is from the single ID FIFO; sw-dimm-partion has N ID FIFOs         
           .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),         
           .START_ACTIVE(1),
           .ENABLE_FAST(ENABLE_READ_FAST),
           .NUM_DIMM(NUM_DIMM),
           .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
           .READ(1),
           .HIGH_FMAX(HIGH_FMAX)
         ) rd_ring (
          .clk              (clk),
          .reset            (reset),
          .i_ext_read       (1'b0), 
          .i_avm_write      (ic_write),
          .i_token          (),
          .i_avm_address    (i_rd_address),
          .i_avm_read       (i_rd_request),
          .i_avm_burstcount (i_rd_burstcount),
          .i_avm_waitrequest(rd_waitrequest),
          .o_avm_waitrequest(o_rd_waitrequest),        
          .o_avm_address    (rd_address),
          .o_avm_read       (rd_request),
          .o_avm_burstcount (rd_burstcount),
          .o_token          (rd_o_token),
          .o_id             (rd_o_id)
        ); 
        
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_RD_SET  
          assign rd_rd_root_en[z] = !rd_out_en[z] | !i_avm_waitrequest[z] & !wr_en[z];          
          assign o_avm_read[z] = rd_out_en[z] & !wr_en[z];                            
    
          if(NUM_DIMM > 1) assign wr_rd_root_en[z] = rd_request & rd_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
          else assign wr_rd_root_en[z] = rd_request;        
    
          always @(posedge clk or posedge reset) begin
            if(reset)  rd_out_en[z] <= 1'b0;
            else if(rd_rd_root_en[z]) rd_out_en[z] <= !rd_fifo_empty[z] & !data_af[z];            
          end
          scfifo #(
            .add_ram_output_register ( "ON"),
            .lpm_numwords (RD_ROOT_FIFO_DEPTH),  
            .lpm_showahead ( "OFF"), 
            .lpm_type ( "scfifo"),
            .lpm_width (AWIDTH-DIMM_W+BURST_CNT_W),
            .lpm_widthu (RD_ROOT_FIFO_AW),  
            .overflow_checking ( "OFF"),
            .underflow_checking ( "ON"),
            .use_eab ( "ON"), 
            .almost_full_value(RD_ROOT_FIFO_DEPTH-5-NUM_RD_PORT*2)  
          ) rd_fifo (
            .clock (clk),
            .data ({rd_address[AWIDTH-DIMM_W-1:0],rd_burstcount}),
            .wrreq (wr_rd_root_en[z]),
            .rdreq (rd_rd_root_en[z] & !data_af[z]),  
            .empty (rd_fifo_empty[z]),
            .q ({top_rd_address[z],top_rd_burstcount[z]}),  
            .almost_full (rd_root_af[z]),
            .aclr (reset)
          );
         // wr_root_af to ring pipelined nodes  
         assign rd_waitrequest[z] = id_af[z]; 
        end            
      end //end if(NUM_RD_PORT > 0) begin : GEN_ENABLE_RD    
      else begin : GEN_DISABLE_RD
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DI
          assign o_avm_read[z] = 1'b0;
        end
      end // end GEN_DISABLE_RD   
      
      if(!DISABLE_WR_RING) begin : GEN_ENABLE_WRITE_RING   
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_WR_ROOT_FIFOS       
          assign o_avm_writedata[z] = wr_fout[z][MWIDTH-1:0];    
          assign {o_avm_byteenable[z], o_avm_address[z], o_avm_burstcount[z]} = o_avm_write[z]? wr_fout[z][WRITE_ROOT_FIFO_WIDTH-1:MWIDTH] : {{MWIDTH_BYTES{1'b1}},top_rd_address[z], top_rd_burstcount[z]}; 
          assign o_avm_write[z] = wr_out_en[z] & wr_en[z];
          
          assign rd_wr_root_en[z] = !wr_out_en[z] | !i_avm_waitrequest[z] & wr_en[z];   
          assign wr_done[z] = o_avm_write[z] & !i_avm_waitrequest[z] & wr_cnt[z] == wr_fout[z][MWIDTH+BURST_CNT_W-1:MWIDTH];       
         
          `ifdef SIM_ONLY // check bubble or error
            reg  [AWIDTH-DIMM_W-1:0] R_addr; 
            reg  not_wr_empty, not_rd_empty;
            reg  freeze_read, freeze_write;
            assign debug_bubble[z] = !i_avm_waitrequest[z] & (!o_avm_write[z] & not_wr_empty) & (!o_avm_read[z] & not_rd_empty); // check if there is switch bubble
            always @(posedge clk) begin 
              if(o_avm_write[z]) R_addr <= o_avm_address[z];
              not_wr_empty <= !wr_fifo_empty[z];
              not_rd_empty <= !rd_fifo_empty[z];     
              freeze_read <= i_avm_waitrequest[z] & o_avm_read[z];
              freeze_write <= i_avm_waitrequest[z] & o_avm_write[z];
              error_0[z] <= R_addr !== o_avm_address[z] & wr_cnt[z] < wr_fout[z][MWIDTH+BURST_CNT_W-1:MWIDTH] & wr_cnt[z] != 1 & (o_avm_read[z] | o_avm_write[z]) ; // switch to rd when wr has not finished
              error_1[z] <= freeze_read & !o_avm_read[z] | freeze_write & !o_avm_write[z] | o_avm_read[z] & o_avm_write[z];  // output request changes during i_avm_waitrequest                            
            end
          `endif

          always @(posedge clk or posedge reset) begin
            if(reset)  begin
              wr_out_en[z] <= 1'b0;
              wr_cnt[z] <= 1;   
              wr_en[z] <= 1'b0;
            end
            else begin                            
              if(rd_wr_root_en[z]) wr_out_en[z] <= !wr_fifo_empty[z];              
              if(o_avm_write[z] & !i_avm_waitrequest[z]) wr_cnt[z] <= (wr_cnt[z] == wr_fout[z][MWIDTH+BURST_CNT_W-1:MWIDTH])? 1 : wr_cnt[z] + 1'b1;
              if(wr_done[z]) wr_en[z] <= !wr_fifo_empty[z]; 
               else if((!wr_fifo_empty[z] | wr_out_en[z]) & !(i_avm_waitrequest[z] & o_avm_read[z])) wr_en[z] <= 1'b1;    
            end        
          end    
          
          scfifo #(
            .add_ram_output_register ( "ON"),
            .lpm_numwords (ROOT_FIFO_DEPTH),  
            .lpm_showahead ( "OFF"), 
            .lpm_type ( "scfifo"),
            .lpm_width (WRITE_ROOT_FIFO_WIDTH),
            .lpm_widthu (ROOT_FIFO_AW),  
            .overflow_checking ( "OFF"),
            .underflow_checking ( "ON"),
            .use_eab ( "ON"), 
            .almost_full_value(ROOT_FIFO_DEPTH-5-NUM_WR_PORT*2)  
          ) wr_fifo (
            .clock (clk),
            .data (wr_fin[z]),
            .wrreq (wr_wr_root_en[z]),
            .rdreq (rd_wr_root_en[z]),  
            .empty (wr_fifo_empty[z]),
            .q (wr_fout[z]),  
            .almost_full (wr_root_af[z]),
            .aclr (reset)
          );
        end // end GEN_WR_ROOT_FIFOS z-loop
        
        if(ENABLE_MULTIPLE_WR_RING_INT) begin : GEN_MULTIPLE_WR_RING
          wire [AWIDTH-DIMM_W-1:0] wr_ring_i_addr [NUM_WR_PORT];                     
          wire wr_ring_i_write [NUM_DIMM] [NUM_WR_PORT];        
          wire wr_ring_o_waitrequest [NUM_DIMM][NUM_WR_PORT];
          wire [0:NUM_DIMM-1] v_wr_stall [NUM_WR_PORT];    
          wire [0:NUM_DIMM-1] wr_accept [NUM_WR_PORT];            
          wire [WR_RING_ID_WIDTH-1:0] wr_o_id [NUM_DIMM];
          
          for(z0=0; z0<NUM_WR_PORT; z0=z0+1) begin : GEN_WR_STALL
            assign o_wr_waitrequest[z0] = |v_wr_stall[z0];
            assign wr_ring_i_addr[z0] = i_wr_address[z0][AWIDTH-DIMM_W-1:0];              
          end     
          for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
            wire wr_i_waitrequest [1];        
            assign wr_i_waitrequest[0] = wr_root_af[z];
            for(z0=0; z0<NUM_WR_PORT; z0=z0+1) begin : GEN_WR_ENABLE
              assign wr_ring_i_write[z][z0] = i_wr_request[z0] & i_wr_address[z0][AWIDTH-1:AWIDTH-DIMM_W] == z;  
              assign v_wr_stall[z0][z] = wr_ring_o_waitrequest[z][z0] & i_wr_address[z0][AWIDTH-1:AWIDTH-DIMM_W] == z;
              assign wr_accept[z0][z] = wr_dimm_en[z] & wr_o_id[z] == z0;    
            end    
            lsu_n_token #(
               .AWIDTH(AWIDTH - DIMM_W),
               .MWIDTH_BYTES(MWIDTH_BYTES),
               .BURST_CNT_W(BURST_CNT_W),
               .NUM_PORT(NUM_WR_PORT),  
               .ID_WIDTH(WR_RING_ID_WIDTH),
               .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),            
               .OPEN_RING(0),
               .START_ACTIVE(1),
               .NUM_DIMM(1),
               .ENABLE_LAST_WAIT(0),
               .START_ID(0), 
               .READ(0),
               .HIGH_FMAX(HIGH_FMAX)
             ) wr_ring (
              .clk              (clk),
              .reset            (reset),   
              .i_token          (1'b0),    
              .i_id             (),          
              .i_ext_address    (),
              .i_ext_read       (1'b0), 
              .i_ext_burstcount (),
              .o_ext_waitrequest(),
              .i_avm_byteenable (i_wr_byteenable),
              .i_avm_address    (wr_ring_i_addr),
              .i_avm_read       (ic_read),
              .i_avm_write      (wr_ring_i_write[z]),
              .i_avm_writedata  (i_wr_writedata),
              .i_avm_burstcount (i_wr_burstcount),
              .i_avm_waitrequest(wr_i_waitrequest), 
              .o_avm_waitrequest(wr_ring_o_waitrequest[z]),  
              .o_avm_byteenable (wr_ring_o_byteenable[z]),
              .o_avm_address    (wr_ring_o_addr[z]),
              .o_avm_read       (),
              .o_avm_write      (wr_dimm_en[z]),
              .o_avm_burstcount (wr_ring_o_burstcount[z]),
              .o_id             (wr_o_id[z]),     
              .o_token          (),         
              .o_avm_writedata  (wr_ring_o_writedata[z])
            );   
            assign wr_fin[z] = {   
              //wr_o_id[z],    
              wr_ring_o_byteenable[z],
              wr_ring_o_addr[z],               
              wr_ring_o_burstcount[z],
              wr_ring_o_writedata[z]            
            };
            assign wr_wr_root_en[z] = wr_dimm_en[z];                    
          end        
          // ------------------
          // Generate write ACK                
          // ------------------
          always @(posedge clk or posedge reset) begin
            if(reset) begin   
              for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= 1'b0;
            end
            else begin
              for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= |wr_accept[i];
            end  
          end // end always
        end
        else begin : GEN_SINGLE_WR_RING   
          lsu_n_token #(
             .AWIDTH(AWIDTH),
             .MWIDTH_BYTES(MWIDTH_BYTES),
             .BURST_CNT_W(BURST_CNT_W),
             .NUM_PORT(NUM_WR_PORT),  
             .ID_WIDTH(WR_RING_ID_WIDTH),
             .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
             .OPEN_RING(NUM_RD_PORT > 0 & !ENABLE_DUAL_RING), 
             .START_ACTIVE(NUM_RD_PORT == 0 | ENABLE_DUAL_RING),
             .NUM_DIMM(NUM_DIMM),
             .ENABLE_LAST_WAIT(0),
             .START_ID(0), 
             .READ(0),
             .HIGH_FMAX(HIGH_FMAX)
           ) wr_ring (
            .clk              (clk),
            .reset            (reset),   
            .i_token          (1'b0),    
            .i_id             (),      
            .i_ext_address    (),
            .i_ext_read       (1'b0), 
            .i_ext_burstcount (rd_burstcount),
            .o_ext_waitrequest(),
            .i_avm_byteenable (i_wr_byteenable),
            .i_avm_address    (i_wr_address),
            .i_avm_read       (ic_read),
            .i_avm_write      (i_wr_request),
            .i_avm_writedata  (i_wr_writedata),
            .i_avm_burstcount (i_wr_burstcount),
            .i_avm_waitrequest(wr_root_af), 
            .o_avm_waitrequest(o_wr_waitrequest),  
            .o_avm_byteenable (wr_byteenable),
            .o_avm_address    (wr_address),
            .o_avm_read       (wr_read),
            .o_avm_write      (wr_write),
            .o_avm_burstcount (wr_burstcount),
            .o_id             (wr_id),     
            .o_token          (),         
            .o_avm_writedata  (wr_writedata)
          );  
          for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
            assign wr_fin[z] = {      
              //wr_id, 
              wr_byteenable,
              wr_address[AWIDTH-DIMM_W-1:0],               
              wr_burstcount,
              wr_writedata            
            };
            if(NUM_DIMM > 1) assign wr_wr_root_en[z] = wr_request & wr_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
            else assign wr_wr_root_en[z] = wr_request;      
          end         
          // ------------------
          // Generate write ACK                
          // ------------------
          always @(posedge clk or posedge reset) begin
            if(reset) begin   
              for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= 1'b0;
            end
            else begin
              for(i=0; i<NUM_WR_PORT; i=i+1)  o_avm_writeack[i] <= wr_write & wr_id == i;                     
            end  
          end // end GEN_SINGLE_WR_RING        
        end  
      end // end GEN_ENABLE_WRITE_RING          
      else begin
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_   
          assign o_avm_write[z] = 1'b0;
          assign wr_en[z] = 1'b0;    
          assign {o_avm_byteenable[z], o_avm_address[z], o_avm_burstcount[z]} = {{MWIDTH_BYTES{1'b1}},top_rd_address[z], top_rd_burstcount[z]};      
        end
      end
    end  // end MULTIPLE PORTS
    wire [DIMM_W:0] to_avm_port_num;
    if(NUM_DIMM > 1) assign to_avm_port_num = rd_address[AWIDTH-1:AWIDTH-DIMM_W];
    else assign to_avm_port_num = 1'b0;         
        
    if(ENABLE_DATA_REORDER & NUM_RD_PORT > 0) begin : GEN_DATA_REORDER        
      lsu_rd_back_n #(
        .NUM_DIMM (NUM_DIMM),
        .NUM_RD_PORT (NUM_RD_PORT),
        .NUM_REORDER(NUM_REORDER_INT),
        .BURST_CNT_W (BURST_CNT_W),
        .MWIDTH (MWIDTH),
        .DATA_FIFO_DEPTH(RETURN_DATA_FIFO_DEPTH),
        .MAX_MEM_DELAY (MAX_MEM_DELAY),
        .PIPELINE (PIPELINE_RD_RETURN),
        .HIGH_FMAX(HIGH_FMAX)
      ) lsu_rd_back (
        .clk                (clk),
        .reset              (reset),
        .i_to_avm_port_num  (to_avm_port_num),
        .i_to_avm_burstcount(rd_burstcount),
        .i_to_avm_id        (rd_o_id),
        .i_to_avm_valid     (rd_request),   
        .i_data             (i_avm_readdata),
        .i_data_valid       (i_avm_return_valid),
        .o_data             (o_avm_readdata),
        .o_data_valid       (o_avm_readdatavalid),
        .o_rd_bank          (rd_bank),
        .o_id_af            (id_af[0])
      );   
      if(NUM_DIMM > 1) assign id_af[1:NUM_DIMM-1] = '0;      
      reg  [PENDING_CNT_W-1:0] pending_rd [NUM_DIMM];                  
      reg  [0:NUM_DIMM-1] R_o_avm_read;
      reg  [BURST_CNT_W-1:0]  R_o_avm_burstcnt [NUM_DIMM];   
      always @(posedge clk) begin
        for(i=0; i<NUM_DIMM; i=i+1) R_o_avm_burstcnt[i] <= o_avm_burstcount[i];                
      end
      always @(posedge clk or posedge reset) begin
        if(reset) begin
          for(i=0; i<NUM_DIMM; i=i+1) begin
            pending_rd[i] <= '0;
            max_pending[i] <= '0;
            data_af[i] <= 1'b0;      
            R_o_avm_read[i] <= 1'b0;            
          end                    
        end
        else begin        
          for(i=0; i<NUM_DIMM; i=i+1) begin    
            R_o_avm_read[i] <= o_avm_read[i] & !i_avm_waitrequest[i];          
            pending_rd[i] <= pending_rd[i] + (R_o_avm_burstcnt[i] & {BURST_CNT_W{R_o_avm_read[i]}}) - rd_bank[i];          
            data_af[i] <= pending_rd[i] >= (RETURN_DATA_FIFO_DEPTH - MAX_BURST * 5);
            `ifdef SIM_ONLY
              if(max_pending[i] < pending_rd[i]) max_pending[i] <= pending_rd[i];
            `endif          
          end
        end
      end          
    end
    else if(NUM_RD_PORT > 0) begin : GEN_DISABLE_DATA_REORDER    
      for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_DOUT
        assign o_avm_readdata[z] = R_avm_readdata[z];  
        assign o_avm_readdatavalid[z] = R_avm_readdatavalid[z];  
      end
      always @(posedge clk) begin
        for(i=0; i<NUM_RD_PORT; i=i+1)  begin                       
          for(j=0; j<NUM_DIMM; j=j+1) if(rd_data_valid[j][i]) R_avm_readdata[i] <= rd_data[j][0];
          R_avm_readdatavalid[i] <= |v_rd_data_en[i];
        end      
      end
      
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DATA_VALID
        wire to_avm_valid; 
        wire [MWIDTH-1:0] i_data [1];
        wire i_data_valid [1];
        assign data_af[z] = 1'b0;      
        for(z0=0; z0<NUM_RD_PORT; z0=z0+1)  begin : GEN_
          assign v_rd_data_en[z0][z] = rd_data_valid[z][z0]; 
        end     
        assign i_data[0] = i_avm_readdata[z];
        assign i_data_valid[0] = i_avm_return_valid[z];
        if(NUM_DIMM > 1) assign to_avm_valid = rd_request & rd_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
        else assign to_avm_valid = rd_request;
        lsu_rd_back #(  
          .NUM_DIMM (1), // NUM_DIMM == 1 : reordering is disabled
          .NUM_RD_PORT (NUM_RD_PORT),
          .BURST_CNT_W (BURST_CNT_W),
          .MWIDTH (MWIDTH),
          .MAX_MEM_DELAY(MAX_MEM_DELAY),
          .PIPELINE (0),
          .HIGH_FMAX(HIGH_FMAX)
        ) lsu_rd_back(
          .clk                (clk),
          .reset              (reset),
          .i_to_avm_port_num  (),
          .i_to_avm_burstcount(rd_burstcount),
          .i_to_avm_id        (rd_o_id),
          .i_to_avm_valid     (to_avm_valid),
          .i_data             (i_data),   
          .i_data_valid       (i_data_valid),
          .o_id_af            (id_af[z]),
          .o_data             (rd_data[z]),        
          .o_data_valid       (rd_data_valid[z])      
        ); 
      end
    end

  end else begin // HIGH_FMAX==1
    /*********************************************************
      High-FMAX design.
    *********************************************************/
    /* The following code is highly optimized and agressively pipelined, for higher FMAX.
    */

    integer i, j;
    // Outputs from the read ring
    logic rd_o_token; // Token output from the read ring. Currently not used.
    logic [RD_ID_WIDTH-1:0] rd_o_id; // LSU ID 
    logic [AWIDTH-1:0] rd_address;   // Address
    logic rd_request; 
    logic rd_waitrequest [NUM_DIMM]; // Wait request into the read-ring, comes from lsu_rd_back's read-request FIFO's almost full.
    localparam NUM_RING_WAITREQUEST_PIPE_STAGES = 3;
    logic rd_ring_waitrequest_pipe[NUM_RING_WAITREQUEST_PIPE_STAGES:1][NUM_DIMM];
    logic wr_ring_waitrequest_pipe[NUM_RING_WAITREQUEST_PIPE_STAGES:1][NUM_DIMM];
    logic wr_ring_waitrequest [NUM_DIMM]; // Wait request into the write ring
    logic [BURST_CNT_W-1:0] rd_burstcount;                   

    logic rd_root_af [NUM_DIMM]; // read root FIFO almost_full
    // Tied off to zero, feeds unused inputs on the read/write rings
    logic ic_read [P_NUM_WR_PORT];       
    logic ic_write [P_NUM_RD_PORT];      

    // Outputs from write-ring
    logic [MWIDTH_BYTES-1:0] wr_byteenable;
    logic [AWIDTH-1:0] wr_address;
    logic wr_read;
    logic wr_write;
    logic wr_request;
    logic [BURST_CNT_W-1:0] wr_burstcount;
    logic [WR_ID_WIDTH-1:0] wr_id;
    logic [MWIDTH-1:0] wr_writedata;

    // Write root FIFO signals (single write ring)
    logic [WRITE_ROOT_FIFO_WIDTH-1:0] write_root_fifo_data_in[NUM_DIMM];
    logic [WRITE_ROOT_FIFO_WIDTH-1:0] write_root_fifo_data_out [NUM_DIMM];
    logic write_root_fifo_empty [NUM_DIMM];
    logic wr_root_af [NUM_DIMM];
    logic wr_wr_root_en [NUM_DIMM];
    logic wr_wr_root_en_wire [NUM_DIMM];

    // Read root FIFO signals
    logic wr_rd_root_en [NUM_DIMM];
    logic rd_rd_root_en [NUM_DIMM];                   

    logic wr_dimm_en [NUM_DIMM];  // Write strobe, output from write-ring, used when there are multiple write rings
    
    logic [0:NUM_DIMM-1] id_af;      // Almost-full flags from lsu_rd_back internal FIFOs
    logic [RD_WIDTH-1:0]rd_bank[NUM_DIMM];  // Output from lsu_rd_back to indicate that the respective data FIFO is being read from. Used to generate pending_rd / read request throttling
    logic [0:NUM_DIMM-1] read_request_throttle;          

    // Read return data to the LSUs, from lsu_rd_back, and related signals
    logic [MWIDTH-1:0] rd_data [NUM_DIMM][P_NUM_RD_PORT]; 
    reg  [MWIDTH-1:0] R_avm_readdata [P_NUM_RD_PORT];           
    reg  R_avm_readdatavalid [P_NUM_RD_PORT];  
    logic rd_data_valid [NUM_DIMM][P_NUM_RD_PORT];           
    logic [0:NUM_DIMM-1] v_rd_data_en [P_NUM_RD_PORT]; 

    // Write ring outputs (multiple write rings)
    logic [AWIDTH-DIMM_W-1:0] wr_ring_o_addr [NUM_DIMM];
    logic [BURST_CNT_W-1:0] wr_ring_o_burstcount [NUM_DIMM];
    logic [MWIDTH-1:0] wr_ring_o_writedata [NUM_DIMM];
    logic [MWIDTH_BYTES-1:0] wr_ring_o_byteenable [NUM_DIMM]; 

    // Used for simulation debug
    reg  [PENDING_CNT_W-1:0] max_pending [NUM_DIMM];  
    reg  [BURST_CNT_W-1:0] wr_cnt [NUM_DIMM];
    logic [0:NUM_DIMM-1] wr_done, wr_en, error_0, error_1;            
    logic [0:NUM_DIMM-1] debug_bubble;                                                        
      
    localparam MASTER_ROOT_FIFO_WIDTH = WRITE_ROOT_FIFO_WIDTH + 2; // +2 for read and write strobe
    logic [MASTER_ROOT_FIFO_WIDTH-1:0] master_root_fifo_data_in[NUM_DIMM];
    logic [MASTER_ROOT_FIFO_WIDTH-1:0] master_root_fifo_data_out[NUM_DIMM];
    logic master_root_fifo_wrreq[NUM_DIMM];
    logic master_root_fifo_rdreq[NUM_DIMM];
    logic master_root_fifo_empty[NUM_DIMM];
    logic master_root_fifo_almost_full[NUM_DIMM];
    logic master_root_fifo_in_write[NUM_DIMM];
    logic master_root_fifo_in_read[NUM_DIMM];

    // State machine for controlling reads from the root FIFOs
    enum logic [1:0]{
      STATE_READ_FROM_ROOT_FIFO_START = 2'b00,
      STATE_READ_FROM_ROOT_FIFO_RD    = 2'b01,
      STATE_READ_FROM_ROOT_FIFO_WR    = 2'b10
    } root_fifo_read_state[NUM_DIMM];

    logic read_root_fifo_rd_req[NUM_DIMM];
    logic read_root_fifo_rd_req_comb[NUM_DIMM];
    logic [AWIDTH-DIMM_W+BURST_CNT_W-1:0] read_root_fifo_data_out[NUM_DIMM];
    logic read_root_fifo_empty [NUM_DIMM];

    logic write_root_fifo_rd_req[NUM_DIMM];
    logic [MAX_BURST:1] write_root_fifo_DataCount_onehot[NUM_DIMM];

    localparam NUM_AVM_OUTPUT_PIPE_STAGES = 3; // Must be at least 2 if NUM_DIMM>1
    // Output pipeline to the avm interface (ie. the memory)
    logic  [MWIDTH_BYTES-1:0] avm_output_pipe_byteenable [NUM_AVM_OUTPUT_PIPE_STAGES:1][NUM_DIMM];            
    logic  [AWIDTH-DIMM_W-1:0] avm_output_pipe_address [NUM_AVM_OUTPUT_PIPE_STAGES:1][NUM_DIMM];                
    logic  avm_output_pipe_read [NUM_AVM_OUTPUT_PIPE_STAGES:1][NUM_DIMM];                   
    logic  avm_output_pipe_write [NUM_AVM_OUTPUT_PIPE_STAGES:1][NUM_DIMM];                          
    logic  [BURST_CNT_W-1:0] avm_output_pipe_burstcount [NUM_AVM_OUTPUT_PIPE_STAGES:1][NUM_DIMM];  
    logic  [MWIDTH-1:0] avm_output_pipe_writedata [NUM_AVM_OUTPUT_PIPE_STAGES:1][NUM_DIMM];  

    logic write_root_fifo_output_end_of_burst[NUM_DIMM];
    logic write_root_fifo_output_end_of_burst_previous[NUM_DIMM];

    localparam NUM_WRITE_RING_OUTPUT_PIPE_STAGES = 3; // Must be at least 3

    /* These are combinational signals used to gather the ring outputs to then feed into the output pipeline.
     Ideally we'd just use index[0] of the pipeline registers for this purpose but Modelsim gives an 
     error when assigning to the same array both continuously and procedurally, even if it's to different
     indexes into the array.
    */
    logic [MWIDTH_BYTES-1:0] write_ring_output_pipe_input_byteenable[NUM_DIMM];
    logic [AWIDTH-1:0] write_ring_output_pipe_input_address[NUM_DIMM];
    logic [BURST_CNT_W-1:0] write_ring_output_pipe_input_burstcount[NUM_DIMM];
    logic [MWIDTH-1:0] write_ring_output_pipe_input_writedata[NUM_DIMM];
    logic write_ring_output_pipe_input_write_request[NUM_DIMM];
    // Ring output pipeline. One per bank. If only one write-ring is used the only one bank's pipeline
    // is kept, the rest should be synthesized away.
    logic [MWIDTH_BYTES-1:0] write_ring_output_pipe_byteenable[NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][NUM_DIMM];
    logic [AWIDTH-1:0] write_ring_output_pipe_address[NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][NUM_DIMM];
    logic [BURST_CNT_W-1:0] write_ring_output_pipe_burstcount[NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][NUM_DIMM];
    logic [MWIDTH-1:0] write_ring_output_pipe_writedata[NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][NUM_DIMM];

    logic  write_ring_output_write_ack_pipe [NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][P_NUM_WR_PORT-1:0];  // Used for latency matching

    logic write_ring_output_pipe_write_request[NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][NUM_DIMM];
    logic write_ring_output_pipe_end_of_burst[NUM_WRITE_RING_OUTPUT_PIPE_STAGES:1][NUM_DIMM];

    logic [MAX_BURST+1:0] write_ring_output_burstcounter_onehot[2:1][NUM_DIMM];
    localparam WAIT_REQUEST_INPUT_PIPE_DEPTH = 3;
    logic wait_request_input_pipe[WAIT_REQUEST_INPUT_PIPE_DEPTH:1][NUM_DIMM];

    /* The write root-FIFO's almost_full flag provides the back pressure to the write-ring. When asserted, the FIFO must have
      enough space to accommodate any requests that are already in the pipeline that feeds the FIFO's data input. This includes 
      2 x the ring length (ie. NUM_WR_PORT*2) to account for the worst-case latency of the stall reaching the LSU at the end
      of the ring + a full ring's worth of write requests, the depth of the write-ring output pipeline which is
      NUM_WRITE_RING_OUTPUT_PIPE_STAGES + 1 additional stage before the request reaches the FIFO input, and the pipelining added
      to the ring waitrequest signal. 
      It appears the -5 is for margin.
    */
    localparam WRITE_ROOT_FIFO_ALMOST_FULL_VALUE = ROOT_FIFO_DEPTH - 5 - NUM_WR_PORT*2 - (NUM_WRITE_RING_OUTPUT_PIPE_STAGES + 1) - NUM_RING_WAITREQUEST_PIPE_STAGES;


    // One reset for each FIFO and its related logic (master root FIFO, read root FIFO, write root FIFO), and one for everything else.
    localparam  NUM_RESET_COPIES = 6;
    /* NOTE if changing RESET_PIPE_DEPTH. The reset pipe depth in lsu_ic_token and lsu_n_fast is chosen to ensure they come out of reset AFTER the rest of the interconnect comes out of reset.
       So if the depth is increased here it needs to be increased in those 2 modules as well.
    */
    localparam  RESET_PIPE_DEPTH = 5;	
    logic [NUM_RESET_COPIES-1:0]local_reset;
      
    acl_fanout_pipeline #(
      .PIPE_DEPTH (RESET_PIPE_DEPTH),
      .NUM_COPIES (NUM_RESET_COPIES)
    )
     local_reset_fanout_pipeline (
      .clk(clk),
      .in(reset),
      .out(local_reset)
    );  

    /********************************************************
      Master Root FIFO
    ********************************************************/
    /*
      This FIFO is a temporary stand-in for the lookahead waitrequest we will be getting from the Hyperflex-optimized
      Qsys interconnect. It buffers the output of avm_output_pipe and provides a lookahead stall using its almost_full flag.
      Tracked by Case:423801
    */
    for (z=0;z<NUM_DIMM;z++) begin : GEN_MASTER_ROOT_FIFO

      // Rest of the avm_output_pipe pipeline.
      always @(posedge clk) begin
        for (int i=3;i<=NUM_AVM_OUTPUT_PIPE_STAGES;i++) begin
          avm_output_pipe_read[i][z]        <= avm_output_pipe_read[i-1][z];          
          avm_output_pipe_write[i][z]       <= avm_output_pipe_write[i-1][z];                   
          avm_output_pipe_byteenable[i][z]  <= avm_output_pipe_byteenable[i-1][z];
          avm_output_pipe_burstcount[i][z]  <= avm_output_pipe_burstcount[i-1][z];
          avm_output_pipe_address[i][z]     <= avm_output_pipe_address[i-1][z];
          avm_output_pipe_writedata[i][z]   <= avm_output_pipe_writedata[i-1][z]; 
        end
      end

      // Feed avm_output_pipe into the master root FIFO.
      // Not connecting end of burst flag (for writes)
      assign master_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH-1:0] = avm_output_pipe_write[NUM_AVM_OUTPUT_PIPE_STAGES][z]? 

              {avm_output_pipe_byteenable[NUM_AVM_OUTPUT_PIPE_STAGES][z],avm_output_pipe_address[NUM_AVM_OUTPUT_PIPE_STAGES][z],
                avm_output_pipe_burstcount[NUM_AVM_OUTPUT_PIPE_STAGES][z],avm_output_pipe_writedata[NUM_AVM_OUTPUT_PIPE_STAGES][z]} : 

              {{MWIDTH_BYTES{1'b1}},avm_output_pipe_address[NUM_AVM_OUTPUT_PIPE_STAGES][z],avm_output_pipe_burstcount[NUM_AVM_OUTPUT_PIPE_STAGES][z]};
   
    `ifdef NO_MASTER_ROOT_FIFO // This is for doing FMAX tests. Omit the master root FIFO.


      assign o_avm_writedata[z]   = avm_output_pipe_writedata[NUM_AVM_OUTPUT_PIPE_STAGES][z];
      assign o_avm_byteenable[z]  = avm_output_pipe_byteenable[NUM_AVM_OUTPUT_PIPE_STAGES][z];
      assign o_avm_address[z]     = avm_output_pipe_address[NUM_AVM_OUTPUT_PIPE_STAGES][z];
      assign o_avm_burstcount[z]  = avm_output_pipe_burstcount[NUM_AVM_OUTPUT_PIPE_STAGES][z];
      assign o_avm_read[z]        = avm_output_pipe_read[NUM_AVM_OUTPUT_PIPE_STAGES][z];
      assign o_avm_write[z]       = avm_output_pipe_write[NUM_AVM_OUTPUT_PIPE_STAGES][z];

      // Pipeline the input waitrequest, for performance
      always @(posedge clk) begin
        wait_request_input_pipe[1][z]  <= i_avm_waitrequest[z];
        for (int i=2;i<=WAIT_REQUEST_INPUT_PIPE_DEPTH;i++) begin
          wait_request_input_pipe[i][z]  <= wait_request_input_pipe[i-1][z];
        end
      end

      assign master_root_fifo_almost_full[z] = wait_request_input_pipe[WAIT_REQUEST_INPUT_PIPE_DEPTH][z];

    `else // For testing functionality, include the master root FIFO. To be removed, tracked by Case: 423801
      scfifo_to_acl_high_speed_fifo #(
        .add_ram_output_register ( "ON"),
        .REGISTERED_DATA_OUT_COUNT (2),
        .ASYNC_RESET (0),
        .lpm_numwords (32),  
        .lpm_showahead ("ON"), 
        .lpm_type ( "scfifo"),
        .lpm_width (MASTER_ROOT_FIFO_WIDTH),
        .lpm_widthu (5),  
        .overflow_checking ( "OFF"),
        .underflow_checking ( "ON"),
        .use_eab ( "ON"), 
        .almost_full_value(22)  
      ) master_root_fifo (
        .clock (clk),
        // the REGISTERED_DATA_OUT_COUNT parameter requires the bits that need registers to be in the LSBs, so re-ordering them.
        .data ({master_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH-1:0],
                master_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH+1],
                master_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH]}),
        .wrreq (master_root_fifo_wrreq[z]),
        .rdreq (master_root_fifo_rdreq[z]),  
        .empty (master_root_fifo_empty[z]),
        // Matching re-ordering on the output
        .q ({master_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH-1:0],
                master_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH+1],
                master_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH]}), 
        .almost_full (master_root_fifo_almost_full[z]),
        .sclr (local_reset[3])
      );

      assign master_root_fifo_wrreq[z]                = (avm_output_pipe_write[NUM_AVM_OUTPUT_PIPE_STAGES][z] || avm_output_pipe_read[NUM_AVM_OUTPUT_PIPE_STAGES][z]);
      assign master_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH]    = avm_output_pipe_read[NUM_AVM_OUTPUT_PIPE_STAGES][z];
      assign master_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH+1]  = avm_output_pipe_write[NUM_AVM_OUTPUT_PIPE_STAGES][z];

      assign o_avm_writedata[z] = master_root_fifo_data_out[z][MWIDTH-1:0];   
      assign {o_avm_byteenable[z], o_avm_address[z], o_avm_burstcount[z]} = master_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH+1]?
        master_root_fifo_data_out[z][MWIDTH_BYTES + (AWIDTH - DIMM_W) + BURST_CNT_W + MWIDTH - 1 : MWIDTH] :
        {{MWIDTH_BYTES{1'b1}},master_root_fifo_data_out[z][AWIDTH-DIMM_W+BURST_CNT_W-1:BURST_CNT_W],master_root_fifo_data_out[z][BURST_CNT_W-1:0]};

        assign o_avm_read[z] = master_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH] && !master_root_fifo_empty[z];
        assign o_avm_write[z] = master_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH+1] && !master_root_fifo_empty[z];

        assign master_root_fifo_rdreq[z] = !master_root_fifo_empty[z] && !i_avm_waitrequest[z];
    `endif    
    end

    logic [NUM_DIMM-1:0] input_avm_waitrequest;

    assign wr_request = wr_read | wr_write;
    /* Apparently you can only use reduction operators on packed types, so this converts the unpacked signal
      i_avm_waitrequest to packed signal input_avm_waitrequest so we can later use the OR reduction operator.
      Placing this outside the IF statement because Quartus 16.1 gives an error otherwise.
    */
    for (z=0;z<NUM_DIMM;z++) begin : GEN_INPUT_AVM_WAIT_REQUEST
      assign input_avm_waitrequest[z]  = master_root_fifo_almost_full[z];
    end

    /* If there's only one LSU, we don't need the root-FIFOs and the single LSU can feed the output pipeline directly.
    */
    if(NUM_ID == 1) begin : GEN_SINGLE_PORT    

      always @(posedge clk) begin
        for(int z=0; z<NUM_DIMM; z=z+1) begin

          /* If NUM_RD_PORT != 1, then it must be zero. So in the case of no reads, set avm_output_pipe_read to zero.
            However, if we have one read, then assert avm_output_pipe_read to bank-z if the has a read-request to send
            AND the MSBs of the address correspond to bank-z. If there's only one bank (ie. DIMM_W==0), then assert
            avm_output_pipe_read irrespective of address.
          */
          if (NUM_RD_PORT == 1) begin
            // Read strobe
            if (DIMM_W == 0) begin  // If one-bank
              avm_output_pipe_read[2][z]        <= i_rd_request[0];
            end else begin  // If more than one bank
              avm_output_pipe_read[2][z]        <= i_rd_request[0] & i_rd_address[0][AWIDTH-1:AWIDTH-P_DIMM_W] == z;
            end
            // Write strobe
            avm_output_pipe_write[2][z]         <= 1'b0;
          end else begin
            // Read strobe
            avm_output_pipe_read[2][z]          <= 1'b0;

            // Write strobe
            if (DIMM_W == 0) begin
              avm_output_pipe_write[2][z]       <= i_wr_request[0];
            end else begin
              avm_output_pipe_write[2][z]       <= i_wr_request[0] & i_wr_address[0][AWIDTH-1:AWIDTH-P_DIMM_W] == z;
            end
          end

            avm_output_pipe_byteenable[2][z]  <= (NUM_RD_PORT == 1)? '1 : i_wr_byteenable[0];  // All bytes are enabled for reads
            avm_output_pipe_burstcount[2][z]  <= (NUM_RD_PORT == 1)? i_rd_burstcount[0] : i_wr_burstcount[0]; 
            avm_output_pipe_address[2][z]     <= (NUM_RD_PORT == 1)? i_rd_address[0][AWIDTH-DIMM_W-1:0]  : i_wr_address[0][AWIDTH-DIMM_W-1:0];
            avm_output_pipe_writedata[2][z]   <= i_wr_writedata[0];     

        end    
    
        // The single LSU can only write to one bank at a time so there should only be one waitrequest input active at a time, so it should
        // be sufficient to OR all the waitrequest bits together to generate the backpressure to the LSU.
        o_rd_waitrequest[0] <= |input_avm_waitrequest;
        o_wr_waitrequest[0] <= |input_avm_waitrequest;
        o_avm_writeack <= i_wr_request;      

        rd_burstcount <= i_rd_burstcount[0];     
        rd_o_id       <= 1'b0;
        rd_request    <= i_rd_request[0] && !(|input_avm_waitrequest);  // A valid read request is issued only when unstalled
        rd_address    <= i_rd_address[0];
      end    

    end
    else begin : GEN_MULTIPLE_PORT
      for(z=0; z<NUM_WR_PORT; z=z+1) begin : GEN_WR_DUMMY
        assign ic_read[z] = 1'b0;  
      end
      for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_DUMMY
        assign ic_write[z] = 1'b0;  
      end
      
      for(z=0; z<NUM_DIMM; z=z+1) begin : ROOT_FIFO_CONTROL_LOGIC
        /********************************************************************
          Root-FIFO Control Logic
        ********************************************************************/
        /* This state machine controls reads from the read and write root-FIFOs.
          A single read request
          is comprised of one word but it represents an entire burst's worth of return data. In contrast, a single write request consists of many words
          (up to a burstcount's worth of words). It appears that this is one of the reasons that priority is given to writes over reads, 
          meaning that as soon as the write root-FIFO has a request, 
          we interrupt the transmission of read requests in favour of transmitting the writes, since writes take "longer" to transmit (since they are comprised
          of more words).

          It appears a second reason that writes are given priority over reads is to support writeacks. When a store-LSU (AKA write-LSU) issues a write-request, 
          the interconnect acknowledges reception of that request (in particular, the writeack to the LSU is asserted when the write request comes out of the
          write ring, NOT when the request is issued to the AvalonMM interface at the output of the interconnect). The interconnect is expected to ensure that once writeack is asserted correspondent
          to a particular write-request, no other write or read request, issued by ANY LSU, can reach the global memory before it. The basic arbitration of the interconnect
          ensures that all subsequent write requests are guaranteed to come after. Giving writes priority over reads at the root guarantees that read requests also
          come after.

          The state-machine ensures bubble-free operation in the steady state when the root FIFOs contain lots of requests.
          This logic is pipelined, meaning that when the Avalon-MM (AVM) interface applies backpressure, it takes a few cycles
          for requests to stop being generated. As a result we require the use of waitrequest-allowance, which is the lookahead
          backpressure feature of the Hyperflex-optimized AVM interface. Similarly, when backpressure is removed, it takes one
          cycle before requests begin to be generated again, which seemingly creates a bubble (we can call it a "start-up bubble").
          It is expected that this block ultimately feeds a downstream FIFO and that FIFO provides the backpressure. The FIFO
          will therefore collapse this bubble. As long as that downstream FIFO is deep enough and has enough data in it, 
          start-up bubbles should not effect overall throughput.

          The key component to implementing bubble-free operation is the output pipeline (avm_output_pipe). Writes feed
          stage-1 but reads feed stage-2 directly. This allows for switching between writes and reads without creating bubbles.
        */
        
        /* Read from the read-root-fifo if reads are not being throttled due to lack of space in the return
          data FIFOs in lsu_rd_back and we are not stalled by waitrequest. We do not check 
          read_root_fifo_empty (ie. we will allow reads from an empty read-root-FIFO, but we later check 
          if the read was valid or not, in the output pipeline)
        */
        assign read_root_fifo_rd_req_comb[z] = !read_request_throttle[z] && !master_root_fifo_almost_full[z];
        // Grab the flag that indicates the burst boundary of write-requests. This is used to detect when to switch to reads.
        assign write_root_fifo_output_end_of_burst[z] = write_root_fifo_data_out[z][1+MWIDTH_BYTES+AWIDTH-DIMM_W+BURST_CNT_W+MWIDTH-1:MWIDTH_BYTES+AWIDTH-DIMM_W+BURST_CNT_W+MWIDTH];

        always @(posedge clk) begin
          // Flag if the last word of a burst was read out of the write-root-fifo in the previous cycle
          write_root_fifo_output_end_of_burst_previous[z] <= write_root_fifo_output_end_of_burst[z] && !write_root_fifo_empty[z];

          /* Always read from the write-root-FIFO so we can output its data as soon as it becomes available.
              While reading from it, if the FIFO goes empty, a bubble will be created in the output pipeline
              stage-1, but it will not propagate to the output since since the read-root-FIFO
              feeds pipeline stage-2 directly. The only thing that stops us from reading from the write-root FIFO is the backpressure.
          */
          write_root_fifo_rd_req[z] <= !master_root_fifo_almost_full[z];

          // State machine
          case (root_fifo_read_state[z])
            /* The purpose of the START state is to assert the read-req to the read-root-FIFO immediately
                after reset. It's questionable if we could just assert read-req during reset (it's not clear in 
                the SCFIFO user's guide if this is OK), so using a separate state to be safe.
            */
            STATE_READ_FROM_ROOT_FIFO_START: begin  
              root_fifo_read_state[z]   <= STATE_READ_FROM_ROOT_FIFO_RD;
            end
            STATE_READ_FROM_ROOT_FIFO_RD: begin
              if (!write_root_fifo_empty[z]) begin  // As soon as the write-root-fifo has data, switch to it.
                root_fifo_read_state[z]   <= STATE_READ_FROM_ROOT_FIFO_WR;
              end

              if (!write_root_fifo_empty[z]) begin // Write-root-fifo has data, so stop reading from the read-root-fifo
                read_root_fifo_rd_req[z]  <= 1'b0;
              end else begin
                read_root_fifo_rd_req[z]  <= read_root_fifo_rd_req_comb[z];  // Read from the read-root-fifo as long as it's not being throttled
              end
            end
            STATE_READ_FROM_ROOT_FIFO_WR: begin
              // Keep reading from the write-root-fifo until we hit a burst boundary and the FIFO goes empty.
              if (write_root_fifo_output_end_of_burst_previous[z] && write_root_fifo_empty[z]) begin
                root_fifo_read_state[z]   <= STATE_READ_FROM_ROOT_FIFO_RD;
                read_root_fifo_rd_req[z]  <= read_root_fifo_rd_req_comb[z];
              end
            end
          endcase
          if (local_reset[4]) begin 
            root_fifo_read_state[z]   <= STATE_READ_FROM_ROOT_FIFO_START;
            read_root_fifo_rd_req[z]  <= 1'b0;
            write_root_fifo_rd_req[z] <= 1'b0;
          end

          /*******************************************************
            Root-FIFO Output Pipeline
          *******************************************************/
          // Root-FIFO output pipeline, stage-1
          // avm_read strobe
          avm_output_pipe_read[1][z]          <= 1'b0;  // Read requests are never fed into stage-1
          // Feed the write-root-fifo output directly into pipe stage 1
          avm_output_pipe_write[1][z]         <= write_root_fifo_rd_req[z] && !write_root_fifo_empty[z]; // Assert only if we read successfully from the FIFO
          avm_output_pipe_byteenable[1][z]    <= write_root_fifo_data_out[z][MWIDTH_BYTES+AWIDTH-DIMM_W+BURST_CNT_W+MWIDTH-1:AWIDTH-DIMM_W+BURST_CNT_W+MWIDTH];
          avm_output_pipe_burstcount[1][z]    <= write_root_fifo_data_out[z][BURST_CNT_W+MWIDTH-1:MWIDTH];
          avm_output_pipe_address[1][z]       <= write_root_fifo_data_out[z][AWIDTH-DIMM_W+BURST_CNT_W+MWIDTH-1:BURST_CNT_W+MWIDTH];
          avm_output_pipe_writedata[1][z]     <= write_root_fifo_data_out[z][MWIDTH-1:0];

          // Stage-2
          avm_output_pipe_read[2][z]          <= read_root_fifo_rd_req[z] && !read_root_fifo_empty[z]; // Assert only if we read successfully from the FIFO
          avm_output_pipe_write[2][z]         <= avm_output_pipe_write[1][z];
          if (read_root_fifo_rd_req[z]) begin  // If reading from the read-root-fifo, feed directly into pipe stage 2
            avm_output_pipe_byteenable[2][z]  <= {MWIDTH_BYTES{1'b1}};
            avm_output_pipe_burstcount[2][z]  <= read_root_fifo_data_out[z][BURST_CNT_W-1:0];
            avm_output_pipe_address[2][z]     <= read_root_fifo_data_out[z][AWIDTH-DIMM_W+BURST_CNT_W-1:BURST_CNT_W];
          end else begin // Otherwise, stage-2 is fed by stage-1.
            avm_output_pipe_byteenable[2][z]  <= avm_output_pipe_byteenable[1][z];
            avm_output_pipe_burstcount[2][z]  <= avm_output_pipe_burstcount[1][z];
            avm_output_pipe_address[2][z]     <= avm_output_pipe_address[1][z];
          end
          avm_output_pipe_writedata[2][z]     <= avm_output_pipe_writedata[1][z];

          // The rest of avm_output_pipe is implemented in another section.
        end
      end

      /*******************************************************
        Generate Read Ring
      *******************************************************/
      if(NUM_RD_PORT > 0) begin : GEN_ENABLE_RD      
        lsu_n_token #(
           .AWIDTH(AWIDTH),       
           .MWIDTH_BYTES(MWIDTH_BYTES),
           .BURST_CNT_W(BURST_CNT_W),
           .NUM_PORT(NUM_RD_PORT),
           .START_ID(START_ID),      
           .OPEN_RING(!DISABLE_WR_RING & !ENABLE_DUAL_RING),
           .SINGLE_STALL((DISABLE_WR_RING | ENABLE_DUAL_RING) & ENABLE_DATA_REORDER), // wr_root_af is from the single ID FIFO; sw-dimm-partion has N ID FIFOs         
           .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),         
           .START_ACTIVE(1),
           .ENABLE_FAST(ENABLE_READ_FAST),
           .NUM_DIMM(NUM_DIMM),
           .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
           .READ(1),
           .HIGH_FMAX(HIGH_FMAX)
         ) rd_ring (
          .clk              (clk),
          .reset            (local_reset[0]),
          .i_ext_read       (1'b0), 
          .i_avm_write      (ic_write),
          .i_token          (),
          .i_avm_address    (i_rd_address),
          .i_avm_read       (i_rd_request),
          .i_avm_burstcount (i_rd_burstcount),
          .i_avm_waitrequest(rd_waitrequest),
          .o_avm_waitrequest(o_rd_waitrequest),        
          .o_avm_address    (rd_address),
          .o_avm_read       (rd_request),
          .o_avm_burstcount (rd_burstcount),
          .o_token          (rd_o_token),
          .o_id             (rd_o_id)
        ); 
        
  
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_RD_SET  
          // Never do reads if wr_en=1. This is the read-req to the FIFO
          // Read whenenever the FIFO output is not valid. Also just read continuously if unstalled and not doing writes.
   
          if(NUM_DIMM > 1) assign wr_rd_root_en[z] = rd_request & rd_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
          else assign wr_rd_root_en[z] = rd_request;        
    
          scfifo_to_acl_high_speed_fifo #(
            // Registering the full FIFO output since some of the data output feeds combinational logic (muxes into the output pipeline). The data width of this FIFO is small so this does not appear to impact performance.
            .add_ram_output_register ( "ON"), 
            .lpm_numwords (RD_ROOT_FIFO_DEPTH),  
            .ASYNC_RESET (0),
            .lpm_showahead ( "ON"), 
            .lpm_type ( "scfifo"),
            .lpm_width (AWIDTH-DIMM_W+BURST_CNT_W),
            .lpm_widthu (RD_ROOT_FIFO_AW),  
            .overflow_checking ( "OFF"),
            .underflow_checking ( "ON"),
            .use_eab ( "ON"), 
            .almost_full_value(RD_ROOT_FIFO_DEPTH-5-NUM_RD_PORT*2)  
          ) read_root_fifo (
            .clock (clk),
            .data ({rd_address[AWIDTH-DIMM_W-1:0],rd_burstcount}),
            .wrreq (wr_rd_root_en[z]),
            .rdreq (read_root_fifo_rd_req[z]),  
            .empty (read_root_fifo_empty[z]),
            .q (read_root_fifo_data_out[z]),  
            .almost_full (rd_root_af[z]), // Not used.
            .sclr (local_reset[1])
          );

          /* The read-ring back pressure comes from lsu_rd_back's internal FIFO that buffers read-requests. It tracks the
              read-requests that are issued so that it knows to which LSU the returned data should be routed. This FIFO's capacity
              is ultimately what limits how many outstanding read requests there can be since this FIFO can't overflow.
              One might wonder why we don't use the read-root-fifo's almost-full to provide the backpressure to the read ring 
              just like we use the write-root-fifo's almost-full to provide backpressure to the write ring. It's simply because the
              read-root-FIFO is read before lsu_rd_back's FIFO is read. We read from the read_root_fifo to issue the requests
              to the AvalonMM interface, but we only read from lsu_rd_back's FIFO when the data returns -- so this FIFO is the ultimate
              limitation.
              The backpressure to the read ring should not be confused with the read_request_throttle signal that's generated using
              the pending_rd count. The read-request-throttle is used in multi-bank mode, and it controls the issuing of read 
              requests on a *per bank* basis, as dictated by the available capacity of lsu_rd_back's internal data FIFOs. These FIFOs
              cannot overflow so their almost_full is used to control the throttling of read-requests being pulled out of the respective
              bank's read_root_fifo. But the absolute overall number of read-requests
              (to any bank) that the read-ring is allowed to have outstanding is limited by the capacity of lsu_rd_back's internal read-request
              FIFO.
          */
          always @(posedge clk) begin
            rd_ring_waitrequest_pipe[1][z] <= id_af[z];
            for (int i=2;i<=NUM_RING_WAITREQUEST_PIPE_STAGES;i++) begin
              rd_ring_waitrequest_pipe[i][z] <= rd_ring_waitrequest_pipe[i-1][z];
            end
          end
          assign rd_waitrequest[z] = rd_ring_waitrequest_pipe[NUM_RING_WAITREQUEST_PIPE_STAGES][z]; 
        end            
      end //end if(NUM_RD_PORT > 0) begin : GEN_ENABLE_RD    
      else begin : GEN_DISABLE_RD
        // If there's no read ring, and therefore no read root FIFO, hook up the read root FIFO output signals 
        // as though there are never any read requests from the read-ring.
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DISABLE_RD_ROOT_FIFO_CONNECTIONS
          always @(posedge clk) begin
            read_root_fifo_rd_req[z] <= 1'b0;
            read_root_fifo_empty[z] <= 1'b1;
          end
        end
      end // end GEN_DISABLE_RD   
      
      /*******************************************************
        Generate Write Ring
      *******************************************************/    
      if(!DISABLE_WR_RING) begin : GEN_ENABLE_WRITE_RING   
        if(ENABLE_MULTIPLE_WR_RING_INT) begin : GEN_MULTIPLE_WR_RING
          logic [AWIDTH-DIMM_W-1:0] wr_ring_i_addr [NUM_WR_PORT];                     
          logic wr_ring_i_write [NUM_DIMM] [NUM_WR_PORT];        
          logic wr_ring_o_waitrequest [NUM_DIMM][NUM_WR_PORT];
          logic [0:NUM_DIMM-1] v_wr_stall [NUM_WR_PORT];    
          logic [0:NUM_DIMM-1] wr_accept [NUM_WR_PORT];            
          logic [WR_RING_ID_WIDTH-1:0] wr_o_id [NUM_DIMM];
          
          for(z0=0; z0<NUM_WR_PORT; z0=z0+1) begin : GEN_WR_STALL
            assign o_wr_waitrequest[z0] = |v_wr_stall[z0];  // Stall LSU z0 if any bank is stalling LSU z0.
            assign wr_ring_i_addr[z0] = i_wr_address[z0][AWIDTH-DIMM_W-1:0];              
          end     
          for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
            logic wr_i_waitrequest [1];        
            assign wr_i_waitrequest[0] = wr_root_af[z];
            for(z0=0; z0<NUM_WR_PORT; z0=z0+1) begin : GEN_WR_ENABLE
              assign wr_ring_i_write[z][z0] = i_wr_request[z0] & i_wr_address[z0][AWIDTH-1:AWIDTH-DIMM_W] == z;  
              // Take the waitrequest to the z0 LSU (from the ring), but only forward it if that LSU is writing to
              // the specified bank.
              assign v_wr_stall[z0][z] = wr_ring_o_waitrequest[z][z0] & i_wr_address[z0][AWIDTH-1:AWIDTH-DIMM_W] == z;
              assign wr_accept[z0][z] = wr_dimm_en[z] & wr_o_id[z] == z0;    // Used for write-ack as the request comes out of the ring
            end    
            lsu_n_token #(
               .AWIDTH(AWIDTH - DIMM_W),
               .MWIDTH_BYTES(MWIDTH_BYTES),
               .BURST_CNT_W(BURST_CNT_W),
               .NUM_PORT(NUM_WR_PORT),  
               .ID_WIDTH(WR_RING_ID_WIDTH),
               .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),            
               .OPEN_RING(0),
               .START_ACTIVE(1),
               .NUM_DIMM(1),
               .ENABLE_LAST_WAIT(0),
               .START_ID(0), 
               .READ(0),
               .HIGH_FMAX(HIGH_FMAX)
             ) wr_ring_multiple (
              .clk              (clk),
              .reset            (local_reset[0]),   
              .i_token          (1'b0),    
              .i_id             (),          
              .i_ext_address    (),
              .i_ext_read       (1'b0), 
              .i_ext_burstcount (),
              .o_ext_waitrequest(),
              .i_avm_byteenable (i_wr_byteenable),
              .i_avm_address    (wr_ring_i_addr),
              .i_avm_read       (ic_read),
              .i_avm_write      (wr_ring_i_write[z]),
              .i_avm_writedata  (i_wr_writedata),
              .i_avm_burstcount (i_wr_burstcount),
              .i_avm_waitrequest(wr_i_waitrequest), 
              .o_avm_waitrequest(wr_ring_o_waitrequest[z]),  
              .o_avm_byteenable (wr_ring_o_byteenable[z]),
              .o_avm_address    (wr_ring_o_addr[z]),
              .o_avm_read       (),
              .o_avm_write      (wr_dimm_en[z]),
              .o_avm_burstcount (wr_ring_o_burstcount[z]),
              .o_id             (wr_o_id[z]),     
              .o_token          (),         
              .o_avm_writedata  (wr_ring_o_writedata[z])
            );   

            assign write_ring_output_pipe_input_byteenable[z]    = wr_ring_o_byteenable[z];
            assign write_ring_output_pipe_input_address[z]       = wr_ring_o_addr[z];
            assign write_ring_output_pipe_input_burstcount[z]    = wr_ring_o_burstcount[z];
            assign write_ring_output_pipe_input_writedata[z]     = wr_ring_o_writedata[z];
            assign write_ring_output_pipe_input_write_request[z] = wr_dimm_en[z]; 

          end        

          // ------------------
          // Generate write ACK                
          // ------------------
          always @(posedge clk) begin
            for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= |wr_accept[i];
            // synchronous reset (these assignments override the assignments above if reset is asserted)
            if(local_reset[0]) begin   
              for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= 1'b0;
            end            
          end // end always
        end
        else begin : GEN_SINGLE_WR_RING   
          lsu_n_token #(
             .AWIDTH(AWIDTH),
             .MWIDTH_BYTES(MWIDTH_BYTES),
             .BURST_CNT_W(BURST_CNT_W),
             .NUM_PORT(NUM_WR_PORT),  
             .ID_WIDTH(WR_RING_ID_WIDTH),
             .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
             .OPEN_RING(NUM_RD_PORT > 0 & !ENABLE_DUAL_RING), 
             .START_ACTIVE(NUM_RD_PORT == 0 | ENABLE_DUAL_RING),
             .NUM_DIMM(NUM_DIMM),
             .ENABLE_LAST_WAIT(0),
             .START_ID(0), 
             .READ(0),
             .HIGH_FMAX(HIGH_FMAX)
           ) wr_ring (
            .clk              (clk),
            .reset            (local_reset[0]),   
            .i_token          (1'b0),    
            .i_id             (),      
            .i_ext_address    (),
            .i_ext_read       (1'b0), 
            .i_ext_burstcount (rd_burstcount),
            .o_ext_waitrequest(),
            .i_avm_byteenable (i_wr_byteenable),
            .i_avm_address    (i_wr_address),
            .i_avm_read       (ic_read),
            .i_avm_write      (i_wr_request),
            .i_avm_writedata  (i_wr_writedata),
            .i_avm_burstcount (i_wr_burstcount),
            .i_avm_waitrequest(wr_ring_waitrequest), 
            .o_avm_waitrequest(o_wr_waitrequest),  
            .o_avm_byteenable (wr_byteenable),
            .o_avm_address    (wr_address),
            .o_avm_read       (wr_read), // ??
            .o_avm_write      (wr_write),
            .o_avm_burstcount (wr_burstcount),
            .o_id             (wr_id),     
            .o_token          (),         
            .o_avm_writedata  (wr_writedata)
          );

          for(z=0; z<NUM_DIMM; z=z+1) begin : SINGLE_WR_RING_OUTPUT_PIPE_INPUT_ASSIGNMENT

            // Pipeline the waitrequest going into the ring, for performance
            always @(posedge clk) begin
              wr_ring_waitrequest_pipe[1][z] <= wr_root_af[z];
              for (int i=2;i<=NUM_RING_WAITREQUEST_PIPE_STAGES;i++) begin
                wr_ring_waitrequest_pipe[i][z] <= wr_ring_waitrequest_pipe[i-1][z];
              end
            end
            assign wr_ring_waitrequest[z] = wr_ring_waitrequest_pipe[NUM_RING_WAITREQUEST_PIPE_STAGES][z]; 

            assign write_ring_output_pipe_input_byteenable[z]    = wr_byteenable;
            assign write_ring_output_pipe_input_address[z]       = wr_address;
            assign write_ring_output_pipe_input_burstcount[z]    = wr_burstcount;
            assign write_ring_output_pipe_input_writedata[z]     = wr_writedata;
            assign write_ring_output_pipe_input_write_request[z] = wr_request;  // Not sure why wr_request is used instead of wr_write
          end

          // ------------------
          // Generate write ACK                
          // ------------------
          always @(posedge clk) begin
            
            //for(i=0; i<NUM_WR_PORT; i=i+1)  o_avm_writeack[i] <= wr_write & wr_id == i;       
            for(i=0; i<NUM_WR_PORT; i=i+1)  write_ring_output_write_ack_pipe[1][i] <= wr_write & wr_id == i;       

            /* Match the latency to the write_ring_output_pipe.
              The write-ack should only be asserted to the LSU when the write request is guaranteed to be
              going into the write_root_fifo. Then it is guaranteed that it will be issued to the AvalonMM interface
              before any other subsequent read or write-requests.
            */
            for (int i=2;i<=NUM_WRITE_RING_OUTPUT_PIPE_STAGES;i++) begin
              write_ring_output_write_ack_pipe[i] <= write_ring_output_write_ack_pipe[i-1];
            end
                          
            // synchronous reset (these assignments override the assignments above if reset is asserted)
            if(local_reset[0]) begin   
              for(i=0; i<NUM_WR_PORT; i=i+1) write_ring_output_write_ack_pipe[1][i]  <= '0;
            end            
          end // end GEN_SINGLE_WR_RING        

          for(z=0; z<NUM_WR_PORT; z++) begin : GEN_WRITE_ACK_OUTPUT_ASSIGNMENT
            assign o_avm_writeack[z] = write_ring_output_write_ack_pipe[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z];
          end

        end

        /********************************************
          Write Root FIFOs
        ********************************************/
        // Write-ring output pipeline, end-of-burst precomputation, and root FIFOs.

        // When using multiple write rings, there is one pipeline per bank.
        // With only one write ring, there is only one pipeline and the others should be synthesized
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_WR_ROOT_FIFOS       
          /* Pipeline the write-ring outputs and flag the last word of a burst (end of burst, EoB). This precomputation of EoB
              is later used in the root-FIFO state machine.
              A one-hot encoded counter is used to track the burst boundaries.
              Stage-1 allows for conversion to one-hot, which should be LUT-depth 1 if BURST_CNT_W <= 6;
              The counter is used in Stage-2.
          */
          always @(posedge clk) begin
            // Stage-1, convert to one-hot
            write_ring_output_pipe_byteenable[1][z]    <= write_ring_output_pipe_input_byteenable[z];   
            write_ring_output_pipe_address[1][z]       <= write_ring_output_pipe_input_address[z];      
            write_ring_output_pipe_burstcount[1][z]    <= write_ring_output_pipe_input_burstcount[z];   
            write_ring_output_pipe_writedata[1][z]     <= write_ring_output_pipe_input_writedata[z];    
            write_ring_output_pipe_write_request[1][z] <= write_ring_output_pipe_input_write_request[z];
            for (int i=0;i<=MAX_BURST;i++) begin : GEN_ONE_HOT_INPUT
                  // Load the counter with the one-hot starting value
                  // Index [0] will be set to 0 since wr_burstcount is assumed to be > 0
                  //[1][0][i] = [pipe stage 1][i'th bit]
              write_ring_output_burstcounter_onehot[1][z][i] <= (i ==  write_ring_output_pipe_input_burstcount[z])? 1'b1 : 1'b0;
            end          

            /* Stage-2, use the one-hot counter, which can be thought of as counting down. 
              The count value reflects the word number in stage-2 (though it's counting down)
              Load the one-hot counter with the new one-hot burstcount when the counter is rolling over
              (ie. when index[1] == 1). Otherwise shift the counter to the right (towards the LSB)
            */
            write_ring_output_burstcounter_onehot[1][z][MAX_BURST+1] <= 1'b0;  // Shift zero into the MSB of the counter
            write_ring_output_burstcounter_onehot[2][z][MAX_BURST+1] <= 1'b0;  // Shift zero into the MSB of the counter
            for (int i=0;i<=MAX_BURST;i++) begin : ONE_HOT_COUNTER
              /* If a new input word is here (ie. it's in stage-1), and the word in stage-2 is the EoB or the EoB has happened already, 
                we need to reload the counter.
              */
              if  ( write_ring_output_pipe_write_request[1][z] && 
                    ( (write_ring_output_burstcounter_onehot[2][z][1] && write_ring_output_pipe_write_request[2][z])
                      || write_ring_output_burstcounter_onehot[2][z][0]
                    )
                  ) begin
                  // Load the counter with the one-hot starting value
                  write_ring_output_burstcounter_onehot[2][z]  <= write_ring_output_burstcounter_onehot[1][z];
              // Otherwise shift the counter whenever a valid word is in stage-2                
              end else if (write_ring_output_pipe_write_request[2][z]) begin
                write_ring_output_burstcounter_onehot[2][z][i] <= write_ring_output_burstcounter_onehot[2][z][i+1]; // Zero is shifted into the MSB (see above)
              end
            end

            // Remaining pipe stages
            for (int i=2;i<=NUM_WRITE_RING_OUTPUT_PIPE_STAGES;i++) begin
              write_ring_output_pipe_byteenable[i][z]    <= write_ring_output_pipe_byteenable[i-1][z];    
              write_ring_output_pipe_address[i][z]       <= write_ring_output_pipe_address[i-1][z];       
              write_ring_output_pipe_burstcount[i][z]    <= write_ring_output_pipe_burstcount[i-1][z];
              write_ring_output_pipe_writedata[i][z]     <= write_ring_output_pipe_writedata[i-1][z];   
              write_ring_output_pipe_write_request[i][z] <= write_ring_output_pipe_write_request[i-1][z];
            end

            // Create the EoB flag
            write_ring_output_pipe_end_of_burst[3][z]  <= write_ring_output_burstcounter_onehot[2][z][1];
            // Remaining pipe stages
            for (int i=4;i<=NUM_WRITE_RING_OUTPUT_PIPE_STAGES;i++) begin
              write_ring_output_pipe_end_of_burst[i][z]  <= write_ring_output_pipe_end_of_burst[i-1][z];
            end

            if (local_reset[2]) begin
              write_ring_output_burstcounter_onehot[2][z][0] <= 1'b1;  // Ensures counter is loaded when first word arrives after reset
            end
          end

          // Feed write-ring-output-pipeline into the appropriate write-root-fifo. Register one more time so the FIFO inputs are all registered.

          // Enable write to the j'th bank's write-root-fifo, as specified by the upper bits of the address
          if (ENABLE_MULTIPLE_WR_RING_INT) begin
            // If there are multiple write-rings, since there is one ring per bank, we can use the write_request directly
            // without looking at the upper address bits
            assign wr_wr_root_en_wire[z]  = write_ring_output_pipe_write_request[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z];
          end else begin
            if(NUM_DIMM > 1) 
                assign wr_wr_root_en_wire[z] = write_ring_output_pipe_write_request[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z] &
                                               write_ring_output_pipe_address[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z][AWIDTH-1:AWIDTH-DIMM_W] == z;
            else
                assign wr_wr_root_en_wire[z] = write_ring_output_pipe_write_request[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z];  // There is only one bank
          end


          always @(posedge clk) begin
            //for(int z=0; z<NUM_DIMM; z=z+1) begin : GEN_
              write_root_fifo_data_in[z] <= {      
                write_ring_output_pipe_end_of_burst[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z],
                write_ring_output_pipe_byteenable[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z],
                write_ring_output_pipe_address[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z][AWIDTH-DIMM_W-1:0],
                write_ring_output_pipe_burstcount[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z],
                write_ring_output_pipe_writedata[NUM_WRITE_RING_OUTPUT_PIPE_STAGES][z]
              };
              wr_wr_root_en[z] <= wr_wr_root_en_wire[z];
            //end  
          end

         `ifdef SIM_ONLY // check bubble or error
            reg  [AWIDTH-DIMM_W-1:0] R_addr; 
            reg  not_wr_empty, not_rd_empty;
            reg  freeze_read, freeze_write;
            localparam BUBBLE_COUNTER_WIDTH = 64;
            logic [NUM_DIMM-1:0][BUBBLE_COUNTER_WIDTH-1:0]count_unstalled_cycles_with_data_to_output;
            logic [NUM_DIMM-1:0][BUBBLE_COUNTER_WIDTH-1:0]count_data_output_cycles;
            logic [NUM_DIMM-1:0][BUBBLE_COUNTER_WIDTH-1:0]num_bubbles;

            //assign debug_bubble[z] = !i_avm_waitrequest[z] & (!o_avm_write[z] & not_wr_empty) & (!o_avm_read[z] & not_rd_empty); // check if there is switch bubble
            assign debug_bubble[z] = !master_root_fifo_almost_full[z] & (!o_avm_write[z] & not_wr_empty) & (!o_avm_read[z] & not_rd_empty); // check if there is switch bubble
            always @(posedge clk) begin 
              if(o_avm_write[z]) R_addr <= o_avm_address[z];
              if(o_avm_write[z]) R_addr <= o_avm_address[z];
              not_wr_empty <= !write_root_fifo_empty[z];
              not_rd_empty <= !read_root_fifo_empty[z];     
              freeze_read <= i_avm_waitrequest[z] & o_avm_read[z];
              freeze_write <= i_avm_waitrequest[z] & o_avm_write[z];
              error_0[z] <= R_addr !== o_avm_address[z] & wr_cnt[z] < write_root_fifo_data_out[z][MWIDTH+BURST_CNT_W-1:MWIDTH] & wr_cnt[z] != 1 & (o_avm_read[z] | o_avm_write[z]) ; // switch to rd when wr has not finished
              error_1[z] <= freeze_read & !o_avm_read[z] | freeze_write & !o_avm_write[z] | o_avm_read[z] & o_avm_write[z];  // output request changes during i_avm_waitrequest                            

              for (int z=0;z<NUM_DIMM;z++) begin
                // Track how many cycles in which we're not being stalled and either of the root FIFOs has data to send
                if (!master_root_fifo_almost_full[z] && (!write_root_fifo_empty[z] || !read_root_fifo_empty[z])) begin
                  count_unstalled_cycles_with_data_to_output[z] <= count_unstalled_cycles_with_data_to_output[z] + 1;
                end
                // Count how many cycles we spend sending data
                if (avm_output_pipe_read[NUM_AVM_OUTPUT_PIPE_STAGES][z] || avm_output_pipe_write[NUM_AVM_OUTPUT_PIPE_STAGES][z]) begin
                  count_data_output_cycles[z]  <= count_data_output_cycles[z] + 1;
                end
                num_bubbles[z] <= count_unstalled_cycles_with_data_to_output[z] - count_data_output_cycles[z];
              end

              if (local_reset[0]) begin
                count_unstalled_cycles_with_data_to_output <= '0;
                count_data_output_cycles <= '0;
                num_bubbles <= '0;
              end
            end
          `endif

 
          scfifo_to_acl_high_speed_fifo #(
            .add_ram_output_register ( "ON"),
            .REGISTERED_DATA_OUT_COUNT (1),
            .ASYNC_RESET (0),
            .lpm_numwords (ROOT_FIFO_DEPTH),  
            .lpm_showahead ( "ON"), 
            .lpm_type ( "scfifo"),
            .lpm_width (WRITE_ROOT_FIFO_WIDTH),
            .lpm_widthu (ROOT_FIFO_AW),  
            .overflow_checking ( "OFF"),
            .underflow_checking ( "ON"),
            .use_eab ( "ON"), 
            .almost_full_value(WRITE_ROOT_FIFO_ALMOST_FULL_VALUE)  
          ) write_root_fifo (
            .clock (clk),
            // the REGISTERED_DATA_OUT_COUNT parameter requires the bits that need registers to be in the LSBs, so re-ordering them.
            .data ({  write_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH-2:0],
                      write_root_fifo_data_in[z][WRITE_ROOT_FIFO_WIDTH-1]
                  }),
            .wrreq (wr_wr_root_en[z]),
            .rdreq (write_root_fifo_rd_req[z]),  
            .empty (write_root_fifo_empty[z]),
            .q ({  write_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH-2:0],
                   write_root_fifo_data_out[z][WRITE_ROOT_FIFO_WIDTH-1]
                  }),
            .almost_full (wr_root_af[z]),
            .sclr (local_reset[2])
          );
        end // end GEN_WR_ROOT_FIFOS z-loop        
      end // end GEN_ENABLE_WRITE_RING          
      else begin : GEN_DISABLE_WRITE_RING
        // If there's no write ring, and therefore no write root FIFO, hook up the wirte root FIFO output signals 
        // as though there are never any write requests from the write-ring.    
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DISABLE_WR_ROOT_FIFO_CONNECTIONS
          always @(posedge clk) begin
            write_root_fifo_rd_req[z] <= 1'b0;
            write_root_fifo_empty[z] <= 1'b1;
            wr_root_af[z] <= 1'b0;
          end
        end
      end
    end  // end MULTIPLE PORTS
    logic [DIMM_W:0] to_avm_port_num;
    if(NUM_DIMM > 1) assign to_avm_port_num = rd_address[AWIDTH-1:AWIDTH-DIMM_W];
    else assign to_avm_port_num = 1'b0;         

    /*******************************************************
      Generate Read Return Data Reordering
    *******************************************************/      
    if(ENABLE_DATA_REORDER & NUM_RD_PORT > 0) begin : GEN_DATA_REORDER        
      lsu_rd_back_n #(
        .NUM_DIMM (NUM_DIMM),
        .NUM_RD_PORT (NUM_RD_PORT),
        .NUM_REORDER(NUM_REORDER_INT),
        .BURST_CNT_W (BURST_CNT_W),
        .MWIDTH (MWIDTH),
        .DATA_FIFO_DEPTH(RETURN_DATA_FIFO_DEPTH),
        .MAX_MEM_DELAY (MAX_MEM_DELAY),
        .PIPELINE (PIPELINE_RD_RETURN),
        .HIGH_FMAX(HIGH_FMAX),
        .ID_AF_EXTERNAL_LATENCY(NUM_RING_WAITREQUEST_PIPE_STAGES) //id_af is pipelined by this amount before backpressuring the read ring.
      ) lsu_rd_back_n (
        .clk                (clk),
        .reset              (local_reset[0]),
        .i_to_avm_port_num  (to_avm_port_num),
        .i_to_avm_burstcount(rd_burstcount),
        .i_to_avm_id        (rd_o_id),
        .i_to_avm_valid     (rd_request),   
        .i_data             (i_avm_readdata),
        .i_data_valid       (i_avm_return_valid),
        .o_data             (o_avm_readdata),
        .o_data_valid       (o_avm_readdatavalid),
        .o_rd_bank          (rd_bank),
        .o_id_af            (id_af[0])
      );   
      if(NUM_DIMM > 1) assign id_af[1:NUM_DIMM-1] = '0;      
      reg  [PENDING_CNT_W-1:0] pending_rd [NUM_DIMM];                  
      reg  [0:NUM_DIMM-1] R_o_avm_read;
      reg  [BURST_CNT_W-1:0]  R_o_avm_burstcnt [NUM_DIMM];   
      logic [RD_WIDTH-1:0]  R_rd_bank[NUM_DIMM];
      logic  [PENDING_CNT_W-1:0]  burstcount_minus_rd_bank [NUM_DIMM];
      logic  [PENDING_CNT_W-1:0]  minus_rd_bank [NUM_DIMM];
      logic valid_avm_read[NUM_DIMM];
      logic  [PENDING_CNT_W-1:0] pending_rd_increment_value [NUM_DIMM];    
      localparam NUM_DATA_AF_COMPARE_STAGES = 2;
      logic [0:NUM_DIMM-1] data_af_pipe[NUM_DATA_AF_COMPARE_STAGES:1];

      always @(posedge clk) begin
        /***********************************************
          Read Request Throttling
        ***********************************************/
        for(i=0; i<NUM_DIMM; i=i+1) begin    
          /* We must ensure the FIFOs inside lsu_rd_back can accommodate the return data from the requests that
          are issued.
            For a given bank [i], pending_rd is a count of the number of outstanding read words from bank [i]
            not yet returned to the corresponding LSU. The read return data FIFO in lsu_rd_back must be able to
            accommodate all of these outstanding words. We use this count to throttle the issuing of further read
            requests to the memory (ie. we make sure there will be enough space in the return data FIFOs).
            pending_rd is calculated by accumulating the burstcounts of read requests as they go out to the memory
            and decrementing the count by rd_bank as words are read out of the return data FIFOs.
            With only one lsu_rd_back instance (ie. NUM_REORDER==1), there is only one return data FIFO per bank, so
            rd_bank is a 1-bit value indicating when a single word is being read out. If there are N
            lsu_rd_backs then there N return data FIFOs per bank and rd_bank[i] is the total # of words
            being read out of bank-i's return data FIFOs, in that cycle.

            The calculation is pipelined with pre-computation to reduce the loop size.
            pending_rd is accumulated in every cycle (there is no clken). The increment value is pre-computed
            as follows.

            R_o_avm_read    | pending_rd_increment_value
            ---------------------------------------------------
                          0 | -rd_bank
                          1 | burstcount - rd_bank
          
            So if rd_bank == 0, then we are simply incrementing pending_rd by a value of burstcount.
          */

          // Stage-1 Register the inputs to the computation
          R_o_avm_read[i]       <= read_root_fifo_rd_req[i] && !read_root_fifo_empty[i]; // Valid read request was sent out         

          R_o_avm_burstcnt[i]   <= read_root_fifo_data_out[i][BURST_CNT_W-1:0];   // Capture the burstcount for that request

          R_rd_bank[i]          <= rd_bank[i];  // Capture the # of words read out of the return data FIFOs on this cycle
          
          // Stage 2. Compute the difference
          valid_avm_read[i]           <= R_o_avm_read[i]; // Just register it through
          burstcount_minus_rd_bank[i] <= R_o_avm_burstcnt[i] - R_rd_bank[i];  // Compute the difference
          minus_rd_bank[i]            <= -R_rd_bank[i]; // Compute the negative
          
          // Stage 3. Select the increment value from the two possibilities
          pending_rd_increment_value[i] <= valid_avm_read[i] ? burstcount_minus_rd_bank[i] :  minus_rd_bank[i];

          // Stage 4. Perform the addition
          pending_rd[i] <= pending_rd[i] + pending_rd_increment_value[i];

          /* Assert almost_full if the # of outstanding read words exceeds the following threshold.
            The threshold must account for the latency through this computation pipeline and the latency
            to when read_request_throttle actually tops the issuing of read requests. It takes 4 cycles to compute pending_rd,
            NUM_DATA_AF_COMPARE_STAGES cycles for read_request_throttle to assert, and 1 more cycle for read_request_throttle to halt the issuing
            of reads. Hence we set the threshold such that the returnd data FIFO can accommodate up to
            MAX_BURST*(5+NUM_DATA_AF_COMPARE_STAGES) words. This is the worst case # of words that could be returned
            if every request in this pipeline had a maximum burst count. The -5 is for margin.
          */
          data_af_pipe[1][i]          <= pending_rd[i] >= (RETURN_DATA_FIFO_DEPTH - (MAX_BURST * (5+NUM_DATA_AF_COMPARE_STAGES)) - 5);
          read_request_throttle[i]    <= data_af_pipe[NUM_DATA_AF_COMPARE_STAGES-1][i];
          
          `ifdef SIM_ONLY
            if(max_pending[i] < pending_rd[i]) max_pending[i] <= pending_rd[i];
          `endif          
        end

        for (int i=2;i<=NUM_DATA_AF_COMPARE_STAGES-1;i++) begin // Last stage of the pipe is the assignment to read_request_throttle above
          data_af_pipe[i] <= data_af_pipe[i-1];
        end

        // synchronous reset (these assignments override the assignments above if reset is asserted)
        if(local_reset[5]) begin
          for(i=0; i<NUM_DIMM; i=i+1) begin
            pending_rd[i] <= '0;
            max_pending[i] <= '0;
            read_request_throttle[i] <= 1'b0;      
            R_o_avm_read[i] <= 1'b0;            
          end                    
        end        
      end
    end
    else if(NUM_RD_PORT > 0) begin : GEN_DISABLE_DATA_REORDER    
      for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_DOUT
        assign o_avm_readdata[z] = R_avm_readdata[z];  
        assign o_avm_readdatavalid[z] = R_avm_readdatavalid[z];  
      end
      always @(posedge clk) begin
        for(int i=0; i<NUM_RD_PORT; i=i+1)  begin                       
          for(int j=0; j<NUM_DIMM; j=j+1) 
            /* This appears to mux the data from the multiple banks down to each LSU.
              It appears to assume that only one bank will be routing to a given LSU at a time.
            */

            // If there's only one bank, then feed the data straight through with no clock enable (feed forward)
            if (NUM_DIMM == 1) begin
              R_avm_readdata[i] <= rd_data[0][0]; // Then to the i'th LSU data bus, forward data-0.
            // If multi-bank, then feed the j'th bank's data to the i'th LSU
            end else if (rd_data_valid[j][i]) begin
              R_avm_readdata[i] <= rd_data[j][0];
            end
          
            // For the i'th LSU, assert valid if we have a valid from any of the banks for that LSU
            // This appears to assume only one bank at a time will be returning data to a given LSU (ie.
            // no contention)
            R_avm_readdatavalid[i] <= |v_rd_data_en[i]; 
        end      
      end
      
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DATA_VALID
        logic to_avm_valid; 
        logic [MWIDTH-1:0] i_data [1];
        logic i_data_valid [1];
        assign read_request_throttle[z] = 1'b0;      
        for(z0=0; z0<NUM_RD_PORT; z0=z0+1)  begin : GEN_
          assign v_rd_data_en[z0][z] = rd_data_valid[z][z0]; // This looks like a transpose so a reduction OR can be done easily above
        end     
        assign i_data[0] = i_avm_readdata[z];
        assign i_data_valid[0] = i_avm_return_valid[z];
        if(NUM_DIMM > 1) assign to_avm_valid = rd_request & rd_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
        else assign to_avm_valid = rd_request;
        lsu_rd_back #(  
          .NUM_DIMM (1), // NUM_DIMM == 1 : reordering is disabled
          .NUM_RD_PORT (NUM_RD_PORT),
          .BURST_CNT_W (BURST_CNT_W),
          .MWIDTH (MWIDTH),
          .MAX_MEM_DELAY(MAX_MEM_DELAY),
          .PIPELINE (PIPELINE_RD_RETURN),
          .HIGH_FMAX(HIGH_FMAX),
          .ID_AF_EXTERNAL_LATENCY(NUM_RING_WAITREQUEST_PIPE_STAGES)
        ) lsu_rd_back(
          .clk                (clk),
          .reset              (local_reset[0]),
          .i_to_avm_port_num  (1'b0),
          .i_to_avm_burstcount(rd_burstcount),
          .i_to_avm_id        (rd_o_id),
          .i_to_avm_valid     (to_avm_valid),
          .i_data             (i_data),   
          .i_data_valid       (i_data_valid),
          .o_id_af            (id_af[z]),
          .o_data             (rd_data[z]),        
          .o_data_valid       (rd_data_valid[z])      
        ); 
      end
    end
end
endgenerate

endmodule
