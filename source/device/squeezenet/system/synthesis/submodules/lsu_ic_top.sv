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


// This is the top level of token ring interconnect for global memory access.
// It has two modes: default (with data reordering block) and sw-dimm-partition (without data reordering; slow switch between banks).

module lsu_ic_top (
  clk,
  resetn,
  // from LSUs
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
  i_avm_readdatavalid,        
  // to MEM                
  o_avm_byteenable,          
  o_avm_address,              
  o_avm_read,        
  o_avm_write,             
  o_avm_burstcount,
  o_avm_writedata,
  // to LSUs
  o_rd_waitrequest,
  o_wr_waitrequest,
  o_avm_readdata,
  o_avm_readdatavalid,
  o_avm_writeack
);


parameter  AWIDTH = 32;                        // memory address width     
parameter  SHIFT = 10;                         // for address permutation 
parameter  ENABLE_PERMUTE = 1;                 // enable address permutation
parameter  MWIDTH_BYTES = 64;                  // memory bus width 
parameter  BURST_CNT_W = 5;                    // max burst number width
parameter  NUM_RD_PORT = 2;                    // number of read ports
parameter  NUM_WR_PORT = 2;                    // number of write ports
parameter  NUM_DIMM = 1;                       // number of physical banks
parameter  RETURN_DATA_FIFO_DEPTH = 512;       // data reordering FIFO depth per bank. Must meet the minimum value required by lsu_token_ring.
parameter  HIGH_FMAX = 0;                      // 1 = optimized, highly pipelined mode, only sclrs (no aclrs) at the expense of area.
// parameter MAX_MEM_DELAY is used as Read ID/burstcount FIFO depth, to generate o_avm_readdatavalid
// Almost-full threshold is set to (MAX_MEM_DELAY - NUM_RD_PORT*2-5); stall is generated to read ring when the threshold is hit
// It selects (NUM_RD_PORT*2+6) as depth when this number is greater than 512, to gurantee a positive Almost-full threshold
parameter  MAX_MEM_DELAY = ((NUM_RD_PORT*2+6) > 512)? (NUM_RD_PORT*2+6) : 512;  
parameter  ENABLE_REORDER = 0;                 // set it to 0 in SW_DIMM_PARTITION mode
parameter  DISABLE_ROOT_FIFO = 0;              // disable root fifo if token ring's root FIFO is merged in iface
// if set to 1, read-ring datapath is replaced with an N-to-1 mux. Arbitration is still a round-robin token, but the datapath uses fewer registers since there's no actual ring.
parameter  ENABLE_READ_FAST = HIGH_FMAX? (NUM_RD_PORT<4) : (NUM_RD_PORT<10);
parameter  ENABLE_DUAL_RING = 1;
parameter  ENABLE_MULTIPLE_WR_RING = 0;        // enable N write rings; N == number of banks
localparam NUM_ID = NUM_RD_PORT+NUM_WR_PORT;   // number of LSUs 
parameter  ROOT_FIFO_DEPTH = 512;              // Token root FIFO depth
parameter  NUM_REORDER = 1;                    // Number of reordering blocks for burst interleaved mode
parameter  ENABLE_LAST_WAIT = 0;               // A temperary fix for global const_cache, which needs avm_waitrequest == 0 to send load request in some cases
parameter  PIPELINE_RD_RETURN = 0;            // 1 = Route the read-return data to the LSUs in a pipelined vine (may help with performance). 0 = fan-out to all LSUs.
localparam RD_ROOT_FIFO_DEPTH = MAX_MEM_DELAY; // Read only root FIFO depth
localparam MWIDTH=8*MWIDTH_BYTES;
localparam ID_WIDTH = $clog2(NUM_ID);
localparam NUM_DIMM_W = $clog2(NUM_DIMM);         
localparam MAX_BURST = 2 ** (BURST_CNT_W-1);
localparam ROOT_FIFO_AW = (ROOT_FIFO_DEPTH >= (5+NUM_WR_PORT*2+MAX_BURST))? $clog2(ROOT_FIFO_DEPTH) : $clog2(5+NUM_WR_PORT*2+MAX_BURST); 
localparam ROOT_RD_FIFO_AW = $clog2(RD_ROOT_FIFO_DEPTH); 
localparam LOG2BYTES = $clog2(MWIDTH_BYTES);
localparam PAGE_ADDR_WIDTH = AWIDTH - LOG2BYTES;
localparam RESET_TYPE = HIGH_FMAX? "SYNC" : "ASYNC";

