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


// A group of the basic unit lsu_ic_token

module lsu_n_token (
  clk,
  reset,
  i_token,
  i_id,
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
  o_avm_burstcount,
  o_id,
  o_token,
  o_active,
  // write
  i_avm_writedata,
  o_avm_writedata
);

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;                             
parameter NUM_PORT = 10; 
parameter START_ID = 0;
parameter READ = 1;   
parameter ENABLE_FAST = 0;
parameter OPEN_RING = 0;  
parameter START_ACTIVE = 0;   
parameter NUM_DIMM = 1;    
parameter ENABLE_DATA_REORDER = 0;
parameter ROOT_FIFO_AW = 8;  
parameter ROOT_FIFO_THRESH = (NUM_PORT+START_ID)*2;
parameter ENABLE_LAST_WAIT = 0;                               
parameter ID_WIDTH = (NUM_PORT+START_ID == 1 )? 1 : $clog2(NUM_PORT+START_ID);
parameter SINGLE_STALL = 0;
parameter HIGH_FMAX = 0;                      // 1 = optimized, highly pipelined mode, only sclrs (no aclrs) at the expense of area.

localparam RESET_TYPE = HIGH_FMAX ? "SYNC" : "ASYNC";
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W + ID_WIDTH;          
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH = READ? REQ_WIDTH_READ : REQ_WIDTH_WRITE;
localparam ROOT_FIFO_DEPTH = 2 ** ROOT_FIFO_AW;
localparam NUM_DIMM_INT = SINGLE_STALL? 1 : NUM_DIMM;


input                            clk;  
input                            reset;   // reset is synchronous if HIGH_FMAX == 1, asynchronous otherwise
// from another open ring part
input      [ID_WIDTH-1:0]        i_id;
input                            i_token;
input      [AWIDTH-1:0]          i_ext_address;
input                            i_ext_read;        
input      [BURST_CNT_W-1:0]     i_ext_burstcount; 
output                           o_ext_waitrequest     [NUM_DIMM];     
// from LSUs
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [NUM_PORT];     
input      [AWIDTH-1:0]          i_avm_address         [NUM_PORT];     
input                            i_avm_read            [NUM_PORT];     
input                            i_avm_write           [NUM_PORT];     
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [NUM_PORT];  
// to LSUs
output                           o_avm_waitrequest     [NUM_PORT];   
output                           o_token;
output                           o_active              [NUM_PORT];   
// from memory
input                            i_avm_waitrequest     [NUM_DIMM];       
// to memory 
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output                           o_avm_read;  
output                           o_avm_write;                
output     [BURST_CNT_W-1:0]     o_avm_burstcount;
output     [ID_WIDTH-1:0]        o_id;
// write
input     [MWIDTH-1:0]           i_avm_writedata [NUM_PORT];
output    [MWIDTH-1:0]           o_avm_writedata;

genvar z, z0;  
wire [ID_WIDTH-1:0]     ci_id             [NUM_PORT][2];            
wire [MWIDTH_BYTES-1:0] ci_byteenable     [NUM_PORT][2];      
wire [AWIDTH-1:0]       ci_address        [NUM_PORT][2];      
wire                    ci_read           [NUM_PORT][2];   
wire                    ci_write          [NUM_PORT][2];   
wire [BURST_CNT_W-1:0]  ci_burstcount     [NUM_PORT][2];       
wire                    ci_token          [NUM_PORT];
wire                    ci_waitrequest    [NUM_PORT][NUM_DIMM_INT]; 
wire                    co_waitrequest_0  [NUM_PORT][NUM_DIMM_INT]; 
wire                    co_waitrequest_1  [NUM_PORT]; 
wire [MWIDTH-1:0]       co_readdata       [NUM_PORT];
wire                    co_return_valid   [NUM_PORT][2];
wire [MWIDTH_BYTES-1:0] co_byteenable     [NUM_PORT];
wire [AWIDTH-1:0]       co_address        [NUM_PORT];
wire                    co_read           [NUM_PORT];
wire                    co_write          [NUM_PORT];
wire [BURST_CNT_W-1:0]  co_burstcount     [NUM_PORT];
wire [ID_WIDTH-1:0]     co_id             [NUM_PORT];
wire                    co_token          [NUM_PORT];
wire [ID_WIDTH-1:0]     co_index          [NUM_PORT];
wire [MWIDTH-1:0]       ci_writedata      [NUM_PORT][2];    
wire [MWIDTH-1:0]       co_writedata      [NUM_PORT];        


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

