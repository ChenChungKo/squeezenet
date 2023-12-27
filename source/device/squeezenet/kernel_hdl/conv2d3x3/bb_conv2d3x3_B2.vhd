-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from bb_conv2d3x3_B2
-- VHDL created on Sun Oct 01 23:33:45 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity bb_conv2d3x3_B2 is
    port (
        in_c0_exe1045_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1045_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1146_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1146_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115436_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe115436_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1248_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1248_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1349_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1349_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1450_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1450_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1551_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1551_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1652_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1652_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe17_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe17_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe237_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe237_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe338_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe338_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe439_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe439_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe540_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe540_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe641_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe641_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe742_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe742_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe944_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe944_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe111_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe111_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe116_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe116_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe219_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe219_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe324_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe324_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe425_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe425_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe530_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe530_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe633_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe633_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exe114_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01535_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01535_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_112_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_112_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0110_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0110_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0110_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0110_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0115_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0115_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0115_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0115_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_111_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_111_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1045 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1146 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe115436 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1248 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1349 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1450 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1551 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1652 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe17 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe237 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe338 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe439 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe540 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe641 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe742 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe843 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe944 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe111 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1176 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exe116 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe219 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe425 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe530 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe633 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc60 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_01535 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0110_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_input_im_load_0110_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_input_im_load_0110_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0110_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0115_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_input_im_load_0115_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_input_im_load_0115_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0115_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B2;

architecture normal of bb_conv2d3x3_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d3x3_B2_stall_region is
        port (
            in_c0_exe1045 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1146 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115436 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1248 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1349 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1450 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1551 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1652 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe237 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe338 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe439 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe540 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe641 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe742 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe944 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe111 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe116 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe219 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe324 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe425 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe530 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe633 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01535 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_112 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_111 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1045 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1146 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115436 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1248 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1349 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1450 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1551 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1652 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe237 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe338 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe439 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe540 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe641 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe742 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe944 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1176 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe425 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe530 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe633 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc60 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01535 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B2_branch is
        port (
            in_c0_exe1045 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1146 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115436 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1248 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1349 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1450 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1551 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1652 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe237 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe338 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe439 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe540 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe641 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe742 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe944 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe111 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe1176 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exe116 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe219 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe324 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe425 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe530 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe633 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc60 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01535 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1045 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1146 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115436 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1248 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1349 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1450 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1551 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1652 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe237 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe338 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe439 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe540 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe641 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe742 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe944 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1176 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe425 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe530 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe633 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc60 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01535 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B2_merge is
        port (
            in_c0_exe1045_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1045_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1146_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1146_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115436_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe115436_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1248_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1248_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1349_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1349_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1450_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1450_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1551_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1551_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1652_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1652_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe17_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe17_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe237_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe237_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe338_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe338_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe439_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe439_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe540_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe540_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe641_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe641_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe742_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe742_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe944_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe944_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe111_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe111_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe116_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe116_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe219_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe219_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe324_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe324_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe425_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe425_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe530_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe530_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe633_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe633_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe114_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c3_exe114_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01535_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01535_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_112_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_112_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_111_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_111_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1045 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1146 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115436 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1248 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1349 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1450 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1551 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1652 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe237 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe338 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe439 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe540 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe641 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe742 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe944 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe425 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe530 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe633 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01535 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_112 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_111 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1045 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1146 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe115436 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1248 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1349 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1450 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1551 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe1652 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe17 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe237 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe338 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe439 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe540 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe641 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe742 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe843 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe944 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe111 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe1176 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c2_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c2_exe219 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c2_exe324 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c2_exe425 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c2_exe530 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c2_exe633 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c3_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_inc60 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_j_01535 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x33 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1045 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1146 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe115436 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1248 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1349 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1450 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1551 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe1652 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe17 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe237 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe338 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe439 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe540 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe641 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe742 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe843 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c0_exe944 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c1_exe111 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_branch_out_c1_exe1176 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_c2_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_c2_exe219 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_c2_exe324 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c2_exe425 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_c2_exe530 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c2_exe633 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_c3_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_inc60 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_j_01535 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1045 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1146 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe115436 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1248 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1349 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1450 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1551 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe1652 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe17 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe237 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe338 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe439 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe540 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe641 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe742 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe843 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe944 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe111 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_out_c2_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_c2_exe219 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_c2_exe324 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c2_exe425 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_c2_exe530 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c2_exe633 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c3_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_j_01535 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_k_112 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_tmp_111 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d3x3_B2_merge(BLACKBOX,4)
    theconv2d3x3_B2_merge : conv2d3x3_B2_merge
    PORT MAP (
        in_c0_exe1045_0 => in_c0_exe1045_0,
        in_c0_exe1045_1 => in_c0_exe1045_1,
        in_c0_exe1146_0 => in_c0_exe1146_0,
        in_c0_exe1146_1 => in_c0_exe1146_1,
        in_c0_exe115436_0 => in_c0_exe115436_0,
        in_c0_exe115436_1 => in_c0_exe115436_1,
        in_c0_exe1248_0 => in_c0_exe1248_0,
        in_c0_exe1248_1 => in_c0_exe1248_1,
        in_c0_exe1349_0 => in_c0_exe1349_0,
        in_c0_exe1349_1 => in_c0_exe1349_1,
        in_c0_exe1450_0 => in_c0_exe1450_0,
        in_c0_exe1450_1 => in_c0_exe1450_1,
        in_c0_exe1551_0 => in_c0_exe1551_0,
        in_c0_exe1551_1 => in_c0_exe1551_1,
        in_c0_exe1652_0 => in_c0_exe1652_0,
        in_c0_exe1652_1 => in_c0_exe1652_1,
        in_c0_exe17_0 => in_c0_exe17_0,
        in_c0_exe17_1 => in_c0_exe17_1,
        in_c0_exe237_0 => in_c0_exe237_0,
        in_c0_exe237_1 => in_c0_exe237_1,
        in_c0_exe338_0 => in_c0_exe338_0,
        in_c0_exe338_1 => in_c0_exe338_1,
        in_c0_exe439_0 => in_c0_exe439_0,
        in_c0_exe439_1 => in_c0_exe439_1,
        in_c0_exe540_0 => in_c0_exe540_0,
        in_c0_exe540_1 => in_c0_exe540_1,
        in_c0_exe641_0 => in_c0_exe641_0,
        in_c0_exe641_1 => in_c0_exe641_1,
        in_c0_exe742_0 => in_c0_exe742_0,
        in_c0_exe742_1 => in_c0_exe742_1,
        in_c0_exe843_0 => in_c0_exe843_0,
        in_c0_exe843_1 => in_c0_exe843_1,
        in_c0_exe944_0 => in_c0_exe944_0,
        in_c0_exe944_1 => in_c0_exe944_1,
        in_c1_exe111_0 => in_c1_exe111_0,
        in_c1_exe111_1 => in_c1_exe111_1,
        in_c2_exe116_0 => in_c2_exe116_0,
        in_c2_exe116_1 => in_c2_exe116_1,
        in_c2_exe219_0 => in_c2_exe219_0,
        in_c2_exe219_1 => in_c2_exe219_1,
        in_c2_exe324_0 => in_c2_exe324_0,
        in_c2_exe324_1 => in_c2_exe324_1,
        in_c2_exe425_0 => in_c2_exe425_0,
        in_c2_exe425_1 => in_c2_exe425_1,
        in_c2_exe530_0 => in_c2_exe530_0,
        in_c2_exe530_1 => in_c2_exe530_1,
        in_c2_exe633_0 => in_c2_exe633_0,
        in_c2_exe633_1 => in_c2_exe633_1,
        in_c3_exe114_0 => in_c3_exe114_0,
        in_c3_exe114_1 => in_c3_exe114_1,
        in_j_01535_0 => in_j_01535_0,
        in_j_01535_1 => in_j_01535_1,
        in_k_112_0 => in_k_112_0,
        in_k_112_1 => in_k_112_1,
        in_stall_in => bb_conv2d3x3_B2_stall_region_out_stall_out,
        in_tmp_111_0 => in_tmp_111_0,
        in_tmp_111_1 => in_tmp_111_1,
        in_unnamed_conv2d3x32_0 => in_unnamed_conv2d3x32_0,
        in_unnamed_conv2d3x32_1 => in_unnamed_conv2d3x32_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe1045 => conv2d3x3_B2_merge_out_c0_exe1045,
        out_c0_exe1146 => conv2d3x3_B2_merge_out_c0_exe1146,
        out_c0_exe115436 => conv2d3x3_B2_merge_out_c0_exe115436,
        out_c0_exe1248 => conv2d3x3_B2_merge_out_c0_exe1248,
        out_c0_exe1349 => conv2d3x3_B2_merge_out_c0_exe1349,
        out_c0_exe1450 => conv2d3x3_B2_merge_out_c0_exe1450,
        out_c0_exe1551 => conv2d3x3_B2_merge_out_c0_exe1551,
        out_c0_exe1652 => conv2d3x3_B2_merge_out_c0_exe1652,
        out_c0_exe17 => conv2d3x3_B2_merge_out_c0_exe17,
        out_c0_exe237 => conv2d3x3_B2_merge_out_c0_exe237,
        out_c0_exe338 => conv2d3x3_B2_merge_out_c0_exe338,
        out_c0_exe439 => conv2d3x3_B2_merge_out_c0_exe439,
        out_c0_exe540 => conv2d3x3_B2_merge_out_c0_exe540,
        out_c0_exe641 => conv2d3x3_B2_merge_out_c0_exe641,
        out_c0_exe742 => conv2d3x3_B2_merge_out_c0_exe742,
        out_c0_exe843 => conv2d3x3_B2_merge_out_c0_exe843,
        out_c0_exe944 => conv2d3x3_B2_merge_out_c0_exe944,
        out_c1_exe111 => conv2d3x3_B2_merge_out_c1_exe111,
        out_c2_exe116 => conv2d3x3_B2_merge_out_c2_exe116,
        out_c2_exe219 => conv2d3x3_B2_merge_out_c2_exe219,
        out_c2_exe324 => conv2d3x3_B2_merge_out_c2_exe324,
        out_c2_exe425 => conv2d3x3_B2_merge_out_c2_exe425,
        out_c2_exe530 => conv2d3x3_B2_merge_out_c2_exe530,
        out_c2_exe633 => conv2d3x3_B2_merge_out_c2_exe633,
        out_c3_exe114 => conv2d3x3_B2_merge_out_c3_exe114,
        out_j_01535 => conv2d3x3_B2_merge_out_j_01535,
        out_k_112 => conv2d3x3_B2_merge_out_k_112,
        out_stall_out_0 => conv2d3x3_B2_merge_out_stall_out_0,
        out_stall_out_1 => conv2d3x3_B2_merge_out_stall_out_1,
        out_tmp_111 => conv2d3x3_B2_merge_out_tmp_111,
        out_unnamed_conv2d3x32 => conv2d3x3_B2_merge_out_unnamed_conv2d3x32,
        out_valid_out => conv2d3x3_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2_stall_region(BLACKBOX,2)
    thebb_conv2d3x3_B2_stall_region : bb_conv2d3x3_B2_stall_region
    PORT MAP (
        in_c0_exe1045 => conv2d3x3_B2_merge_out_c0_exe1045,
        in_c0_exe1146 => conv2d3x3_B2_merge_out_c0_exe1146,
        in_c0_exe115436 => conv2d3x3_B2_merge_out_c0_exe115436,
        in_c0_exe1248 => conv2d3x3_B2_merge_out_c0_exe1248,
        in_c0_exe1349 => conv2d3x3_B2_merge_out_c0_exe1349,
        in_c0_exe1450 => conv2d3x3_B2_merge_out_c0_exe1450,
        in_c0_exe1551 => conv2d3x3_B2_merge_out_c0_exe1551,
        in_c0_exe1652 => conv2d3x3_B2_merge_out_c0_exe1652,
        in_c0_exe17 => conv2d3x3_B2_merge_out_c0_exe17,
        in_c0_exe237 => conv2d3x3_B2_merge_out_c0_exe237,
        in_c0_exe338 => conv2d3x3_B2_merge_out_c0_exe338,
        in_c0_exe439 => conv2d3x3_B2_merge_out_c0_exe439,
        in_c0_exe540 => conv2d3x3_B2_merge_out_c0_exe540,
        in_c0_exe641 => conv2d3x3_B2_merge_out_c0_exe641,
        in_c0_exe742 => conv2d3x3_B2_merge_out_c0_exe742,
        in_c0_exe843 => conv2d3x3_B2_merge_out_c0_exe843,
        in_c0_exe944 => conv2d3x3_B2_merge_out_c0_exe944,
        in_c1_exe111 => conv2d3x3_B2_merge_out_c1_exe111,
        in_c2_exe116 => conv2d3x3_B2_merge_out_c2_exe116,
        in_c2_exe219 => conv2d3x3_B2_merge_out_c2_exe219,
        in_c2_exe324 => conv2d3x3_B2_merge_out_c2_exe324,
        in_c2_exe425 => conv2d3x3_B2_merge_out_c2_exe425,
        in_c2_exe530 => conv2d3x3_B2_merge_out_c2_exe530,
        in_c2_exe633 => conv2d3x3_B2_merge_out_c2_exe633,
        in_c3_exe114 => conv2d3x3_B2_merge_out_c3_exe114,
        in_filter_weight => in_filter_weight,
        in_flush => in_flush,
        in_input_channels => in_input_channels,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_j_01535 => conv2d3x3_B2_merge_out_j_01535,
        in_k_112 => conv2d3x3_B2_merge_out_k_112,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        in_memcoalesce_input_im_load_0110_avm_readdata => in_memcoalesce_input_im_load_0110_avm_readdata,
        in_memcoalesce_input_im_load_0110_avm_readdatavalid => in_memcoalesce_input_im_load_0110_avm_readdatavalid,
        in_memcoalesce_input_im_load_0110_avm_waitrequest => in_memcoalesce_input_im_load_0110_avm_waitrequest,
        in_memcoalesce_input_im_load_0110_avm_writeack => in_memcoalesce_input_im_load_0110_avm_writeack,
        in_memcoalesce_input_im_load_0115_avm_readdata => in_memcoalesce_input_im_load_0115_avm_readdata,
        in_memcoalesce_input_im_load_0115_avm_readdatavalid => in_memcoalesce_input_im_load_0115_avm_readdatavalid,
        in_memcoalesce_input_im_load_0115_avm_waitrequest => in_memcoalesce_input_im_load_0115_avm_waitrequest,
        in_memcoalesce_input_im_load_0115_avm_writeack => in_memcoalesce_input_im_load_0115_avm_writeack,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        in_stall_in => conv2d3x3_B2_branch_out_stall_out,
        in_tmp_111 => conv2d3x3_B2_merge_out_tmp_111,
        in_unnamed_conv2d3x32 => conv2d3x3_B2_merge_out_unnamed_conv2d3x32,
        in_valid_in => conv2d3x3_B2_merge_out_valid_out,
        out_c0_exe1045 => bb_conv2d3x3_B2_stall_region_out_c0_exe1045,
        out_c0_exe1146 => bb_conv2d3x3_B2_stall_region_out_c0_exe1146,
        out_c0_exe115436 => bb_conv2d3x3_B2_stall_region_out_c0_exe115436,
        out_c0_exe1248 => bb_conv2d3x3_B2_stall_region_out_c0_exe1248,
        out_c0_exe1349 => bb_conv2d3x3_B2_stall_region_out_c0_exe1349,
        out_c0_exe1450 => bb_conv2d3x3_B2_stall_region_out_c0_exe1450,
        out_c0_exe1551 => bb_conv2d3x3_B2_stall_region_out_c0_exe1551,
        out_c0_exe1652 => bb_conv2d3x3_B2_stall_region_out_c0_exe1652,
        out_c0_exe17 => bb_conv2d3x3_B2_stall_region_out_c0_exe17,
        out_c0_exe237 => bb_conv2d3x3_B2_stall_region_out_c0_exe237,
        out_c0_exe338 => bb_conv2d3x3_B2_stall_region_out_c0_exe338,
        out_c0_exe439 => bb_conv2d3x3_B2_stall_region_out_c0_exe439,
        out_c0_exe540 => bb_conv2d3x3_B2_stall_region_out_c0_exe540,
        out_c0_exe641 => bb_conv2d3x3_B2_stall_region_out_c0_exe641,
        out_c0_exe742 => bb_conv2d3x3_B2_stall_region_out_c0_exe742,
        out_c0_exe843 => bb_conv2d3x3_B2_stall_region_out_c0_exe843,
        out_c0_exe944 => bb_conv2d3x3_B2_stall_region_out_c0_exe944,
        out_c1_exe111 => bb_conv2d3x3_B2_stall_region_out_c1_exe111,
        out_c1_exe1176 => bb_conv2d3x3_B2_stall_region_out_c1_exe1176,
        out_c2_exe116 => bb_conv2d3x3_B2_stall_region_out_c2_exe116,
        out_c2_exe219 => bb_conv2d3x3_B2_stall_region_out_c2_exe219,
        out_c2_exe324 => bb_conv2d3x3_B2_stall_region_out_c2_exe324,
        out_c2_exe425 => bb_conv2d3x3_B2_stall_region_out_c2_exe425,
        out_c2_exe530 => bb_conv2d3x3_B2_stall_region_out_c2_exe530,
        out_c2_exe633 => bb_conv2d3x3_B2_stall_region_out_c2_exe633,
        out_c3_exe114 => bb_conv2d3x3_B2_stall_region_out_c3_exe114,
        out_inc60 => bb_conv2d3x3_B2_stall_region_out_inc60,
        out_j_01535 => bb_conv2d3x3_B2_stall_region_out_j_01535,
        out_memcoalesce_filter_weight_load_0_avm_address => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_memcoalesce_input_im_load_0110_avm_address => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_address,
        out_memcoalesce_input_im_load_0110_avm_burstcount => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_burstcount,
        out_memcoalesce_input_im_load_0110_avm_byteenable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_byteenable,
        out_memcoalesce_input_im_load_0110_avm_enable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_enable,
        out_memcoalesce_input_im_load_0110_avm_read => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_read,
        out_memcoalesce_input_im_load_0110_avm_write => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_write,
        out_memcoalesce_input_im_load_0110_avm_writedata => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_writedata,
        out_memcoalesce_input_im_load_0115_avm_address => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_address,
        out_memcoalesce_input_im_load_0115_avm_burstcount => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_burstcount,
        out_memcoalesce_input_im_load_0115_avm_byteenable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_byteenable,
        out_memcoalesce_input_im_load_0115_avm_enable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_enable,
        out_memcoalesce_input_im_load_0115_avm_read => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_read,
        out_memcoalesce_input_im_load_0115_avm_write => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_write,
        out_memcoalesce_input_im_load_0115_avm_writedata => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_writedata,
        out_memcoalesce_input_im_load_0_avm_address => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata,
        out_stall_out => bb_conv2d3x3_B2_stall_region_out_stall_out,
        out_unnamed_conv2d3x32 => bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x32,
        out_unnamed_conv2d3x33 => bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x33,
        out_valid_out => bb_conv2d3x3_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d3x3_B2_branch(BLACKBOX,3)
    theconv2d3x3_B2_branch : conv2d3x3_B2_branch
    PORT MAP (
        in_c0_exe1045 => bb_conv2d3x3_B2_stall_region_out_c0_exe1045,
        in_c0_exe1146 => bb_conv2d3x3_B2_stall_region_out_c0_exe1146,
        in_c0_exe115436 => bb_conv2d3x3_B2_stall_region_out_c0_exe115436,
        in_c0_exe1248 => bb_conv2d3x3_B2_stall_region_out_c0_exe1248,
        in_c0_exe1349 => bb_conv2d3x3_B2_stall_region_out_c0_exe1349,
        in_c0_exe1450 => bb_conv2d3x3_B2_stall_region_out_c0_exe1450,
        in_c0_exe1551 => bb_conv2d3x3_B2_stall_region_out_c0_exe1551,
        in_c0_exe1652 => bb_conv2d3x3_B2_stall_region_out_c0_exe1652,
        in_c0_exe17 => bb_conv2d3x3_B2_stall_region_out_c0_exe17,
        in_c0_exe237 => bb_conv2d3x3_B2_stall_region_out_c0_exe237,
        in_c0_exe338 => bb_conv2d3x3_B2_stall_region_out_c0_exe338,
        in_c0_exe439 => bb_conv2d3x3_B2_stall_region_out_c0_exe439,
        in_c0_exe540 => bb_conv2d3x3_B2_stall_region_out_c0_exe540,
        in_c0_exe641 => bb_conv2d3x3_B2_stall_region_out_c0_exe641,
        in_c0_exe742 => bb_conv2d3x3_B2_stall_region_out_c0_exe742,
        in_c0_exe843 => bb_conv2d3x3_B2_stall_region_out_c0_exe843,
        in_c0_exe944 => bb_conv2d3x3_B2_stall_region_out_c0_exe944,
        in_c1_exe111 => bb_conv2d3x3_B2_stall_region_out_c1_exe111,
        in_c1_exe1176 => bb_conv2d3x3_B2_stall_region_out_c1_exe1176,
        in_c2_exe116 => bb_conv2d3x3_B2_stall_region_out_c2_exe116,
        in_c2_exe219 => bb_conv2d3x3_B2_stall_region_out_c2_exe219,
        in_c2_exe324 => bb_conv2d3x3_B2_stall_region_out_c2_exe324,
        in_c2_exe425 => bb_conv2d3x3_B2_stall_region_out_c2_exe425,
        in_c2_exe530 => bb_conv2d3x3_B2_stall_region_out_c2_exe530,
        in_c2_exe633 => bb_conv2d3x3_B2_stall_region_out_c2_exe633,
        in_c3_exe114 => bb_conv2d3x3_B2_stall_region_out_c3_exe114,
        in_inc60 => bb_conv2d3x3_B2_stall_region_out_inc60,
        in_j_01535 => bb_conv2d3x3_B2_stall_region_out_j_01535,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d3x32 => bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x32,
        in_unnamed_conv2d3x33 => bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x33,
        in_valid_in => bb_conv2d3x3_B2_stall_region_out_valid_out,
        out_c0_exe1045 => conv2d3x3_B2_branch_out_c0_exe1045,
        out_c0_exe1146 => conv2d3x3_B2_branch_out_c0_exe1146,
        out_c0_exe115436 => conv2d3x3_B2_branch_out_c0_exe115436,
        out_c0_exe1248 => conv2d3x3_B2_branch_out_c0_exe1248,
        out_c0_exe1349 => conv2d3x3_B2_branch_out_c0_exe1349,
        out_c0_exe1450 => conv2d3x3_B2_branch_out_c0_exe1450,
        out_c0_exe1551 => conv2d3x3_B2_branch_out_c0_exe1551,
        out_c0_exe1652 => conv2d3x3_B2_branch_out_c0_exe1652,
        out_c0_exe17 => conv2d3x3_B2_branch_out_c0_exe17,
        out_c0_exe237 => conv2d3x3_B2_branch_out_c0_exe237,
        out_c0_exe338 => conv2d3x3_B2_branch_out_c0_exe338,
        out_c0_exe439 => conv2d3x3_B2_branch_out_c0_exe439,
        out_c0_exe540 => conv2d3x3_B2_branch_out_c0_exe540,
        out_c0_exe641 => conv2d3x3_B2_branch_out_c0_exe641,
        out_c0_exe742 => conv2d3x3_B2_branch_out_c0_exe742,
        out_c0_exe843 => conv2d3x3_B2_branch_out_c0_exe843,
        out_c0_exe944 => conv2d3x3_B2_branch_out_c0_exe944,
        out_c1_exe111 => conv2d3x3_B2_branch_out_c1_exe111,
        out_c1_exe1176 => conv2d3x3_B2_branch_out_c1_exe1176,
        out_c2_exe116 => conv2d3x3_B2_branch_out_c2_exe116,
        out_c2_exe219 => conv2d3x3_B2_branch_out_c2_exe219,
        out_c2_exe324 => conv2d3x3_B2_branch_out_c2_exe324,
        out_c2_exe425 => conv2d3x3_B2_branch_out_c2_exe425,
        out_c2_exe530 => conv2d3x3_B2_branch_out_c2_exe530,
        out_c2_exe633 => conv2d3x3_B2_branch_out_c2_exe633,
        out_c3_exe114 => conv2d3x3_B2_branch_out_c3_exe114,
        out_inc60 => conv2d3x3_B2_branch_out_inc60,
        out_j_01535 => conv2d3x3_B2_branch_out_j_01535,
        out_stall_out => conv2d3x3_B2_branch_out_stall_out,
        out_unnamed_conv2d3x32 => conv2d3x3_B2_branch_out_unnamed_conv2d3x32,
        out_valid_out_0 => conv2d3x3_B2_branch_out_valid_out_0,
        out_valid_out_1 => conv2d3x3_B2_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe1045(GPOUT,92)
    out_c0_exe1045 <= conv2d3x3_B2_branch_out_c0_exe1045;

    -- out_c0_exe1146(GPOUT,93)
    out_c0_exe1146 <= conv2d3x3_B2_branch_out_c0_exe1146;

    -- out_c0_exe115436(GPOUT,94)
    out_c0_exe115436 <= conv2d3x3_B2_branch_out_c0_exe115436;

    -- out_c0_exe1248(GPOUT,95)
    out_c0_exe1248 <= conv2d3x3_B2_branch_out_c0_exe1248;

    -- out_c0_exe1349(GPOUT,96)
    out_c0_exe1349 <= conv2d3x3_B2_branch_out_c0_exe1349;

    -- out_c0_exe1450(GPOUT,97)
    out_c0_exe1450 <= conv2d3x3_B2_branch_out_c0_exe1450;

    -- out_c0_exe1551(GPOUT,98)
    out_c0_exe1551 <= conv2d3x3_B2_branch_out_c0_exe1551;

    -- out_c0_exe1652(GPOUT,99)
    out_c0_exe1652 <= conv2d3x3_B2_branch_out_c0_exe1652;

    -- out_c0_exe17(GPOUT,100)
    out_c0_exe17 <= conv2d3x3_B2_branch_out_c0_exe17;

    -- out_c0_exe237(GPOUT,101)
    out_c0_exe237 <= conv2d3x3_B2_branch_out_c0_exe237;

    -- out_c0_exe338(GPOUT,102)
    out_c0_exe338 <= conv2d3x3_B2_branch_out_c0_exe338;

    -- out_c0_exe439(GPOUT,103)
    out_c0_exe439 <= conv2d3x3_B2_branch_out_c0_exe439;

    -- out_c0_exe540(GPOUT,104)
    out_c0_exe540 <= conv2d3x3_B2_branch_out_c0_exe540;

    -- out_c0_exe641(GPOUT,105)
    out_c0_exe641 <= conv2d3x3_B2_branch_out_c0_exe641;

    -- out_c0_exe742(GPOUT,106)
    out_c0_exe742 <= conv2d3x3_B2_branch_out_c0_exe742;

    -- out_c0_exe843(GPOUT,107)
    out_c0_exe843 <= conv2d3x3_B2_branch_out_c0_exe843;

    -- out_c0_exe944(GPOUT,108)
    out_c0_exe944 <= conv2d3x3_B2_branch_out_c0_exe944;

    -- out_c1_exe111(GPOUT,109)
    out_c1_exe111 <= conv2d3x3_B2_branch_out_c1_exe111;

    -- out_c1_exe1176(GPOUT,110)
    out_c1_exe1176 <= conv2d3x3_B2_branch_out_c1_exe1176;

    -- out_c2_exe116(GPOUT,111)
    out_c2_exe116 <= conv2d3x3_B2_branch_out_c2_exe116;

    -- out_c2_exe219(GPOUT,112)
    out_c2_exe219 <= conv2d3x3_B2_branch_out_c2_exe219;

    -- out_c2_exe324(GPOUT,113)
    out_c2_exe324 <= conv2d3x3_B2_branch_out_c2_exe324;

    -- out_c2_exe425(GPOUT,114)
    out_c2_exe425 <= conv2d3x3_B2_branch_out_c2_exe425;

    -- out_c2_exe530(GPOUT,115)
    out_c2_exe530 <= conv2d3x3_B2_branch_out_c2_exe530;

    -- out_c2_exe633(GPOUT,116)
    out_c2_exe633 <= conv2d3x3_B2_branch_out_c2_exe633;

    -- out_c3_exe114(GPOUT,117)
    out_c3_exe114 <= conv2d3x3_B2_branch_out_c3_exe114;

    -- out_inc60(GPOUT,118)
    out_inc60 <= conv2d3x3_B2_branch_out_inc60;

    -- out_j_01535(GPOUT,119)
    out_j_01535 <= conv2d3x3_B2_branch_out_j_01535;

    -- out_memcoalesce_filter_weight_load_0_avm_address(GPOUT,120)
    out_memcoalesce_filter_weight_load_0_avm_address <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address;

    -- out_memcoalesce_filter_weight_load_0_avm_burstcount(GPOUT,121)
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- out_memcoalesce_filter_weight_load_0_avm_byteenable(GPOUT,122)
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- out_memcoalesce_filter_weight_load_0_avm_enable(GPOUT,123)
    out_memcoalesce_filter_weight_load_0_avm_enable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- out_memcoalesce_filter_weight_load_0_avm_read(GPOUT,124)
    out_memcoalesce_filter_weight_load_0_avm_read <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read;

    -- out_memcoalesce_filter_weight_load_0_avm_write(GPOUT,125)
    out_memcoalesce_filter_weight_load_0_avm_write <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write;

    -- out_memcoalesce_filter_weight_load_0_avm_writedata(GPOUT,126)
    out_memcoalesce_filter_weight_load_0_avm_writedata <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- out_memcoalesce_input_im_load_0110_avm_address(GPOUT,127)
    out_memcoalesce_input_im_load_0110_avm_address <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_address;

    -- out_memcoalesce_input_im_load_0110_avm_burstcount(GPOUT,128)
    out_memcoalesce_input_im_load_0110_avm_burstcount <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_burstcount;

    -- out_memcoalesce_input_im_load_0110_avm_byteenable(GPOUT,129)
    out_memcoalesce_input_im_load_0110_avm_byteenable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_byteenable;

    -- out_memcoalesce_input_im_load_0110_avm_enable(GPOUT,130)
    out_memcoalesce_input_im_load_0110_avm_enable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_enable;

    -- out_memcoalesce_input_im_load_0110_avm_read(GPOUT,131)
    out_memcoalesce_input_im_load_0110_avm_read <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_read;

    -- out_memcoalesce_input_im_load_0110_avm_write(GPOUT,132)
    out_memcoalesce_input_im_load_0110_avm_write <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_write;

    -- out_memcoalesce_input_im_load_0110_avm_writedata(GPOUT,133)
    out_memcoalesce_input_im_load_0110_avm_writedata <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0110_avm_writedata;

    -- out_memcoalesce_input_im_load_0115_avm_address(GPOUT,134)
    out_memcoalesce_input_im_load_0115_avm_address <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_address;

    -- out_memcoalesce_input_im_load_0115_avm_burstcount(GPOUT,135)
    out_memcoalesce_input_im_load_0115_avm_burstcount <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_burstcount;

    -- out_memcoalesce_input_im_load_0115_avm_byteenable(GPOUT,136)
    out_memcoalesce_input_im_load_0115_avm_byteenable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_byteenable;

    -- out_memcoalesce_input_im_load_0115_avm_enable(GPOUT,137)
    out_memcoalesce_input_im_load_0115_avm_enable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_enable;

    -- out_memcoalesce_input_im_load_0115_avm_read(GPOUT,138)
    out_memcoalesce_input_im_load_0115_avm_read <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_read;

    -- out_memcoalesce_input_im_load_0115_avm_write(GPOUT,139)
    out_memcoalesce_input_im_load_0115_avm_write <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_write;

    -- out_memcoalesce_input_im_load_0115_avm_writedata(GPOUT,140)
    out_memcoalesce_input_im_load_0115_avm_writedata <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0115_avm_writedata;

    -- out_memcoalesce_input_im_load_0_avm_address(GPOUT,141)
    out_memcoalesce_input_im_load_0_avm_address <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address;

    -- out_memcoalesce_input_im_load_0_avm_burstcount(GPOUT,142)
    out_memcoalesce_input_im_load_0_avm_burstcount <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- out_memcoalesce_input_im_load_0_avm_byteenable(GPOUT,143)
    out_memcoalesce_input_im_load_0_avm_byteenable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- out_memcoalesce_input_im_load_0_avm_enable(GPOUT,144)
    out_memcoalesce_input_im_load_0_avm_enable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable;

    -- out_memcoalesce_input_im_load_0_avm_read(GPOUT,145)
    out_memcoalesce_input_im_load_0_avm_read <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read;

    -- out_memcoalesce_input_im_load_0_avm_write(GPOUT,146)
    out_memcoalesce_input_im_load_0_avm_write <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write;

    -- out_memcoalesce_input_im_load_0_avm_writedata(GPOUT,147)
    out_memcoalesce_input_im_load_0_avm_writedata <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata;

    -- out_stall_out_0(GPOUT,148)
    out_stall_out_0 <= conv2d3x3_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,149)
    out_stall_out_1 <= conv2d3x3_B2_merge_out_stall_out_1;

    -- out_unnamed_conv2d3x32(GPOUT,150)
    out_unnamed_conv2d3x32 <= conv2d3x3_B2_branch_out_unnamed_conv2d3x32;

    -- out_valid_out_0(GPOUT,151)
    out_valid_out_0 <= conv2d3x3_B2_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,152)
    out_valid_out_1 <= conv2d3x3_B2_branch_out_valid_out_1;

END normal;