// avoid modelsim compile error
localparam P_NUM_RD_PORT   = (NUM_RD_PORT > 0)?   NUM_RD_PORT   : 1;   
localparam P_NUM_WR_PORT   = (NUM_WR_PORT > 0)?   NUM_WR_PORT   : 1;   

input  clk;
/* Synchronous if HIGH_FMAX==1, asynchronous otherwise.
   The ring nodes (lsu_ic_token and lsu_n_fast) assert waitrequest to their connected LSUs during reset.
   These blocks are held in reset longer than the rest of the interconnect to ensure that by the time they come out of reset
   and begin accepting requests from the LSUs, the rest of the interconnect is ready to accept the requests.
   resetn must be asserted for at least 30 cycles.
*/
input  resetn;  
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
input  i_avm_readdatavalid [NUM_DIMM];                   
// to MEM                
output  [MWIDTH_BYTES-1:0] o_avm_byteenable [NUM_DIMM];            
output  [AWIDTH-NUM_DIMM_W-1:0] o_avm_address [NUM_DIMM];                
output  o_avm_read [NUM_DIMM];                   
output  o_avm_write [NUM_DIMM];                          
output  [BURST_CNT_W-1:0] o_avm_burstcount [NUM_DIMM];  
output  [MWIDTH-1:0] o_avm_writedata [NUM_DIMM];  
// to LSU
output  o_rd_waitrequest [P_NUM_RD_PORT]; 
output  o_wr_waitrequest [P_NUM_WR_PORT]; 
output  [MWIDTH-1:0] o_avm_readdata [P_NUM_RD_PORT];     
output  o_avm_readdatavalid [P_NUM_RD_PORT]; 
output  logic o_avm_writeack [P_NUM_WR_PORT];

integer i, j;
genvar z;
wire[ID_WIDTH-1:0] o_id [NUM_DIMM];
wire [PAGE_ADDR_WIDTH-1:0] ci_avm_rd_addr [P_NUM_RD_PORT];
wire [PAGE_ADDR_WIDTH-1:0] ci_avm_wr_addr [P_NUM_WR_PORT];
wire [PAGE_ADDR_WIDTH-NUM_DIMM_W-1:0] co_avm_address [NUM_DIMM];

/* For RESET_TYPE==ASYNC mode, a reset synchronizer is used to:
   "help timing; reduce the high fanout of global reset from iface" (original code comment)

For synchronous resets (HIGH_FMAX==1 mode), the reset is registered once to handle BSPs that use a multicycle path constraint on the reset, which is effectively
like a false path on the reset, meaning that registers that use a synchronous reset may be reset at different times, leading to functional failures. Registering the incoming reset once ensures
that all registers in this block are synchronously reset (and come out of reset) at the same time.
*/

logic [1:0] sync_rst_MS;  // Output of the synchronizer when RESET_TYPE==ASYNC
logic       sclr_reg;     // Registered reset when RESET_TYPE==SYNC
logic       reset_synchronized; // Final reset, fed to all submodules

localparam  NUM_RESET_COPIES = 1;
localparam  RESET_PIPE_DEPTH = 5;
logic [NUM_RESET_COPIES-1:0]srst_pipe_out;
  
acl_fanout_pipeline #(
  .PIPE_DEPTH (RESET_PIPE_DEPTH),
  .NUM_COPIES (NUM_RESET_COPIES)
)
 local_reset_fanout_pipeline (
  .clk(clk),
  .in(!resetn),
  .out(srst_pipe_out)
);    

