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


// Burst interleaved style needs to handle two problems:
//  1) Data is returned in a different bank order than the order in which
//     the banks were issued.
//  2) Multiple data words arrive in the same cycle (from different banks).
//
// This module solves the problem by storing data from different banks in seperate RAMs, and 
// only one RAM's data is sent to LSUs in every clock cycle according to the request order that is buffered.
// Considering the memory bandwidth is data_width x N banks, and one data reordering block sends 
// data_width bits per clock cycle, it might not saturate the available bandwidth. Therefore, 
// module lsu_rd_back_n allows multiple data reordering blocks to be instantiated by setting the
// parameter NUM_REORDER.

module lsu_rd_back_n (
  clk,
  reset,
  // from LSU to MEM  
  i_to_avm_port_num,
  i_to_avm_burstcount,
  i_to_avm_id,
  i_to_avm_valid,  
  // from MEM to LSU
  i_data,
  i_data_valid,
  // to Kernel LSUs
  o_data,
  o_data_valid,
  // ID FIFO status
  o_id_af,
  // data FIFO status, used to stall input requests from LSUs
  o_rd_bank
);

parameter NUM_DIMM = 1;
parameter NUM_RD_PORT = 1;
parameter ID_WIDTH = $clog2(NUM_RD_PORT);  
parameter BURST_CNT_W = 1;
parameter MWIDTH = 512;
parameter MAX_MEM_DELAY = 64; 
parameter DATA_FIFO_DEPTH = 64; 
parameter PIPELINE = 0;
parameter NUM_REORDER = 2;
parameter HIGH_FMAX = 0;  // 1 = optimized, highly pipelined, at the expense of area
/*  Specifies the amount of additional latency that exists on the o_id_af signal before it actually backpressures the read-ring. 
    There might be pipelining on this backpressure, so this latency needs to be accounted for when setting the almost-full threshold 
    of avm_read_req_fifo.
*/
parameter ID_AF_EXTERNAL_LATENCY = 0; 

localparam RESET_TYPE = HIGH_FMAX ? "SYNC" : "ASYNC"; 
localparam REMAINDER = NUM_RD_PORT%NUM_REORDER;
localparam NUM_PORT_PER = NUM_RD_PORT/NUM_REORDER;
localparam NUM_PORT_LAST = NUM_PORT_PER + REMAINDER;
localparam NUM_DIMM_W = $clog2(NUM_DIMM);       
localparam PORT_FIFO_WIDTH = NUM_DIMM_W + BURST_CNT_W + ID_WIDTH;
localparam MAX_BURST = 2**(BURST_CNT_W-1);
localparam THRESHOLD = DATA_FIFO_DEPTH - MAX_BURST * 4;
localparam FIFO_AW = $clog2(DATA_FIFO_DEPTH);
localparam P_ID_WIDTH = (ID_WIDTH == 0)? 1 : ID_WIDTH;
localparam PORT_NUM_DEPTH = MAX_MEM_DELAY;
localparam PORT_NUM_AW = $clog2(PORT_NUM_DEPTH);
localparam P_NUM_DIMM_W = (NUM_DIMM_W == 0)? 1 :NUM_DIMM_W;
localparam RD_WIDTH = (NUM_REORDER == 1)? 1 :$clog2(NUM_PORT_LAST+1);

/*
  The group_info_fifo's almost_full is one of the backpressure sources of the read-ring when NUM_REORDER > 1.
  We must allow for 2 x read-ring-length worth of latency for the backpressure to reach the last LSU (in the worst case)
  and allow for the full ring data path to drain. We also must allow for external pipelining of the almost full (ID_AF_EXTERNAL_LATENCY).
  It appears -5 is for margin.
*/
parameter  FIFO_AF_THRESH = PORT_NUM_DEPTH - 5 - (2*NUM_RD_PORT) - ID_AF_EXTERNAL_LATENCY;



input clk;
input reset;  // reset is synchronous if HIGH_FMAX == 1, asynchronous otherwise
input [P_NUM_DIMM_W-1:0] i_to_avm_port_num;
input [BURST_CNT_W-1:0] i_to_avm_burstcount;
input [P_ID_WIDTH-1:0] i_to_avm_id;
input i_to_avm_valid;
input [MWIDTH-1:0] i_data [NUM_DIMM];
input i_data_valid [NUM_DIMM];
output reg [MWIDTH-1:0] o_data [NUM_RD_PORT] /* synthesis dont_merge */;   // Important when PIPELINE=0 (ie. data is replicated/fanned out to the LSUs)
output reg o_data_valid  [NUM_RD_PORT];
output [RD_WIDTH-1:0] o_rd_bank [NUM_DIMM];
output o_id_af;


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

