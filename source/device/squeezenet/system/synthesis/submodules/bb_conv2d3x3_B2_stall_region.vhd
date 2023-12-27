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

-- VHDL created from bb_conv2d3x3_B2_stall_region
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

entity bb_conv2d3x3_B2_stall_region is
    port (
        in_memcoalesce_input_im_load_0110_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0110_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0110_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0110_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_input_im_load_0110_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0110_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0110_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0110_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1045 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1146 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115436 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1248 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1349 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1450 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1551 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1652 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe17 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe237 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe338 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe439 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe540 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe641 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe742 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe944 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe111 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe116 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe219 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe324 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe425 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe530 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe633 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe114 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01535 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_112 : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_111 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d3x33 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0115_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0115_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0115_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0115_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_input_im_load_0115_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0115_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0115_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0115_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B2_stall_region;

architecture normal of bb_conv2d3x3_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d3x3_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_filter_weight_load_0_conv2d3x3105 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_7 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_8 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_input_im_load_0110_conv2d3x398 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_input_im_load_0115_conv2d3x3100 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_input_im_load_0_conv2d3x396 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3 is
        port (
            in_c0_eni5_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni5_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit167_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit167_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit167_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit167_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3 is
        port (
            in_c1_eni14_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_9 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_13 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_15 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni14_16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni14_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni14_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_19 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_22 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_23 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_24 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_29 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_30 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_31 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit175_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit175_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_weight_sync_buffer_conv2d3x370 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_channels_sync_buffer131_conv2d3x372 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;















































    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;







    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_inc60_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom52_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_10 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_c1_exit175_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_ptr_sum_conv2d3x3_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d3x3_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d3x3_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d3x3_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_exitcond18_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond18_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond18_guard_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc60_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc60_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc60_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc60_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul48_add124_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul48_add124_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul48_add124_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul48_add124_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d3x3103_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d3x394_vt_const_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_unnamed_conv2d3x394_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x394_vt_select_31_b : STD_LOGIC_VECTOR (28 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal leftShiftStage0Idx1Pad2_uid111_i_unnamed_conv2d3x395_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid113_i_unnamed_conv2d3x395_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid118_i_unnamed_conv2d3x395_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (433 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_t : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_u : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_v : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_w : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_x : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_y : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_z : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_bb : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_cc : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_dd : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (191 downto 0);
    signal bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (433 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_r : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_s : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_v : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_x : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_y : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond18_conv2d3x3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond18_conv2d3x3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond18_conv2d3x3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond18_conv2d3x3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond18_conv2d3x3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond18_conv2d3x3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond18_conv2d3x3_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data6 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data7 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data8 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data9 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data10 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data11 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data12 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data13 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data14 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data15 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data16 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data18 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data21 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data22 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data23 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data24 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data28 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data29 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data30 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data31 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D6 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D7 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D8 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D9 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D10 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D11 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D12 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D13 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D14 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D15 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D16 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D18 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D21 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D22 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D23 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D24 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D28 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D29 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D30 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D31 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D34 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x(STALLENABLE,423)
    -- Valid signal propagation
    SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V0 <= SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_stall or not (SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid <= SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V;

    -- bubble_join_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x(BITJOIN,247)
    bubble_join_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_q <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_0;

    -- SE_stall_entry(STALLENABLE,445)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d3x3_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,270)
    bubble_join_stall_entry_q <= in_unnamed_conv2d3x32 & in_tmp_111 & in_k_112 & in_j_01535 & in_c3_exe114 & in_c2_exe633 & in_c2_exe530 & in_c2_exe425 & in_c2_exe324 & in_c2_exe219 & in_c2_exe116 & in_c1_exe111 & in_c0_exe944 & in_c0_exe843 & in_c0_exe742 & in_c0_exe641 & in_c0_exe540 & in_c0_exe439 & in_c0_exe338 & in_c0_exe237 & in_c0_exe17 & in_c0_exe1652 & in_c0_exe1551 & in_c0_exe1450 & in_c0_exe1349 & in_c0_exe1248 & in_c0_exe115436 & in_c0_exe1146 & in_c0_exe1045;

    -- bubble_select_stall_entry(BITSELECT,271)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(33 downto 2));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(34 downto 34));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(35 downto 35));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(36 downto 36));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(37 downto 37));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(38 downto 38));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(102 downto 39));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(103 downto 103));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(104 downto 104));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(105 downto 105));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(106 downto 106));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(107 downto 107));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(108 downto 108));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(109 downto 109));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(110 downto 110));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(174 downto 111));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(206 downto 175));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(238 downto 207));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(239 downto 239));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(271 downto 240));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(272 downto 272));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(273 downto 273));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(305 downto 274));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(337 downto 306));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(369 downto 338));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(401 downto 370));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(433 downto 402));

    -- conv2d3x3_B2_merge_reg_aunroll_x(BLACKBOX,5)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_data_out_12@1
    -- out out_data_out_13@1
    -- out out_data_out_14@1
    -- out out_data_out_15@1
    -- out out_data_out_16@1
    -- out out_data_out_17@1
    -- out out_data_out_18@1
    -- out out_data_out_19@1
    -- out out_data_out_20@1
    -- out out_data_out_21@1
    -- out out_data_out_22@1
    -- out out_data_out_23@1
    -- out out_data_out_24@1
    -- out out_data_out_25@1
    -- out out_data_out_26@1
    -- out out_data_out_27@1
    -- out out_data_out_28@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d3x3_B2_merge_reg_aunroll_x : conv2d3x3_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_bb,
        in_data_in_1 => bubble_select_stall_entry_cc,
        in_data_in_2 => bubble_select_stall_entry_j,
        in_data_in_3 => bubble_select_stall_entry_s,
        in_data_in_4 => bubble_select_stall_entry_z,
        in_data_in_5 => bubble_select_stall_entry_t,
        in_data_in_6 => bubble_select_stall_entry_u,
        in_data_in_7 => bubble_select_stall_entry_v,
        in_data_in_8 => bubble_select_stall_entry_w,
        in_data_in_9 => bubble_select_stall_entry_x,
        in_data_in_10 => bubble_select_stall_entry_y,
        in_data_in_11 => bubble_select_stall_entry_dd,
        in_data_in_12 => bubble_select_stall_entry_aa,
        in_data_in_13 => bubble_select_stall_entry_d,
        in_data_in_14 => bubble_select_stall_entry_k,
        in_data_in_15 => bubble_select_stall_entry_l,
        in_data_in_16 => bubble_select_stall_entry_m,
        in_data_in_17 => bubble_select_stall_entry_n,
        in_data_in_18 => bubble_select_stall_entry_o,
        in_data_in_19 => bubble_select_stall_entry_p,
        in_data_in_20 => bubble_select_stall_entry_q,
        in_data_in_21 => bubble_select_stall_entry_r,
        in_data_in_22 => bubble_select_stall_entry_b,
        in_data_in_23 => bubble_select_stall_entry_c,
        in_data_in_24 => bubble_select_stall_entry_e,
        in_data_in_25 => bubble_select_stall_entry_f,
        in_data_in_26 => bubble_select_stall_entry_g,
        in_data_in_27 => bubble_select_stall_entry_h,
        in_data_in_28 => bubble_select_stall_entry_i,
        in_stall_in => SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17,
        out_data_out_18 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18,
        out_data_out_19 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19,
        out_data_out_20 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20,
        out_data_out_21 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21,
        out_data_out_22 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22,
        out_data_out_23 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23,
        out_data_out_24 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24,
        out_data_out_25 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25,
        out_data_out_26 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26,
        out_data_out_27 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27,
        out_data_out_28 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28,
        out_stall_out => conv2d3x3_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d3x3_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_conv2d3x3_B2_merge_reg_aunroll_x(BITJOIN,239)
    bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q <= conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d3x3_B2_merge_reg_aunroll_x(BITSELECT,240)
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(191 downto 128));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(223 downto 192));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(255 downto 224));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(287 downto 256));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(288 downto 288));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(320 downto 289));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(321 downto 321));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(322 downto 322));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(354 downto 323));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(386 downto 355));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(418 downto 387));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(419 downto 419));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(420 downto 420));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(421 downto 421));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(422 downto 422));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(423 downto 423));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(424 downto 424));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(425 downto 425));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(426 downto 426));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(427 downto 427));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(428 downto 428));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(429 downto 429));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(430 downto 430));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(431 downto 431));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(432 downto 432));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(433 downto 433));

    -- bubble_join_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo(BITJOIN,406)
    bubble_join_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_q <= redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_data_out;

    -- bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo(BITSELECT,407)
    bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_q(0 downto 0));

    -- SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2(STALLENABLE,572)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_V0 <= SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_backStall <= i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_stall_out or not (SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_wireValid <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_input_channels_sync_buffer131_conv2d3x3(BLACKBOX,74)@397
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_channels_sync_buffer131_conv2d3x3 : i_syncbuf_input_channels_sync_buffer131_conv2d3x372
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_backStall,
        in_valid_in => SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_V0,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_buffer_out,
        out_stall_out => i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_stall_out,
        out_valid_out => i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_channels_sync_buffer131_conv2d3x3(BITJOIN,266)
    bubble_join_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_q <= i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_buffer_out;

    -- bubble_select_i_syncbuf_input_channels_sync_buffer131_conv2d3x3(BITSELECT,267)
    bubble_select_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_q(31 downto 0));

    -- c_i32_1gr(CONSTANT,59)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- bubble_join_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo(BITJOIN,274)
    bubble_join_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_q <= redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_data_out;

    -- bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo(BITSELECT,275)
    bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_q(31 downto 0));

    -- bubble_join_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo(BITJOIN,298)
    bubble_join_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_q <= redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_data_out;

    -- bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo(BITSELECT,299)
    bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_q(31 downto 0));

    -- bubble_join_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo(BITJOIN,307)
    bubble_join_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_q <= redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_data_out;

    -- bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo(BITSELECT,308)
    bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_q(31 downto 0));

    -- bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo(BITJOIN,325)
    bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_q <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_data_out;

    -- bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo(BITSELECT,326)
    bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_q(31 downto 0));

    -- bubble_join_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo(BITJOIN,292)
    bubble_join_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_q <= redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_data_out;

    -- bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo(BITSELECT,293)
    bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_q(31 downto 0));

    -- SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo(STALLENABLE,501)
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg0 <= (others => '0');
            SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg0 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_toReg0;
            -- Succesor 1
            SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg1 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed0 <= (not (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall) and SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid) or SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg0;
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed1 <= (not (redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_out) and SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid) or SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg1;
    -- Consuming
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_StallValid <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_backStall and SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid;
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_toReg0 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_StallValid and SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed0;
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_toReg1 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_StallValid and SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_or0 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed0;
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireStall <= not (SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_consumed1 and SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_or0);
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_backStall <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_V0 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid and not (SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg0);
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_V1 <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid and not (SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_wireValid <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_out;

    -- SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo(STALLENABLE,489)
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg0 <= (others => '0');
            SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg0 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_toReg0;
            -- Succesor 1
            SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg1 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed0 <= (not (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall) and SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid) or SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg0;
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed1 <= (not (redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_out) and SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid) or SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg1;
    -- Consuming
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_StallValid <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_backStall and SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid;
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_toReg0 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_StallValid and SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed0;
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_toReg1 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_StallValid and SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_or0 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed0;
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireStall <= not (SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_consumed1 and SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_or0);
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_backStall <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_V0 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid and not (SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg0);
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_V1 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid and not (SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_wireValid <= redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_out;

    -- SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo(STALLENABLE,483)
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg0 <= (others => '0');
            SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg0 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_toReg0;
            -- Succesor 1
            SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg1 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed0 <= (not (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall) and SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid) or SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg0;
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed1 <= (not (redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_out) and SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid) or SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg1;
    -- Consuming
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_StallValid <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_backStall and SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid;
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_toReg0 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_StallValid and SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed0;
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_toReg1 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_StallValid and SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_or0 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed0;
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireStall <= not (SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_consumed1 and SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_or0);
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_backStall <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_V0 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid and not (SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg0);
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_V1 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid and not (SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_wireValid <= redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_out;

    -- SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo(STALLENABLE,479)
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg0 <= (others => '0');
            SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg0 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_toReg0;
            -- Succesor 1
            SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg1 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed0 <= (not (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall) and SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid) or SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg0;
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed1 <= (not (redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_out) and SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid) or SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg1;
    -- Consuming
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_StallValid <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_backStall and SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid;
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_toReg0 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_StallValid and SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed0;
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_toReg1 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_StallValid and SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_or0 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed0;
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireStall <= not (SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_consumed1 and SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_or0);
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_backStall <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_V0 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid and not (SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg0);
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_V1 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid and not (SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_wireValid <= redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_out;

    -- bubble_join_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo(BITJOIN,391)
    bubble_join_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_q <= redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_data_out;

    -- bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo(BITSELECT,392)
    bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x(BITJOIN,256)
    bubble_join_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_q <= i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_3 & i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_2 & i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_1;

    -- bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x(BITSELECT,257)
    bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_q(63 downto 0));
    bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_q(127 downto 64));
    bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_q(191 downto 128));

    -- SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo(STALLENABLE,545)
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg0 <= (others => '0');
            SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg0 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_toReg0;
            -- Succesor 1
            SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg1 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed0 <= (not (SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall) and SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid) or SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg0;
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed1 <= (not (redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_out) and SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid) or SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg1;
    -- Consuming
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_StallValid <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_backStall and SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid;
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_toReg0 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_StallValid and SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed0;
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_toReg1 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_StallValid and SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_or0 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed0;
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireStall <= not (SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_consumed1 and SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_or0);
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_backStall <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_V0 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid and not (SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg0);
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_V1 <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid and not (SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_wireValid <= redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_out;

    -- SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(STALLENABLE,428)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0 <= SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_valid;

    -- i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(BLACKBOX,48)@97
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@252
    -- out out_o_readdata_1@252
    -- out out_o_readdata_2@252
    -- out out_o_readdata_3@252
    -- out out_memcoalesce_input_im_load_0_avm_address@20000000
    -- out out_memcoalesce_input_im_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_input_im_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_input_im_load_0_avm_enable@20000000
    -- out out_memcoalesce_input_im_load_0_avm_read@20000000
    -- out out_memcoalesce_input_im_load_0_avm_write@20000000
    -- out out_memcoalesce_input_im_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@252
    thei_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x : i_load_memcoalesce_input_im_load_0_conv2d3x396
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_D0,
        in_i_predicate => SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_D1,
        in_i_stall => SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_3,
        out_memcoalesce_input_im_load_0_avm_address => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(STALLENABLE,427)
    -- Valid signal propagation
    SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0 <= SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_stall or not (SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid <= SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V;

    -- SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(STALLREG,811)
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid <= (others => '0');
            SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data0 <= (others => '-');
            SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid <= SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall and (SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid or SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_i_valid);

            IF (SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid = "0") THEN
                -- Data(s)
                SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data0 <= bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_b;
                SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data1 <= bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_and0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V2;
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_i_valid <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_V0 and SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_and0;
    -- Stall signal propagation
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall <= SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid or not (SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_i_valid);

    -- Valid
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V <= SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid = "1" ELSE SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_i_valid;

    -- Data0
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_D0 <= SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data0 WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_b;
    -- Data1
    SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_D1 <= SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_data1 WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_b;

    -- SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x(STALLENABLE,430)
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed0 <= (not (SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall) and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed1 <= (not (SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall) and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed2 <= (not (SR_SE_in_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall) and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg2;
    -- Consuming
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_or0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_or1 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_or0;
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_or1);
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V1 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V2 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid <= i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_o_valid;

    -- i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x(BLACKBOX,49)@83
    -- in in_i_stall@20000000
    -- out out_c0_exit167_0@97
    -- out out_c0_exit167_1@97
    -- out out_c0_exit167_2@97
    -- out out_c0_exit167_3@97
    -- out out_o_stall@20000000
    -- out out_o_valid@97
    thei_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x : i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3
    PORT MAP (
        in_c0_eni5_0 => GND_q,
        in_c0_eni5_1 => SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D0,
        in_c0_eni5_2 => SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D1,
        in_c0_eni5_3 => SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D2,
        in_c0_eni5_4 => SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D3,
        in_c0_eni5_5 => SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D4,
        in_i_stall => SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V0,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        out_c0_exit167_1 => i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_1,
        out_c0_exit167_2 => i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_2,
        out_c0_exit167_3 => i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_c0_exit167_3,
        out_o_stall => i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x(STALLENABLE,429)
    -- Valid signal propagation
    SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V0 <= SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall <= i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_out_o_stall or not (SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_wireValid <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V;

    -- SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x(STALLREG,810)
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid <= (others => '0');
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data0 <= (others => '-');
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data1 <= (others => '-');
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data2 <= (others => '-');
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data3 <= (others => '-');
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data4 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid <= SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall and (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid or SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_i_valid);

            IF (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "0") THEN
                -- Data(s)
                SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data0 <= bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_b;
                SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data1 <= bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_b;
                SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data2 <= bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_b;
                SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data3 <= bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_b;
                SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data4 <= bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and0 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_V0;
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and1 <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_V0 and SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and0;
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and2 <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_V0 and SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and1;
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and3 <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_V0 and SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and2;
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_i_valid <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_V0 and SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_and3;
    -- Stall signal propagation
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid or not (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_i_valid);

    -- Valid
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid WHEN SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "1" ELSE SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_i_valid;

    -- Data0
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D0 <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data0 WHEN SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_b;
    -- Data1
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D1 <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data1 WHEN SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_b;
    -- Data2
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D2 <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data2 WHEN SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_b;
    -- Data3
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D3 <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data3 WHEN SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_b;
    -- Data4
    SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_D4 <= SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_data4 WHEN SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_b;

    -- SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo(STALLENABLE,466)
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg0 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg1 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed0 <= (not (SR_SE_in_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_backStall) and SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid) or SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg0;
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed1 <= (not (redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_out) and SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid) or SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_StallValid <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_backStall and SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid;
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_toReg0 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_StallValid and SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed0;
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_toReg1 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_StallValid and SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_or0 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed0;
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireStall <= not (SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_consumed1 and SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_or0);
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_backStall <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_V0 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid and not (SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg0);
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_V1 <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid and not (SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_wireValid <= redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_out;

    -- redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo(STALLFIFO,185)
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_in <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_V1;
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_in <= SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_backStall;
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_data_in <= bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_b;
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_in_bitsignaltemp <= redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_in(0);
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_in_bitsignaltemp <= redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_in(0);
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_out(0) <= redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_out_bitsignaltemp;
    redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_out(0) <= redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_out_bitsignaltemp;
    theredist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 314,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_b,
        valid_out => redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_stall_out_bitsignaltemp,
        data_out => redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo(BITJOIN,277)
    bubble_join_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_q <= redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_data_out;

    -- bubble_select_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo(BITSELECT,278)
    bubble_select_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_q(31 downto 0));

    -- i_inc60_conv2d3x3(ADD,70)@396
    i_inc60_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_b);
    i_inc60_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc60_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc60_conv2d3x3_a) + UNSIGNED(i_inc60_conv2d3x3_b));
    i_inc60_conv2d3x3_q <= i_inc60_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_inc60_conv2d3x3_sel_x(BITSELECT,3)@396
    bgTrunc_i_inc60_conv2d3x3_sel_x_b <= i_inc60_conv2d3x3_q(31 downto 0);

    -- redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0(REG,235)
    redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backEN = "1") THEN
                redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_inc60_conv2d3x3_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg(STALLREG,806)
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid <= bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backStall and (SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid or SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_i_valid <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backStall <= SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_V <= SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_i_valid;


    -- SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3(STALLENABLE,441)
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg0 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg1 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed0 <= (not (SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backStall) and SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid) or SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg0;
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed1 <= (not (SR_SE_i_exitcond18_conv2d3x3_backStall) and SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid) or SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_StallValid <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_backStall and SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid;
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_toReg0 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_StallValid and SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed0;
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_toReg1 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_StallValid and SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_or0 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed0;
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireStall <= not (SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_consumed1 and SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_or0);
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_backStall <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_V0 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid and not (SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg0);
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_V1 <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid and not (SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_wireValid <= i_syncbuf_input_channels_sync_buffer131_conv2d3x3_out_valid_out;

    -- SR_SE_i_exitcond18_conv2d3x3(STALLREG,809)
    SR_SE_i_exitcond18_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond18_conv2d3x3_r_valid <= (others => '0');
            SR_SE_i_exitcond18_conv2d3x3_r_data0 <= (others => '-');
            SR_SE_i_exitcond18_conv2d3x3_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond18_conv2d3x3_r_valid <= SE_i_exitcond18_conv2d3x3_backStall and (SR_SE_i_exitcond18_conv2d3x3_r_valid or SR_SE_i_exitcond18_conv2d3x3_i_valid);

            IF (SR_SE_i_exitcond18_conv2d3x3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond18_conv2d3x3_r_data0 <= STD_LOGIC_VECTOR(redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_q);
                SR_SE_i_exitcond18_conv2d3x3_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond18_conv2d3x3_and0 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_V0;
    SR_SE_i_exitcond18_conv2d3x3_i_valid <= SE_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_V1 and SR_SE_i_exitcond18_conv2d3x3_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond18_conv2d3x3_backStall <= SR_SE_i_exitcond18_conv2d3x3_r_valid or not (SR_SE_i_exitcond18_conv2d3x3_i_valid);

    -- Valid
    SR_SE_i_exitcond18_conv2d3x3_V <= SR_SE_i_exitcond18_conv2d3x3_r_valid WHEN SR_SE_i_exitcond18_conv2d3x3_r_valid = "1" ELSE SR_SE_i_exitcond18_conv2d3x3_i_valid;

    -- Data0
    SR_SE_i_exitcond18_conv2d3x3_D0 <= SR_SE_i_exitcond18_conv2d3x3_r_data0 WHEN SR_SE_i_exitcond18_conv2d3x3_r_valid = "1" ELSE redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond18_conv2d3x3_D1 <= SR_SE_i_exitcond18_conv2d3x3_r_data1 WHEN SR_SE_i_exitcond18_conv2d3x3_r_valid = "1" ELSE bubble_select_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_b;

    -- SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo(STALLENABLE,468)
    -- Valid signal propagation
    SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_V0 <= SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_backStall <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backStall or not (SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_wireValid <= redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_valid_out;

    -- SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0(STALLENABLE,562)
    -- Valid signal propagation
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_V0 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0;
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_V1 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_0 <= SR_SE_i_exitcond18_conv2d3x3_backStall and SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0;
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_1 <= SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backStall and SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_or0 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_0;
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backEN <= not (SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_1 or SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_v_s_0 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backEN and SE_out_redist2_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_395_fifo_V0;
    -- Backward Stall generation
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backStall <= not (SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_v_s_0);
    SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backEN = "0") THEN
                SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0 and SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_0 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_backEN = "0") THEN
                SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1 and SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_R_v_1 <= SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0(STALLENABLE,563)
    -- Valid signal propagation
    SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_V0 <= SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall and SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backEN <= not (SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_v_s_0 <= SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backEN and SE_redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_V1;
    -- Backward Stall generation
    SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backStall <= not (SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_v_s_0);
    SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backEN = "0") THEN
                SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0 <= SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0 and SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_s_tv_0;
            ELSE
                SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_R_v_0 <= SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x(BLACKBOX,50)@252
    -- in in_i_stall@20000000
    -- out out_c1_exit175_0@398
    -- out out_c1_exit175_1@398
    -- out out_o_stall@20000000
    -- out out_o_valid@398
    thei_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x : i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3
    PORT MAP (
        in_c1_eni14_0 => GND_q,
        in_c1_eni14_1 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D0,
        in_c1_eni14_2 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D1,
        in_c1_eni14_3 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D2,
        in_c1_eni14_4 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D3,
        in_c1_eni14_5 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D4,
        in_c1_eni14_6 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D5,
        in_c1_eni14_7 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D6,
        in_c1_eni14_8 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D7,
        in_c1_eni14_9 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D8,
        in_c1_eni14_10 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D9,
        in_c1_eni14_11 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D10,
        in_c1_eni14_12 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D11,
        in_c1_eni14_13 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D12,
        in_c1_eni14_14 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D13,
        in_c1_eni14_15 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D14,
        in_c1_eni14_16 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D15,
        in_c1_eni14_17 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D16,
        in_c1_eni14_18 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D17,
        in_c1_eni14_19 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D18,
        in_c1_eni14_20 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D19,
        in_c1_eni14_21 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D20,
        in_c1_eni14_22 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D21,
        in_c1_eni14_23 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D22,
        in_c1_eni14_24 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D23,
        in_c1_eni14_25 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D24,
        in_c1_eni14_26 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D25,
        in_c1_eni14_27 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D26,
        in_c1_eni14_28 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D27,
        in_c1_eni14_29 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D28,
        in_c1_eni14_30 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D29,
        in_c1_eni14_31 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D30,
        in_c1_eni14_32 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D31,
        in_c1_eni14_33 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D32,
        in_c1_eni14_34 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D33,
        in_c1_eni14_35 => SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D34,
        in_i_stall => SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall,
        in_i_valid => SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V0,
        out_c1_exit175_1 => i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_c1_exit175_1,
        out_o_stall => i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_exitcond18_conv2d3x3(STALLENABLE,434)
    -- Valid signal propagation
    SE_i_exitcond18_conv2d3x3_V0 <= SE_i_exitcond18_conv2d3x3_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond18_conv2d3x3_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall and SE_i_exitcond18_conv2d3x3_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond18_conv2d3x3_backEN <= not (SE_i_exitcond18_conv2d3x3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond18_conv2d3x3_v_s_0 <= SE_i_exitcond18_conv2d3x3_backEN and SR_SE_i_exitcond18_conv2d3x3_V;
    -- Backward Stall generation
    SE_i_exitcond18_conv2d3x3_backStall <= not (SE_i_exitcond18_conv2d3x3_backEN);
    SE_i_exitcond18_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond18_conv2d3x3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond18_conv2d3x3_backEN = "0") THEN
                SE_i_exitcond18_conv2d3x3_R_v_0 <= SE_i_exitcond18_conv2d3x3_R_v_0 and SE_i_exitcond18_conv2d3x3_s_tv_0;
            ELSE
                SE_i_exitcond18_conv2d3x3_R_v_0 <= SE_i_exitcond18_conv2d3x3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0(REG,187)
    redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN = "1") THEN
                redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_0(REG,226)
    redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN = "1") THEN
                redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1(REG,227)
    redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backEN = "1") THEN
                redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_q <= STD_LOGIC_VECTOR(redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_multconst_x(CONSTANT,38)
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist49_bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b_1_0(REG,234)
    redist49_bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist49_bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN = "1") THEN
                redist49_bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom52_conv2d3x3_sel_x(BITSELECT,44)@2
    i_idxprom52_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist49_bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b_1_0_q(31 downto 0)), 64)));

    -- i_add_ptr_sum_conv2d3x3(ADD,65)@2
    i_add_ptr_sum_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & i_idxprom52_conv2d3x3_sel_x_b);
    i_add_ptr_sum_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_q);
    i_add_ptr_sum_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr_sum_conv2d3x3_a) + UNSIGNED(i_add_ptr_sum_conv2d3x3_b));
    i_add_ptr_sum_conv2d3x3_q <= i_add_ptr_sum_conv2d3x3_o(64 downto 0);

    -- bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x(BITSELECT,2)@2
    bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b <= i_add_ptr_sum_conv2d3x3_q(63 downto 0);

    -- redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0(REG,237)
    redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backEN = "1") THEN
                redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select(BITSELECT,129)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_b <= redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_c <= redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_d <= redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_e <= redist52_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0(BITSHIFT,126)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0_qint <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15(BITSHIFT,104)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0(BITSHIFT,127)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0_qint <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14(BITSHIFT,103)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_16(BITJOIN,105)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_16_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_15_q & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_14_q;

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0(BITSHIFT,128)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0_qint <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12(BITSHIFT,101)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0(BITSHIFT,125)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0_qint <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_13(BITJOIN,102)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_13_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_im0_shift0_q);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0(ADD,106)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_13_q);
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_join_16_q);
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_b));
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_mult_extender_x(BITJOIN,37)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_mult_extender_x_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_multconst_x_q & i_arrayidx53_conv2d3x3_conv2d3x3104_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x(BITSELECT,39)@3
    i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b <= i_arrayidx53_conv2d3x3_conv2d3x3104_mult_extender_x_q(63 downto 0);

    -- SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(STALLENABLE,422)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_V0 <= SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_valid;

    -- redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2(REG,228)
    redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0(REG,183)
    redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3(BITJOIN,263)
    bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_q <= i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3(BITSELECT,264)
    bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_q(63 downto 0));

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_add_x(ADD,40)@4
    i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_b);
    i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_b <= STD_LOGIC_VECTOR("0" & redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_q);
    i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_a) + UNSIGNED(i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_b));
    i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_q <= i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_o(64 downto 0);

    -- i_arrayidx53_conv2d3x3_conv2d3x3104_dupName_0_trunc_sel_x(BITSELECT,34)@4
    i_arrayidx53_conv2d3x3_conv2d3x3104_dupName_0_trunc_sel_x_b <= i_arrayidx53_conv2d3x3_conv2d3x3104_add_x_q(63 downto 0);

    -- i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(BLACKBOX,45)@4
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@252
    -- out out_o_readdata_1@252
    -- out out_o_readdata_2@252
    -- out out_o_readdata_3@252
    -- out out_o_readdata_4@252
    -- out out_o_readdata_5@252
    -- out out_o_readdata_6@252
    -- out out_o_readdata_7@252
    -- out out_o_readdata_8@252
    -- out out_o_readdata_9@252
    -- out out_o_readdata_10@252
    -- out out_o_readdata_11@252
    -- out out_o_readdata_12@252
    -- out out_memcoalesce_filter_weight_load_0_avm_address@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_enable@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_read@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_write@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@252
    thei_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x : i_load_memcoalesce_filter_weight_load_0_conv2d3x3105
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx53_conv2d3x3_conv2d3x3104_dupName_0_trunc_sel_x_b,
        in_i_predicate => redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_q,
        in_i_stall => SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_V0,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_3,
        out_o_readdata_4 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_4,
        out_o_readdata_5 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_5,
        out_o_readdata_6 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_6,
        out_o_readdata_7 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_7,
        out_o_readdata_8 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_8,
        out_o_readdata_9 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_9,
        out_o_readdata_10 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_10,
        out_o_readdata_11 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_11,
        out_o_readdata_12 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_12,
        out_memcoalesce_filter_weight_load_0_avm_address => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1(STALLENABLE,570)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_backStall <= i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_stall_out or not (SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out;

    -- i_syncbuf_filter_weight_sync_buffer_conv2d3x3(BLACKBOX,73)@4
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_weight_sync_buffer_conv2d3x3 : i_syncbuf_filter_weight_sync_buffer_conv2d3x370
    PORT MAP (
        in_buffer_in => in_filter_weight,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall,
        in_valid_in => SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_buffer_out,
        out_stall_out => i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_stall_out,
        out_valid_out => i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3(STALLENABLE,439)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_V0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and0 <= i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_valid_out;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and0;

    -- SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0(STALLENABLE,464)
    -- Valid signal propagation
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V0 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V1 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall and SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_1 <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_out and SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_or0 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN <= not (SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_1 or SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_v_s_0 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN and SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backStall <= not (SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN);
    SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0 and SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1 and SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0(STALLREG,808)
    SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
            SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backStall and (SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid or SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b);
                SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data1 <= STD_LOGIC_VECTOR(redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_i_valid <= SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backStall <= SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V <= SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_i_valid;

    -- Data0
    SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_D0 <= SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b;
    -- Data1
    SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_D1 <= SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_data1 WHEN SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_r_valid = "1" ELSE redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_q;

    -- SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1(STALLENABLE,549)
    -- Valid signal propagation
    SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_V0 <= SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0;
    -- Stall signal propagation
    SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_s_tv_0 <= SR_SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_backStall and SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0;
    -- Backward Enable generation
    SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backEN <= not (SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_v_s_0 <= SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backEN and SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V0;
    -- Backward Stall generation
    SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backStall <= not (SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_v_s_0);
    SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backEN = "0") THEN
                SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0 <= SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0 and SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_s_tv_0;
            ELSE
                SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_R_v_0 <= SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0(STALLENABLE,471)
    -- Valid signal propagation
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V0 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0;
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V1 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_0 <= SE_redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_1_backStall and SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0;
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_1 <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_out and SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_or0 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_0;
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN <= not (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_1 or SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_v_s_0 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN and SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V;
    -- Backward Stall generation
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backStall <= not (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN);
    SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0 <= (others => '0');
            SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN = "0") THEN
                SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0 and SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_0;
            ELSE
                SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_0 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_v_s_0;
            END IF;

            IF (SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backEN = "0") THEN
                SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1 and SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_s_tv_1;
            ELSE
                SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_R_v_1 <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo(STALLFIFO,188)
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_in <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V1;
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_data_in <= redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_q;
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_in_bitsignaltemp <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_in(0);
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_in_bitsignaltemp <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_in(0);
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_out(0) <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_out_bitsignaltemp;
    redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_out(0) <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_out_bitsignaltemp;
    theredist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 397,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_in_bitsignaltemp,
        data_in => redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_q,
        valid_out => redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_stall_out_bitsignaltemp,
        data_out => redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo(STALLFIFO,192)
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_in <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_V1;
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_data_in <= bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_b;
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_in_bitsignaltemp <= redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_in(0);
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_in_bitsignaltemp <= redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_in(0);
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_out(0) <= redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_out_bitsignaltemp;
    redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_out(0) <= redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_out_bitsignaltemp;
    theredist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 316,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_b,
        valid_out => redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_stall_out_bitsignaltemp,
        data_out => redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo(STALLFIFO,194)
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_in <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_V1;
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_data_in <= bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_b;
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_in_bitsignaltemp <= redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_in(0);
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_in_bitsignaltemp <= redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_in(0);
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_out(0) <= redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_out_bitsignaltemp;
    redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_out(0) <= redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_out_bitsignaltemp;
    theredist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 316,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_b,
        valid_out => redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_stall_out_bitsignaltemp,
        data_out => redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo(STALLFIFO,197)
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_in <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_V1;
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_data_in <= bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_b;
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_in_bitsignaltemp <= redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_in(0);
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_in_bitsignaltemp <= redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_in(0);
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_out(0) <= redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_out_bitsignaltemp;
    redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_out(0) <= redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_out_bitsignaltemp;
    theredist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 316,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_b,
        valid_out => redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_stall_out_bitsignaltemp,
        data_out => redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo(STALLFIFO,203)
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_in <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_V1;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_data_in <= bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_b;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_in_bitsignaltemp <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_in(0);
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_in_bitsignaltemp <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_in(0);
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_out(0) <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_out_bitsignaltemp;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_out(0) <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_out_bitsignaltemp;
    theredist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 316,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_b,
        valid_out => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_stall_out_bitsignaltemp,
        data_out => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo(STALLFIFO,205)
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_in <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_V1;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_data_in <= bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_b;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_in_bitsignaltemp <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_in(0);
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_in_bitsignaltemp <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_in(0);
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_out(0) <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_out_bitsignaltemp;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_out(0) <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_out_bitsignaltemp;
    theredist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_b,
        valid_out => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_out_bitsignaltemp,
        data_out => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo(STALLFIFO,207)
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_in <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_V1;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_data_in <= bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_b;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_in_bitsignaltemp <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_in(0);
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_in_bitsignaltemp <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_in(0);
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_out(0) <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_out_bitsignaltemp;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_out(0) <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_out_bitsignaltemp;
    theredist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_b,
        valid_out => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_out_bitsignaltemp,
        data_out => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo(STALLFIFO,209)
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_in <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_V1;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_data_in <= bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_b;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_in_bitsignaltemp <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_in(0);
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_in_bitsignaltemp <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_in(0);
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_out(0) <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_out_bitsignaltemp;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_out(0) <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_out_bitsignaltemp;
    theredist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_b,
        valid_out => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_out_bitsignaltemp,
        data_out => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo(STALLFIFO,211)
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_in <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_V1;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_data_in <= bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_b;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_in_bitsignaltemp <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_in(0);
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_in_bitsignaltemp <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_in(0);
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_out(0) <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_out_bitsignaltemp;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_out(0) <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_out_bitsignaltemp;
    theredist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_b,
        valid_out => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_out_bitsignaltemp,
        data_out => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo(STALLFIFO,213)
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_in <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_V1;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_data_in <= bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_b;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_in_bitsignaltemp <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_in(0);
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_in_bitsignaltemp <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_in(0);
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_out(0) <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_out_bitsignaltemp;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_out(0) <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_out_bitsignaltemp;
    theredist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_b,
        valid_out => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_out_bitsignaltemp,
        data_out => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo(STALLFIFO,215)
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_in <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_V1;
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_data_in <= bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_b;
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_in_bitsignaltemp <= redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_in(0);
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_in_bitsignaltemp <= redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_in(0);
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_out(0) <= redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_out_bitsignaltemp;
    redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_out(0) <= redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_out_bitsignaltemp;
    theredist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_b,
        valid_out => redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_out_bitsignaltemp,
        data_out => redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo(STALLFIFO,217)
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_in <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_V1;
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_data_in <= bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_b;
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_in_bitsignaltemp <= redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_in(0);
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_in_bitsignaltemp <= redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_in(0);
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_out(0) <= redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_out_bitsignaltemp;
    redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_out(0) <= redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_out_bitsignaltemp;
    theredist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_b,
        valid_out => redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_out_bitsignaltemp,
        data_out => redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo(STALLFIFO,219)
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_in <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_V1;
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_data_in <= bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_b;
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_in_bitsignaltemp <= redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_in(0);
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_in_bitsignaltemp <= redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_in(0);
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_out(0) <= redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_out_bitsignaltemp;
    redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_out(0) <= redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_out_bitsignaltemp;
    theredist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_b,
        valid_out => redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_out_bitsignaltemp,
        data_out => redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo(STALLFIFO,221)
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_in <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_V1;
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_data_in <= bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_b;
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_in_bitsignaltemp <= redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_in(0);
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_in_bitsignaltemp <= redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_in(0);
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_out(0) <= redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_out_bitsignaltemp;
    redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_out(0) <= redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_out_bitsignaltemp;
    theredist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 147,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_b,
        valid_out => redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_out_bitsignaltemp,
        data_out => redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo(STALLFIFO,225)
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_in <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_V1;
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_data_in <= bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_b;
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_in_bitsignaltemp <= redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_in(0);
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_in_bitsignaltemp <= redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_in(0);
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_out(0) <= redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_out_bitsignaltemp;
    redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_out(0) <= redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_out_bitsignaltemp;
    theredist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 302,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_b,
        valid_out => redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_stall_out_bitsignaltemp,
        data_out => redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo(STALLFIFO,229)
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_in <= SE_redist0_i_arrayidx53_conv2d3x3_conv2d3x3104_trunc_sel_x_b_1_0_V1;
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_data_in <= redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_q;
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_in_bitsignaltemp <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_in(0);
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_in_bitsignaltemp <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_in(0);
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_out(0) <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_out_bitsignaltemp;
    redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_out(0) <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_out_bitsignaltemp;
    theredist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 395,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_in_bitsignaltemp,
        data_in => redist43_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_3_2_q,
        valid_out => redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_stall_out_bitsignaltemp,
        data_out => redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo(BITJOIN,400)
    bubble_join_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_q <= redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_data_out;

    -- bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo(BITSELECT,401)
    bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_q(0 downto 0));

    -- SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo(STALLENABLE,554)
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg0 <= (others => '0');
            SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg0 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_toReg0;
            -- Succesor 1
            SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg1 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed0 <= (not (SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall) and SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid) or SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg0;
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed1 <= (not (redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_out) and SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid) or SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg1;
    -- Consuming
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_StallValid <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_backStall and SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid;
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_toReg0 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_StallValid and SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed0;
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_toReg1 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_StallValid and SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_or0 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed0;
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireStall <= not (SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_consumed1 and SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_or0);
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_backStall <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_V0 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid and not (SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg0);
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_V1 <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid and not (SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_wireValid <= redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_out;

    -- redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo(STALLFIFO,231)
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_in <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_V1;
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_data_in <= bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_b;
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_in_bitsignaltemp <= redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_in(0);
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_in_bitsignaltemp <= redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_in(0);
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_out(0) <= redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_out_bitsignaltemp;
    redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_out(0) <= redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_out_bitsignaltemp;
    theredist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 302,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_b,
        valid_out => redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_stall_out_bitsignaltemp,
        data_out => redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg(STALLENABLE,805)
    -- Valid signal propagation
    bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_V0 <= bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall and bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backEN <= not (bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_v_s_0 <= bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backEN and SR_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backStall <= not (bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backEN);
    bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0 and bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1(STALLENABLE,608)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_V0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and0 <= bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_reg_V0;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and1 <= redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and0;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and2 <= redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and1;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and3 <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and2;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and4 <= redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and3;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and5 <= redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and4;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and6 <= redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and5;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and7 <= redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and6;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and8 <= redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and7;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and9 <= redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and8;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and10 <= redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and9;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and11 <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and10;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and12 <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and11;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and13 <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and12;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and14 <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and13;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and15 <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and14;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and16 <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and15;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and17 <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and16;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and18 <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and17;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and19 <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and18;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and20 <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and19;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and21 <= redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and20;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and22 <= redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and21;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and23 <= redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and22;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and24 <= redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and23;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and25 <= redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and24;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and26 <= redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and25;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and27 <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and26;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and28 <= SE_i_exitcond18_conv2d3x3_V0 and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and27;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and29 <= i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_o_valid and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and28;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_wireValid <= SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_V0 and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_and29;

    -- redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo(STALLFIFO,233)
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_in <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_V1;
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_data_in <= bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_b;
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_in_bitsignaltemp <= redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_in(0);
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_in_bitsignaltemp <= redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_in(0);
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_out(0) <= redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_out_bitsignaltemp;
    redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_out(0) <= redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_out_bitsignaltemp;
    theredist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 302,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_b,
        valid_out => redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_out_bitsignaltemp,
        data_out => redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x(STALLENABLE,426)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V0 <= SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_valid;

    -- i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x(BLACKBOX,47)@97
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@252
    -- out out_o_readdata_1@252
    -- out out_o_readdata_2@252
    -- out out_o_readdata_3@252
    -- out out_memcoalesce_input_im_load_0115_avm_address@20000000
    -- out out_memcoalesce_input_im_load_0115_avm_burstcount@20000000
    -- out out_memcoalesce_input_im_load_0115_avm_byteenable@20000000
    -- out out_memcoalesce_input_im_load_0115_avm_enable@20000000
    -- out out_memcoalesce_input_im_load_0115_avm_read@20000000
    -- out out_memcoalesce_input_im_load_0115_avm_write@20000000
    -- out out_memcoalesce_input_im_load_0115_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@252
    thei_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x : i_load_memcoalesce_input_im_load_0115_conv2d3x3100
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_D0,
        in_i_predicate => SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_D1,
        in_i_stall => SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V0,
        in_memcoalesce_input_im_load_0115_avm_readdata => in_memcoalesce_input_im_load_0115_avm_readdata,
        in_memcoalesce_input_im_load_0115_avm_readdatavalid => in_memcoalesce_input_im_load_0115_avm_readdatavalid,
        in_memcoalesce_input_im_load_0115_avm_waitrequest => in_memcoalesce_input_im_load_0115_avm_waitrequest,
        in_memcoalesce_input_im_load_0115_avm_writeack => in_memcoalesce_input_im_load_0115_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_3,
        out_memcoalesce_input_im_load_0115_avm_address => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_address,
        out_memcoalesce_input_im_load_0115_avm_burstcount => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_burstcount,
        out_memcoalesce_input_im_load_0115_avm_byteenable => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_byteenable,
        out_memcoalesce_input_im_load_0115_avm_enable => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_enable,
        out_memcoalesce_input_im_load_0115_avm_read => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_read,
        out_memcoalesce_input_im_load_0115_avm_write => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_write,
        out_memcoalesce_input_im_load_0115_avm_writedata => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_writedata,
        out_o_stall => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x(STALLENABLE,425)
    -- Valid signal propagation
    SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V0 <= SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_stall or not (SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_wireValid <= SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V;

    -- SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x(STALLREG,812)
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid <= (others => '0');
            SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data0 <= (others => '-');
            SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid <= SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall and (SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid or SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_i_valid);

            IF (SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid = "0") THEN
                -- Data(s)
                SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data0 <= bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_d;
                SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data1 <= bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_and0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V1;
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_i_valid <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_V0 and SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_and0;
    -- Stall signal propagation
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall <= SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid or not (SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_i_valid);

    -- Valid
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V <= SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid = "1" ELSE SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_i_valid;

    -- Data0
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_D0 <= SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data0 WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_d;
    -- Data1
    SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_D1 <= SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_data1 WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_b;

    -- SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo(STALLENABLE,558)
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg0 <= (others => '0');
            SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg0 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_toReg0;
            -- Succesor 1
            SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg1 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed0 <= (not (SR_SE_in_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_backStall) and SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid) or SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg0;
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed1 <= (not (redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_stall_out) and SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid) or SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg1;
    -- Consuming
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_StallValid <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_backStall and SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid;
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_toReg0 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_StallValid and SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed0;
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_toReg1 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_StallValid and SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_or0 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed0;
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireStall <= not (SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_consumed1 and SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_or0);
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_backStall <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_V0 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid and not (SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg0);
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_V1 <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid and not (SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_wireValid <= redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_out;

    -- redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo(STALLFIFO,232)
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V29;
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_in <= SE_out_redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_backStall;
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_dd;
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_in_bitsignaltemp <= redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_in(0);
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_in_bitsignaltemp <= redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_in(0);
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_out(0) <= redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_out_bitsignaltemp;
    redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_out(0) <= redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_out_bitsignaltemp;
    theredist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 97,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_in_bitsignaltemp,
        stall_in => redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_dd,
        valid_out => redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_valid_out_bitsignaltemp,
        stall_out => redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_out_bitsignaltemp,
        data_out => redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo(STALLFIFO,230)
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V28;
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_in <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_backStall;
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_cc;
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_in_bitsignaltemp <= redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_in(0);
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_in_bitsignaltemp <= redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_in(0);
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_out(0) <= redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_out_bitsignaltemp;
    redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_out(0) <= redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_out_bitsignaltemp;
    theredist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 97,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_in_bitsignaltemp,
        stall_in => redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_cc,
        valid_out => redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_valid_out_bitsignaltemp,
        stall_out => redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_out_bitsignaltemp,
        data_out => redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo(STALLFIFO,224)
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V27;
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_in <= SE_out_redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_backStall;
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_aa;
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_in_bitsignaltemp <= redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_in(0);
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_in_bitsignaltemp <= redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_in(0);
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_out(0) <= redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_out_bitsignaltemp;
    redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_out(0) <= redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_out_bitsignaltemp;
    theredist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 97,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_in_bitsignaltemp,
        stall_in => redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_aa,
        valid_out => redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_valid_out_bitsignaltemp,
        stall_out => redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_out_bitsignaltemp,
        data_out => redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo(STALLFIFO,223)
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V26;
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_z;
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_in_bitsignaltemp <= redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_in(0);
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_in_bitsignaltemp <= redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_in(0);
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_out(0) <= redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_out_bitsignaltemp;
    redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_out(0) <= redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_out_bitsignaltemp;
    theredist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_z,
        valid_out => redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_out_bitsignaltemp,
        data_out => redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo(STALLFIFO,222)
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V25;
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_y;
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_in_bitsignaltemp <= redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_in(0);
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_in_bitsignaltemp <= redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_in(0);
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_out(0) <= redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_out_bitsignaltemp;
    redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_out(0) <= redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_out_bitsignaltemp;
    theredist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_y,
        valid_out => redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_out_bitsignaltemp,
        data_out => redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo(STALLFIFO,220)
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V24;
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_in <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_backStall;
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_x;
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_in_bitsignaltemp <= redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_in(0);
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_in_bitsignaltemp <= redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_in(0);
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_out(0) <= redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_out_bitsignaltemp;
    redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_out(0) <= redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_out_bitsignaltemp;
    theredist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_x,
        valid_out => redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_out_bitsignaltemp,
        data_out => redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo(STALLFIFO,218)
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V23;
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_in <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_backStall;
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_w;
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_in_bitsignaltemp <= redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_in(0);
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_in_bitsignaltemp <= redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_in(0);
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_out(0) <= redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_out_bitsignaltemp;
    redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_out(0) <= redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_out_bitsignaltemp;
    theredist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_w,
        valid_out => redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_out_bitsignaltemp,
        data_out => redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo(STALLFIFO,216)
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V22;
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_in <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_backStall;
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_v;
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_in_bitsignaltemp <= redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_in(0);
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_in_bitsignaltemp <= redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_in(0);
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_out(0) <= redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_out_bitsignaltemp;
    redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_out(0) <= redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_out_bitsignaltemp;
    theredist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_v,
        valid_out => redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_out_bitsignaltemp,
        data_out => redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo(STALLFIFO,214)
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V21;
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_in <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_backStall;
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_u;
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_in_bitsignaltemp <= redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_in(0);
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_in_bitsignaltemp <= redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_in(0);
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_out(0) <= redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_out_bitsignaltemp;
    redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_out(0) <= redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_out_bitsignaltemp;
    theredist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_u,
        valid_out => redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_out_bitsignaltemp,
        data_out => redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo(STALLFIFO,212)
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V20;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_in <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_backStall;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_t;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_in_bitsignaltemp <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_in(0);
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_in_bitsignaltemp <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_in(0);
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_out(0) <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_out_bitsignaltemp;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_out(0) <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_out_bitsignaltemp;
    theredist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_t,
        valid_out => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_out_bitsignaltemp,
        data_out => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo(STALLFIFO,210)
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V19;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_in <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_backStall;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_in_bitsignaltemp <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_in(0);
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_in_bitsignaltemp <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_in(0);
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_out(0) <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_out_bitsignaltemp;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_out(0) <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_out_bitsignaltemp;
    theredist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s,
        valid_out => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_out_bitsignaltemp,
        data_out => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo(STALLFIFO,208)
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V18;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_in <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_backStall;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_in_bitsignaltemp <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_in(0);
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_in_bitsignaltemp <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_in(0);
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_out(0) <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_out_bitsignaltemp;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_out(0) <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_out_bitsignaltemp;
    theredist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r,
        valid_out => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_out_bitsignaltemp,
        data_out => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo(STALLFIFO,206)
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V17;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_in <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_backStall;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_in_bitsignaltemp <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_in(0);
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_in_bitsignaltemp <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_in(0);
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_out(0) <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_out_bitsignaltemp;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_out(0) <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_out_bitsignaltemp;
    theredist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q,
        valid_out => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_out_bitsignaltemp,
        data_out => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo(STALLFIFO,202)
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V15;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_in <= SE_out_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_backStall;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_in_bitsignaltemp <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_in(0);
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_in_bitsignaltemp <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_in(0);
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_out(0) <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_out_bitsignaltemp;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_out(0) <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_out_bitsignaltemp;
    theredist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 83,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o,
        valid_out => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_out_bitsignaltemp,
        data_out => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo(STALLFIFO,201)
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V14;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_in_bitsignaltemp <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_in(0);
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_in_bitsignaltemp <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_in(0);
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_out(0) <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_out_bitsignaltemp;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_out(0) <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_out_bitsignaltemp;
    theredist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n,
        valid_out => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_out_bitsignaltemp,
        data_out => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo(STALLFIFO,200)
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V13;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_in_bitsignaltemp <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_in(0);
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_in_bitsignaltemp <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_in(0);
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_out(0) <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_out_bitsignaltemp;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_out(0) <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_out_bitsignaltemp;
    theredist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m,
        valid_out => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_out_bitsignaltemp,
        data_out => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo(STALLFIFO,199)
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V12;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_in_bitsignaltemp <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_in(0);
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_in_bitsignaltemp <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_in(0);
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_out(0) <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_out_bitsignaltemp;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_out(0) <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_out_bitsignaltemp;
    theredist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l,
        valid_out => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_out_bitsignaltemp,
        data_out => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo(STALLFIFO,198)
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V11;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_in_bitsignaltemp <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_in(0);
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_in_bitsignaltemp <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_in(0);
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_out(0) <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_out_bitsignaltemp;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_out(0) <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_out_bitsignaltemp;
    theredist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k,
        valid_out => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_out_bitsignaltemp,
        data_out => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo(STALLFIFO,196)
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V10;
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_in <= SE_out_redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_backStall;
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j;
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_in_bitsignaltemp <= redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_in(0);
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_in_bitsignaltemp <= redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_in(0);
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_out(0) <= redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_out_bitsignaltemp;
    redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_out(0) <= redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_out_bitsignaltemp;
    theredist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 83,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j,
        valid_out => redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_out_bitsignaltemp,
        data_out => redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo(STALLFIFO,195)
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V9;
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i;
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_in_bitsignaltemp <= redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_in(0);
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_in_bitsignaltemp <= redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_in(0);
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_out(0) <= redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_out_bitsignaltemp;
    redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_out(0) <= redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_out_bitsignaltemp;
    theredist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i,
        valid_out => redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_out_bitsignaltemp,
        data_out => redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo(STALLFIFO,193)
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V8;
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_in <= SE_out_redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_backStall;
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h;
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_in_bitsignaltemp <= redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_in(0);
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_in_bitsignaltemp <= redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_in(0);
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_out(0) <= redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_out_bitsignaltemp;
    redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_out(0) <= redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_out_bitsignaltemp;
    theredist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 83,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h,
        valid_out => redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_out_bitsignaltemp,
        data_out => redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo(STALLFIFO,191)
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V7;
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_in <= SE_out_redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_backStall;
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g;
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_in_bitsignaltemp <= redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_in(0);
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_in_bitsignaltemp <= redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_in(0);
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_out(0) <= redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_out_bitsignaltemp;
    redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_out(0) <= redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_out_bitsignaltemp;
    theredist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 83,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g,
        valid_out => redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_out_bitsignaltemp,
        data_out => redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo(STALLFIFO,190)
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V6;
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f;
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_in_bitsignaltemp <= redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_in(0);
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_in_bitsignaltemp <= redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_in(0);
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_out(0) <= redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_out_bitsignaltemp;
    redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_out(0) <= redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_out_bitsignaltemp;
    theredist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f,
        valid_out => redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_out_bitsignaltemp,
        data_out => redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo(STALLFIFO,189)
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V5;
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_backStall;
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e;
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_in_bitsignaltemp <= redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_in(0);
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_in_bitsignaltemp <= redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_in(0);
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_out(0) <= redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_out_bitsignaltemp;
    redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_out(0) <= redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_out_bitsignaltemp;
    theredist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 398,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e,
        valid_out => redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_out_bitsignaltemp,
        data_out => redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo(STALLFIFO,184)
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V3;
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_in <= SE_out_redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_backStall;
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b;
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_in_bitsignaltemp <= redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_in(0);
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_in_bitsignaltemp <= redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_in(0);
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_out(0) <= redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_out_bitsignaltemp;
    redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_out(0) <= redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_out_bitsignaltemp;
    theredist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 83,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b,
        valid_out => redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_out_bitsignaltemp,
        data_out => redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x(BITSELECT,116)@1
    leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x_in <= leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x_b <= leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x_in(30 downto 0);

    -- leftShiftStage1Idx1_uid118_i_unnamed_conv2d3x395_shift_x(BITJOIN,117)@1
    leftShiftStage1Idx1_uid118_i_unnamed_conv2d3x395_shift_x_q <= leftShiftStage1Idx1Rng1_uid117_i_unnamed_conv2d3x395_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x(BITSELECT,111)@1
    leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b(29 downto 0);
    leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x_b <= leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1Pad2_uid111_i_unnamed_conv2d3x395_shift_x(CONSTANT,110)
    leftShiftStage0Idx1Pad2_uid111_i_unnamed_conv2d3x395_shift_x_q <= "00";

    -- leftShiftStage0Idx1_uid113_i_unnamed_conv2d3x395_shift_x(BITJOIN,112)@1
    leftShiftStage0Idx1_uid113_i_unnamed_conv2d3x395_shift_x_q <= leftShiftStage0Idx1Rng2_uid112_i_unnamed_conv2d3x395_shift_x_b & leftShiftStage0Idx1Pad2_uid111_i_unnamed_conv2d3x395_shift_x_q;

    -- leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x(MUX,114)@1
    leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_s <= VCC_q;
    leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_combproc: PROCESS (leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_s, bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b, leftShiftStage0Idx1_uid113_i_unnamed_conv2d3x395_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b;
            WHEN "1" => leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q <= leftShiftStage0Idx1_uid113_i_unnamed_conv2d3x395_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x(MUX,119)@1
    leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_s <= VCC_q;
    leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_combproc: PROCESS (leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_s, leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q, leftShiftStage1Idx1_uid118_i_unnamed_conv2d3x395_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_q <= leftShiftStage0_uid115_i_unnamed_conv2d3x395_shift_x_q;
            WHEN "1" => leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_q <= leftShiftStage1Idx1_uid118_i_unnamed_conv2d3x395_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_conv2d3x394_vt_select_31(BITSELECT,78)@1
    i_unnamed_conv2d3x394_vt_select_31_b <= leftShiftStage1_uid120_i_unnamed_conv2d3x395_shift_x_q(31 downto 3);

    -- i_unnamed_conv2d3x394_vt_const_2(CONSTANT,76)
    i_unnamed_conv2d3x394_vt_const_2_q <= "000";

    -- i_unnamed_conv2d3x394_vt_join(BITJOIN,77)@1
    i_unnamed_conv2d3x394_vt_join_q <= i_unnamed_conv2d3x394_vt_select_31_b & i_unnamed_conv2d3x394_vt_const_2_q;

    -- i_mul48_add124_conv2d3x3(ADD,72)@1
    i_mul48_add124_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b);
    i_mul48_add124_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & i_unnamed_conv2d3x394_vt_join_q);
    i_mul48_add124_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul48_add124_conv2d3x3_a) + UNSIGNED(i_mul48_add124_conv2d3x3_b));
    i_mul48_add124_conv2d3x3_q <= i_mul48_add124_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul48_add124_conv2d3x3_sel_x(BITSELECT,4)@1
    bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b <= i_mul48_add124_conv2d3x3_q(31 downto 0);

    -- SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0(STALLREG,807)
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid <= (others => '0');
            SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data0 <= (others => '-');
            SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data1 <= (others => '-');
            SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid <= SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backStall and (SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid or SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_i_valid);

            IF (SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d);
                SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data1 <= STD_LOGIC_VECTOR(bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_bb);
                SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data2 <= STD_LOGIC_VECTOR(bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_i_valid <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V2;
    -- Stall signal propagation
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backStall <= SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid or not (SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_i_valid);

    -- Valid
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_V <= SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid WHEN SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid = "1" ELSE SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_i_valid;

    -- Data0
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D0 <= SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data0 WHEN SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid = "1" ELSE bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d;
    -- Data1
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D1 <= SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data1 WHEN SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid = "1" ELSE bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_bb;
    -- Data2
    SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_D2 <= SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_data2 WHEN SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_r_valid = "1" ELSE bgTrunc_i_mul48_add124_conv2d3x3_sel_x_b;

    -- bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg(STALLFIFO,800)
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V1;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_in <= SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_backStall;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_in(0);
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_in(0);
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_out(0) <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_out(0) <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 397,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg(STALLFIFO,799)
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V0;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_backStall;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 4,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d3x3_B2_merge_reg_aunroll_x(STALLENABLE,415)
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg18 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg19 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg20 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg21 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg22 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg23 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg24 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg25 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg26 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg27 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg28 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg29 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg13;
            -- Succesor 14
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg14;
            -- Succesor 15
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg15;
            -- Succesor 16
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg16;
            -- Succesor 17
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg17;
            -- Succesor 18
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg18 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg18;
            -- Succesor 19
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg19 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg19;
            -- Succesor 20
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg20 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg20;
            -- Succesor 21
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg21 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg21;
            -- Succesor 22
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg22 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg22;
            -- Succesor 23
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg23 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg23;
            -- Succesor 24
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg24 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg24;
            -- Succesor 25
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg25 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg25;
            -- Succesor 26
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg26 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg26;
            -- Succesor 27
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg27 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg27;
            -- Succesor 28
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg28 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg28;
            -- Succesor 29
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg29 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg29;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_2_reg_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2 <= (not (SR_SE_redist4_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_1_0_backStall) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3 <= (not (redist1_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0_82_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4 <= (not (redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5 <= (not (redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6 <= (not (redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7 <= (not (redist8_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_82_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8 <= (not (redist10_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_82_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9 <= (not (redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10 <= (not (redist13_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_82_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11 <= (not (redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12 <= (not (redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13 <= (not (redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14 <= (not (redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15 <= (not (redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_82_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16 <= (not (redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17 <= (not (redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed18 <= (not (redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg18;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed19 <= (not (redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg19;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed20 <= (not (redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg20;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed21 <= (not (redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg21;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed22 <= (not (redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg22;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed23 <= (not (redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg23;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed24 <= (not (redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg24;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed25 <= (not (redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg25;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed26 <= (not (redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg26;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed27 <= (not (redist41_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_96_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg27;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed28 <= (not (redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg28;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed29 <= (not (redist47_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_96_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg29;
    -- Consuming
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg18 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed18;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg19 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed19;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg20 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed20;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg21 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed21;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg22 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed22;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg23 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed23;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg24 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed24;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg25 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed25;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg26 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed26;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg27 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed27;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg28 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed28;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg29 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed29;
    -- Backward Stall generation
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or1;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or2;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or3;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or4;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or5;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or6;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or7;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or8;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or9;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or10;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or11;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or12;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or13;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or14;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or15;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or16;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or18 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed18 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or17;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or19 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed19 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or18;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or20 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed20 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or19;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or21 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed21 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or20;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or22 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed22 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or21;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or23 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed23 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or22;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or24 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed24 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or23;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or25 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed25 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or24;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or26 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed26 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or25;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or27 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed27 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or26;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or28 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed28 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or27;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed29 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or28);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V18 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg18);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V19 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg19);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V20 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg20);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V21 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg21);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V22 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg22);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V23 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg23);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V24 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg24);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V25 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg25);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V26 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg26);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V27 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg27);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V28 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg28);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V29 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg29);
    -- Computing multiple Valid(s)
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid <= conv2d3x3_B2_merge_reg_aunroll_x_out_valid_out;

    -- redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo(STALLFIFO,204)
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V16;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_in <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_backStall;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_in_bitsignaltemp <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_in(0);
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_in_bitsignaltemp <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_in(0);
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_out(0) <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_out_bitsignaltemp;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_out(0) <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_out_bitsignaltemp;
    theredist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p,
        valid_out => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_stall_out_bitsignaltemp,
        data_out => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo(BITJOIN,331)
    bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_q <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_data_out;

    -- bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo(BITSELECT,332)
    bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_q(0 downto 0));

    -- bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo(BITJOIN,337)
    bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_q <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_data_out;

    -- bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo(BITSELECT,338)
    bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_q(0 downto 0));

    -- bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo(BITJOIN,343)
    bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_q <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_data_out;

    -- bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo(BITSELECT,344)
    bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_q(0 downto 0));

    -- bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x(BITSELECT,251)
    bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_out(127 downto 96));

    -- bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo(BITJOIN,349)
    bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_q <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_data_out;

    -- bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo(BITSELECT,350)
    bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_q(0 downto 0));

    -- bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo(BITJOIN,355)
    bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_q <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_data_out;

    -- bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo(BITSELECT,356)
    bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_q(0 downto 0));

    -- bubble_join_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo(BITJOIN,361)
    bubble_join_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_q <= redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_data_out;

    -- bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo(BITSELECT,362)
    bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_q(0 downto 0));

    -- bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x(BITSELECT,248)
    bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_out(127 downto 96));

    -- bubble_join_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo(BITJOIN,367)
    bubble_join_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_q <= redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_data_out;

    -- bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo(BITSELECT,368)
    bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_q(0 downto 0));

    -- bubble_join_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo(BITJOIN,373)
    bubble_join_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_q <= redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_data_out;

    -- bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo(BITSELECT,374)
    bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_q(0 downto 0));

    -- bubble_join_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo(BITJOIN,280)
    bubble_join_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_q <= redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_data_out;

    -- bubble_select_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo(BITSELECT,281)
    bubble_select_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_q(31 downto 0));

    -- bubble_join_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo(BITJOIN,379)
    bubble_join_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_q <= redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_data_out;

    -- bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo(BITSELECT,380)
    bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_q(0 downto 0));

    -- bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(BITSELECT,245)
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(127 downto 96));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(159 downto 128));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(191 downto 160));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(223 downto 192));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(255 downto 224));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(287 downto 256));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(319 downto 288));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(383 downto 320));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(447 downto 384));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(511 downto 448));

    -- bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(BITSELECT,254)
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(127 downto 96));

    -- SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo(STALLENABLE,537)
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg0 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg1 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid) or SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg0;
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed1 <= (not (redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_stall_out) and SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid) or SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_StallValid <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_backStall and SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid;
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_toReg0 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_StallValid and SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed0;
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_toReg1 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_StallValid and SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_or0 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed0;
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireStall <= not (SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_consumed1 and SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_or0);
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_backStall <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_V0 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid and not (SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg0);
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_V1 <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid and not (SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_wireValid <= redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_valid_out;

    -- SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo(STALLENABLE,533)
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg0 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg1 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid) or SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg0;
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed1 <= (not (redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_stall_out) and SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid) or SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_StallValid <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_backStall and SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid;
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_toReg0 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_StallValid and SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed0;
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_toReg1 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_StallValid and SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_or0 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed0;
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireStall <= not (SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_consumed1 and SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_or0);
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_backStall <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_V0 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid and not (SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg0);
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_V1 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid and not (SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_wireValid <= redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_valid_out;

    -- SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo(STALLENABLE,529)
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg0 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg1 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid) or SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg0;
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed1 <= (not (redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_stall_out) and SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid) or SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_StallValid <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_backStall and SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid;
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_toReg0 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_StallValid and SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed0;
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_toReg1 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_StallValid and SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_or0 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed0;
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireStall <= not (SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_consumed1 and SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_or0);
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_backStall <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_V0 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid and not (SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg0);
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_V1 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid and not (SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_wireValid <= redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_valid_out;

    -- SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo(STALLENABLE,525)
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg0 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg1 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid) or SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg0;
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed1 <= (not (redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_stall_out) and SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid) or SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_StallValid <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_backStall and SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid;
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_toReg0 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_StallValid and SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed0;
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_toReg1 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_StallValid and SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_or0 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed0;
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireStall <= not (SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_consumed1 and SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_or0);
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_backStall <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_V0 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid and not (SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg0);
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_V1 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid and not (SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_wireValid <= redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_valid_out;

    -- SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo(STALLENABLE,521)
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg0 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg1 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid) or SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg0;
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed1 <= (not (redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_stall_out) and SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid) or SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_StallValid <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_backStall and SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid;
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_toReg0 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_StallValid and SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed0;
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_toReg1 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_StallValid and SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_or0 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed0;
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireStall <= not (SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_consumed1 and SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_or0);
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_backStall <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_V0 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid and not (SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg0);
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_V1 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid and not (SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_wireValid <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_valid_out;

    -- SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo(STALLENABLE,517)
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg0 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg1 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid) or SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg0;
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed1 <= (not (redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_stall_out) and SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid) or SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_StallValid <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_backStall and SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid;
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_toReg0 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_StallValid and SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed0;
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_toReg1 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_StallValid and SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_or0 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed0;
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireStall <= not (SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_consumed1 and SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_or0);
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_backStall <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_V0 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid and not (SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg0);
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_V1 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid and not (SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_wireValid <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_valid_out;

    -- SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo(STALLENABLE,513)
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg0 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg1 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid) or SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg0;
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed1 <= (not (redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_stall_out) and SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid) or SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_StallValid <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_backStall and SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid;
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_toReg0 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_StallValid and SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed0;
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_toReg1 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_StallValid and SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_or0 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed0;
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireStall <= not (SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_consumed1 and SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_or0);
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_backStall <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_V0 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid and not (SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg0);
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_V1 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid and not (SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_wireValid <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_valid_out;

    -- SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo(STALLENABLE,509)
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg0 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg1 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid) or SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg0;
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed1 <= (not (redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_stall_out) and SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid) or SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_StallValid <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_backStall and SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid;
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_toReg0 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_StallValid and SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed0;
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_toReg1 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_StallValid and SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_or0 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed0;
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireStall <= not (SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_consumed1 and SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_or0);
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_backStall <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_V0 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid and not (SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg0);
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_V1 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid and not (SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_wireValid <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_valid_out;

    -- SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo(STALLENABLE,505)
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg0 <= (others => '0');
            SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg0 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_toReg0;
            -- Succesor 1
            SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg1 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed0 <= (not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid) or SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg0;
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed1 <= (not (redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_stall_out) and SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid) or SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg1;
    -- Consuming
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_StallValid <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_backStall and SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid;
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_toReg0 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_StallValid and SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed0;
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_toReg1 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_StallValid and SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_or0 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed0;
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireStall <= not (SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_consumed1 and SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_or0);
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_backStall <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_V0 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid and not (SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg0);
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_V1 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid and not (SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_wireValid <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_valid_out;

    -- redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo(STALLFIFO,186)
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V4;
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_in <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c;
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_in_bitsignaltemp <= redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_in(0);
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_in_bitsignaltemp <= redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_in(0);
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_out(0) <= redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_out_bitsignaltemp;
    redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_out(0) <= redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_out_bitsignaltemp;
    theredist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 252,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c,
        valid_out => redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_stall_out_bitsignaltemp,
        data_out => redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(BITJOIN,244)
    bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_12 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_11 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_10 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_9 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_8 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_7 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_6 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_5 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_4 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_0;

    -- bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg(STALLFIFO,801)
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 125,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 512,
        IMPL => "zl_ram"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x(BITJOIN,250)
    bubble_join_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_q <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_o_readdata_0;

    -- bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg(STALLFIFO,803)
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_in <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_q;
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 32,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 128,
        IMPL => "zl_ram"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(BITJOIN,253)
    bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_0;

    -- bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg(STALLFIFO,804)
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 32,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 128,
        IMPL => "zl_ram"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data(STALLENABLE,586)
    -- Valid signal propagation
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V0 <= SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall <= i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_o_stall or not (SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V;

    -- SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data(STALLREG,814)
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid <= (others => '0');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data0 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data1 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data2 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data3 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data4 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data5 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data6 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data7 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data8 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data9 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data10 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data11 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data12 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data13 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data14 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data15 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data16 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data17 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data18 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data19 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data20 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data21 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data22 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data23 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data24 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data25 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data26 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data27 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data28 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data29 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data30 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data31 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data32 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data33 <= (others => '-');
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data34 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid <= SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall and (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid or SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_i_valid);

            IF (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data2 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data3 <= bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data4 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data5 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data6 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data7 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data8 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_f);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data9 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_g);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data10 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_h);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data11 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_i);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data12 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_j);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data13 <= bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_k;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data14 <= bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_l;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data15 <= bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_m;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data16 <= bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_n;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data17 <= bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data18 <= STD_LOGIC_VECTOR(bubble_select_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_b);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data19 <= bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data20 <= bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data21 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_b);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data22 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_c);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data23 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_d);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data24 <= bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_e;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data25 <= bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data26 <= bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data27 <= bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data28 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_b);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data29 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_c);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data30 <= STD_LOGIC_VECTOR(bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_d);
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data31 <= bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_e;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data32 <= bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data33 <= bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_b;
                SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data34 <= bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and0 <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and1 <= bubble_out_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_data_reg_valid_out and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and0;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and2 <= bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_out and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and1;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and3 <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and2;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and4 <= redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_valid_out and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and3;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and5 <= SE_out_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and4;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and6 <= SE_out_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and5;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and7 <= SE_out_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and6;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and8 <= SE_out_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and7;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and9 <= SE_out_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and8;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and10 <= SE_out_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and9;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and11 <= SE_out_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and10;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and12 <= SE_out_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and11;
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_i_valid <= SE_out_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_V0 and SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and12;
    -- Stall signal propagation
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid or not (SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_i_valid);

    -- Valid
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_i_valid;

    -- Data0
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D0 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data0 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b;
    -- Data1
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D1 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data1 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c;
    -- Data2
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D2 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data2 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d;
    -- Data3
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D3 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data3 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e;
    -- Data4
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D4 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data4 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b;
    -- Data5
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D5 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data5 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c;
    -- Data6
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D6 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data6 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d;
    -- Data7
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D7 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data7 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e;
    -- Data8
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D8 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data8 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_f;
    -- Data9
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D9 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data9 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_g;
    -- Data10
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D10 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data10 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_h;
    -- Data11
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D11 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data11 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_i;
    -- Data12
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D12 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data12 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_j;
    -- Data13
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D13 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data13 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_k;
    -- Data14
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D14 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data14 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_l;
    -- Data15
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D15 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data15 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_m;
    -- Data16
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D16 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data16 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_n;
    -- Data17
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D17 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data17 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist37_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_251_fifo_b;
    -- Data18
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D18 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data18 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist3_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1_251_fifo_b;
    -- Data19
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D19 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data19 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist35_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_251_fifo_b;
    -- Data20
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D20 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data20 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist33_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_251_fifo_b;
    -- Data21
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D21 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data21 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_b;
    -- Data22
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D22 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data22 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_c;
    -- Data23
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D23 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data23 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_d;
    -- Data24
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D24 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data24 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_e;
    -- Data25
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D25 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data25 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist31_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_251_fifo_b;
    -- Data26
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D26 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data26 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_251_fifo_b;
    -- Data27
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D27 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data27 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_251_fifo_b;
    -- Data28
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D28 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data28 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_b;
    -- Data29
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D29 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data29 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_c;
    -- Data30
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D30 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data30 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_d;
    -- Data31
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D31 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data31 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_e;
    -- Data32
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D32 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data32 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_251_fifo_b;
    -- Data33
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D33 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data33 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_251_fifo_b;
    -- Data34
    SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_D34 <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_data34 WHEN SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_r_valid = "1" ELSE bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_251_fifo_b;

    -- bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg(STALLFIFO,802)
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_in <= SR_SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_q;
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 32,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 128,
        IMPL => "zl_ram"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x(STALLENABLE,424)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V0 <= SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_wireValid <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_valid;

    -- SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x(STALLREG,813)
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid <= (others => '0');
            SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data0 <= (others => '-');
            SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid <= SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall and (SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid or SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_i_valid);

            IF (SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid = "0") THEN
                -- Data(s)
                SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data0 <= bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_c;
                SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data1 <= bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_and0 <= SE_out_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_V0;
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_i_valid <= SE_out_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_V0 and SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_and0;
    -- Stall signal propagation
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall <= SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid or not (SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_i_valid);

    -- Valid
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V <= SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid = "1" ELSE SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_i_valid;

    -- Data0
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_D0 <= SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data0 WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x3_aunroll_x_c;
    -- Data1
    SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_D1 <= SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_data1 WHEN SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_r_valid = "1" ELSE bubble_select_redist45_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_96_fifo_b;

    -- i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x(BLACKBOX,46)@97
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@252
    -- out out_o_readdata_1@252
    -- out out_o_readdata_2@252
    -- out out_o_readdata_3@252
    -- out out_memcoalesce_input_im_load_0110_avm_address@20000000
    -- out out_memcoalesce_input_im_load_0110_avm_burstcount@20000000
    -- out out_memcoalesce_input_im_load_0110_avm_byteenable@20000000
    -- out out_memcoalesce_input_im_load_0110_avm_enable@20000000
    -- out out_memcoalesce_input_im_load_0110_avm_read@20000000
    -- out out_memcoalesce_input_im_load_0110_avm_write@20000000
    -- out out_memcoalesce_input_im_load_0110_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@252
    thei_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x : i_load_memcoalesce_input_im_load_0110_conv2d3x398
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_D0,
        in_i_predicate => SR_SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_D1,
        in_i_stall => SE_out_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_in_i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_V0,
        in_memcoalesce_input_im_load_0110_avm_readdata => in_memcoalesce_input_im_load_0110_avm_readdata,
        in_memcoalesce_input_im_load_0110_avm_readdatavalid => in_memcoalesce_input_im_load_0110_avm_readdatavalid,
        in_memcoalesce_input_im_load_0110_avm_waitrequest => in_memcoalesce_input_im_load_0110_avm_waitrequest,
        in_memcoalesce_input_im_load_0110_avm_writeack => in_memcoalesce_input_im_load_0110_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_readdata_3,
        out_memcoalesce_input_im_load_0110_avm_address => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_address,
        out_memcoalesce_input_im_load_0110_avm_burstcount => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_burstcount,
        out_memcoalesce_input_im_load_0110_avm_byteenable => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_byteenable,
        out_memcoalesce_input_im_load_0110_avm_enable => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_enable,
        out_memcoalesce_input_im_load_0110_avm_read => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_read,
        out_memcoalesce_input_im_load_0110_avm_write => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_write,
        out_memcoalesce_input_im_load_0110_avm_writedata => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_writedata,
        out_o_stall => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,7)
    out_memcoalesce_input_im_load_0110_avm_address <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_address;
    out_memcoalesce_input_im_load_0110_avm_enable <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_enable;
    out_memcoalesce_input_im_load_0110_avm_read <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_read;
    out_memcoalesce_input_im_load_0110_avm_write <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_write;
    out_memcoalesce_input_im_load_0110_avm_writedata <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_writedata;
    out_memcoalesce_input_im_load_0110_avm_byteenable <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_byteenable;
    out_memcoalesce_input_im_load_0110_avm_burstcount <= i_load_memcoalesce_input_im_load_0110_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0110_avm_burstcount;

    -- i_exitcond18_conv2d3x3(LOGICAL,66)@397 + 1
    i_exitcond18_conv2d3x3_qi <= "1" WHEN SR_SE_i_exitcond18_conv2d3x3_D0 = SR_SE_i_exitcond18_conv2d3x3_D1 ELSE "0";
    i_exitcond18_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond18_conv2d3x3_qi, xout => i_exitcond18_conv2d3x3_q, ena => SE_i_exitcond18_conv2d3x3_backEN(0), clk => clock, aclr => resetn );

    -- i_exitcond18_guard_conv2d3x3(LOGICAL,67)@398
    i_exitcond18_guard_conv2d3x3_q <= i_exitcond18_conv2d3x3_q or bubble_select_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_b;

    -- i_unnamed_conv2d3x3103(LOGICAL,75)@398
    i_unnamed_conv2d3x3103_q <= i_exitcond18_guard_conv2d3x3_q or bubble_select_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_b;

    -- bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo(BITJOIN,319)
    bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_q <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_data_out;

    -- bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo(BITSELECT,320)
    bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_q(31 downto 0));

    -- bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo(BITJOIN,322)
    bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_q <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_data_out;

    -- bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo(BITSELECT,323)
    bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_q(31 downto 0));

    -- redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0(REG,236)
    redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_backEN = "1") THEN
                redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(redist50_bgTrunc_i_inc60_conv2d3x3_sel_x_b_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo(BITJOIN,289)
    bubble_join_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_q <= redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_data_out;

    -- bubble_select_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo(BITSELECT,290)
    bubble_select_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_q(31 downto 0));

    -- bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo(BITJOIN,316)
    bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_q <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_data_out;

    -- bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo(BITSELECT,317)
    bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_q(0 downto 0));

    -- bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo(BITJOIN,313)
    bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_q <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_data_out;

    -- bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo(BITSELECT,314)
    bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_q(0 downto 0));

    -- bubble_join_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo(BITJOIN,310)
    bubble_join_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_q <= redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_data_out;

    -- bubble_select_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo(BITSELECT,311)
    bubble_select_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_q(31 downto 0));

    -- bubble_join_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo(BITJOIN,304)
    bubble_join_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_q <= redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_data_out;

    -- bubble_select_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo(BITSELECT,305)
    bubble_select_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_q(0 downto 0));

    -- bubble_join_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo(BITJOIN,301)
    bubble_join_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_q <= redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_data_out;

    -- bubble_select_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo(BITSELECT,302)
    bubble_select_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_q(31 downto 0));

    -- bubble_join_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo(BITJOIN,295)
    bubble_join_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_q <= redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_data_out;

    -- bubble_select_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo(BITSELECT,296)
    bubble_select_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_q(31 downto 0));

    -- bubble_join_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x(BITJOIN,259)
    bubble_join_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_q <= i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_out_c1_exit175_1;

    -- bubble_select_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x(BITSELECT,260)
    bubble_select_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_q(31 downto 0));

    -- bubble_join_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo(BITJOIN,286)
    bubble_join_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_q <= redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_data_out;

    -- bubble_select_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo(BITSELECT,287)
    bubble_select_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_q(63 downto 0));

    -- bubble_join_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo(BITJOIN,376)
    bubble_join_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_q <= redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_data_out;

    -- bubble_select_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo(BITSELECT,377)
    bubble_select_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_q(0 downto 0));

    -- bubble_join_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo(BITJOIN,370)
    bubble_join_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_q <= redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_data_out;

    -- bubble_select_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo(BITSELECT,371)
    bubble_select_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_q(0 downto 0));

    -- bubble_join_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo(BITJOIN,364)
    bubble_join_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_q <= redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_data_out;

    -- bubble_select_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo(BITSELECT,365)
    bubble_select_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_q(0 downto 0));

    -- bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo(BITJOIN,358)
    bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_q <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_data_out;

    -- bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo(BITSELECT,359)
    bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_q(0 downto 0));

    -- bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo(BITJOIN,352)
    bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_q <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_data_out;

    -- bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo(BITSELECT,353)
    bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_q(0 downto 0));

    -- bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo(BITJOIN,346)
    bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_q <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_data_out;

    -- bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo(BITSELECT,347)
    bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_q(0 downto 0));

    -- bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo(BITJOIN,340)
    bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_q <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_data_out;

    -- bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo(BITSELECT,341)
    bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_q(0 downto 0));

    -- bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo(BITJOIN,334)
    bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_q <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_data_out;

    -- bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo(BITSELECT,335)
    bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_q(0 downto 0));

    -- bubble_join_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo(BITJOIN,283)
    bubble_join_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_q <= redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_data_out;

    -- bubble_select_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo(BITSELECT,284)
    bubble_select_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_q(63 downto 0));

    -- bubble_join_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo(BITJOIN,409)
    bubble_join_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_q <= redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_data_out;

    -- bubble_select_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo(BITSELECT,410)
    bubble_select_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_q(0 downto 0));

    -- bubble_join_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo(BITJOIN,403)
    bubble_join_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_q <= redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_data_out;

    -- bubble_select_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo(BITSELECT,404)
    bubble_select_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_q(0 downto 0));

    -- bubble_join_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo(BITJOIN,397)
    bubble_join_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_q <= redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_data_out;

    -- bubble_select_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo(BITSELECT,398)
    bubble_select_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_q(0 downto 0));

    -- bubble_join_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo(BITJOIN,394)
    bubble_join_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_q <= redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_data_out;

    -- bubble_select_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo(BITSELECT,395)
    bubble_select_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_q(0 downto 0));

    -- bubble_join_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo(BITJOIN,388)
    bubble_join_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_q <= redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_data_out;

    -- bubble_select_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo(BITSELECT,389)
    bubble_select_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_q(0 downto 0));

    -- bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo(BITJOIN,328)
    bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_q <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_data_out;

    -- bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo(BITSELECT,329)
    bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_q(31 downto 0));

    -- bubble_join_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo(BITJOIN,385)
    bubble_join_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_q <= redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_data_out;

    -- bubble_select_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo(BITSELECT,386)
    bubble_select_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_q(0 downto 0));

    -- bubble_join_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo(BITJOIN,382)
    bubble_join_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_q <= redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_data_out;

    -- bubble_select_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo(BITSELECT,383)
    bubble_select_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_q(0 downto 0));

    -- dupName_0_sync_out_x(GPOUT,12)@398
    out_c0_exe1045 <= bubble_select_redist38_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_22_397_fifo_b;
    out_c0_exe1146 <= bubble_select_redist39_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_23_397_fifo_b;
    out_c0_exe115436 <= bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_397_fifo_b;
    out_c0_exe1248 <= bubble_select_redist40_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_24_397_fifo_b;
    out_c0_exe1349 <= bubble_select_redist42_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_25_397_fifo_b;
    out_c0_exe1450 <= bubble_select_redist44_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_26_397_fifo_b;
    out_c0_exe1551 <= bubble_select_redist46_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_27_397_fifo_b;
    out_c0_exe1652 <= bubble_select_redist48_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_28_397_fifo_b;
    out_c0_exe17 <= bubble_select_redist5_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2_397_fifo_b;
    out_c0_exe237 <= bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_397_fifo_b;
    out_c0_exe338 <= bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_397_fifo_b;
    out_c0_exe439 <= bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_397_fifo_b;
    out_c0_exe540 <= bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_397_fifo_b;
    out_c0_exe641 <= bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_18_397_fifo_b;
    out_c0_exe742 <= bubble_select_redist32_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_19_397_fifo_b;
    out_c0_exe843 <= bubble_select_redist34_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_20_397_fifo_b;
    out_c0_exe944 <= bubble_select_redist36_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_21_397_fifo_b;
    out_c1_exe111 <= bubble_select_redist6_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_397_fifo_b;
    out_c1_exe1176 <= bubble_select_i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3_aunroll_x_b;
    out_c2_exe116 <= bubble_select_redist9_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_397_fifo_b;
    out_c2_exe219 <= bubble_select_redist11_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_397_fifo_b;
    out_c2_exe324 <= bubble_select_redist12_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_397_fifo_b;
    out_c2_exe425 <= bubble_select_redist14_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_397_fifo_b;
    out_c2_exe530 <= bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_397_fifo_b;
    out_c2_exe633 <= bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_397_fifo_b;
    out_c3_exe114 <= bubble_select_redist7_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_397_fifo_b;
    out_inc60 <= redist51_bgTrunc_i_inc60_conv2d3x3_sel_x_b_2_0_q;
    out_j_01535 <= bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_397_fifo_b;
    out_unnamed_conv2d3x32 <= bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_397_fifo_b;
    out_unnamed_conv2d3x33 <= i_unnamed_conv2d3x3103_q;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer131_conv2d3x3_1_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,14)
    out_memcoalesce_input_im_load_0115_avm_address <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_address;
    out_memcoalesce_input_im_load_0115_avm_enable <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_enable;
    out_memcoalesce_input_im_load_0115_avm_read <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_read;
    out_memcoalesce_input_im_load_0115_avm_write <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_write;
    out_memcoalesce_input_im_load_0115_avm_writedata <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_writedata;
    out_memcoalesce_input_im_load_0115_avm_byteenable <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_byteenable;
    out_memcoalesce_input_im_load_0115_avm_burstcount <= i_load_memcoalesce_input_im_load_0115_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0115_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,19)
    out_memcoalesce_filter_weight_load_0_avm_address <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address;
    out_memcoalesce_filter_weight_load_0_avm_enable <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable;
    out_memcoalesce_filter_weight_load_0_avm_read <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read;
    out_memcoalesce_filter_weight_load_0_avm_write <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write;
    out_memcoalesce_filter_weight_load_0_avm_writedata <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata;
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable;
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,64)
    out_memcoalesce_input_im_load_0_avm_address <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_address;
    out_memcoalesce_input_im_load_0_avm_enable <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable;
    out_memcoalesce_input_im_load_0_avm_read <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_read;
    out_memcoalesce_input_im_load_0_avm_write <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_write;
    out_memcoalesce_input_im_load_0_avm_writedata <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata;
    out_memcoalesce_input_im_load_0_avm_byteenable <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable;
    out_memcoalesce_input_im_load_0_avm_burstcount <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- sync_out(GPOUT,88)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