// Reset synchronizer, used when RESET_TYPE==ASYNC
always @(posedge clk or negedge resetn) begin
  if(!resetn) sync_rst_MS <= 2'b11;
  else sync_rst_MS <= {sync_rst_MS[0], 1'b0};
end

assign reset_synchronized = (RESET_TYPE == "ASYNC")? sync_rst_MS[1] : srst_pipe_out[0];

`ifdef GEN_ACCESS_CNT        
  // This part is used to trace the number of requests received from LSUs and sent to global memory
  // for simulation or signalTap mem access analysis
  // add /* synthesis syn_noprune syn_preserve = 1 */ for signalTap
  logic [31:0] i_receive_cnt [NUM_ID]; // num of requests received from LSUs
  logic [31:0] o_return_to_lsu_cnt [NUM_ID]; // returned to LSUs
  logic [8:0]  err_cnt_lsu [NUM_ID];
  logic [0:NUM_ID-1] err_lsu;  
  logic [31:0] o_rd_to_mem_cnt, i_return_cnt; 
  logic [8:0] err_cnt_global;  
  logic [31:0] sum_receive [NUM_RD_PORT];
  logic [31:0] sum_return [NUM_RD_PORT];

    
  debug_io_cnt #(.WIDTH(6)) globl_mem_io_checker (        
    .rst(!resetn),
    .clk(clk),
    .i_0(((o_avm_read[0] & !i_avm_waitrequest[0])? o_avm_burstcount[0] : 0) + ((o_avm_read[1] & !i_avm_waitrequest[1])? o_avm_burstcount[1] : 0)),
    .i_1(i_avm_readdatavalid[0] + i_avm_readdatavalid[1] + 6'd0),
    .o_cnt_0(o_rd_to_mem_cnt),
    .o_cnt_1(i_return_cnt),
    .o_mismatch_cnt(err_cnt_global)
  );            
  generate

    always @(posedge clk) begin
      for(i=0; i<NUM_ID; i=i+1) err_lsu[i] <= |err_cnt_lsu[i];
    end

    for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_LSU_IO_CNT
      assign sum_receive[z] = (z==0)? i_receive_cnt[0] : i_receive_cnt[z] + sum_receive[z-1];
      assign sum_return[z]  = (z==0)? o_return_to_lsu_cnt[0] : o_return_to_lsu_cnt[z] + sum_return[z-1];
      
      debug_io_cnt #(.WIDTH(6)) lsu_io_checker (        
        .rst(!resetn),
        .clk(clk),
        .i_0(((i_rd_request[z] & !o_rd_waitrequest[z])? i_rd_burstcount[z] : 0)),
        .i_1(o_avm_readdatavalid[z] + 0),
        .o_cnt_0(i_receive_cnt[z]),
        .o_cnt_1(o_return_to_lsu_cnt[z]),
        .o_mismatch_cnt(err_cnt_lsu[z])
      );    
    end  
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : GEN_WR_LSU_IO_CNT
      debug_io_cnt #(.WIDTH(6)) lsu_io_checker (        
        .rst(!resetn),
        .clk(clk),
        .i_0((i_wr_request[z] & !o_wr_waitrequest[z]) + 6'd0),
        .i_1(o_avm_writeack[z] + 6'd0),
        .o_cnt_0(i_receive_cnt[z+NUM_RD_PORT]),
        .o_cnt_1(o_return_to_lsu_cnt[z+NUM_RD_PORT]),
        .o_mismatch_cnt(err_cnt_lsu[z+NUM_RD_PORT])
      );    
    end    
  endgenerate
`endif


generate
  if(ENABLE_PERMUTE && ENABLE_REORDER && NUM_DIMM > 1) begin : GEN_ENABLE_ADDR_PERMUTE
    for(z=0; z<NUM_RD_PORT; z=z+1) begin : PERMUTE_RD_ADDR
      assign ci_avm_rd_addr[z] = {i_rd_address[z][SHIFT], i_rd_address[z][AWIDTH-1:SHIFT+1], i_rd_address[z][SHIFT-1:LOG2BYTES]};
    end
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : PERMUTE_WR_ADDR
      assign ci_avm_wr_addr[z] = {i_wr_address[z][SHIFT], i_wr_address[z][AWIDTH-1:SHIFT+1], i_wr_address[z][SHIFT-1:LOG2BYTES]};    
    end
  end
  else begin : GEN_DISABLE_ADDR_PERMUTE
    for(z=0; z<NUM_RD_PORT; z=z+1) begin : PERMUTE_RD_ADDR
      assign ci_avm_rd_addr[z] = i_rd_address[z][AWIDTH-1:LOG2BYTES];
    end
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : PERMUTE_WR_ADDR
      assign ci_avm_wr_addr[z] = i_wr_address[z][AWIDTH-1:LOG2BYTES];
    end
  end
  for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_PAD_O_ADDR
    assign o_avm_address[z] = {co_avm_address[z], {LOG2BYTES{1'b0}}};
  end  
  if(ENABLE_REORDER == 0 && NUM_DIMM > 1) begin : GEN_SW_DIMM         
    lsu_swdimm_token_ring #(
      .AWIDTH(PAGE_ADDR_WIDTH),        
      .MWIDTH_BYTES(MWIDTH_BYTES),      
      .BURST_CNT_W (BURST_CNT_W),       
      .NUM_RD_PORT(NUM_RD_PORT), 
      .NUM_WR_PORT(NUM_WR_PORT), 
      .MAX_MEM_DELAY(MAX_MEM_DELAY),
      .DISABLE_ROOT_FIFO(DISABLE_ROOT_FIFO),
      .ENABLE_READ_FAST(ENABLE_READ_FAST),
      .NUM_DIMM(NUM_DIMM),       
      .ROOT_FIFO_AW(ROOT_FIFO_AW),
      .RD_ROOT_FIFO_AW(ROOT_RD_FIFO_AW),
      .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
      .ENABLE_MULTIPLE_WR_RING(ENABLE_MULTIPLE_WR_RING),
      .ENABLE_DUAL_RING(1),
      .PIPELINE_RD_RETURN(PIPELINE_RD_RETURN),  
      .HIGH_FMAX (HIGH_FMAX)
    )lsu_ic (
      .clk                (clk                ),
      .reset              (reset_synchronized ),
      .i_rd_byteenable    (i_rd_byteenable    ),
      .i_rd_address       (ci_avm_rd_addr     ),
      .i_rd_request       (i_rd_request       ),
      .i_rd_burstcount    (i_rd_burstcount    ),
      .i_wr_byteenable    (i_wr_byteenable    ),
      .i_wr_address       (ci_avm_wr_addr     ),
      .i_wr_request       (i_wr_request       ),
      .i_wr_burstcount    (i_wr_burstcount    ),
      .i_wr_writedata     (i_wr_writedata     ),
      .i_avm_waitrequest  (i_avm_waitrequest  ),
      .i_avm_readdata     (i_avm_readdata     ),
      .i_avm_return_valid (i_avm_readdatavalid),   
      .o_id               (o_id),
      .o_avm_byteenable   (o_avm_byteenable   ),
      .o_avm_address      (co_avm_address     ),
      .o_avm_read         (o_avm_read         ),
      .o_avm_write        (o_avm_write        ),
      .o_avm_burstcount   (o_avm_burstcount   ),
      .o_avm_writedata    (o_avm_writedata    ),
      .o_rd_waitrequest   (o_rd_waitrequest   ),
      .o_wr_waitrequest   (o_wr_waitrequest   ),
      .o_avm_readdata     (o_avm_readdata     ),
      .o_avm_readdatavalid(o_avm_readdatavalid),
      .o_avm_writeack     (o_avm_writeack     )
    );   
  end
  else begin : GEN_SIMPLE    
    lsu_token_ring #(
      .AWIDTH(PAGE_ADDR_WIDTH),        
      .MWIDTH_BYTES(MWIDTH_BYTES),      
      .BURST_CNT_W (BURST_CNT_W),       
      .NUM_RD_PORT(NUM_RD_PORT), 
      .NUM_WR_PORT(NUM_WR_PORT), 
      .NUM_DIMM(NUM_DIMM),     
      .RETURN_DATA_FIFO_DEPTH(RETURN_DATA_FIFO_DEPTH),
      .PIPELINE_RD_RETURN(PIPELINE_RD_RETURN),  
      .MAX_MEM_DELAY(MAX_MEM_DELAY),    
      .ENABLE_MULTIPLE_WR_RING(ENABLE_MULTIPLE_WR_RING),
      .ENABLE_READ_FAST(ENABLE_READ_FAST),
      .DISABLE_ROOT_FIFO(DISABLE_ROOT_FIFO),
      .ROOT_FIFO_AW(ROOT_FIFO_AW),  
      .RD_ROOT_FIFO_AW(ROOT_RD_FIFO_AW),
      .ENABLE_DATA_REORDER(ENABLE_REORDER),
      .NUM_REORDER(NUM_REORDER),
      .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
      .ENABLE_DUAL_RING(1),
      .HIGH_FMAX (HIGH_FMAX)
    )lsu_ic (
      .clk                (clk                ),
      .reset              (reset_synchronized ),
      .i_rd_byteenable    (i_rd_byteenable    ),
      .i_rd_address       (ci_avm_rd_addr     ),
      .i_rd_request       (i_rd_request       ),
      .i_rd_burstcount    (i_rd_burstcount    ),
      .i_wr_byteenable    (i_wr_byteenable    ),
      .i_wr_address       (ci_avm_wr_addr     ),
      .i_wr_request       (i_wr_request       ),
      .i_wr_burstcount    (i_wr_burstcount    ),
      .i_wr_writedata     (i_wr_writedata     ),
      .i_avm_waitrequest  (i_avm_waitrequest  ),
      .i_avm_readdata     (i_avm_readdata     ),
      .i_avm_return_valid (i_avm_readdatavalid),       
      .o_avm_byteenable   (o_avm_byteenable   ),
      .o_avm_address      (co_avm_address     ),
      .o_avm_read         (o_avm_read         ),
      .o_avm_write        (o_avm_write        ),
      .o_avm_burstcount   (o_avm_burstcount   ),
      .o_avm_writedata    (o_avm_writedata    ),
      .o_rd_waitrequest   (o_rd_waitrequest   ),
      .o_wr_waitrequest   (o_wr_waitrequest   ),
      .o_avm_readdata     (o_avm_readdata     ),
      .o_avm_readdatavalid(o_avm_readdatavalid),
      .o_avm_writeack     (o_avm_writeack     )
    );   
  end  
endgenerate
endmodule







module debug_io_cnt #(
  parameter WIDTH = 1
)(        
  input rst,
  input clk,
  input [WIDTH-1:0] i_0,
  input [WIDTH-1:0] i_1,
  output reg [31:0] o_cnt_0,
  output reg [31:0] o_cnt_1,
  output reg        o_mismatch,
  output reg [15:0] o_mismatch_cnt
);            

always @(posedge clk or posedge rst) begin
  if(rst) begin
    o_cnt_0        <= '0;             
    o_cnt_1        <= '0;             
    o_mismatch_cnt <= '0;        
    o_mismatch <= '0;     
  end
  else begin       
    o_cnt_0    <= o_cnt_0 + i_0;        
    o_cnt_1    <= o_cnt_1 + i_1;        
    if(o_cnt_0 == o_cnt_1) o_mismatch_cnt <= '0;   
    else if(!(&o_mismatch_cnt)) o_mismatch_cnt <= o_mismatch_cnt + 1;
    o_mismatch <= |o_mismatch_cnt;
  end
end
endmodule