generate  
    if(ENABLE_FAST) begin : GEN_ENABLE_FAST        
      wire i_avm_wait_int [NUM_DIMM_INT]; 
      if(NUM_DIMM_INT > 1) begin
        assign i_avm_wait_int = i_avm_waitrequest;          
      end
      else  begin
        assign i_avm_wait_int[0] = i_avm_waitrequest[0];        
      end
      lsu_n_fast #(
         .AWIDTH(AWIDTH),       
         .MWIDTH_BYTES(MWIDTH_BYTES),
         .BURST_CNT_W(BURST_CNT_W),
         .NUM_PORT(NUM_PORT),
         .START_ID(START_ID),      
         .ID_WIDTH(ID_WIDTH),
         .OPEN_RING(OPEN_RING),
         .NUM_DIMM(NUM_DIMM_INT),
         .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
         .START_ACTIVE(START_ACTIVE|!OPEN_RING),
         .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),               
         .READ(READ),
         .HIGH_FMAX(HIGH_FMAX)
       ) lsu_n_fast (
        .clk              (clk),
        .reset            (reset),
        .i_ext_read       (1'b0), 
        .i_avm_write      (i_avm_write),
        .i_token          (i_token),
        .i_avm_address    (i_avm_address),
        .i_avm_read       (i_avm_read),
        .i_avm_burstcount (i_avm_burstcount),
        .o_avm_waitrequest(o_avm_waitrequest),
        .i_avm_waitrequest(i_avm_wait_int),
        .o_avm_address    (o_avm_address),
        .o_avm_read       (o_avm_read),
        .o_avm_burstcount (o_avm_burstcount),
        .o_token          (o_token),
        .o_id             (o_id)
      );           
    end
    else begin : GEN_DISABLE_FAST 
      assign o_avm_byteenable   = co_byteenable  [NUM_PORT-1];
      assign o_avm_address      = co_address     [NUM_PORT-1];
      assign o_avm_read         = co_read        [NUM_PORT-1];
      assign o_avm_write        = co_write       [NUM_PORT-1];
      assign o_avm_burstcount   = co_burstcount  [NUM_PORT-1];  
      assign o_id               = co_id          [NUM_PORT-1];
      assign o_token            = co_token       [NUM_PORT-1];
      assign o_avm_writedata    = co_writedata   [NUM_PORT-1];    
      if(NUM_DIMM_INT > 1) begin
        assign ci_waitrequest[NUM_PORT-1] = i_avm_waitrequest;  
        assign o_ext_waitrequest = co_waitrequest_0[0]; 
      end
      else  begin
        assign ci_waitrequest[NUM_PORT-1][0] = i_avm_waitrequest[0];      
        assign o_ext_waitrequest[0] = co_waitrequest_0[0][0];    
      end                  
                
      for(z=0; z<NUM_PORT; z=z+1) begin : GEN_IC
        if(z==0) begin   
          assign ci_token[z] = OPEN_RING? i_token : co_token [NUM_PORT - 1]; 
          assign ci_read       [z][0] = OPEN_RING? i_ext_read : 1'b0;                
          assign ci_write      [z][0] = 1'b0;
          assign ci_id         [z][0] = i_id;
          assign ci_byteenable [z][0] = '1;      
          assign ci_address    [z][0] = i_ext_address;      
          assign ci_burstcount [z][0] = i_ext_burstcount;    
          assign ci_read       [z][1] = i_avm_read [0];        
          assign ci_write      [z][1] = i_avm_write[0];            
          assign ci_id         [z][1] = START_ID;
          assign ci_byteenable [z][1] = i_avm_byteenable [0];      
          assign ci_address    [z][1] = i_avm_address    [0];      
          assign ci_burstcount [z][1] = i_avm_burstcount [0]; 
          assign ci_writedata  [z][1] = i_avm_writedata  [0];        
        end
        else begin
          assign ci_token[z] = co_token [z-1]; 
          assign ci_read       [z][0] = co_read          [z-1];   
          assign ci_write      [z][0] = co_write         [z-1]; 
          assign ci_id         [z][0] = co_id            [z-1];
          assign ci_byteenable [z][0] = co_byteenable    [z-1];
          assign ci_address    [z][0] = co_address       [z-1];        
          assign ci_burstcount [z][0] = co_burstcount    [z-1];   
          assign ci_writedata  [z][0] = co_writedata     [z-1];            
          assign ci_id         [z][1] = START_ID+z;
          assign ci_byteenable [z][1] = i_avm_byteenable [z];      
          assign ci_address    [z][1] = i_avm_address    [z];      
          assign ci_read       [z][1] = i_avm_read       [z];      
          assign ci_write      [z][1] = i_avm_write      [z];      
          assign ci_burstcount [z][1] = i_avm_burstcount [z];      
          assign ci_writedata  [z][1] = i_avm_writedata  [z];            
        end           
        assign o_avm_waitrequest[z] = co_waitrequest_1[z];   
        if(z < NUM_PORT - 1)  assign ci_waitrequest[z] = co_waitrequest_0[z+1];           
              
        lsu_ic_token #(
          .AWIDTH(AWIDTH),
          .START_ACTIVE(z==0 & (START_ACTIVE|!OPEN_RING)),
          .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
          .MWIDTH_BYTES(MWIDTH_BYTES),
          .READ(READ),   
          .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT & (z == NUM_PORT - 1)),
          .ID_WIDTH(ID_WIDTH),
          .NUM_DIMM(NUM_DIMM_INT),
          .BURST_CNT_W(BURST_CNT_W),
          .HIGH_FMAX(HIGH_FMAX)
        ) ic (
          .clk(clk),                      
          .reset(reset), 
          .i_token(ci_token[z]),
          .i_id(ci_id[z]),                    
          .i_avm_waitrequest(ci_waitrequest[z]),          
          .i_avm_byteenable(ci_byteenable[z]),         
          .i_avm_address(ci_address[z]),            
          .i_avm_read(ci_read[z]),            
          .i_avm_write(ci_write[z]),             
          .i_avm_burstcount(ci_burstcount[z]),      
          .i_avm_writedata(ci_writedata[z]),   
          .o_avm_writedata(co_writedata[z]),    
          .o_avm_waitrequest_0(co_waitrequest_0[z]),        
          .o_avm_waitrequest_1(co_waitrequest_1[z]),        
          .o_avm_byteenable(co_byteenable[z]),         
          .o_avm_address(co_address[z]),            
          .o_avm_read(co_read[z]),          
          .o_avm_write(co_write[z]),            
          .o_avm_burstcount(co_burstcount[z]),    
          .o_token(co_token[z]),    
          .o_index(co_index[z]),
          .o_active(o_active[z]),
          .o_id(co_id[z])
        );        
      end // end GEN_MULTIPLE_PORT   
      `ifdef SIM_ONLY
          reg burst_done;
          reg [BURST_CNT_W-1:0] cnt;
          reg [AWIDTH-1:0]  R_address;
          reg error;         
          if(READ == 0) begin : GEN_WRITE_DEBUG
            always @(posedge clk or posedge arst) begin
              if(arst) begin
                cnt <= 1;
                burst_done <= 1'b0;  
                error <= 1'b0; 
              end
              else begin                
                if(o_avm_write) begin
                  R_address <= o_avm_address;
                  cnt <= (cnt == o_avm_burstcount)? 1 : cnt + 1;
                  burst_done <= cnt == o_avm_burstcount;
                  error <= (R_address != o_avm_address) & !burst_done;
                  if(error) begin
                    $display("write ring error");
                    $stop;
                  end
                end
                // synchronous reset (these assignments override the assignments above if srst is asserted)
                if(srst[0]) begin
                  cnt <= 1;
                  burst_done <= 1'b0;  
                  error <= 1'b0; 
                end                
              end      
            end      
          end
        `endif   
    end
endgenerate

endmodule
