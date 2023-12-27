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


/*  This module performs data reordering for load LSUs. Its job is to route the read data returned by the memory to
    the LSU that requested it. It operates in single-bank and multi-bank modes, depending on the value of NUM_DIMM.
    For multi-bank, 2 issues need to be handled:
    1) Data from the various banks are returned in an order different from the order in which the read-requests were issued to the banks.
    2) Data from the various banks can return at the same time.

    When read data is returned from the memory it needs to be routed to the LSUs in the same order that the LSUs issued the read 
    requests to the memory. This is managed by locally storing the read requests as they are issued (in the order they are issued)
    to the Avalon-MM interface. They are stored in avm_read_req_fifo

    Assumptions:
    - All of the read data from a single read request will come from a single bank.
*/
`timescale 1ns / 1ns  
module lsu_rd_back (
  clk,
  reset,  // Synchronous reset if HIGH_FMAX == 1. Should be held for at least 20 + RD_PORT_NUM cycles (not an exact, calculated number, but this is a safe amount). Several signals use a "trickle reset" (ie. they depend on the reset state propagating through the module). Otherwise, asynchronous reset.
  // from LSU to MEM. These are the read requests being issued to the memory.  
  i_to_avm_port_num,
  i_to_avm_burstcount,
  i_to_avm_id,
  i_to_avm_valid,  
  // from MEM to LSU. This is the read return data.
  i_data,
  i_data_valid,
  // to Kernel LSUs. This is the data routed to each Load-LSU.
  o_data,
  o_data_valid,
  // Indicates a read is happening from the i'th data FIFO. Used only in multi-bank. This signal is typically used externally to count the number of outstanding read return data words so the issuing of read requests to the memory can be throttled to ensure the data FIFO doesn't overflow.
  o_rd_bank,
  // avm_read_req_fifo almost full. This signals if more outstanding read-requests can be handled. This can be used to backpressure the generation of read requests.
  o_id_af
);

parameter NUM_DIMM = 1;         // Number of banks.
parameter NUM_RD_PORT = 1;      // Number of Load-LSUs
parameter ID_WIDTH = $clog2(NUM_RD_PORT);  
parameter BURST_CNT_W = 1;      // Width of i_to_avm_burstcount
parameter MWIDTH = 512;         // Memory datapath width (width of i_data)
parameter MAX_MEM_DELAY = 64;   // Specifies the depth of avm_read_req_fifo. The maximum of read requests that can be outstanding to the memory is calculated using this (AVM_READ_REQ_FIFO_AF_THRESHOLD).
parameter DATA_FIFO_DEPTH = 64; // Depth of the return data FIFOs. Used in multi-bank.
parameter PIPELINE = 0;         // 0 = o_data is replicated and fans out to all of the LSUs. 1 = o_data is a pipelined vine to which the LSUs are connected sequentially. o_data_valid[i] matches the latency of o_data[i]. This mode might be better for placement when there are many LSUs.
parameter HIGH_FMAX = 0; // 1 = highly optimized/pipelined code is used, at the expense of area.
localparam PORT_NUM_DEPTH = MAX_MEM_DELAY;
parameter FIFO_AF_THRESH = PORT_NUM_DEPTH - 5 - 2*NUM_RD_PORT;
/*  Specifies the amount of additional latency that exists on the o_id_af signal before it actually backpressures the read-ring. 
    There might be pipelining on this backpressure, so this latency needs to be accounted for when setting the almost-full threshold 
    of avm_read_req_fifo.
*/
parameter ID_AF_EXTERNAL_LATENCY = 0; 

localparam NUM_DIMM_W = $clog2(NUM_DIMM);                       // Number of bits used to represent NUM_DIMM
localparam P_NUM_DIMM_W = (NUM_DIMM_W == 0)? 1 : NUM_DIMM_W;    // Modifier if NUM_DIMM == 1 (therefore NUM_DIMM_W==0).
localparam P_ID_WIDTH = (ID_WIDTH == 0)? 1 : ID_WIDTH;

input clk;
input reset;
input [P_NUM_DIMM_W-1:0] i_to_avm_port_num;
input [BURST_CNT_W-1:0] i_to_avm_burstcount;
input [P_ID_WIDTH-1:0] i_to_avm_id;
input i_to_avm_valid;
input [MWIDTH-1:0] i_data [NUM_DIMM];
input i_data_valid [NUM_DIMM];
// When PIPELINE=0, o_data fans out to each LSU like a tree, meaning the output data
// is replicated to each LSU.
// When PIPELINE=1, a pipelined vine is created and each LSU hangs off sequential
// positions on the vine. o_data_valid is latency-matched, meaning
// The latency of o_data_valid[i] matches the latency of o_data[i] to the i'th LSU.
// Index [0] is the last (furthest) position on the vine (ie. data enters the vine at
// o_data[NUM_RD_PORT-1])
output reg [MWIDTH-1:0] o_data [NUM_RD_PORT] /* synthesis dont_merge */;  // The dont_merge is relevant when PIPELINE=0 (the data is replicated/fanned-out to all LSUs)
output reg o_data_valid  [NUM_RD_PORT];
output reg [NUM_DIMM-1:0] o_rd_bank;
output o_id_af;

generate
  if (HIGH_FMAX == 0) begin
    
    localparam PORT_FIFO_WIDTH = NUM_DIMM_W + BURST_CNT_W + ID_WIDTH;
    localparam MAX_BURST = 2**(BURST_CNT_W-1);
    localparam THRESHOLD = DATA_FIFO_DEPTH - MAX_BURST * 4;
    localparam FIFO_AW = $clog2(DATA_FIFO_DEPTH);
    localparam PORT_NUM_DEPTH = MAX_MEM_DELAY;
    localparam PORT_NUM_AW = $clog2(PORT_NUM_DEPTH);

    integer i;
    genvar z;
    wire [PORT_FIFO_WIDTH-1:0] fin, fout;
    wire rd_port_num;
    wire port_num_empty;
    wire [P_NUM_DIMM_W-1:0] port_num;
    wire [BURST_CNT_W-1:0] rd_burstcount;
    reg  [BURST_CNT_W-1:0] cnt;
    wire [ID_WIDTH-1:0] return_id;
    wire [NUM_DIMM-1:0] rd_data_en, data_empty;
    wire [MWIDTH-1:0] data_out [NUM_DIMM];
    reg  R_rd_port_num;
    reg  [P_NUM_DIMM_W-1:0] R_port_num;
    reg  [ID_WIDTH-1:0] R_id;
    reg  [MWIDTH-1:0] data_to_ic;
    reg  data_to_ic_en;
    reg  [BURST_CNT_W-1:0] R_o_avm_burstcnt;
    reg  port_num_valid;
    reg  data_out_valid;
    reg  [0:NUM_RD_PORT-1] data_id_en [NUM_RD_PORT];
    wire id_af;
    wire [0:NUM_DIMM-1] data_overflow;

          
    assign o_id_af = id_af;

    always @(posedge clk) begin
      R_port_num <= port_num;
      R_id <= return_id; // return_id is aligned with port_num; R_id ~ R_port_num
      data_to_ic <= (NUM_DIMM == 1)? i_data[0] : data_out[R_port_num]; 
      R_o_avm_burstcnt <= i_to_avm_burstcount;     
      `ifdef SIM_ONLY
      if(data_overflow) begin
        $display("data overflow");
        $stop;
      end
      `endif
    end   

    always @(posedge clk or posedge reset) begin
      if(reset) begin
        data_to_ic_en <= 1'b0;
        R_rd_port_num <= 1'b0;
        port_num_valid <= 1'b0;
        data_out_valid <= 1'b0;
        o_rd_bank <= 0; 
        cnt <= 0;
      end
      else begin
        data_out_valid <= !data_empty[port_num];
        data_to_ic_en <= data_out_valid;
        R_rd_port_num <= rd_port_num & !port_num_empty;
        if(NUM_DIMM == 1)begin
          if(rd_port_num & !port_num_empty) port_num_valid <= 1'b1;
          else if(i_data_valid[0] & port_num_empty & rd_burstcount == cnt)   port_num_valid <= 1'b0;     
          if(rd_port_num & !port_num_empty)cnt <= 1;
          else if(i_data_valid[0] & cnt < rd_burstcount) cnt <= cnt + 1;          
        end
        else begin 
          if(rd_port_num & !port_num_empty) port_num_valid <= 1'b1;
          else if(!data_empty[port_num] & port_num_empty & rd_burstcount == cnt)   port_num_valid <= 1'b0;  
          if(rd_port_num & !port_num_empty)cnt <= 1;
          else if(!data_empty[port_num] & cnt < rd_burstcount) cnt <= cnt + 1;   
        end       
        
        for(i=0; i<NUM_DIMM; i=i+1)  begin 
          o_rd_bank[i] <= rd_data_en[i] & !data_empty[i];      
        end           
      end
    end

    if(PIPELINE) begin : GEN_PENDING_DATA
      always @(posedge clk) begin
        o_data[NUM_RD_PORT-1] <= data_to_ic; 
        for(i=0; i<NUM_RD_PORT-1; i=i+1) begin
          o_data[i] <= o_data[i+1];
        end
      end
      always @(posedge clk or posedge reset) begin
        if(reset) begin
          for(i=0; i<NUM_RD_PORT; i=i+1) begin
            o_data_valid[i] <= 1'b0;
            data_id_en[i] <= 0;
          end
        end
        else begin     
          if(NUM_RD_PORT > 1) begin     
            for(i=0; i<NUM_RD_PORT; i=i+1) begin          
              data_id_en[NUM_RD_PORT-1][i] <= (NUM_DIMM == 1)? (i_data_valid[0] & return_id == i) : (data_out_valid & R_id == i);// data_id_en[0] is aligned with data_to_ic
              if(i<NUM_RD_PORT-1) data_id_en[i] <= data_id_en[i+1];
              o_data_valid[i] <= data_id_en[i][i];
            end
          end
          else begin
            data_id_en[0][0] <=  (NUM_DIMM == 1)? i_data_valid[0] : data_out_valid;            
            o_data_valid[0] <= data_id_en[0][0];
          end
        end
      end
    end // end GEN_PENDING_DATA
    else begin : GEN_FAST_DATA
      always @(posedge clk) begin
        for(i=0; i<NUM_RD_PORT; i=i+1) begin
          o_data[i] <= (NUM_DIMM == 1)? i_data[0] : data_to_ic;
        end
      end
      always @(posedge clk or posedge reset) begin
       if(reset) begin
          for(i=0; i<NUM_RD_PORT; i=i+1) begin
            o_data_valid[i] <= 1'b0;
            data_id_en[i] <= 0;
         end
        end
        else begin  
          if(NUM_RD_PORT > 1) begin           
           for(i=0; i<NUM_RD_PORT; i=i+1)  begin // data_id_en[0] is aligned with data_to_ic
              data_id_en[0][i] <= (NUM_DIMM == 1)? (i_data_valid[0] & return_id == i) : (data_out_valid & R_id == i);// data_id_en[0] is aligned with data_to_ic
              o_data_valid[i] <= (NUM_DIMM == 1)? (i_data_valid[0] & return_id == i) : data_id_en[0][i];
           end
          end
          else begin
            data_id_en[0][0] <=  (NUM_DIMM == 1)? i_data_valid[0] : data_out_valid;            
            o_data_valid[0] <= (NUM_DIMM == 1)? i_data_valid[0] : data_id_en[0][0];
          end      
        end
      end
    end
     
      
    if(NUM_DIMM == 1) begin : GEN_SINGLE_DIMM
      assign rd_port_num = !port_num_valid | i_data_valid[0] & (rd_burstcount == cnt);
      assign fin = (ID_WIDTH == 0)? i_to_avm_burstcount : {i_to_avm_burstcount, i_to_avm_id};   
      assign return_id = fout[P_ID_WIDTH-1:0];  
      assign rd_burstcount = fout[PORT_FIFO_WIDTH-1:ID_WIDTH];  
    end
    else begin : GEN_MULTIPLE_DIMM
      assign rd_port_num = !port_num_valid | !data_empty[port_num] & (rd_burstcount == cnt);
      assign fin = (ID_WIDTH == 0)? {i_to_avm_port_num[NUM_DIMM_W-1:0], i_to_avm_burstcount} : {i_to_avm_port_num[NUM_DIMM_W-1:0], i_to_avm_burstcount, i_to_avm_id};
      assign return_id = fout[P_ID_WIDTH-1:0];  
      assign rd_burstcount = fout[ID_WIDTH+BURST_CNT_W-1:ID_WIDTH];    
      assign port_num = fout[PORT_FIFO_WIDTH-1:PORT_FIFO_WIDTH-NUM_DIMM_W];    
      
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DATA_FIFO
        assign rd_data_en[z] = port_num == z[NUM_DIMM_W-1:0];             
        
        scfifo #(
          .add_ram_output_register ( "ON"),
          .lpm_numwords (DATA_FIFO_DEPTH),  
          .lpm_widthu (FIFO_AW),
          .lpm_showahead ( "OFF"),
          .lpm_type ( "scfifo"),
          .lpm_width (MWIDTH),
          .overflow_checking ( "OFF"),
          .underflow_checking ( "ON"),
          .use_eab ( "ON")
        ) return_data_fifo (
          .clock (clk),
          .data (i_data[z]), 
          .wrreq (i_data_valid[z]),
          .rdreq (rd_data_en[z]),  
          .empty (data_empty[z]), 
          .q (data_out[z]),
          .full(data_overflow[z]),
          .aclr (reset)
        );    
      end
    end
    


    scfifo #(
      .add_ram_output_register ( "ON"),
      .lpm_numwords (PORT_NUM_DEPTH),  
      .lpm_widthu (PORT_NUM_AW),
      .lpm_showahead ( "OFF"),
      .lpm_type ( "scfifo"),
      .lpm_width (PORT_FIFO_WIDTH),
      .almost_full_value(FIFO_AF_THRESH),
      .overflow_checking ( "OFF"),
      .underflow_checking ( "ON"),
      .use_eab ( "ON")
    ) port_num_fifo (
      .clock (clk),
      .data (fin), 
      .wrreq (i_to_avm_valid),
      .rdreq (rd_port_num),  
      .empty (port_num_empty), 
      .almost_full(id_af),
      .q (fout),
      .aclr (reset)
    );       

  end else begin // HIGH_FMAX == 1
    /*********************************************************
      High-FMAX design.
    *********************************************************/
    /* The following code is highly optimized and agressively pipelined, for higher FMAX.
    */

    /* 
      The code that shifts the one-hot burst counters and looks ahead to when the counter is rolling over
      assumes that MAX_BURST >= 2, so we add +1 here to ensure this true.
      If BURST_CNT_W == 1, meaning that the true/intended maximum burstcount is 1, then the one-hot burst counters are not used at 
      all since the burstcount of every request will be 1.
    */
    localparam MAX_BURST = 2**(BURST_CNT_W-1) + 1; 
    localparam AVM_READ_REQ_FIFO_DATA_WIDTH = 1 + MAX_BURST + P_NUM_DIMM_W + BURST_CNT_W + P_ID_WIDTH; // 1+ is for the burstcount_equals_one flag
    localparam DATA_FIFO_ADDR_WIDTH = $clog2(DATA_FIFO_DEPTH);
    localparam AVM_READ_REQ_FIFO_DEPTH = MAX_MEM_DELAY;
    localparam AVM_READ_REQ_FIFO_ADDR_WIDTH = $clog2(AVM_READ_REQ_FIFO_DEPTH);
    localparam READ_REQ_INPUT_PIPE_DEPTH = 1; // Depth of the pipeline on the input read requests (before they are written to avm_read_req_fifo)

    /* The almost_full of the avm_read_req FIFO is used to backpressure the read ring. The depth of the FIFO matches the
      depth of the read-root-FIFO in lsu_token_ring. It is important that neither of these FIFOs overflows (otherwise read requests will be lost)
      By choosing avm_read_req_fifo's almost_full threshold to prevent it from overflowing, the read_root_fifo
      is also prevented from overflowing, since they have the same depth and they both collect the outgoing read requests.
      Although both FIFOs have the same depth, the avm_read_req_fifo's is effectively a bit deeper due to the reasons described below, so its
      almost_full threshold is lowered to ensure the read-root-FIFO does not overflow if the avm_read_req_fifo fills up.

      There are some additiona adjustments to the threshold to account to account for various latencies and other effects in the system, as described below.

      We must account for the stall latency through the read-ring 
      (ie. in the worst case, the issuing LSU is at the end of the read-ring, so NUM_RD_PORT requests could be issued before 
      the stall reaches the LSU, followed by another NUM_RD_PORT that were already in the read-ring datapath). 
      The depth of the avm_read_req FIFO is effectively deepened by 1 because of the skid buffer, and deepened by another 1 since we pre-read the first word
      out of the FIFO. So we need to subract a total of 2 from the "depth".
      We also pipeline the input by READ_REQ_INPUT_PIPE_DEPTH cycles, so avm_read_req_fifo is written to 1 cycle later than the read_root_fifo, so we must reduce the 
      threshold by 1 to compensate for this.
      This almost-full signal may be additionally pipelined external to this block before reaching the read-ring, so we must subtract ID_AF_EXTERNAL_LATENCY
      The -5 is for margin.
    */
    parameter AVM_READ_REQ_FIFO_AF_THRESHOLD = (AVM_READ_REQ_FIFO_DEPTH - 2) - (2*NUM_RD_PORT) - 1 - ID_AF_EXTERNAL_LATENCY - 5;

    localparam DATA_FIFO_READ_REQ_PIPE_DEPTH = 3; // The number of pipeline stages on the data FIFO read_req signal, from the data_fifo_read state machine to the FIFO.
    localparam NUM_RETURN_DATA_FIFO_READ_REQ_DUPES = 2; // Duplicate the read-req to the return data FIFOs.
    logic [DATA_FIFO_READ_REQ_PIPE_DEPTH:1][NUM_DIMM-1:0] returnDataFIFO_rdreq_pipe[NUM_RETURN_DATA_FIFO_READ_REQ_DUPES]/* synthesis dont_merge */;

    /*  Number of cycles from reading from avm_read_req_fifo to the corresponding bank's data FIFO being read from
        (ie. when returnDataFIFO_rdreq[z] == 1).
        This parameter does not set this latency, rather it's set to indicate what the latency is in the code and is used for other latency matching.
        It requires 2 cycles for the bankReadBegin signal to propagate to bankReadEnable through the data_fifo_read statemachine, followed by 
        DATA_FIFO_READ_REQ_PIPE_DEPTH through the read_req pipeline.
    */
    localparam BANK_READ_ENABLE_LATENCY = 2 + DATA_FIFO_READ_REQ_PIPE_DEPTH; // Number of cycles from reading from avm_read_req_fifo to the corresponding bank being selected (ie. bankReadEnable[z]=1). This parameter does not set this latency, rather it's set to indicate what the latency is in the code and is used for other latency matching.
    localparam DATA_FIFO_OUT_PIPE_DEPTH = 1; // Specifies the number of pipeline stages on the output of each data FIFO.
    localparam DATA_OUT_MUX_PIPE_DEPTH = 3; // Specifies the number of pipeline stages in the mux that feeds returnData_out*
    localparam BANK_READ_DONE_PIPE_DEPTH = 1; // The bankReadDone signals (one per bank) are muxed and this mux needs to be pipelined as the number of banks grows. Set to 1 for 4 banks or fewer (ie. 1 LUT can implemented a 4:1 mux).
    localparam DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH = 1;
    localparam DATA_INPUT_PIPE_DEPTH = 1; // Depth of the pipeline on the input read return data

    `ifdef SIMONLY
      localparam SIM = 1;
    `else
      localparam SIM = 0;
    `endif

    // This threshold is set to allow us to check if there's enough data in the FIFO
    // to read out a full burst (MAX_BURST). In general, if the FIFO contains more than MAX_BURST words, then
    // the data FIFO has enough data for us to read out a burst of any valid length.
    // However, bankReadEnable has some latency, meaning that when the state machine triggers a read
    // to the next bank (using bankReadBegin), it takes a few cycles before the reads from 
    // the FIFO actually begin. To compensate for this, 
    // the state machine looks ahead on the FIFO fullness of the next bank to check
    // if it has enough data to service the burst, in which case, it triggers the read
    // to this next bank early so that reads from the next FIFO begin immediately after
    // reads from the current FIFO stop (ie. no bubbles).
    // However, in the case of servicing back-to-back bursts from the same bank, 
    // at the time we check the FIFO fullness, the FIFO is still being read to service
    // the current burst, so at this instant, the FIFO must contain more than MAX_BURST words 
    // to be guaranteed to finish servicing the current request and fully service the next request.
    // The number of extra words it needs is equal to the bankRead latency, hence the + BANK_READ_ENABLE_LATENCY.
    // Since FIFO fullness is checked using the almost_empty, and the almost_empty's are pipeline-muxed,
    // we have to account for the latency through this mux as well, hence the + DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH.
    // + 5 is a safety margin. 
    // This threshold effectively indicates the FIFO fullness at which we'll start doing slow-reads.
    // This value needs to be at least 4 to avoid incorrect behaviour on the almost_empty flag in scfifo (case:414451)
    localparam DATA_FIFO_ALMOST_EMPTY_THRESHOLD = MAX_BURST + BANK_READ_ENABLE_LATENCY + DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH + 5; 

    // One reset for each FIFO and its related logic (avm_read_req_fifo + NUM_DIMM data FIFOs), and one reset for everything else
    localparam  NUM_RESET_COPIES = 1 + (1 + NUM_DIMM);
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

    integer i;
    genvar z;
    genvar y;
    logic [READ_REQ_INPUT_PIPE_DEPTH:1][AVM_READ_REQ_FIFO_DATA_WIDTH-1:0] avm_read_req_fifo_data_in;
    logic [AVM_READ_REQ_FIFO_DATA_WIDTH-1:0] avm_read_req_fifo_skid_buffer_data_out;
    localparam NUM_AVM_READ_REQ_DUPES = 2;
    logic avm_read_req_skid_buffer_rreq[NUM_AVM_READ_REQ_DUPES] /* synthesis dont_merge */; // This is the read-request signal to the AVM read-request skid buffer. The skid buffer deepens the FIFO therefore this signal can be thought of as a FIFO read-request.
    logic avm_read_req_skid_buffer_empty; 

    logic [P_NUM_DIMM_W-1:0] bank_num_current;  // The bank number from the current read request at the skid buffer output.
    logic [P_NUM_DIMM_W-1:0] bankSelect_lookahead_wire; // The bank number from the next read request (we lookahead to this)
    logic [MAX_BURST:1] burstcount_onehot_input;  // The burstcount of the input read-request, converted to one-hot.
    logic [MAX_BURST:1] burstcount_onehot_current; // Burstcount output from avm_read_req_fifo. This is the burstcount of the current read request.
    // One burstcount register per bank. This gets loaded into the per-bank one-hot counter.
    // It's also pipelined to match the latency of the read req to the data FIFO
    logic [MAX_BURST:1] burstcount_onehot_current_reg[DATA_FIFO_READ_REQ_PIPE_DEPTH:1][NUM_DIMM]; 
    logic load_slowread_counter[DATA_FIFO_READ_REQ_PIPE_DEPTH:1][NUM_DIMM];
    logic burstcount_equals_one_input;  // Flag to indicate that the burstcount == 1, input to the avm_read_req_fifo.
    logic burstcount_equals_one_current; // Output from avm_read_req_fifo.
    logic burstcount_equals_one_previous; // Flag to indicate if the previous request's burcount == 1
    logic burstcount_equals_one_lookahead;  // Looks ahead to the next request in avm_read_req_fifo
    logic avm_read_req_fifo_wrreq [READ_REQ_INPUT_PIPE_DEPTH:1];  
    logic [P_ID_WIDTH-1:0] lsu_return_id_current;   // The current LSU ID at the output of avm_read_req_fifo

    /* One-hot encoded counters for reading data from a bank.
     There is one slowRead counter per bank, for performance.
     Explanations of slow-read and burst-read are given near the state-machine code.
     They are defined as MAX_BURST+1 -- the +1 is there if MAX_BURST==1. Since these counters are indexed at position [2]
     in some places in the code, this ensures this index exists and prevents a compilation error. But these code paths are not used
     if the maximum burstcount == 1 anyways, so it should be safe.
    */
    logic [MAX_BURST:1] slowRead_DataCount_onehot[NUM_DIMM]; // A one-hot encoded counter (basically a shift register) to count the return data so we know when a burst is complete. One counter per bank.
    logic [BANK_READ_ENABLE_LATENCY:1][NUM_DIMM-1:0] slowRead_Flag ; // Indicates that the specified bank is doing a slow-read rather than a burst read. Used to ensure bankReadDone is asserted only on slow-reads.
    logic [MAX_BURST:1] burstRead_DataCount_onehot;  // Counter used when doing a burst-read.
    /*  This onehot counter is used by the data_fifo_read state machine when doing a slow-read. It counts 
        the latency on the read_req pipeline to control how often to issue a read-req. Essentially this counter
        is used to to count the effective read latency through the FIFO (the actual latency through the FIFO is 1
        but it appears longer to the data_fifo_read state machine due to the added pipeline on the read_req).
    */
    logic [DATA_FIFO_READ_REQ_PIPE_DEPTH + 1:1] data_fifo_slow_read_latency_count_onehot[NUM_DIMM];

    // To simplify the output pipelining, lsu_return_id is kept in-sync with the data being read out of the given bank's FIFO.
    // The stored return ID updates at the start of every burst.
    // This ID is pipelined to match the latency of bankReadEnable being asserted to the given bank + the depth of the pipeline on the data-FIFO output. This
    // results in the ID being in sync with the data.
    localparam  BANK_MUX_SELECT_PIPE_DEPTH = BANK_READ_ENABLE_LATENCY + DATA_FIFO_OUT_PIPE_DEPTH;
    logic [BANK_MUX_SELECT_PIPE_DEPTH:1][NUM_DIMM-1:0][P_ID_WIDTH-1:0] lsu_return_id_reg; 

    
    logic [NUM_DIMM-1:0] returnDataFIFO_rdreq[NUM_RETURN_DATA_FIFO_READ_REQ_DUPES]/* synthesis dont_merge */; 
    logic [NUM_DIMM-1:0] returnDataFIFO_empty;
    // Delayed versions of rdreq and empty, used to generate o_rd_back, which fans outside of this module, so these delayed versions are also like duplicates for performance.
    logic [NUM_DIMM-1:0] returnDataFIFO_rdreq_delayed;
    logic [NUM_DIMM-1:0] returnDataFIFO_rdreq_empty_delayed;


    logic [NUM_DIMM-1:0] returnDataFIFO_AlmostEmpty;
    logic returnDataFIFO_AlmostEmpty_CurrentBank; // Output of the pipeline
    logic returnDataFIFO_AlmostEmpty_NextBank_Pipe[DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH:1]; //The almost-empty from the data FIFO of the bank to be selected next
    logic returnDataFIFO_AlmostEmpty_NextBank;  // Output of the pipeline
    logic returnDataFIFO_AlmostEmpty_NextBank_Lookahead_Pipe[DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH:1]; // Looks ahead into the avm_read_req_fifo
    logic returnDataFIFO_AlmostEmpty_NextBank_Lookahead;  // Output of the pipeline

    logic [MWIDTH-1:0] returnDataFIFO_data_out [NUM_DIMM];
    logic [MWIDTH-1:0] data_output_to_interconnect;
    logic [NUM_RD_PORT-1:0] data_valid_output_to_interconnect;
    logic returnData_out_valid[DATA_OUT_MUX_PIPE_DEPTH:1];
    logic [MWIDTH-1:0] returnData_out[DATA_OUT_MUX_PIPE_DEPTH:1];
    logic data_fifo_out_valid[DATA_FIFO_OUT_PIPE_DEPTH:1][NUM_DIMM];
    logic [MWIDTH-1:0] data_fifo_out[DATA_FIFO_OUT_PIPE_DEPTH:1][NUM_DIMM];
    logic [P_ID_WIDTH-1:0] data_fifo_out_lsu_return_id_reg[DATA_FIFO_OUT_PIPE_DEPTH:1]; 
    logic [P_ID_WIDTH-1:0] returnData_out_lsu_return_id[DATA_OUT_MUX_PIPE_DEPTH:1]; // LSU return ID accompanying the output data. Used to route the data to the specified LSU.
    logic  [0:NUM_RD_PORT-1] data_valid_vine_output_pipeline [NUM_RD_PORT];
    logic id_af;
    logic [0:NUM_DIMM-1] data_overflow;

    // Flag to indicate we should read the next request out of the avm_read_req_fifo
    // ahead of time. We do this at the very beginning to get ready to receive the returned data. 
    // for the first request. We also assert this flag when the avm_read_req_fifo goes empty
    // (ie. the last request has been serviced) because we'll need to pre-read the next request
    // as soon as it's available on the avm_read_req_fifo output. All other reads to avm_read_req_fifo
    // are done at the end of the current burst.
    logic preReadNextRequest;
    logic [NUM_DIMM-1:0] bankReadBegin;  // A strobe to trigger reading from the specified bank
    logic [NUM_DIMM-1:0] bankReadEnable; // A flag that is asserted while reading from the specified bank. This feeds the read-req of the respective Data FIFO.
    logic [NUM_DIMM-1:0] bankReadDone;  // Strobe to indicate that a burst from the specified bank has been completely read out
    logic bankReadDone_CurrentBank_Pipe[BANK_READ_DONE_PIPE_DEPTH:1];  
    logic bankReadDone_CurrentBank; // Output of the pipelined mux that selects the bankReadDone signal from the current bank we are reading from.
    localparam NUM_DATA_OUT_FANOUT_SECTIONS = (MWIDTH/32);  // Break up the fanout to the data out mux into sections of 32
    localparam NUM_BANK_SELECT_DUPE_PIPES = 2;      // returnData_BankSelect has a high fanout and feeds a loop in the state machine. Create one copy for the forward fanout and one for the loop, to help with retiming.
    localparam NUM_BANK_SELECT_FORWARD_DUPES = NUM_DATA_OUT_FANOUT_SECTIONS + 10;  // Number of duplicates of returnData_BankSelect to create, at the output of each pipe. Break up the data path fanout into 32-bit chunks. Add an additional 10 fanouts for control-path muxes. Not all will be used. 
    // Selects which bank's data FIFO should be read from when outputting the return data. This is essentially the select signal for the mux on the Data FIFO outputs.
    // Signal is pipelined by BANK_READ_ENABLE_LATENCY stages to match the bankReadEnable latency.
    logic [P_NUM_DIMM_W-1:0] returnData_BankSelect_Pipe[NUM_BANK_SELECT_DUPE_PIPES-1:0][BANK_MUX_SELECT_PIPE_DEPTH:1]  /* synthesis dont_merge */; 
    logic [P_NUM_DIMM_W-1:0] returnData_BankSelect[NUM_BANK_SELECT_DUPE_PIPES-1:0][NUM_BANK_SELECT_FORWARD_DUPES-1:0]  /* synthesis dont_merge */;

    logic [AVM_READ_REQ_FIFO_DATA_WIDTH-1:0] avm_read_req_fifo_data_out;
    logic avm_read_req_fifo_empty; 
    logic avm_read_req_fifo_read_req; 

    // For Single-DIMM, pipeline the inputs so we can lookahead on the valids. Not used in multi-bank since the input data are written directly into the data FIFOs
    logic [DATA_INPUT_PIPE_DEPTH:1][MWIDTH-1:0] input_data_pipe;
    logic [MWIDTH-1:0] input_data_current;
    logic [DATA_INPUT_PIPE_DEPTH:0] input_data_valid_pipe; // Index-0 is not really used, it's only defined to allow an out-of-bounds access to Modelsim won't complain.
    logic input_data_valid_current;
    logic input_data_valid_lookahead1;
    logic waiting_for_last_word_arriving_next;
    logic receiving_second_last_word_last_word_arriving_next;
    logic burstcount_equals_one_current_and_data_arriving_next;

    // State machine for parsing the read requests from the LSUs and deciding which bank's dataFIFO to read from
    enum logic [1:0] {
      STATE_WAIT_FOR_REQUEST = 2'b00,// avm_read_req_fifo is empty so we're waiting for a read request to show up
      STATE_LOAD_REQUEST = 2'b01,   // Load a new read request from avm_read_req_fifo.
      STATE_BURST_READ = 2'b10,    // There is already enough data in the data FIFO to complete the burst, so we can read continuously and pipeline ideally.
      STATE_SLOW_READ = 2'b11     // There isn't enough data in the FIFO, so we have to monitor the FIFO empty and read words as they become available (ie. we cannot read continuously).
    } bank_read_state;

    // State machine to control the read-requests to each data FIFO. Each FIFO has one of these state-machines local to it.
    typedef enum logic [1:0] {
      STATE_DATA_FIFO_READ_WAIT = 2'b00,
      STATE_DATA_FIFO_READ_BURST = 2'b01,
      STATE_DATA_FIFO_READ_SLOW = 2'b10
    } data_fifo_read_state_type;
    data_fifo_read_state_type data_fifo_read_state [NUM_DIMM-1:0];    

    assign o_id_af = id_af;

    // These asserts are in an ifdef because Quartus 16.1 does not ignore them in the synthesis.
    `ifdef SIMONLY
      // Only one bankReadEnable should ever be asserted at a time.
      property p1;
        @(posedge clk) $onehot0(bankReadEnable);
      endproperty
      ERR_bankReadEnables_asserted_simultaneously:
        assert property (p1);
      COVER_bankReadEnables_asserted_simultaneously:
        cover property (p1);

      property reading_from_data_fifo_not_aligned_with_slow_read_latency_counter_rollover (read_req, data_fifo_read_state, counter_rollover);
        @(posedge clk) (read_req && data_fifo_read_state == STATE_DATA_FIFO_READ_SLOW) |-> counter_rollover;
      endproperty

      for (genvar i=0;i<NUM_DIMM;i++) begin
        ERR_reading_from_data_fifo_not_aligned_with_slow_read_latency_counter_rollover:
        assert property (reading_from_data_fifo_not_aligned_with_slow_read_latency_counter_rollover(returnDataFIFO_rdreq[1][i],data_fifo_read_state[i],data_fifo_slow_read_latency_count_onehot[i][1]))
          else $display ("Error, reading from data FIFO is not aligned with slow read latency counter rollover");
      end

      // Reading from an empty data FIFO should only occur in slow-read mode
      property read_from_empty_FIFO_slow_read(read,empty);
        @(posedge clk) (read && empty) |-> (bank_read_state == STATE_SLOW_READ);
      endproperty

      for (genvar i=0;i<NUM_DIMM;i++) begin
        ERR_Reading_From_Empty_Data_FIFO_Not_In_Slow_Read:
          assert property (read_from_empty_FIFO_slow_read(returnDataFIFO_rdreq[1][i],returnDataFIFO_empty[i]))
            else $display("Error, reading from empty data FIFO");
        COVER_Reading_From_Empty_Data_FIFO_Not_In_Slow_Read:
          cover property (read_from_empty_FIFO_slow_read(returnDataFIFO_rdreq[1][i],returnDataFIFO_empty[i]));      
      end
    `endif

    /******************************************************************
      AVM Read Request capture
    ******************************************************************/
    // Store the read requests into avm_read_req_fifo as they are issued to the memory.
    // Here we one-hot encode the burstcount.
    // Set burstcount_onehot_input[i_to_avm_burstcount]=1 and all other bits to 0.
    // Relying on the pipelining of avm_read_req_fifo_data_in[] to re-time back into the burstcount_onehot_input logic.
    // For BURST_CNT_W <= 6, this logic should have a LUT-depth of 1.
    for (z=1;z<=MAX_BURST;z++) begin : GEN_ONE_HOT_INPUT
      // Set burstcount_onehot_input[i_to_avm_burstcount] to 1 and all other bits to 0.
      assign burstcount_onehot_input[z] = (z == i_to_avm_burstcount)? 1'b1 : 1'b0;
    end

    assign burstcount_equals_one_input = (i_to_avm_burstcount == 1);
    // Pipeline the data inputs, before the avm_read_req_fifo.
    always @(posedge clk) begin
      avm_read_req_fifo_wrreq[1]        <= i_to_avm_valid;
      avm_read_req_fifo_data_in[1]      <= {burstcount_equals_one_input,burstcount_onehot_input, i_to_avm_port_num[P_NUM_DIMM_W-1:0], i_to_avm_burstcount, i_to_avm_id};
      for (int i=2;i<=READ_REQ_INPUT_PIPE_DEPTH;i++) begin
        avm_read_req_fifo_wrreq [i]     <= avm_read_req_fifo_wrreq[i-1];
        avm_read_req_fifo_data_in[i]    <= avm_read_req_fifo_data_in[i-1];
      end
    end 

    // This FIFO stores the read requests as they are issued by the LSUs so we can 
    // route the returned data from the memory to the LSUs in the same order.

      scfifo_to_acl_high_speed_fifo #(
        .add_ram_output_register ("ON"),
        .lpm_numwords (AVM_READ_REQ_FIFO_DEPTH),  
        .lpm_widthu (AVM_READ_REQ_FIFO_ADDR_WIDTH),
        .ASYNC_RESET (0),
        .lpm_showahead ("ON"),
        .lpm_type ( "scfifo"),
        .lpm_width (AVM_READ_REQ_FIFO_DATA_WIDTH),
        .almost_full_value(AVM_READ_REQ_FIFO_AF_THRESHOLD), // This needs to be 4 or more to avoid FB case 414451 (ie. ensure correct operation of almost_empty)
        .overflow_checking ( "OFF"),
        .underflow_checking ( "ON"),
        .use_eab ( "ON")
      ) avm_read_req_fifo (
        .clock (clk),
        .data (avm_read_req_fifo_data_in[READ_REQ_INPUT_PIPE_DEPTH]), 
        .wrreq (avm_read_req_fifo_wrreq[READ_REQ_INPUT_PIPE_DEPTH]),
        .rdreq (avm_read_req_fifo_read_req),  
        .empty (avm_read_req_fifo_empty), 
        .almost_full(id_af),
        .q (avm_read_req_fifo_data_out),
        .sclr (local_reset[(NUM_DIMM+1)-1])
      );

    /*  A skid buffer is connected to the output of avm_read_req_fifo. The skid buffer is 
        a 1-word deep FIFO made of registers, so it effectively deepens avm_read_req_fifo by 1 word.
        This allows us to peek ahead at the next read request by looking at the avm_read_req_fifo
        output. This lookahead is needed by the state machine. It's useful to think of the combination
        of [avm_read_req_fifo + avm_read_req_fifo_skid_buffer] as one big FIFO that stores the memory requests,
        with avm_read_req_skid_buffer_rreq being the FIFO read request signal.
     */
    acl_skid_buffer #(
      .DATA_WIDTH (AVM_READ_REQ_FIFO_DATA_WIDTH)
    ) avm_read_req_fifo_skid_buffer (
      .clk(clk),
      .reset(local_reset[(NUM_DIMM+1)-1]),
      .rreq_to_fifo(avm_read_req_fifo_read_req),
      .empty_fr_fifo(avm_read_req_fifo_empty),
      .data_fr_fifo(avm_read_req_fifo_data_out),
      .rreq(avm_read_req_skid_buffer_rreq[0]),
      .rdempty(avm_read_req_skid_buffer_empty),
      .out_data(avm_read_req_fifo_skid_buffer_data_out)
    );
    

    /******************************************************************
      Single-Bank Read Return Data input pipeline 
    ******************************************************************/
    // For single-bank, pipeline the data input so we can lookahead
    always @(posedge clk) begin
      if(NUM_DIMM == 1) begin // Single-DIMM
        // Pipeline the inputs so we can lookahead
        input_data_valid_pipe[1]  <= i_data_valid[0];
        input_data_pipe[1]        <= i_data[0];
        for (int i=2;i<=DATA_INPUT_PIPE_DEPTH;i++) begin
          input_data_valid_pipe[i]  <= input_data_valid_pipe[i-1];
          input_data_pipe[i]        <= input_data_pipe[i-1];
        end
      end
    end

    // Grab the input data pipeline output.
    // input_data_valid_lookahead1 is simply the valid from one stage back. If the pipe depth is 1
    // then "one stage back" is the input directly.
    assign input_data_valid_lookahead1 = (DATA_INPUT_PIPE_DEPTH == 1)? i_data_valid[0] : input_data_valid_pipe[DATA_INPUT_PIPE_DEPTH-1];
    assign input_data_valid_current   = input_data_valid_pipe[DATA_INPUT_PIPE_DEPTH];
    assign input_data_current         = input_data_pipe[DATA_INPUT_PIPE_DEPTH];


    /******************************************************************
      Data Router (Single- and Multi-bank) 
    ******************************************************************/
    /*  The Data Router logic routes the returned read data to the LSU that requested that data.
        Requests are pulled out of avm_read_req_fifo and the lsu_return_id (ie. to which
        LSU the data should be routed) controls an output mux.
        For single-bank, the input data feeds the output mux directly.
        For multi-bank, the read return data is first buffered in FIFOs and then
        a state machine is used to control reads from the various FIFOs in a pipelined fashion. The FIFO outputs
        are muxed and the data is fed to the appropriate LSU.

        Requests are read out of avm_read_req_fifo on burst boundaries. The boundaries are determined using a counter that
        simply counts the input words (in single-bank) or the words read out from the data FIFOs (in multi-bank). When the counter
        rolls over we know that the current read request's data has been fully returned to the corresponding LSU and we must
        load the next request from avm_read_req_fifo. The counter is a one-hot counter to help reduce LUT-depth. Special handling
        exists for when the burstcount==1 (to ensure bubble-free operation).

        The counters are one-hot encoded downcounters. A '1' is loaded into the [burstcount] position (ie. if burstcount==12, then
        counter[12] = 1). As each word in the burst is received (in single-bank) or read out of a data FIFO (in multi-bank) the counter
        "decrements" (ie. shifts). The counter is rolling over when the '1' reaches the last position. We can lookahead on when the count
        will rollover by just checking for when then '1' is in earlier positions.
    */

    /******************************************************************
      Data Router (Single-bank)
    ******************************************************************/  
    if(NUM_DIMM == 1) begin : GEN_SINGLE_DIMM
      // Grab the avm_read_req_fifo outputs. Actually taken from the skid buffer but it's useful to think of the [fifo + skid buffer] combination as one big FIFO.
      assign burstcount_onehot_current        = avm_read_req_fifo_skid_buffer_data_out[MAX_BURST+P_NUM_DIMM_W+BURST_CNT_W+P_ID_WIDTH-1:P_NUM_DIMM_W+BURST_CNT_W+P_ID_WIDTH];
      assign burstcount_equals_one_current    = avm_read_req_fifo_skid_buffer_data_out[AVM_READ_REQ_FIFO_DATA_WIDTH-1];
      assign burstcount_equals_one_lookahead  = avm_read_req_fifo_data_out[AVM_READ_REQ_FIFO_DATA_WIDTH-1];
      assign lsu_return_id_current            = avm_read_req_fifo_skid_buffer_data_out[P_ID_WIDTH-1:0];  

      always @(posedge clk) begin
        // Reset at bottom

        /**************************************
          avm_read_req_fifo Read logic (ie. generates the read request to the avm_read_req_fifo)
        **************************************/
        // A "pre-read" flag is used to handle reading when the FIFO is empty.
        // It ensures that as soon as a new request appears, we read it out and get ready
        // to receive the corresponding read return data when it arrives.
        // Assert the flag when the FIFO goes empty and we've attempted a read. (We don't just
        // check for FIFO-empty -- we specifically check for reading when empty. It's possible for
        // the FIFO to go empty but have a new request appear before we need to read again)
        // This flag is de-asserted when a successful read is done (ie. when the FIFO has a new request.)
        if (avm_read_req_skid_buffer_rreq[1] & !avm_read_req_skid_buffer_empty) begin
          preReadNextRequest  <= 1'b0;
        end else if (avm_read_req_skid_buffer_rreq[1] & avm_read_req_skid_buffer_empty) begin
          preReadNextRequest  <= 1'b1;
        end
        if(local_reset[(NUM_DIMM+1)-1]) begin
          preReadNextRequest  <= 1'b1;
        end

        /*
        Determine when to load the next read request from avm_read_req_fifo. We essentially read
        on a burst boundary so that we are immediately ready to receive the next burst of read
        return data on the next cycle.
        The read signal is asserted on the same
        cycle in which we are receiving the last word in a burst (ie. when input_data_valid_current==1 on the
        last word of the burst). There is a bunch of special handling for when burstcount==1 to ensure bubble-free operation.
        
        We read if we need to pre-read, 
        or if we're waiting for the last word of a burst and it's about to arrive on the next cycle
        or if we're receiving the 2nd last word and the last word is about to arrive on the next cycle
        or if we're loading a request with burstcount==1 and the request's single word will arrive in the 
          next cycle requiring us to read again immediately.
        
        slowRead_DataCount_onehot is the counter that gets loaded with the burstcount when a new request is read out of avm_read_req_fifo.
        This counter increments as we receive input words and load a new request when the counter rolls over.

        The pre-read logic will attempt to read from an empty FIFO in every other cycle (sometimes called a "slow read"). We attempt
        to read in one cycle, in the next cycle check if that read was successful (ie. that the FIFO had data),
        and then repeat if the read was unsuccessful. This toggling of avm_read_req_skid_buffer_rreq allows it to be fully registered
        so we don't have to check avm_read_req_skid_buffer_empty combinationally. We also explicitly allow reads to happen to the empty
        FIFO (ie. we could prevent reads when avm_read_req_skid_buffer_empty==1, but that would be another input signal to check).

        avm_read_req_skid_buffer_rreq has 7 input signals (including reset) so it may require more than 1 LUT.
        Further pipelining by pre-computing some of these conditions gets tricky and can be revisited
        if this path limits performance. It should be possible to precompute the 
        (burstcount_equals_one_current && input_data_valid_lookahead1) condition (carefully). We could also 
        remove the reset from avm_read_req_skid_buffer_rreq which would mean it
        would be reading from the avm_read_req_fifo scfifo while it's held in reset. There is no mention
        of this being a problem in the SCFIFO user's guide and the SCFIFO code seems to ignore
        rreq while held in reset. But this would have to be thoroughly verified.

        avm_read_req_skid_buffer_rreq is manually replicated for performance.

        */
        if  ( (!avm_read_req_skid_buffer_rreq[0] && preReadNextRequest) || 
              (slowRead_DataCount_onehot[0][1] && !input_data_valid_current && input_data_valid_lookahead1) ||
              (slowRead_DataCount_onehot[0][2] && input_data_valid_current && input_data_valid_lookahead1) ||
              (avm_read_req_skid_buffer_rreq[0] && burstcount_equals_one_current && input_data_valid_lookahead1)
            ) begin
          for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i] <= 1'b1;
        end else begin
          for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i] <= 1'b0;
        end 

        // When reading from avm_read_req_fifo, latch the current lsu_return_id.
        if (avm_read_req_skid_buffer_rreq[1]) begin
          lsu_return_id_reg[1][0]         <= lsu_return_id_current;
        end

        if (local_reset[(NUM_DIMM+1)-1]) begin
          for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i] <= 1'b0;
        end

      end

    /******************************************************************
      Data Router (Multi-bank)
    ******************************************************************/
    /*
      In multi-bank the read return data is first buffered in FIFOs (one data FIFO per bank). Each read request
      in avm_read_req_fifo specifies both the burstcount and the bank to which the request was made.
      The state-machine reads out the requests from avm_read_req_fifo and then reads out the specified burstcount's worth of data from the corresponding bank's
      data FIFO. The read_req signals to the data FIFOs are pipelined for performance and are fully registered
      (ie. are not generated combinationally).
      The state machine will be switching between data FIFOs as dictated by the read requests. In order to be bubble-free it's important that
      the read_req to a given FIFO asserts in the same cycle that the read_req to the previous FIFO de-asserts (ie. no bubbles).
      Since the read signals are pipelined (and therefore experience some latency before reaching the respective FIFO) they are generated with lookahead.
      When reading out a given burst from a given data FIFO, we look ahead to see when that burst will be finished and assert the read signal
      to the next FIFO. The lookahead operates not by tracking exact FIFO occupancy but instead using the FIFO almost_empty flag as an indicator
      that there's at least one burst's worth of data in the FIFO. This way we know we can read a word on every cycle without checking empty (called a "burst read" in this context) and can easily count
      these words to look ahead to when we'll be done reading. The FIFO almost_empty thresholds are set with DATA_FIFO_ALMOST_EMPTY_THRESHOLD (see its declaratoin
      for an explanation of how it's calculated). 
      If the FIFO does not have enough words (ie. is almost empty) then we do what's called a "slow read" where we check the FIFO empty flag and increment the counter only on valid reads 
      (ie. when the FIFO is not empty). When doing a slow-read, we simply do not know if the FIFO has enough data to service reads on every cycle so we cannot lookahead to know when
      we'll be done reading from that FIFO. As such, due to us not compensating for the read_req latency with lookahead, a bubble is created before servicing 
      the next read request, but this only happens when the data FIFOs are close
      to being drained, which indicates that there are very few read requests left to be serviced or that memory bandwidth is being under-utilized. These bubbles
      can be thought of as a few cycles of extra latency experienced by these read requests.

      The data being read out of the FIFOs is counted using one-hot counters (for performance). For "burst reads", the state-machine uses a single counter
      (burstRead_DataCount_onehot). For "slow reads", each bank has its own counter (slowRead_DataCount_onehot, again done for performance)

      The data FIFO outputs are pipeline-muxed. The muxed data is routed to the appropriate LSU using the lsu_return_id select signal.
    */    
    end else begin : GEN_MULTIPLE_DIMM
      // Grab avm_read_req_fifo outputs. Some are taken from the skid buffer output, others from avm_read_req_fifo directly (for lookahead)
      assign lsu_return_id_current                          = avm_read_req_fifo_skid_buffer_data_out[P_ID_WIDTH-1:0];  
      assign bank_num_current                               = avm_read_req_fifo_skid_buffer_data_out[P_NUM_DIMM_W+BURST_CNT_W+P_ID_WIDTH-1:BURST_CNT_W+P_ID_WIDTH];    
      assign burstcount_onehot_current                      = avm_read_req_fifo_skid_buffer_data_out[MAX_BURST+P_NUM_DIMM_W+BURST_CNT_W+P_ID_WIDTH-1:P_NUM_DIMM_W+BURST_CNT_W+P_ID_WIDTH];
      assign burstcount_equals_one_current                  = avm_read_req_fifo_skid_buffer_data_out[AVM_READ_REQ_FIFO_DATA_WIDTH-1];

      assign bankSelect_lookahead_wire                      = avm_read_req_fifo_data_out[P_NUM_DIMM_W+BURST_CNT_W+P_ID_WIDTH-1:BURST_CNT_W+P_ID_WIDTH];

      // In general, DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH specifies how many stages are needed to pipeline the 
      // almost-empty muxes. Grab the outputs of the pipelines.
      assign returnDataFIFO_AlmostEmpty_NextBank            = returnDataFIFO_AlmostEmpty_NextBank_Pipe[DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH];
      assign returnDataFIFO_AlmostEmpty_NextBank_Lookahead  = returnDataFIFO_AlmostEmpty_NextBank_Lookahead_Pipe[DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH];
      assign bankReadDone_CurrentBank                       = bankReadDone_CurrentBank_Pipe[BANK_READ_DONE_PIPE_DEPTH];

      /* State machine (SM) for issuing reads to the required bank. This also controls reads to avm_read_req_fifo.
        bank_read_state and avm_read_req_skid_buffer_rreq have more than 6 inputs. This will
        exceed 1 LUT. If this limits performance then additional pre-computation will be needed to pipeline
        this further. 

        The basic function of the SM is to read a request from avm_read_req_fifo (called "loading a request") then determine
        if it can do a burst-read or must do a slow-read.
        There is special-handling for when the burstcount==1 to ensure no bubbles are created.
      */
      always @(posedge clk) begin
        case (bank_read_state)
          STATE_WAIT_FOR_REQUEST: begin // Wait until the avm_read_req_fifo has data.
            if (!avm_read_req_skid_buffer_empty) begin
              bank_read_state                 <= STATE_LOAD_REQUEST;
              for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]   <= 1'b1;
              bankReadBegin                   <= '0;
              slowRead_Flag[1]                <= '0;
              burstcount_equals_one_previous  <= 1'b0;  
            end
            for (int i=0;i<NUM_BANK_SELECT_DUPE_PIPES;i++) begin
              returnData_BankSelect_Pipe[i][1]  <= 0; // This is the select signal on the output-valid mux, so set it to a known value to prevent X's in simulation on the valid-output.
            end            
          end
          STATE_LOAD_REQUEST: begin // When in this state, we are currently reading from avm_read_req_fifo (avm_read_req_skid_buffer_rreq is asserted)
            /*
              The avm_read_req_fifo output indicates which bank we need to start reading from. 
              So trigger reads from the specified bank. The bankReadBegin signal is used
              to signal that the specified bank's one-hot counter needs to reload.
              The actual reads are enabled in the next cycle.
              Set only bankReadBegin[bank_num_current] to 1 and all other bits to 0. bankReadBegin is a one-cycle strobe.
              To simplify things only the assertion of the FIFO read-req (bankReadEnable) is handled in this state-machine,
              which occurs through the bankReadBegin strobe. The de-assertion is handled elsewhere.
            */
            if (!avm_read_req_skid_buffer_empty) begin
              for (int i=0;i<NUM_DIMM;i++) begin
                bankReadBegin[i]  <= (i == bank_num_current)? 1'b1 : 1'b0;  // Trigger reads to the appropriate data FIFO.
              end
            end else begin
                bankReadBegin <= '0;  // Don't enable any banks if the avm_read_req_fifo is empty
            end

            // Register some of the avm_read_req_fifo outputs
            burstcount_onehot_current_reg[1][bank_num_current] <= burstcount_onehot_current;  // Load the selected bank's counter

            /* Grab bank_num_current but validate it with the fifo empty. This is actually not functionally necessary since we'll only leave this state if
                when avm_read_req_skid_buffer_empty == 0. But returnData_BankSelect_Pipe ultimately feeds the output data valid from this block. In simulation,
                when the FIFO is empty, it outputs X's for data, so returnData_BankSelect_Pipe ultimately becomes X leading to the output data valid becoming X.
                This breaks the testbench. Validating using the fifo empty works around this. If it affects performance, it can be removed.
            */
            for (int i=0;i<NUM_BANK_SELECT_DUPE_PIPES;i++) begin
              if (!avm_read_req_skid_buffer_empty) begin
                returnData_BankSelect_Pipe[i][1]            <= bank_num_current;  // Store the bank # being switched to. This is the select signal for the muxes on the bank data-FIFO outputs. Pipelines are duplicated to manage fanout.
              end
            end
            lsu_return_id_reg[1][bank_num_current]          <= lsu_return_id_current;     // Store the LSU return ID for this burst. To simplify things, it's kept in-sync with the data being read from the particular data FIFO.
            burstcount_equals_one_previous                  <= burstcount_equals_one_current;  // If this request's burstcount==1, we'll need to store this fact so we can do special handling on the next request.

            // Determine if we can do a burst read from the next bank's data FIFO or if we have to do a slow read.
            // We can do a burst read if the FIFO has enough data, which is determined by its almost_empty. If the burstcount==1, we must lookahead
            // to see if we can begin processing the next request immediately (and therefore introduce no bubbles)
            if (avm_read_req_skid_buffer_empty) begin // If we're reading but the FIFO has gone empty, go back to the wait state
              bank_read_state                 <= STATE_WAIT_FOR_REQUEST;
              for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]   <= 1'b0;
            // If the current request's burscount==1, we need to do some special handling to ensure bubble-free operation.
            end else if (burstcount_equals_one_current) begin
              /* If the respective data FIFO does not have enough data, then we do a slow-read.
               Otherwise, we need to do a 1-word burst-read, but instead of going into STATE_BURST_READ, 
               we have to stay in STATE_LOAD_REQUEST and immediately load the next request to not create any bubbles.

               We check if the respective data FIFO has enough data by checking its almost_empty. The almost_emptys are muxed using
               bank_num_current as the select signal. But this mux is pipelined for performance so we need to make sure enough time
               has been allowed for the selected almost_empty to pass through the pipeline. If the previous burstcount was > 1 then there
               would have been enough time since we'd spend multiple cycles servicing that burst.
               But if the previous burstcount==1, then only 1 cycle has transpired and the almost-empty for the next bank would not yet have
               passed through the mux. In this case, we use the Lookahead almost_empty, which is computed by peeking one request ahead
               into avm_read_req_fifo.
              */
              if (burstcount_equals_one_previous) begin
                if (!returnDataFIFO_AlmostEmpty_NextBank_Lookahead) begin     // Check if FIFO has enough data
                  bank_read_state                     <= STATE_LOAD_REQUEST;  // stay in this state
                  for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]       <= 1'b1;                // Immediately read out the next request
                end else begin // FIFO may not have enough data, so do a slow read
                  bank_read_state                     <= STATE_SLOW_READ;
                  for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]       <= 1'b0;
                  slowRead_Flag[1][bank_num_current]  <= 1'b1;                // Flag that we're doing a slow-read on this bank                  
                end
              end else begin // Previous request's burstcount was > 1
                if (!returnDataFIFO_AlmostEmpty_NextBank) begin               // FIFO has enough data
                  bank_read_state                     <= STATE_LOAD_REQUEST;  // Stay in this state
                  for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]       <= 1'b1;                // Immediately read out the next request
                end else begin // FIFO may not have enough data, so do a slow read
                  bank_read_state                     <= STATE_SLOW_READ;
                  for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]       <= 1'b0;
                  slowRead_Flag[1][bank_num_current]  <= 1'b1;                // Flag that we're doing a slow-read on this bank                  
                end                
              end
            // If the previous request's burstcount==1, we need to look at the Lookahead almost-empty.
            end else if (burstcount_equals_one_previous) begin
                if (!returnDataFIFO_AlmostEmpty_NextBank_Lookahead) begin     // Check if FIFO has enough data
                  bank_read_state                     <= STATE_BURST_READ;    // Do a burst read
                  for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]       <= 1'b0;                // Immediately read out the next request
                end else begin // FIFO may not have enough data, so do a slow read
                  bank_read_state                     <= STATE_SLOW_READ;
                  for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]       <= 1'b0;
                  slowRead_Flag[1][bank_num_current]  <= 1'b1;              // Flag that we're doing a slow-read on this bank                  
                end
            // Both current and previous burstcount > 1, and the FIFO has enough data, so do a burst-read
            end else if (!returnDataFIFO_AlmostEmpty_NextBank) begin 
              bank_read_state                         <= STATE_BURST_READ;
              for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]           <= 1'b0;
            // FIFO does not have enough data, so do a slow-read
            end else begin
              bank_read_state                         <= STATE_SLOW_READ;
              for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]           <= 1'b0;
              slowRead_Flag[1][bank_num_current]      <= 1'b1;  // Flag that we're doing a slow-read on this bank
            end
          end
          // In a burst read, the data FIFO is guaranteed to have enough data to complete the burst
          // so we read from the FIFO continuously without checking empty. burstRead_DataCount_onehot
          // counts how long to read for.
          STATE_BURST_READ: begin
            // Shift the counter
            burstRead_DataCount_onehot[MAX_BURST-1:1]  <= burstRead_DataCount_onehot[MAX_BURST:2];
            burstRead_DataCount_onehot[MAX_BURST]      <= 1'b0;
            
            // Check when the count is done. Look ahead by 1 word since there is one cycle latency as we
            // switch through STATE_LOAD_REQUEST back to either STATE_BURST_READ or STATE_SLOW_READ.
            // This ensures bankReadEnable will have no bubbles.
            if (burstRead_DataCount_onehot[2]) begin 
              bank_read_state                         <= STATE_LOAD_REQUEST;
              for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]           <= 1'b1;  // Read out the next request
            end
            burstcount_equals_one_previous            <= 1'b0;
          end
          // In a slow read, it is not guaranteed that the data FIFO has enough data so we ultimately
          // check empty as we read and wait for the bankReadDone signal to come back.
          STATE_SLOW_READ: begin
            // Wait until the last word is read out from the currently selected bank
            if (bankReadDone_CurrentBank) begin
              bank_read_state                         <= STATE_LOAD_REQUEST;
              for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]           <= 1'b1;  // Read out the next request
              slowRead_Flag[1]                        <= '0;    // Slow-read is done       
            end
            bankReadBegin                             <= '0;
            burstcount_equals_one_previous            <= 1'b0;
          end
        endcase
        
        if (local_reset[(NUM_DIMM+1)-1]) begin
          bank_read_state                             <= STATE_WAIT_FOR_REQUEST;
          for (int i=0;i<NUM_AVM_READ_REQ_DUPES;i++) avm_read_req_skid_buffer_rreq[i]               <= 1'b0;
          bankReadBegin                               <= '0;
          slowRead_Flag[1]                            <= '0;
          burstcount_equals_one_previous              <= 1'b0;
        end

        if (bank_read_state != STATE_BURST_READ) begin
          burstRead_DataCount_onehot          <= burstcount_onehot_current;
        end

        // Pipelines to match latency on bankReadEnable + data FIFO output mux
        // The output of this pipeline (ie. returnData_BankSelect_Pipe[BANK_MUX_SELECT_PIPE_DEPTH]) indicates the bank we are currently
        // reading from.

        // The returnData_BankSelect pipeline is replicated for performance.
        for (int j=0;j<NUM_BANK_SELECT_DUPE_PIPES;j++) begin // For each copy of the pipeline
          for (int i=2;i<=BANK_MUX_SELECT_PIPE_DEPTH-1;i++) begin // Shift the signal through the given pipeline. The final pipe stage is implemented below (hence BANK_MUX_SELECT_PIPE_DEPTH-1)
            returnData_BankSelect_Pipe[j][i] <= returnData_BankSelect_Pipe[j][i-1];
          end
        end
        for (int j=0;j<NUM_BANK_SELECT_DUPE_PIPES;j++) begin // For each copy of the pipeline
          for (int i=0;i<NUM_BANK_SELECT_FORWARD_DUPES;i++) begin // Replicate the last stage
            returnData_BankSelect[j][i] <= returnData_BankSelect_Pipe[j][BANK_MUX_SELECT_PIPE_DEPTH-1];
          end
        end

        for (int i=2;i<=BANK_MUX_SELECT_PIPE_DEPTH;i++) begin
          lsu_return_id_reg[i]          <= lsu_return_id_reg[i-1];
        end      
        // Pipeline to match latency on bankReadEnable
        for (int i=2;i<=BANK_READ_ENABLE_LATENCY;i++) begin
          slowRead_Flag[i]              <= slowRead_Flag[i-1]; 
        end

        for (int i=2;i<=DATA_FIFO_READ_REQ_PIPE_DEPTH;i++) begin
          burstcount_onehot_current_reg[i]  <= burstcount_onehot_current_reg[i-1]; 
        end

        // Pipeline the mux that selects the bankReadDone signal from the bank we are currently reading from.
        bankReadDone_CurrentBank_Pipe[1] <= bankReadDone[returnData_BankSelect[0][0]];
        for (int i=2;i<=BANK_READ_DONE_PIPE_DEPTH;i++) begin
          bankReadDone_CurrentBank_Pipe[i] <= bankReadDone_CurrentBank_Pipe[i-1];
        end

        // Mux the almost_empties from the data FIFOs
        returnDataFIFO_AlmostEmpty_NextBank_Pipe[1]             <= returnDataFIFO_AlmostEmpty[bank_num_current];
        returnDataFIFO_AlmostEmpty_NextBank_Lookahead_Pipe[1]   <= returnDataFIFO_AlmostEmpty[bankSelect_lookahead_wire];
        for (int i=2;i<=DATA_FIFO_ALMOST_EMPTY_PIPE_DEPTH;i++) begin
          returnDataFIFO_AlmostEmpty_NextBank_Pipe[i]           <= returnDataFIFO_AlmostEmpty_NextBank_Pipe[i-1];
          returnDataFIFO_AlmostEmpty_NextBank_Lookahead_Pipe[i] <= returnDataFIFO_AlmostEmpty_NextBank_Lookahead_Pipe[i-1];
        end

      end

      // Generate the data FIFOs and data FIFO-specific signals.
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DATA_FIFO
	/*
	This state-machine controls reading from dataFIFOs. It implements a slow-read/burst-read approach whereby it reads continuously when the FIFO contains lots of data
	(called burst-read mode) and reads slowly (one word at a time, checking for FIFO-empty between reads, called slow-read mode) when the FIFO is almost empty.
	This allows us to switch between dataFIFOs without any bubbles when all of the FIFOs have lots of data, ensures we drain the FIFOs safely (without underflowing)
	when the FIFOs are almost-empty, and generate the FIFO read-request signals directly from a register (no combinational logic feeds the read-req port, which is bad for FMAX).
	*/
        always @(posedge clk) begin
          case (data_fifo_read_state[z])
            // Wait for the begin signal and check if it's a burst-read or slow-read.
            STATE_DATA_FIFO_READ_WAIT: begin
              bankReadEnable[z] <= bankReadBegin[z];
              if (bankReadBegin[z]) begin
                if (!slowRead_Flag[1][z]) begin // Check if it's a burst-read
                  data_fifo_read_state[z]   <= STATE_DATA_FIFO_READ_BURST;
                end else begin // Slow-read
                  data_fifo_read_state[z]   <= STATE_DATA_FIFO_READ_SLOW;
                end
              end
            end
            STATE_DATA_FIFO_READ_BURST: begin
              /* In a burst read, simply forward the bankReadBegin signal as the read-req to the dataFIFO.
                 This ultimately lets the bank_read state-machine control when to stop reading from the FIFO,
                 which it is already tracking with its burst read counter.
                 We know to exit this state when we receive a slow-read to this FIFO or if bankReadBegin de-asserts.
              */
              bankReadEnable[z] <= bankReadBegin[z];
              if (bankReadBegin[z] && slowRead_Flag[1][z]) begin // Check if the bank_read state-machine wants to start doing a slow-read from this FIFO
                data_fifo_read_state[z]   <= STATE_DATA_FIFO_READ_SLOW;
              end else if (!bankReadBegin[z]) begin
                data_fifo_read_state[z]   <= STATE_DATA_FIFO_READ_WAIT;
              end
            end
            STATE_DATA_FIFO_READ_SLOW: begin
              /* Check for when we read out the last valid word in this burst (by checking for when the counter rolls over).
                  Stop reading and wait for the next Begin from the bank_read state machine.
                  We can't have another read (burst-read or slow-read) immediately in the next cycle because of the latency on
                  bankReadDone going back to the bank_read state machine.
              */
              
              // Shift the counter to the right (towards the LSB), and wrap the LSB around to the MSB.
              data_fifo_slow_read_latency_count_onehot[z] <=  { data_fifo_slow_read_latency_count_onehot[z][1],
                                                                data_fifo_slow_read_latency_count_onehot[z][DATA_FIFO_READ_REQ_PIPE_DEPTH + 1:2]
                                                              };
              // If slowRead_DataCount_onehot rolls over while reading out a valid word, we know we are done with this burst.
              // data_fifo_slow_read_latency_count_onehot should rollover when returnDataFIFO_rdreq==1
              if (returnDataFIFO_rdreq[1][z] && !returnDataFIFO_empty[z] && slowRead_DataCount_onehot[z][1]) begin 
                bankReadEnable[z]         <= 1'b0;  // Stop reading
                data_fifo_read_state[z]   <= STATE_DATA_FIFO_READ_WAIT; // Wait for the next read
              end else begin
                bankReadEnable[z]         <= data_fifo_slow_read_latency_count_onehot[z][1];  // Read every time the counter rolls over
              end
            end
          endcase

          if (local_reset[z]) begin
            data_fifo_read_state[z] <= STATE_DATA_FIFO_READ_WAIT;
            bankReadEnable[z]       <= 1'b0;
            data_fifo_slow_read_latency_count_onehot[z]  <= {1'b1, {DATA_FIFO_READ_REQ_PIPE_DEPTH{1'b0}}}; // Reset with a 1 in the MSB and the rest zeroes
          end          
              
        // Assign bankReadEnable to the read-req pipeline. The pipeline is duplicated.
        for (int i=0;i<NUM_RETURN_DATA_FIFO_READ_REQ_DUPES;i++) returnDataFIFO_rdreq_pipe[i][1][z]  <= bankReadEnable[z];
                
        // Complete the rest of the read-req pipeline (and do the same for its duplicates)
        for (int i=2;i<=DATA_FIFO_READ_REQ_PIPE_DEPTH;i++) begin
          for (int j=0;j<NUM_RETURN_DATA_FIFO_READ_REQ_DUPES;j++) returnDataFIFO_rdreq_pipe[j][i][z] <= returnDataFIFO_rdreq_pipe[j][i-1][z];
        end
        
          // Check for when the slow-read is complete.
          // Check for the end of the burst, but only if doing a slow read. 
          // If bankReadDone was allowed to be asserted during a burst-read as well, then the state machine might interpret it as
          // a false done if a slow read followed.
          if (returnDataFIFO_rdreq[1][z] && !returnDataFIFO_empty[z] && slowRead_DataCount_onehot[z][1] & slowRead_Flag[BANK_READ_ENABLE_LATENCY][z]) begin
            bankReadDone[z]           <= 1'b1;  
          end else begin
            bankReadDone[z]           <= 1'b0;
          end
          if (local_reset[z]) begin
            bankReadDone[z]           <= 1'b0;
          end        
        end

        // Grab the outputs of the read-req pipeline. This is done for clarity.
        for (y=0;y<NUM_RETURN_DATA_FIFO_READ_REQ_DUPES;y++) begin : GEN_DATA_FIFO_READ_REQ_PIPELINE
          assign returnDataFIFO_rdreq[y][z] = returnDataFIFO_rdreq_pipe[y][DATA_FIFO_READ_REQ_PIPE_DEPTH][z]; 
        end

        scfifo_to_acl_high_speed_fifo #(
          .add_ram_output_register ( "OFF"),
          .lpm_numwords (DATA_FIFO_DEPTH),  
          .ASYNC_RESET (0),
          .lpm_widthu (DATA_FIFO_ADDR_WIDTH),
          .lpm_showahead ( "ON"),
          .lpm_type ( "scfifo"),
          .lpm_width (MWIDTH),
          .overflow_checking ( "OFF"),
          .underflow_checking ( "ON"),
          .use_eab ( "ON"),
          .almost_empty_value (DATA_FIFO_ALMOST_EMPTY_THRESHOLD)
        ) return_data_fifo (
          .clock (clk),
          .data (i_data[z]), 
          .wrreq (i_data_valid[z]),
          .rdreq (returnDataFIFO_rdreq[0][z]),  
          .empty (returnDataFIFO_empty[z]), 
          .q (returnDataFIFO_data_out[z]),
          .full(data_overflow[z]),
          .almost_empty (returnDataFIFO_AlmostEmpty[z]),
          .sclr (local_reset[z])
        ); 

      end
    end


    /***************************************************************
      Slow-read Counters
    ***************************************************************/
    // Here we load and shift the one-hot counters as words are received (in single-bank) or read out of
    // the data FIFOs (in mult-bank).
    always @(posedge clk) begin
      // Reset clause is at the bottom of this always block
      
      if(NUM_DIMM == 1) begin // Single-bank

        if (avm_read_req_skid_buffer_rreq[1]) begin // Load the counter when a new read-request is being read out of avm_read_req_fifo
          slowRead_DataCount_onehot[0]                  <= burstcount_onehot_current;
        end else if (input_data_valid_current) begin // When we have valid input data, shift the counter to the right.
          slowRead_DataCount_onehot[0][MAX_BURST-1:1]   <= slowRead_DataCount_onehot[0][MAX_BURST:2];
          slowRead_DataCount_onehot[0][MAX_BURST]       <= 1'b0;
        end

      end
      else begin // Multi-bank
        for (int z=0; z<NUM_DIMM;z++) begin
          // If we need to begin reading from this bank, reload the counter
          //if (bankReadBegin[z]) begin
          /* Load the slowread counter with its new value whenever the bank_read_state machine issues a new Begin
              to this data FIFO. But we only do this for slow-reads. Then latency match the load signal to the read-req
              so the counter is reloaded by the time read-req reaches the FIFO.
          */
          load_slowread_counter[1][z] <= bankReadBegin[z] && slowRead_Flag[1][z];
          for (int i=2;i<=DATA_FIFO_READ_REQ_PIPE_DEPTH;i++) begin
            load_slowread_counter[i][z] <= load_slowread_counter[i-1][z];
          end
          
          if (load_slowread_counter[DATA_FIFO_READ_REQ_PIPE_DEPTH][z]) begin
            //slowRead_DataCount_onehot[z]               <= burstcount_onehot_current_reg[z];
            slowRead_DataCount_onehot[z]                <= burstcount_onehot_current_reg[DATA_FIFO_READ_REQ_PIPE_DEPTH][z];
          // If reading from this bank and the FIFO has data (ie. reading out a valid word), then shift the counter.
          end else if (returnDataFIFO_rdreq[1][z] && !returnDataFIFO_empty[z]) begin
            slowRead_DataCount_onehot[z][MAX_BURST-1:1]  <= slowRead_DataCount_onehot[z][MAX_BURST:2];
            slowRead_DataCount_onehot[z][MAX_BURST]      <= 1'b0;
          end
        end
      end       
      
      // Assert o_rd_bank whenever a valid word is read out of the data FIFO
      // This is used in the interconnect for tracking the occupancy of the data-FIFOs so the issuing of read requests to the memory can be throttled
      returnDataFIFO_rdreq_delayed        <= returnDataFIFO_rdreq[1];
      returnDataFIFO_rdreq_empty_delayed  <= returnDataFIFO_empty;
      for(i=0; i<NUM_DIMM; i=i+1)  begin 
        //o_rd_bank[i] <= returnDataFIFO_rdreq[1][i] & !returnDataFIFO_empty[i]; 
        o_rd_bank[i] <= returnDataFIFO_rdreq_delayed[i] & !returnDataFIFO_rdreq_empty_delayed[i]; 
      end           
      if(local_reset[NUM_RESET_COPIES-1]) begin
        o_rd_bank <= 0; 
      end

    end

    /***************************************
      Output Data Muxing and Routing
    ***************************************/
    /*
      For multi-bank, the read request specifies which bank's data FIFO to read from (returnData_BankSelect)
      The data FIFO outputs are pipeline muxed using returnData_BankSelect. None of this muxing is needed for single-bank.

      The selected data is then routed to the appropriate LSU in the next step.
    */

      /***************************************
        Multi-bank Data FIFO output mux
      ***************************************/
    always @(posedge clk) begin
      // First we pipeline each FIFO's output. Then we mux between the FIFOs (also pipelined).
      
      // Pipeline the outputs of each FIFO. Capture the FIFO outputs into stage-1
      // In theory we could omit these individual data-FIFO output pipelines and just pipeline
      // the mux (below) deeper and rely on the retimer to duplicate the registers as necessary,
      // (ie. in theory it should create these data-FIFO output pipelines on its own)
      // but experiments show this manual duplication gives a better performance result.
      for (int i=0;i<NUM_DIMM;i++) begin
        data_fifo_out_valid[1][i]       <= returnDataFIFO_rdreq[1][i] & !returnDataFIFO_empty[i];
        data_fifo_out[1][i]             <= returnDataFIFO_data_out[i];
      end
      for (int i=2;i<=DATA_FIFO_OUT_PIPE_DEPTH;i++) begin // Implement remaining stages.
        data_fifo_out_valid[i]          <= data_fifo_out_valid[i-1];
        data_fifo_out[i]                <= data_fifo_out[i-1];
      end

      // A pipelined N:1 mux selects from the N data FIFO pipelines. We rely on the retimer to pipeline this properly.
      // The number of stages can be adjusted to achieve the desired LUT depth.
      returnData_out_valid[1]           <= data_fifo_out_valid[DATA_FIFO_OUT_PIPE_DEPTH][returnData_BankSelect[1][NUM_DATA_OUT_FANOUT_SECTIONS+1]];
      for (int i=0;i<(MWIDTH/32);i++) begin : DATA_OUT_MUX // Manually use the replicated returnData_BankSelect to break up the fanout to returnData_out by sections of 32
        returnData_out[1][ 32*i +: 32 ] <= data_fifo_out[DATA_FIFO_OUT_PIPE_DEPTH][returnData_BankSelect[1][i]][ 32*i +: 32 ];
      end
      // The lsu_return_id is later used to route the data valid to the specified LSU
      returnData_out_lsu_return_id[1]   <= lsu_return_id_reg[BANK_MUX_SELECT_PIPE_DEPTH][returnData_BankSelect[1][NUM_DATA_OUT_FANOUT_SECTIONS+2]];
      for (int i=2;i<=DATA_OUT_MUX_PIPE_DEPTH;i++) begin
        returnData_out_valid[i]         <= returnData_out_valid[i-1];
        returnData_out[i]               <= returnData_out[i-1];
        returnData_out_lsu_return_id[i] <= returnData_out_lsu_return_id[i-1];
      end
    end   

      /***************************************
        LSU data routing
      ***************************************/
      /* In PIPELINE mode, the data is routed to the appropriate LSU using a pipelined vine. Otherwise the data is replicated and fanned out (called "fast mode").
      */

    // First, grab the final data and valids to send to the interconnect.
    // For single-bank, use the input data, for multi-bank, grab the output from the mux.
    assign data_output_to_interconnect = (NUM_DIMM == 1)? input_data_current : returnData_out[DATA_OUT_MUX_PIPE_DEPTH];

    // There is one data-valid signal per LSU. Use lsu_return_id to decide whose data valid should be asserted.
    for (z=0;z<NUM_RD_PORT;z++) begin : GEN_DATA_VALID_OUTPUT
      assign data_valid_output_to_interconnect[z] = (NUM_DIMM == 1)?  (input_data_valid_current & lsu_return_id_reg[1][0] == z) : 
                                                                      (returnData_out_valid[DATA_OUT_MUX_PIPE_DEPTH] & returnData_out_lsu_return_id[DATA_OUT_MUX_PIPE_DEPTH] == z);
    end


    // Next, route the data the LSU, either in PIPELINE mode or fast mode.

    // Create a pipelined-vine for the data path. Each LSU hangs off of the vine.
    if(PIPELINE) begin : GEN_OUTPUT_DATA_VINE
      // Data path vine. Index-0 is the end of the vine
      always @(posedge clk) begin
        o_data[NUM_RD_PORT-1] <= data_output_to_interconnect; 
        for(i=0; i<NUM_RD_PORT-1; i=i+1) begin
          o_data[i]           <= o_data[i+1];
        end
      end

      // Data-valid pipelines
      // These are NOT reset. They depend on reset being asserted for a long enough time (~10 + NUM_RD_PORT cycles should be enough)
      // that the reset trickles through, setting these to 0 naturally.
      always @(posedge clk) begin
        // Match the latency of o_data_valid[i] to o_data[i].
        // The i'th LSU has a data-valid pipeline that is i-stages long.
          for(i=0; i<NUM_RD_PORT; i=i+1) begin   
            // The output valid enters the pipeline at position [NUM_RD_PORT-1], but only
            // for the selected LSU. data_valid_vine_output_pipeline is a 2D array, but only half of it actually used.
            data_valid_vine_output_pipeline[NUM_RD_PORT-1][i] <= data_valid_output_to_interconnect[i];

            // Pipeline the i'th data-valid pipeline by i-stages.
            if(i<NUM_RD_PORT-1) begin
              data_valid_vine_output_pipeline[i] <= data_valid_vine_output_pipeline[i+1];
            end
          end
      end

      // Make the output assignment
      for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_DATA_VALID_OUTPUT_FINAL
        assign o_data_valid[z] = data_valid_vine_output_pipeline[z][z];
      end          

    end else begin : GEN_OUTPUT_DATA_FAST

      always @(posedge clk) begin
        for(i=0; i<NUM_RD_PORT; i=i+1) begin
          o_data[i] <= data_output_to_interconnect; // Replicate and fanout output data to all LSUs
        end

        // Could have changed o_data_valid to a packed-type so that a straight
        // assignment would work (ie. no for loop would be needed) but this signal
        // propagates up through the hierarchy and is declared as an unpacked type
        // everywhere. 
        // Not reset (depends on reset trickling through)
        for (int i=0;i<NUM_RD_PORT;i++) begin
          o_data_valid[i] <=  data_valid_output_to_interconnect[i];
        end
      end
    end
  end
endgenerate

endmodule
