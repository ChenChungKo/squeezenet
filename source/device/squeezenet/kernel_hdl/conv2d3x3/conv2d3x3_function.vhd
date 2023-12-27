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

-- VHDL created from conv2d3x3_function
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

entity conv2d3x3_function is
    port (
        in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_start_channel : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_stride : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x36_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x36_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_o_active_unnamed_conv2d3x36 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d3x36_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d3x36_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x36_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x36_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x36_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x36_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x36_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_function;

architecture normal of conv2d3x3_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d3x3_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B4_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B0 is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d3x30_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_channel : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x30_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B1 is
        port (
            in_c0_exe18_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe18_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe112_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe112_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe117_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe117_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe220_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe220_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe322_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe322_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe426_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe426_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe528_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe528_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe631_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe631_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c3_exe115_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_015_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_015_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x31_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x31_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe112 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe117 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe220 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe322 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe426 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe528 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe631 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2 is
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
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01535_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01535_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_112_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_112_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B3 is
        port (
            in_c0_exe1247_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe19_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe110_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe117653_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exe118_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe221_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe323_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe427_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe529_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe632_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe113_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01534_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x34_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe110 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe118 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe323 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe427 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe529 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe632 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc72 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d3x36_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x34 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x36_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B4 is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_conv2d3x30 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_conv2d3x31 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B0_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B0_out_c2_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_c2_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_c2_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_c2_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_c2_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_c2_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_c3_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe1154 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe18 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe112 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_out_c2_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_c2_exe220 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_c2_exe322 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c2_exe426 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_c2_exe528 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c2_exe631 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c3_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_j_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_unnamed_conv2d3x31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1045 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1146 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe115436 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1248 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1349 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1450 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1551 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe1652 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe17 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe237 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe338 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe439 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe540 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe641 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe742 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe843 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c0_exe944 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c1_exe111 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_out_c1_exe1176 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_c2_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_c2_exe219 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_c2_exe324 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c2_exe425 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_c2_exe530 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c2_exe633 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_c3_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_inc60 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_j_01535 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_c0_exe19 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_out_c1_exe110 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_out_c2_exe118 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_c2_exe221 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_c2_exe323 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_c2_exe427 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_c2_exe529 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_c2_exe632 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_c3_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_inc72 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_lsu_unnamed_conv2d3x36_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B3_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x30_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x30_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x31_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x31_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_conv2d3x31(BLACKBOX,62)
    theloop_limiter_conv2d3x31 : loop_limiter_conv2d3x31
    PORT MAP (
        in_i_stall => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d3x3_B1_out_valid_out_0,
        in_i_valid_exit => bb_conv2d3x3_B2_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d3x31_out_o_stall,
        out_o_valid => loop_limiter_conv2d3x31_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_conv2d3x30(BLACKBOX,61)
    theloop_limiter_conv2d3x30 : loop_limiter_conv2d3x30
    PORT MAP (
        in_i_stall => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d3x3_B0_out_valid_out_0,
        in_i_valid_exit => bb_conv2d3x3_B3_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d3x30_out_o_stall,
        out_o_valid => loop_limiter_conv2d3x30_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B0(BLACKBOX,9)
    thebb_conv2d3x3_B0 : bb_conv2d3x3_B0
    PORT MAP (
        in_filter_bias => in_arg_filter_bias,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_global_id_1_0 => in_arg_global_id_1,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_lsu_unnamed_conv2d3x30_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => loop_limiter_conv2d3x30_out_o_stall,
        in_start_channel => in_arg_start_channel,
        in_stream_reset => in_valid_in,
        in_stride => in_arg_stride,
        in_unnamed_conv2d3x30_avm_readdata => in_unnamed_conv2d3x30_avm_readdata,
        in_unnamed_conv2d3x30_avm_readdatavalid => in_unnamed_conv2d3x30_avm_readdatavalid,
        in_unnamed_conv2d3x30_avm_waitrequest => in_unnamed_conv2d3x30_avm_waitrequest,
        in_unnamed_conv2d3x30_avm_writeack => in_unnamed_conv2d3x30_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_c0_exe1 => bb_conv2d3x3_B0_out_c0_exe1,
        out_c1_exe1 => bb_conv2d3x3_B0_out_c1_exe1,
        out_c2_exe1 => bb_conv2d3x3_B0_out_c2_exe1,
        out_c2_exe2 => bb_conv2d3x3_B0_out_c2_exe2,
        out_c2_exe3 => bb_conv2d3x3_B0_out_c2_exe3,
        out_c2_exe4 => bb_conv2d3x3_B0_out_c2_exe4,
        out_c2_exe5 => bb_conv2d3x3_B0_out_c2_exe5,
        out_c2_exe6 => bb_conv2d3x3_B0_out_c2_exe6,
        out_c3_exe1 => bb_conv2d3x3_B0_out_c3_exe1,
        out_stall_out_0 => bb_conv2d3x3_B0_out_stall_out_0,
        out_unnamed_conv2d3x30 => bb_conv2d3x3_B0_out_unnamed_conv2d3x30,
        out_unnamed_conv2d3x30_avm_address => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_address,
        out_unnamed_conv2d3x30_avm_burstcount => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_burstcount,
        out_unnamed_conv2d3x30_avm_byteenable => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_byteenable,
        out_unnamed_conv2d3x30_avm_enable => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_enable,
        out_unnamed_conv2d3x30_avm_read => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_read,
        out_unnamed_conv2d3x30_avm_write => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_write,
        out_unnamed_conv2d3x30_avm_writedata => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_writedata,
        out_valid_out_0 => bb_conv2d3x3_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,8)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- bb_conv2d3x3_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_conv2d3x3_B1_sr_1_aunroll_x : bb_conv2d3x3_B1_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d3x3_B0_out_c0_exe1,
        in_i_data_2 => bb_conv2d3x3_B0_out_c1_exe1,
        in_i_data_3 => bb_conv2d3x3_B0_out_c3_exe1,
        in_i_data_4 => bb_conv2d3x3_B0_out_c2_exe1,
        in_i_data_5 => bb_conv2d3x3_B0_out_c2_exe2,
        in_i_data_6 => bb_conv2d3x3_B0_out_c2_exe3,
        in_i_data_7 => bb_conv2d3x3_B0_out_c2_exe4,
        in_i_data_8 => bb_conv2d3x3_B0_out_c2_exe5,
        in_i_data_9 => bb_conv2d3x3_B0_out_c2_exe6,
        in_i_data_10 => bb_conv2d3x3_B0_out_unnamed_conv2d3x30,
        in_i_stall => bb_conv2d3x3_B1_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d3x30_out_o_valid,
        out_o_data_0 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_10,
        out_o_stall => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B1(BLACKBOX,10)
    thebb_conv2d3x3_B1 : bb_conv2d3x3_B1
    PORT MAP (
        in_c0_exe18_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_1,
        in_c0_exe18_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_1,
        in_c1_exe112_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_2,
        in_c1_exe112_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_2,
        in_c2_exe117_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_4,
        in_c2_exe117_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_4,
        in_c2_exe220_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_5,
        in_c2_exe220_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_5,
        in_c2_exe322_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_6,
        in_c2_exe322_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_6,
        in_c2_exe426_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_7,
        in_c2_exe426_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_7,
        in_c2_exe528_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_8,
        in_c2_exe528_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_8,
        in_c2_exe631_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_9,
        in_c2_exe631_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_9,
        in_c3_exe115_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_3,
        in_c3_exe115_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_3,
        in_filter_weight => in_arg_filter_weight,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_015_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_0,
        in_j_015_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_0,
        in_output_im => in_arg_output_im,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => loop_limiter_conv2d3x31_out_o_stall,
        in_stride => in_arg_stride,
        in_unnamed_conv2d3x31_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_10,
        in_unnamed_conv2d3x31_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_10,
        in_valid_in_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe10 => bb_conv2d3x3_B1_out_c0_exe10,
        out_c0_exe11 => bb_conv2d3x3_B1_out_c0_exe11,
        out_c0_exe1154 => bb_conv2d3x3_B1_out_c0_exe1154,
        out_c0_exe12 => bb_conv2d3x3_B1_out_c0_exe12,
        out_c0_exe13 => bb_conv2d3x3_B1_out_c0_exe13,
        out_c0_exe14 => bb_conv2d3x3_B1_out_c0_exe14,
        out_c0_exe15 => bb_conv2d3x3_B1_out_c0_exe15,
        out_c0_exe16 => bb_conv2d3x3_B1_out_c0_exe16,
        out_c0_exe18 => bb_conv2d3x3_B1_out_c0_exe18,
        out_c0_exe2 => bb_conv2d3x3_B1_out_c0_exe2,
        out_c0_exe3 => bb_conv2d3x3_B1_out_c0_exe3,
        out_c0_exe4 => bb_conv2d3x3_B1_out_c0_exe4,
        out_c0_exe5 => bb_conv2d3x3_B1_out_c0_exe5,
        out_c0_exe6 => bb_conv2d3x3_B1_out_c0_exe6,
        out_c0_exe7 => bb_conv2d3x3_B1_out_c0_exe7,
        out_c0_exe8 => bb_conv2d3x3_B1_out_c0_exe8,
        out_c0_exe9 => bb_conv2d3x3_B1_out_c0_exe9,
        out_c1_exe112 => bb_conv2d3x3_B1_out_c1_exe112,
        out_c2_exe117 => bb_conv2d3x3_B1_out_c2_exe117,
        out_c2_exe220 => bb_conv2d3x3_B1_out_c2_exe220,
        out_c2_exe322 => bb_conv2d3x3_B1_out_c2_exe322,
        out_c2_exe426 => bb_conv2d3x3_B1_out_c2_exe426,
        out_c2_exe528 => bb_conv2d3x3_B1_out_c2_exe528,
        out_c2_exe631 => bb_conv2d3x3_B1_out_c2_exe631,
        out_c3_exe115 => bb_conv2d3x3_B1_out_c3_exe115,
        out_j_015 => bb_conv2d3x3_B1_out_j_015,
        out_stall_out_0 => bb_conv2d3x3_B1_out_stall_out_0,
        out_stall_out_1 => bb_conv2d3x3_B1_out_stall_out_1,
        out_unnamed_conv2d3x31 => bb_conv2d3x3_B1_out_unnamed_conv2d3x31,
        out_valid_out_0 => bb_conv2d3x3_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_conv2d3x3_B1_sr_0_aunroll_x : bb_conv2d3x3_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d3x3_B3_out_inc72,
        in_i_data_1 => bb_conv2d3x3_B3_out_c0_exe19,
        in_i_data_2 => bb_conv2d3x3_B3_out_c1_exe110,
        in_i_data_3 => bb_conv2d3x3_B3_out_c3_exe113,
        in_i_data_4 => bb_conv2d3x3_B3_out_c2_exe118,
        in_i_data_5 => bb_conv2d3x3_B3_out_c2_exe221,
        in_i_data_6 => bb_conv2d3x3_B3_out_c2_exe323,
        in_i_data_7 => bb_conv2d3x3_B3_out_c2_exe427,
        in_i_data_8 => bb_conv2d3x3_B3_out_c2_exe529,
        in_i_data_9 => bb_conv2d3x3_B3_out_c2_exe632,
        in_i_data_10 => bb_conv2d3x3_B3_out_unnamed_conv2d3x34,
        in_i_stall => bb_conv2d3x3_B1_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B3_out_valid_out_1,
        out_o_data_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_10,
        out_o_stall => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B4(BLACKBOX,13)
    thebb_conv2d3x3_B4 : bb_conv2d3x3_B4
    PORT MAP (
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_valid,
        out_stall_out_0 => bb_conv2d3x3_B4_out_stall_out_0,
        out_valid_out_0 => bb_conv2d3x3_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_conv2d3x3_B4_sr_0_aunroll_x(BLACKBOX,7)
    thebb_conv2d3x3_B4_sr_0_aunroll_x : bb_conv2d3x3_B4_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_conv2d3x3_B4_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B3_out_valid_out_0,
        out_o_stall => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B3(BLACKBOX,12)
    thebb_conv2d3x3_B3 : bb_conv2d3x3_B3
    PORT MAP (
        in_c0_exe1247_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_11,
        in_c0_exe19_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_0,
        in_c1_exe110_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_1,
        in_c1_exe117653_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_12,
        in_c2_exe118_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_3,
        in_c2_exe221_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_4,
        in_c2_exe323_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_5,
        in_c2_exe427_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_6,
        in_c2_exe529_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_7,
        in_c2_exe632_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_8,
        in_c3_exe113_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_2,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_01534_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_10,
        in_output_im => in_arg_output_im,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_stall,
        in_stride => in_arg_stride,
        in_unnamed_conv2d3x34_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_9,
        in_unnamed_conv2d3x36_avm_readdata => in_unnamed_conv2d3x36_avm_readdata,
        in_unnamed_conv2d3x36_avm_readdatavalid => in_unnamed_conv2d3x36_avm_readdatavalid,
        in_unnamed_conv2d3x36_avm_waitrequest => in_unnamed_conv2d3x36_avm_waitrequest,
        in_unnamed_conv2d3x36_avm_writeack => in_unnamed_conv2d3x36_avm_writeack,
        in_valid_in_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_valid,
        out_c0_exe19 => bb_conv2d3x3_B3_out_c0_exe19,
        out_c1_exe110 => bb_conv2d3x3_B3_out_c1_exe110,
        out_c2_exe118 => bb_conv2d3x3_B3_out_c2_exe118,
        out_c2_exe221 => bb_conv2d3x3_B3_out_c2_exe221,
        out_c2_exe323 => bb_conv2d3x3_B3_out_c2_exe323,
        out_c2_exe427 => bb_conv2d3x3_B3_out_c2_exe427,
        out_c2_exe529 => bb_conv2d3x3_B3_out_c2_exe529,
        out_c2_exe632 => bb_conv2d3x3_B3_out_c2_exe632,
        out_c3_exe113 => bb_conv2d3x3_B3_out_c3_exe113,
        out_inc72 => bb_conv2d3x3_B3_out_inc72,
        out_lsu_unnamed_conv2d3x36_o_active => bb_conv2d3x3_B3_out_lsu_unnamed_conv2d3x36_o_active,
        out_stall_out_0 => bb_conv2d3x3_B3_out_stall_out_0,
        out_unnamed_conv2d3x34 => bb_conv2d3x3_B3_out_unnamed_conv2d3x34,
        out_unnamed_conv2d3x36_avm_address => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_address,
        out_unnamed_conv2d3x36_avm_burstcount => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_burstcount,
        out_unnamed_conv2d3x36_avm_byteenable => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_byteenable,
        out_unnamed_conv2d3x36_avm_enable => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_enable,
        out_unnamed_conv2d3x36_avm_read => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_read,
        out_unnamed_conv2d3x36_avm_write => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_write,
        out_unnamed_conv2d3x36_avm_writedata => bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_writedata,
        out_valid_out_0 => bb_conv2d3x3_B3_out_valid_out_0,
        out_valid_out_1 => bb_conv2d3x3_B3_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B3_sr_0_aunroll_x(BLACKBOX,6)
    thebb_conv2d3x3_B3_sr_0_aunroll_x : bb_conv2d3x3_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d3x3_B2_out_c0_exe17,
        in_i_data_1 => bb_conv2d3x3_B2_out_c1_exe111,
        in_i_data_2 => bb_conv2d3x3_B2_out_c3_exe114,
        in_i_data_3 => bb_conv2d3x3_B2_out_c2_exe116,
        in_i_data_4 => bb_conv2d3x3_B2_out_c2_exe219,
        in_i_data_5 => bb_conv2d3x3_B2_out_c2_exe324,
        in_i_data_6 => bb_conv2d3x3_B2_out_c2_exe425,
        in_i_data_7 => bb_conv2d3x3_B2_out_c2_exe530,
        in_i_data_8 => bb_conv2d3x3_B2_out_c2_exe633,
        in_i_data_9 => bb_conv2d3x3_B2_out_unnamed_conv2d3x32,
        in_i_data_10 => bb_conv2d3x3_B2_out_j_01535,
        in_i_data_11 => bb_conv2d3x3_B2_out_c0_exe1248,
        in_i_data_12 => bb_conv2d3x3_B2_out_c1_exe1176,
        in_i_stall => bb_conv2d3x3_B3_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B2_out_valid_out_0,
        out_o_data_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_12,
        out_o_stall => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2_sr_1_aunroll_x(BLACKBOX,5)
    thebb_conv2d3x3_B2_sr_1_aunroll_x : bb_conv2d3x3_B2_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d3x3_B1_out_unnamed_conv2d3x31,
        in_i_data_2 => bb_conv2d3x3_B1_out_c0_exe18,
        in_i_data_3 => bb_conv2d3x3_B1_out_c1_exe112,
        in_i_data_4 => bb_conv2d3x3_B1_out_c3_exe115,
        in_i_data_5 => bb_conv2d3x3_B1_out_c2_exe117,
        in_i_data_6 => bb_conv2d3x3_B1_out_c2_exe220,
        in_i_data_7 => bb_conv2d3x3_B1_out_c2_exe322,
        in_i_data_8 => bb_conv2d3x3_B1_out_c2_exe426,
        in_i_data_9 => bb_conv2d3x3_B1_out_c2_exe528,
        in_i_data_10 => bb_conv2d3x3_B1_out_c2_exe631,
        in_i_data_11 => bb_conv2d3x3_B1_out_unnamed_conv2d3x31,
        in_i_data_12 => bb_conv2d3x3_B1_out_j_015,
        in_i_data_13 => bb_conv2d3x3_B1_out_c0_exe1154,
        in_i_data_14 => bb_conv2d3x3_B1_out_c0_exe2,
        in_i_data_15 => bb_conv2d3x3_B1_out_c0_exe3,
        in_i_data_16 => bb_conv2d3x3_B1_out_c0_exe4,
        in_i_data_17 => bb_conv2d3x3_B1_out_c0_exe5,
        in_i_data_18 => bb_conv2d3x3_B1_out_c0_exe6,
        in_i_data_19 => bb_conv2d3x3_B1_out_c0_exe7,
        in_i_data_20 => bb_conv2d3x3_B1_out_c0_exe8,
        in_i_data_21 => bb_conv2d3x3_B1_out_c0_exe9,
        in_i_data_22 => bb_conv2d3x3_B1_out_c0_exe10,
        in_i_data_23 => bb_conv2d3x3_B1_out_c0_exe11,
        in_i_data_24 => bb_conv2d3x3_B1_out_c0_exe12,
        in_i_data_25 => bb_conv2d3x3_B1_out_c0_exe13,
        in_i_data_26 => bb_conv2d3x3_B1_out_c0_exe14,
        in_i_data_27 => bb_conv2d3x3_B1_out_c0_exe15,
        in_i_data_28 => bb_conv2d3x3_B1_out_c0_exe16,
        in_i_stall => bb_conv2d3x3_B2_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d3x31_out_o_valid,
        out_o_data_0 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_28,
        out_o_stall => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_conv2d3x3_B2_sr_0_aunroll_x : bb_conv2d3x3_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d3x3_B2_out_inc60,
        in_i_data_1 => bb_conv2d3x3_B2_out_c1_exe1176,
        in_i_data_2 => bb_conv2d3x3_B2_out_c0_exe17,
        in_i_data_3 => bb_conv2d3x3_B2_out_c1_exe111,
        in_i_data_4 => bb_conv2d3x3_B2_out_c3_exe114,
        in_i_data_5 => bb_conv2d3x3_B2_out_c2_exe116,
        in_i_data_6 => bb_conv2d3x3_B2_out_c2_exe219,
        in_i_data_7 => bb_conv2d3x3_B2_out_c2_exe324,
        in_i_data_8 => bb_conv2d3x3_B2_out_c2_exe425,
        in_i_data_9 => bb_conv2d3x3_B2_out_c2_exe530,
        in_i_data_10 => bb_conv2d3x3_B2_out_c2_exe633,
        in_i_data_11 => bb_conv2d3x3_B2_out_unnamed_conv2d3x32,
        in_i_data_12 => bb_conv2d3x3_B2_out_j_01535,
        in_i_data_13 => bb_conv2d3x3_B2_out_c0_exe115436,
        in_i_data_14 => bb_conv2d3x3_B2_out_c0_exe237,
        in_i_data_15 => bb_conv2d3x3_B2_out_c0_exe338,
        in_i_data_16 => bb_conv2d3x3_B2_out_c0_exe439,
        in_i_data_17 => bb_conv2d3x3_B2_out_c0_exe540,
        in_i_data_18 => bb_conv2d3x3_B2_out_c0_exe641,
        in_i_data_19 => bb_conv2d3x3_B2_out_c0_exe742,
        in_i_data_20 => bb_conv2d3x3_B2_out_c0_exe843,
        in_i_data_21 => bb_conv2d3x3_B2_out_c0_exe944,
        in_i_data_22 => bb_conv2d3x3_B2_out_c0_exe1045,
        in_i_data_23 => bb_conv2d3x3_B2_out_c0_exe1146,
        in_i_data_24 => bb_conv2d3x3_B2_out_c0_exe1248,
        in_i_data_25 => bb_conv2d3x3_B2_out_c0_exe1349,
        in_i_data_26 => bb_conv2d3x3_B2_out_c0_exe1450,
        in_i_data_27 => bb_conv2d3x3_B2_out_c0_exe1551,
        in_i_data_28 => bb_conv2d3x3_B2_out_c0_exe1652,
        in_i_stall => bb_conv2d3x3_B2_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B2_out_valid_out_1,
        out_o_data_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_28,
        out_o_stall => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2(BLACKBOX,11)
    thebb_conv2d3x3_B2 : bb_conv2d3x3_B2
    PORT MAP (
        in_c0_exe1045_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_22,
        in_c0_exe1045_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_22,
        in_c0_exe1146_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_23,
        in_c0_exe1146_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_23,
        in_c0_exe115436_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_13,
        in_c0_exe115436_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_13,
        in_c0_exe1248_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_24,
        in_c0_exe1248_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_24,
        in_c0_exe1349_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_25,
        in_c0_exe1349_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_25,
        in_c0_exe1450_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_26,
        in_c0_exe1450_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_26,
        in_c0_exe1551_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_27,
        in_c0_exe1551_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_27,
        in_c0_exe1652_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_28,
        in_c0_exe1652_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_28,
        in_c0_exe17_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_2,
        in_c0_exe17_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_2,
        in_c0_exe237_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_14,
        in_c0_exe237_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_14,
        in_c0_exe338_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_15,
        in_c0_exe338_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_15,
        in_c0_exe439_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_16,
        in_c0_exe439_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_16,
        in_c0_exe540_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_17,
        in_c0_exe540_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_17,
        in_c0_exe641_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_18,
        in_c0_exe641_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_18,
        in_c0_exe742_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_19,
        in_c0_exe742_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_19,
        in_c0_exe843_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_20,
        in_c0_exe843_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_20,
        in_c0_exe944_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_21,
        in_c0_exe944_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_21,
        in_c1_exe111_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_3,
        in_c1_exe111_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_3,
        in_c2_exe116_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_5,
        in_c2_exe116_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_5,
        in_c2_exe219_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_6,
        in_c2_exe219_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_6,
        in_c2_exe324_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_7,
        in_c2_exe324_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_7,
        in_c2_exe425_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_8,
        in_c2_exe425_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_8,
        in_c2_exe530_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_9,
        in_c2_exe530_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_9,
        in_c2_exe633_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_10,
        in_c2_exe633_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_10,
        in_c3_exe114_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_4,
        in_c3_exe114_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_4,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_01535_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_12,
        in_j_01535_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_12,
        in_k_112_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_0,
        in_k_112_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_0,
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
        in_output_im => in_arg_output_im,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_stall,
        in_stride => in_arg_stride,
        in_tmp_111_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_1,
        in_tmp_111_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_1,
        in_unnamed_conv2d3x32_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_11,
        in_unnamed_conv2d3x32_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_11,
        in_valid_in_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_valid,
        out_c0_exe1045 => bb_conv2d3x3_B2_out_c0_exe1045,
        out_c0_exe1146 => bb_conv2d3x3_B2_out_c0_exe1146,
        out_c0_exe115436 => bb_conv2d3x3_B2_out_c0_exe115436,
        out_c0_exe1248 => bb_conv2d3x3_B2_out_c0_exe1248,
        out_c0_exe1349 => bb_conv2d3x3_B2_out_c0_exe1349,
        out_c0_exe1450 => bb_conv2d3x3_B2_out_c0_exe1450,
        out_c0_exe1551 => bb_conv2d3x3_B2_out_c0_exe1551,
        out_c0_exe1652 => bb_conv2d3x3_B2_out_c0_exe1652,
        out_c0_exe17 => bb_conv2d3x3_B2_out_c0_exe17,
        out_c0_exe237 => bb_conv2d3x3_B2_out_c0_exe237,
        out_c0_exe338 => bb_conv2d3x3_B2_out_c0_exe338,
        out_c0_exe439 => bb_conv2d3x3_B2_out_c0_exe439,
        out_c0_exe540 => bb_conv2d3x3_B2_out_c0_exe540,
        out_c0_exe641 => bb_conv2d3x3_B2_out_c0_exe641,
        out_c0_exe742 => bb_conv2d3x3_B2_out_c0_exe742,
        out_c0_exe843 => bb_conv2d3x3_B2_out_c0_exe843,
        out_c0_exe944 => bb_conv2d3x3_B2_out_c0_exe944,
        out_c1_exe111 => bb_conv2d3x3_B2_out_c1_exe111,
        out_c1_exe1176 => bb_conv2d3x3_B2_out_c1_exe1176,
        out_c2_exe116 => bb_conv2d3x3_B2_out_c2_exe116,
        out_c2_exe219 => bb_conv2d3x3_B2_out_c2_exe219,
        out_c2_exe324 => bb_conv2d3x3_B2_out_c2_exe324,
        out_c2_exe425 => bb_conv2d3x3_B2_out_c2_exe425,
        out_c2_exe530 => bb_conv2d3x3_B2_out_c2_exe530,
        out_c2_exe633 => bb_conv2d3x3_B2_out_c2_exe633,
        out_c3_exe114 => bb_conv2d3x3_B2_out_c3_exe114,
        out_inc60 => bb_conv2d3x3_B2_out_inc60,
        out_j_01535 => bb_conv2d3x3_B2_out_j_01535,
        out_memcoalesce_filter_weight_load_0_avm_address => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_memcoalesce_input_im_load_0110_avm_address => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_address,
        out_memcoalesce_input_im_load_0110_avm_burstcount => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_burstcount,
        out_memcoalesce_input_im_load_0110_avm_byteenable => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_byteenable,
        out_memcoalesce_input_im_load_0110_avm_enable => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_enable,
        out_memcoalesce_input_im_load_0110_avm_read => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_read,
        out_memcoalesce_input_im_load_0110_avm_write => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_write,
        out_memcoalesce_input_im_load_0110_avm_writedata => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_writedata,
        out_memcoalesce_input_im_load_0115_avm_address => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_address,
        out_memcoalesce_input_im_load_0115_avm_burstcount => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_burstcount,
        out_memcoalesce_input_im_load_0115_avm_byteenable => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_byteenable,
        out_memcoalesce_input_im_load_0115_avm_enable => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_enable,
        out_memcoalesce_input_im_load_0115_avm_read => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_read,
        out_memcoalesce_input_im_load_0115_avm_write => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_write,
        out_memcoalesce_input_im_load_0115_avm_writedata => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_writedata,
        out_memcoalesce_input_im_load_0_avm_address => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_writedata,
        out_stall_out_0 => bb_conv2d3x3_B2_out_stall_out_0,
        out_stall_out_1 => bb_conv2d3x3_B2_out_stall_out_1,
        out_unnamed_conv2d3x32 => bb_conv2d3x3_B2_out_unnamed_conv2d3x32,
        out_valid_out_0 => bb_conv2d3x3_B2_out_valid_out_0,
        out_valid_out_1 => bb_conv2d3x3_B2_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_memcoalesce_filter_weight_load_0_avm_address(GPOUT,63)
    out_memcoalesce_filter_weight_load_0_avm_address <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_address;

    -- out_memcoalesce_filter_weight_load_0_avm_burstcount(GPOUT,64)
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- out_memcoalesce_filter_weight_load_0_avm_byteenable(GPOUT,65)
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- out_memcoalesce_filter_weight_load_0_avm_enable(GPOUT,66)
    out_memcoalesce_filter_weight_load_0_avm_enable <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- out_memcoalesce_filter_weight_load_0_avm_read(GPOUT,67)
    out_memcoalesce_filter_weight_load_0_avm_read <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_read;

    -- out_memcoalesce_filter_weight_load_0_avm_write(GPOUT,68)
    out_memcoalesce_filter_weight_load_0_avm_write <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_write;

    -- out_memcoalesce_filter_weight_load_0_avm_writedata(GPOUT,69)
    out_memcoalesce_filter_weight_load_0_avm_writedata <= bb_conv2d3x3_B2_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- out_memcoalesce_input_im_load_0110_avm_address(GPOUT,70)
    out_memcoalesce_input_im_load_0110_avm_address <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_address;

    -- out_memcoalesce_input_im_load_0110_avm_burstcount(GPOUT,71)
    out_memcoalesce_input_im_load_0110_avm_burstcount <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_burstcount;

    -- out_memcoalesce_input_im_load_0110_avm_byteenable(GPOUT,72)
    out_memcoalesce_input_im_load_0110_avm_byteenable <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_byteenable;

    -- out_memcoalesce_input_im_load_0110_avm_enable(GPOUT,73)
    out_memcoalesce_input_im_load_0110_avm_enable <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_enable;

    -- out_memcoalesce_input_im_load_0110_avm_read(GPOUT,74)
    out_memcoalesce_input_im_load_0110_avm_read <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_read;

    -- out_memcoalesce_input_im_load_0110_avm_write(GPOUT,75)
    out_memcoalesce_input_im_load_0110_avm_write <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_write;

    -- out_memcoalesce_input_im_load_0110_avm_writedata(GPOUT,76)
    out_memcoalesce_input_im_load_0110_avm_writedata <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0110_avm_writedata;

    -- out_memcoalesce_input_im_load_0115_avm_address(GPOUT,77)
    out_memcoalesce_input_im_load_0115_avm_address <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_address;

    -- out_memcoalesce_input_im_load_0115_avm_burstcount(GPOUT,78)
    out_memcoalesce_input_im_load_0115_avm_burstcount <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_burstcount;

    -- out_memcoalesce_input_im_load_0115_avm_byteenable(GPOUT,79)
    out_memcoalesce_input_im_load_0115_avm_byteenable <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_byteenable;

    -- out_memcoalesce_input_im_load_0115_avm_enable(GPOUT,80)
    out_memcoalesce_input_im_load_0115_avm_enable <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_enable;

    -- out_memcoalesce_input_im_load_0115_avm_read(GPOUT,81)
    out_memcoalesce_input_im_load_0115_avm_read <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_read;

    -- out_memcoalesce_input_im_load_0115_avm_write(GPOUT,82)
    out_memcoalesce_input_im_load_0115_avm_write <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_write;

    -- out_memcoalesce_input_im_load_0115_avm_writedata(GPOUT,83)
    out_memcoalesce_input_im_load_0115_avm_writedata <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0115_avm_writedata;

    -- out_memcoalesce_input_im_load_0_avm_address(GPOUT,84)
    out_memcoalesce_input_im_load_0_avm_address <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_address;

    -- out_memcoalesce_input_im_load_0_avm_burstcount(GPOUT,85)
    out_memcoalesce_input_im_load_0_avm_burstcount <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- out_memcoalesce_input_im_load_0_avm_byteenable(GPOUT,86)
    out_memcoalesce_input_im_load_0_avm_byteenable <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- out_memcoalesce_input_im_load_0_avm_enable(GPOUT,87)
    out_memcoalesce_input_im_load_0_avm_enable <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_enable;

    -- out_memcoalesce_input_im_load_0_avm_read(GPOUT,88)
    out_memcoalesce_input_im_load_0_avm_read <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_read;

    -- out_memcoalesce_input_im_load_0_avm_write(GPOUT,89)
    out_memcoalesce_input_im_load_0_avm_write <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_write;

    -- out_memcoalesce_input_im_load_0_avm_writedata(GPOUT,90)
    out_memcoalesce_input_im_load_0_avm_writedata <= bb_conv2d3x3_B2_out_memcoalesce_input_im_load_0_avm_writedata;

    -- out_o_active_unnamed_conv2d3x36(GPOUT,91)
    out_o_active_unnamed_conv2d3x36 <= bb_conv2d3x3_B3_out_lsu_unnamed_conv2d3x36_o_active;

    -- out_stall_out(GPOUT,92)
    out_stall_out <= bb_conv2d3x3_B0_out_stall_out_0;

    -- out_unnamed_conv2d3x30_avm_address(GPOUT,93)
    out_unnamed_conv2d3x30_avm_address <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_address;

    -- out_unnamed_conv2d3x30_avm_burstcount(GPOUT,94)
    out_unnamed_conv2d3x30_avm_burstcount <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_burstcount;

    -- out_unnamed_conv2d3x30_avm_byteenable(GPOUT,95)
    out_unnamed_conv2d3x30_avm_byteenable <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_byteenable;

    -- out_unnamed_conv2d3x30_avm_enable(GPOUT,96)
    out_unnamed_conv2d3x30_avm_enable <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_enable;

    -- out_unnamed_conv2d3x30_avm_read(GPOUT,97)
    out_unnamed_conv2d3x30_avm_read <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_read;

    -- out_unnamed_conv2d3x30_avm_write(GPOUT,98)
    out_unnamed_conv2d3x30_avm_write <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_write;

    -- out_unnamed_conv2d3x30_avm_writedata(GPOUT,99)
    out_unnamed_conv2d3x30_avm_writedata <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_writedata;

    -- out_unnamed_conv2d3x36_avm_address(GPOUT,100)
    out_unnamed_conv2d3x36_avm_address <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_address;

    -- out_unnamed_conv2d3x36_avm_burstcount(GPOUT,101)
    out_unnamed_conv2d3x36_avm_burstcount <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_burstcount;

    -- out_unnamed_conv2d3x36_avm_byteenable(GPOUT,102)
    out_unnamed_conv2d3x36_avm_byteenable <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_byteenable;

    -- out_unnamed_conv2d3x36_avm_enable(GPOUT,103)
    out_unnamed_conv2d3x36_avm_enable <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_enable;

    -- out_unnamed_conv2d3x36_avm_read(GPOUT,104)
    out_unnamed_conv2d3x36_avm_read <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_read;

    -- out_unnamed_conv2d3x36_avm_write(GPOUT,105)
    out_unnamed_conv2d3x36_avm_write <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_write;

    -- out_unnamed_conv2d3x36_avm_writedata(GPOUT,106)
    out_unnamed_conv2d3x36_avm_writedata <= bb_conv2d3x3_B3_out_unnamed_conv2d3x36_avm_writedata;

    -- out_valid_out(GPOUT,107)
    out_valid_out <= bb_conv2d3x3_B4_out_valid_out_0;

END normal;