genvar z, z0;
generate
  if(NUM_REORDER == 1) begin : GEN_SINGLE_REORDER
    wire [NUM_DIMM-1:0] rd_bank;
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_RD
      assign o_rd_bank[z][0] = rd_bank[z];
    end
    lsu_rd_back #(
      .NUM_DIMM (NUM_DIMM),
      .NUM_RD_PORT (NUM_RD_PORT),
      .BURST_CNT_W (BURST_CNT_W),
      .ID_WIDTH(ID_WIDTH),
      .MWIDTH (MWIDTH),    
      .DATA_FIFO_DEPTH(DATA_FIFO_DEPTH),
      .MAX_MEM_DELAY (MAX_MEM_DELAY),
      .PIPELINE (PIPELINE),
      .HIGH_FMAX(HIGH_FMAX),
      .ID_AF_EXTERNAL_LATENCY(ID_AF_EXTERNAL_LATENCY) //This block does not add any additional latency to o_id_af
    ) lsu_rd_back (
      .clk                (clk),
      .reset              (reset),
      .i_to_avm_port_num  (i_to_avm_port_num),
      .i_to_avm_burstcount(i_to_avm_burstcount),
      .i_to_avm_id        (i_to_avm_id),
      .i_to_avm_valid     (i_to_avm_valid),   
      .i_data             (i_data),
      .i_data_valid       (i_data_valid),
      .o_data             (o_data),
      .o_data_valid       (o_data_valid),
      .o_id_af            (o_id_af),
      .o_rd_bank          (rd_bank) 
    );       
  end
  else begin : GEN_N_REORDER
    wire [0:NUM_REORDER-1] i_group_en;
    wire [NUM_DIMM-1:0] id_af;
    wire [NUM_REORDER-1:0] af; 
    wire [NUM_DIMM-1:0] rd_bank [NUM_REORDER];      
    wire goup_i_data_en [NUM_REORDER][NUM_DIMM];   
    wire [0:NUM_REORDER-1] o_group_en [NUM_DIMM];    
    wire [MWIDTH-1:0] group_o_data [NUM_REORDER][NUM_RD_PORT];
    wire group_o_data_en [NUM_REORDER][NUM_RD_PORT];    
    logic [RD_WIDTH-1:0] sum [NUM_DIMM];
    integer i, j;
    // bit add
    always @(*) begin      
      for(i=0; i<NUM_DIMM; i=i+1) begin
        sum[i] = '0;     
        for(j=0; j<NUM_REORDER; j=j+1) begin          
          sum[i] += rd_bank[j][i];
        end
      end
    end 
    assign o_rd_bank = sum;  
    for(z=0; z<NUM_REORDER; z=z+1) begin : GEN_DATA_REORDER         
      if(z < NUM_REORDER-1) begin        
        assign i_group_en[z] = i_to_avm_id >= z*NUM_PORT_PER & i_to_avm_id < (z+1)*NUM_PORT_PER;
        for(z0=0; z0<NUM_PORT_PER; z0=z0+1) begin :  GEN_
          assign o_data[z*NUM_PORT_PER+z0] = group_o_data[z][z*NUM_PORT_PER+z0];
          assign o_data_valid[z*NUM_PORT_PER+z0] = group_o_data_en[z][z*NUM_PORT_PER+z0];
        end
      end
      else begin
        assign i_group_en[z] = i_to_avm_id >= z*NUM_PORT_PER & i_to_avm_id < NUM_RD_PORT; 
        for(z0=0; z0<NUM_PORT_LAST; z0=z0+1) begin :  GEN_
          assign o_data[z*NUM_PORT_PER+z0] = group_o_data[z][z*NUM_PORT_PER+z0];
          assign o_data_valid[z*NUM_PORT_PER+z0] = group_o_data_en[z][z*NUM_PORT_PER+z0];
        end
      end
      for(z0=0; z0<NUM_DIMM; z0=z0+1) begin : GEN_DATA_VALID 
        assign goup_i_data_en[z][z0] = i_data_valid[z0] & o_group_en[z0][z];
      end      
      assign o_id_af = |{af, id_af};
      
      lsu_rd_back #(
        .NUM_DIMM (NUM_DIMM),
        .NUM_RD_PORT (NUM_RD_PORT),
        .BURST_CNT_W (BURST_CNT_W),
        .ID_WIDTH(ID_WIDTH),
        .MWIDTH (MWIDTH),
        .DATA_FIFO_DEPTH(DATA_FIFO_DEPTH),
        .MAX_MEM_DELAY (MAX_MEM_DELAY),
        .PIPELINE (PIPELINE),
        .HIGH_FMAX(HIGH_FMAX)
      ) lsu_rd_back (
        .clk                (clk),
        .reset              (reset),
        .i_to_avm_port_num  (i_to_avm_port_num),
        .i_to_avm_burstcount(i_to_avm_burstcount),
        .i_to_avm_id        (i_to_avm_id),
        .i_to_avm_valid     (i_group_en[z] & i_to_avm_valid),   
        .i_data             (i_data),
        .i_data_valid       (goup_i_data_en[z]),
        .o_data             (group_o_data[z]),
        .o_data_valid       (group_o_data_en[z]),
        .o_id_af            (af[z]),
        .o_rd_bank          (rd_bank[z]) 
      );       
    end // end GEN_DATA_REORDER
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_GROUP_INFO_FIFO
      wire [BURST_CNT_W-1:0] rd_burstcount;
      reg  [BURST_CNT_W-1:0] cnt;
      wire rd_group_info, empty;
      reg  fout_valid;      
      assign rd_group_info = !fout_valid | i_data_valid[z] & rd_burstcount == cnt;
      
      always @(posedge clk or posedge arst) begin
        if(arst) begin
          fout_valid <= 1'b0;
          cnt <= '0;
        end
        else begin
          if(rd_group_info & !empty) fout_valid <= 1'b1;
          else if(i_data_valid[z] & empty & rd_burstcount == cnt)   fout_valid <= 1'b0;  
          if(rd_group_info & !empty)cnt <= 1;
          else if(i_data_valid[z] & cnt < rd_burstcount) cnt <= cnt + 1;   
          // synchronous reset (these assignments override the assignments above if srst is asserted)
          if(srst[0]) begin
            fout_valid <= 1'b0;
            cnt <= '0;
          end          
        end
      end
 
      if (HIGH_FMAX) begin
        scfifo_to_acl_high_speed_fifo #(
          .add_ram_output_register ( "ON"), // Enabling output registers (recommended for best performance when output registers feed logic). Data width is small so this appears to be OK for performance.
          .lpm_numwords (PORT_NUM_DEPTH),  
          .ASYNC_RESET (RESET_TYPE=="ASYNC"),
          .lpm_widthu (PORT_NUM_AW),
          .lpm_showahead ( "OFF"),
          .lpm_type ( "scfifo"),
          .lpm_width (NUM_REORDER+BURST_CNT_W),
          .almost_full_value(FIFO_AF_THRESH),
          .overflow_checking ( "OFF"),
          .underflow_checking ( "ON"),
          .use_eab ( "ON")
        ) group_info_fifo (
          .clock (clk),
          .data ({i_group_en, i_to_avm_burstcount}), 
          .wrreq (i_to_avm_valid & i_to_avm_port_num == z),
          .rdreq (rd_group_info),  
          .empty (empty), 
          .almost_full(id_af[z]), 
          .q ({o_group_en[z], rd_burstcount}),
          .aclr (arst),
          .sclr (reset)
        );       
      end else begin
        scfifo #(
          .add_ram_output_register ( "ON"),
          .lpm_numwords (PORT_NUM_DEPTH),  
          .lpm_widthu (PORT_NUM_AW),
          .lpm_showahead ( "OFF"),
          .lpm_type ( "scfifo"),
          .lpm_width (NUM_REORDER+BURST_CNT_W),
          .almost_full_value(FIFO_AF_THRESH),
          .overflow_checking ( "OFF"),
          .underflow_checking ( "ON"),
          .use_eab ( "ON")
        ) group_info_fifo (
          .clock (clk),
          .data ({i_group_en, i_to_avm_burstcount}), 
          .wrreq (i_to_avm_valid & i_to_avm_port_num == z),
          .rdreq (rd_group_info),  
          .empty (empty), 
          .almost_full(id_af[z]), 
          .q ({o_group_en[z], rd_burstcount}),
          .aclr (arst),
          .sclr (srst)
        ); 
      end

    end // end GEN_GROUP_INFO_FIFO      
  end
endgenerate


endmodule
