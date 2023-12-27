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


`timescale 1ns / 1ns

/* This module implements a skid-buffer, which is effectively a 1-deep FIFO made of registers.
   The read-req signal is fed combinationally upstream.
   Incoming data, along with the empty signal, are registered.
*/
module acl_skid_buffer (
                                       clk,
                                       reset,
                                       rreq_to_fifo,
                                       empty_fr_fifo,
                                       data_fr_fifo,
                                       rreq,
                                       rdempty,
                                       out_data
                                       );

   parameter  DATA_WIDTH = 32;
   
   input clk;
   input reset;   // Synchronous reset
   
   output rreq_to_fifo;
   input  empty_fr_fifo;
   input [DATA_WIDTH-1:0] data_fr_fifo;
   
   input                  rreq;
   output                 rdempty;
   output [DATA_WIDTH-1:0] out_data;
   
   logic                     full1;
   logic [DATA_WIDTH-1:0]    data1;

   assign rdempty = ~full1;
   assign out_data  = data1;    
   
  // rreq_to_fifo will be a pass through of the rreq signal as it is not registered
  // Also assert read to the previous stage if not full (ie. there is no data stored in data1)
  assign rreq_to_fifo = (~full1) | rreq;

   // NON_RESETABLE FLOPS
   // Data path registers
   always @(posedge clk) begin
      if (rreq_to_fifo) begin
         data1 <= data_fr_fifo;
      end
   end

   // SYNC_RESET FLOPS
   // Ready/Valid control logic
   always @(posedge clk) begin
      if (reset) begin
         full1 <= 1'b0;
      end
      else begin
         if (rreq_to_fifo) begin
            full1 <= ~empty_fr_fifo;  //full1 indicates if we have valid data
         end
      end
   end
endmodule
