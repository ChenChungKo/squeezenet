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

-- VHDL created from conv2d1x1_function
-- VHDL created on Sun Oct 01 23:33:44 2023


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

entity conv2d1x1_function is
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x111_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x18_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x18_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x18_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x18_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_conv2d1x111 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x111_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x111_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x111_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x111_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x14_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x15_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x16_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x16_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x16_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x16_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x17_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x18_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x18_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x18_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x18_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_function;

architecture normal of conv2d1x1_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d1x1_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B4_sr_0 is
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


    component bb_conv2d1x1_B0 is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d1x10_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x10_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B1 is
        port (
            in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe15_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe15_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe29_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe29_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe110_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe110_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_010_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_010_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x11_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x11_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe110 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_010 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B2 is
        port (
            in_add16_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_add16_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe14_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe14_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe28_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe28_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe112_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe112_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01014_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_18_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_18_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_17_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_17_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe121 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe112 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_cmp9_phi_decision20_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x14_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B3 is
        port (
            in_add15_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe12118_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe16_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe27_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe111_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp9_phi_decision20_xor_RM17_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01013_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x19_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc68 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d1x111_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B4 is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_conv2d1x10 is
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


    component loop_limiter_conv2d1x11 is
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
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B0_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_c1_exe2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B0_out_c2_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_out_add : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_c1_exe29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_out_c2_exe110 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_j_010 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_out_unnamed_conv2d1x11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_add16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_out_c1_exe121 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_c1_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_c1_exe28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_out_c2_exe112 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_cmp9_phi_decision20_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_j_01014 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B3_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_out_c1_exe27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B3_out_c2_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_out_inc68 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_out_lsu_unnamed_conv2d1x111_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B3_out_unnamed_conv2d1x19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x10_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x10_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x11_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x11_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bb_conv2d1x1_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_conv2d1x1_B2_sr_0_aunroll_x : bb_conv2d1x1_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d1x1_B2_out_inc,
        in_i_data_1 => bb_conv2d1x1_B2_out_c1_exe121,
        in_i_data_2 => bb_conv2d1x1_B2_out_c0_exe11,
        in_i_data_3 => bb_conv2d1x1_B2_out_c1_exe14,
        in_i_data_4 => bb_conv2d1x1_B2_out_c1_exe28,
        in_i_data_5 => bb_conv2d1x1_B2_out_c2_exe112,
        in_i_data_6 => bb_conv2d1x1_B2_out_unnamed_conv2d1x12,
        in_i_data_7 => bb_conv2d1x1_B2_out_j_01014,
        in_i_data_8 => bb_conv2d1x1_B2_out_add16,
        in_i_stall => bb_conv2d1x1_B2_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B2_out_valid_out_1,
        out_o_data_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_8,
        out_o_stall => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B2(BLACKBOX,11)
    thebb_conv2d1x1_B2 : bb_conv2d1x1_B2
    PORT MAP (
        in_add16_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_8,
        in_add16_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_8,
        in_c0_exe11_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_2,
        in_c0_exe11_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_2,
        in_c1_exe14_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_3,
        in_c1_exe14_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_3,
        in_c1_exe28_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_4,
        in_c1_exe28_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_4,
        in_c2_exe112_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_5,
        in_c2_exe112_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_5,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_01014_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_7,
        in_j_01014_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_7,
        in_k_18_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_0,
        in_k_18_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_0,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_stall,
        in_tmp_17_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_1,
        in_tmp_17_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_1,
        in_unnamed_conv2d1x12_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_6,
        in_unnamed_conv2d1x12_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_6,
        in_unnamed_conv2d1x14_avm_readdata => in_unnamed_conv2d1x14_avm_readdata,
        in_unnamed_conv2d1x14_avm_readdatavalid => in_unnamed_conv2d1x14_avm_readdatavalid,
        in_unnamed_conv2d1x14_avm_waitrequest => in_unnamed_conv2d1x14_avm_waitrequest,
        in_unnamed_conv2d1x14_avm_writeack => in_unnamed_conv2d1x14_avm_writeack,
        in_unnamed_conv2d1x15_avm_readdata => in_unnamed_conv2d1x15_avm_readdata,
        in_unnamed_conv2d1x15_avm_readdatavalid => in_unnamed_conv2d1x15_avm_readdatavalid,
        in_unnamed_conv2d1x15_avm_waitrequest => in_unnamed_conv2d1x15_avm_waitrequest,
        in_unnamed_conv2d1x15_avm_writeack => in_unnamed_conv2d1x15_avm_writeack,
        in_unnamed_conv2d1x16_avm_readdata => in_unnamed_conv2d1x16_avm_readdata,
        in_unnamed_conv2d1x16_avm_readdatavalid => in_unnamed_conv2d1x16_avm_readdatavalid,
        in_unnamed_conv2d1x16_avm_waitrequest => in_unnamed_conv2d1x16_avm_waitrequest,
        in_unnamed_conv2d1x16_avm_writeack => in_unnamed_conv2d1x16_avm_writeack,
        in_unnamed_conv2d1x17_avm_readdata => in_unnamed_conv2d1x17_avm_readdata,
        in_unnamed_conv2d1x17_avm_readdatavalid => in_unnamed_conv2d1x17_avm_readdatavalid,
        in_unnamed_conv2d1x17_avm_waitrequest => in_unnamed_conv2d1x17_avm_waitrequest,
        in_unnamed_conv2d1x17_avm_writeack => in_unnamed_conv2d1x17_avm_writeack,
        in_unnamed_conv2d1x18_avm_readdata => in_unnamed_conv2d1x18_avm_readdata,
        in_unnamed_conv2d1x18_avm_readdatavalid => in_unnamed_conv2d1x18_avm_readdatavalid,
        in_unnamed_conv2d1x18_avm_waitrequest => in_unnamed_conv2d1x18_avm_waitrequest,
        in_unnamed_conv2d1x18_avm_writeack => in_unnamed_conv2d1x18_avm_writeack,
        in_valid_in_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_valid,
        out_add16 => bb_conv2d1x1_B2_out_add16,
        out_c0_exe11 => bb_conv2d1x1_B2_out_c0_exe11,
        out_c1_exe121 => bb_conv2d1x1_B2_out_c1_exe121,
        out_c1_exe14 => bb_conv2d1x1_B2_out_c1_exe14,
        out_c1_exe28 => bb_conv2d1x1_B2_out_c1_exe28,
        out_c2_exe112 => bb_conv2d1x1_B2_out_c2_exe112,
        out_cmp9_phi_decision20_xor_RM => bb_conv2d1x1_B2_out_cmp9_phi_decision20_xor_RM,
        out_inc => bb_conv2d1x1_B2_out_inc,
        out_j_01014 => bb_conv2d1x1_B2_out_j_01014,
        out_stall_out_0 => bb_conv2d1x1_B2_out_stall_out_0,
        out_stall_out_1 => bb_conv2d1x1_B2_out_stall_out_1,
        out_unnamed_conv2d1x12 => bb_conv2d1x1_B2_out_unnamed_conv2d1x12,
        out_unnamed_conv2d1x14_avm_address => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_writedata,
        out_unnamed_conv2d1x15_avm_address => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_writedata,
        out_unnamed_conv2d1x16_avm_address => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_address,
        out_unnamed_conv2d1x16_avm_burstcount => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_burstcount,
        out_unnamed_conv2d1x16_avm_byteenable => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_byteenable,
        out_unnamed_conv2d1x16_avm_enable => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_enable,
        out_unnamed_conv2d1x16_avm_read => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_read,
        out_unnamed_conv2d1x16_avm_write => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_write,
        out_unnamed_conv2d1x16_avm_writedata => bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_writedata,
        out_unnamed_conv2d1x17_avm_address => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_writedata,
        out_unnamed_conv2d1x18_avm_address => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_address,
        out_unnamed_conv2d1x18_avm_burstcount => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_burstcount,
        out_unnamed_conv2d1x18_avm_byteenable => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_byteenable,
        out_unnamed_conv2d1x18_avm_enable => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_enable,
        out_unnamed_conv2d1x18_avm_read => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_read,
        out_unnamed_conv2d1x18_avm_write => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_write,
        out_unnamed_conv2d1x18_avm_writedata => bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_writedata,
        out_valid_out_0 => bb_conv2d1x1_B2_out_valid_out_0,
        out_valid_out_1 => bb_conv2d1x1_B2_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,8)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- bb_conv2d1x1_B2_sr_1_aunroll_x(BLACKBOX,5)
    thebb_conv2d1x1_B2_sr_1_aunroll_x : bb_conv2d1x1_B2_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d1x1_B1_out_unnamed_conv2d1x11,
        in_i_data_2 => bb_conv2d1x1_B1_out_c0_exe12,
        in_i_data_3 => bb_conv2d1x1_B1_out_c1_exe15,
        in_i_data_4 => bb_conv2d1x1_B1_out_c1_exe29,
        in_i_data_5 => bb_conv2d1x1_B1_out_c2_exe110,
        in_i_data_6 => bb_conv2d1x1_B1_out_unnamed_conv2d1x11,
        in_i_data_7 => bb_conv2d1x1_B1_out_j_010,
        in_i_data_8 => bb_conv2d1x1_B1_out_add,
        in_i_stall => bb_conv2d1x1_B2_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d1x11_out_o_valid,
        out_o_data_0 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_8,
        out_o_stall => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_conv2d1x11(BLACKBOX,62)
    theloop_limiter_conv2d1x11 : loop_limiter_conv2d1x11
    PORT MAP (
        in_i_stall => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d1x1_B1_out_valid_out_0,
        in_i_valid_exit => bb_conv2d1x1_B2_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d1x11_out_o_stall,
        out_o_valid => loop_limiter_conv2d1x11_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_conv2d1x10(BLACKBOX,61)
    theloop_limiter_conv2d1x10 : loop_limiter_conv2d1x10
    PORT MAP (
        in_i_stall => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d1x1_B0_out_valid_out_0,
        in_i_valid_exit => bb_conv2d1x1_B3_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d1x10_out_o_stall,
        out_o_valid => loop_limiter_conv2d1x10_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B0(BLACKBOX,9)
    thebb_conv2d1x1_B0 : bb_conv2d1x1_B0
    PORT MAP (
        in_filter_bias => in_arg_filter_bias,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_global_id_1_0 => in_arg_global_id_1,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_lsu_unnamed_conv2d1x10_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => loop_limiter_conv2d1x10_out_o_stall,
        in_stream_reset => in_valid_in,
        in_unnamed_conv2d1x10_avm_readdata => in_unnamed_conv2d1x10_avm_readdata,
        in_unnamed_conv2d1x10_avm_readdatavalid => in_unnamed_conv2d1x10_avm_readdatavalid,
        in_unnamed_conv2d1x10_avm_waitrequest => in_unnamed_conv2d1x10_avm_waitrequest,
        in_unnamed_conv2d1x10_avm_writeack => in_unnamed_conv2d1x10_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_c0_exe1 => bb_conv2d1x1_B0_out_c0_exe1,
        out_c1_exe1 => bb_conv2d1x1_B0_out_c1_exe1,
        out_c1_exe2 => bb_conv2d1x1_B0_out_c1_exe2,
        out_c2_exe1 => bb_conv2d1x1_B0_out_c2_exe1,
        out_stall_out_0 => bb_conv2d1x1_B0_out_stall_out_0,
        out_unnamed_conv2d1x10 => bb_conv2d1x1_B0_out_unnamed_conv2d1x10,
        out_unnamed_conv2d1x10_avm_address => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_address,
        out_unnamed_conv2d1x10_avm_burstcount => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_burstcount,
        out_unnamed_conv2d1x10_avm_byteenable => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_byteenable,
        out_unnamed_conv2d1x10_avm_enable => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_enable,
        out_unnamed_conv2d1x10_avm_read => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_read,
        out_unnamed_conv2d1x10_avm_write => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_write,
        out_unnamed_conv2d1x10_avm_writedata => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_writedata,
        out_valid_out_0 => bb_conv2d1x1_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_conv2d1x1_B1_sr_1_aunroll_x : bb_conv2d1x1_B1_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d1x1_B0_out_c0_exe1,
        in_i_data_2 => bb_conv2d1x1_B0_out_c1_exe1,
        in_i_data_3 => bb_conv2d1x1_B0_out_c1_exe2,
        in_i_data_4 => bb_conv2d1x1_B0_out_c2_exe1,
        in_i_data_5 => bb_conv2d1x1_B0_out_unnamed_conv2d1x10,
        in_i_stall => bb_conv2d1x1_B1_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d1x10_out_o_valid,
        out_o_data_0 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_stall => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B1(BLACKBOX,10)
    thebb_conv2d1x1_B1 : bb_conv2d1x1_B1
    PORT MAP (
        in_c0_exe12_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_1,
        in_c0_exe12_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_1,
        in_c1_exe15_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_2,
        in_c1_exe15_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_2,
        in_c1_exe29_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_3,
        in_c1_exe29_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_3,
        in_c2_exe110_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_4,
        in_c2_exe110_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_4,
        in_filter_weight => in_arg_filter_weight,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_010_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_0,
        in_j_010_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_0,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => loop_limiter_conv2d1x11_out_o_stall,
        in_unnamed_conv2d1x11_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_5,
        in_unnamed_conv2d1x11_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_5,
        in_valid_in_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_valid,
        out_add => bb_conv2d1x1_B1_out_add,
        out_c0_exe12 => bb_conv2d1x1_B1_out_c0_exe12,
        out_c1_exe15 => bb_conv2d1x1_B1_out_c1_exe15,
        out_c1_exe29 => bb_conv2d1x1_B1_out_c1_exe29,
        out_c2_exe110 => bb_conv2d1x1_B1_out_c2_exe110,
        out_j_010 => bb_conv2d1x1_B1_out_j_010,
        out_stall_out_0 => bb_conv2d1x1_B1_out_stall_out_0,
        out_stall_out_1 => bb_conv2d1x1_B1_out_stall_out_1,
        out_unnamed_conv2d1x11 => bb_conv2d1x1_B1_out_unnamed_conv2d1x11,
        out_valid_out_0 => bb_conv2d1x1_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_conv2d1x1_B1_sr_0_aunroll_x : bb_conv2d1x1_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d1x1_B3_out_inc68,
        in_i_data_1 => bb_conv2d1x1_B3_out_c0_exe13,
        in_i_data_2 => bb_conv2d1x1_B3_out_c1_exe16,
        in_i_data_3 => bb_conv2d1x1_B3_out_c1_exe27,
        in_i_data_4 => bb_conv2d1x1_B3_out_c2_exe111,
        in_i_data_5 => bb_conv2d1x1_B3_out_unnamed_conv2d1x19,
        in_i_stall => bb_conv2d1x1_B1_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B3_out_valid_out_1,
        out_o_data_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_stall => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B4(BLACKBOX,13)
    thebb_conv2d1x1_B4 : bb_conv2d1x1_B4
    PORT MAP (
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_valid,
        out_stall_out_0 => bb_conv2d1x1_B4_out_stall_out_0,
        out_valid_out_0 => bb_conv2d1x1_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_conv2d1x1_B4_sr_0_aunroll_x(BLACKBOX,7)
    thebb_conv2d1x1_B4_sr_0_aunroll_x : bb_conv2d1x1_B4_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_conv2d1x1_B4_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B3_out_valid_out_0,
        out_o_stall => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B3_sr_0_aunroll_x(BLACKBOX,6)
    thebb_conv2d1x1_B3_sr_0_aunroll_x : bb_conv2d1x1_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d1x1_B2_out_c0_exe11,
        in_i_data_1 => bb_conv2d1x1_B2_out_c1_exe14,
        in_i_data_2 => bb_conv2d1x1_B2_out_c1_exe28,
        in_i_data_3 => bb_conv2d1x1_B2_out_c2_exe112,
        in_i_data_4 => bb_conv2d1x1_B2_out_unnamed_conv2d1x12,
        in_i_data_5 => bb_conv2d1x1_B2_out_j_01014,
        in_i_data_6 => bb_conv2d1x1_B2_out_add16,
        in_i_data_7 => bb_conv2d1x1_B2_out_cmp9_phi_decision20_xor_RM,
        in_i_data_8 => bb_conv2d1x1_B2_out_c1_exe121,
        in_i_stall => bb_conv2d1x1_B3_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B2_out_valid_out_0,
        out_o_data_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_stall => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B3(BLACKBOX,12)
    thebb_conv2d1x1_B3 : bb_conv2d1x1_B3
    PORT MAP (
        in_add15_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_6,
        in_c0_exe13_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_0,
        in_c1_exe12118_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_8,
        in_c1_exe16_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_1,
        in_c1_exe27_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_2,
        in_c2_exe111_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_3,
        in_cmp9_phi_decision20_xor_RM17_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_7,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_01013_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_5,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_stall,
        in_unnamed_conv2d1x111_avm_readdata => in_unnamed_conv2d1x111_avm_readdata,
        in_unnamed_conv2d1x111_avm_readdatavalid => in_unnamed_conv2d1x111_avm_readdatavalid,
        in_unnamed_conv2d1x111_avm_waitrequest => in_unnamed_conv2d1x111_avm_waitrequest,
        in_unnamed_conv2d1x111_avm_writeack => in_unnamed_conv2d1x111_avm_writeack,
        in_unnamed_conv2d1x19_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_data_4,
        in_valid_in_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_valid,
        out_c0_exe13 => bb_conv2d1x1_B3_out_c0_exe13,
        out_c1_exe16 => bb_conv2d1x1_B3_out_c1_exe16,
        out_c1_exe27 => bb_conv2d1x1_B3_out_c1_exe27,
        out_c2_exe111 => bb_conv2d1x1_B3_out_c2_exe111,
        out_inc68 => bb_conv2d1x1_B3_out_inc68,
        out_lsu_unnamed_conv2d1x111_o_active => bb_conv2d1x1_B3_out_lsu_unnamed_conv2d1x111_o_active,
        out_stall_out_0 => bb_conv2d1x1_B3_out_stall_out_0,
        out_unnamed_conv2d1x111_avm_address => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_address,
        out_unnamed_conv2d1x111_avm_burstcount => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_burstcount,
        out_unnamed_conv2d1x111_avm_byteenable => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_byteenable,
        out_unnamed_conv2d1x111_avm_enable => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_enable,
        out_unnamed_conv2d1x111_avm_read => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_read,
        out_unnamed_conv2d1x111_avm_write => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_write,
        out_unnamed_conv2d1x111_avm_writedata => bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_writedata,
        out_unnamed_conv2d1x19 => bb_conv2d1x1_B3_out_unnamed_conv2d1x19,
        out_valid_out_0 => bb_conv2d1x1_B3_out_valid_out_0,
        out_valid_out_1 => bb_conv2d1x1_B3_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_o_active_unnamed_conv2d1x111(GPOUT,63)
    out_o_active_unnamed_conv2d1x111 <= bb_conv2d1x1_B3_out_lsu_unnamed_conv2d1x111_o_active;

    -- out_stall_out(GPOUT,64)
    out_stall_out <= bb_conv2d1x1_B0_out_stall_out_0;

    -- out_unnamed_conv2d1x10_avm_address(GPOUT,65)
    out_unnamed_conv2d1x10_avm_address <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_address;

    -- out_unnamed_conv2d1x10_avm_burstcount(GPOUT,66)
    out_unnamed_conv2d1x10_avm_burstcount <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_burstcount;

    -- out_unnamed_conv2d1x10_avm_byteenable(GPOUT,67)
    out_unnamed_conv2d1x10_avm_byteenable <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_byteenable;

    -- out_unnamed_conv2d1x10_avm_enable(GPOUT,68)
    out_unnamed_conv2d1x10_avm_enable <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_enable;

    -- out_unnamed_conv2d1x10_avm_read(GPOUT,69)
    out_unnamed_conv2d1x10_avm_read <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_read;

    -- out_unnamed_conv2d1x10_avm_write(GPOUT,70)
    out_unnamed_conv2d1x10_avm_write <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_write;

    -- out_unnamed_conv2d1x10_avm_writedata(GPOUT,71)
    out_unnamed_conv2d1x10_avm_writedata <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_writedata;

    -- out_unnamed_conv2d1x111_avm_address(GPOUT,72)
    out_unnamed_conv2d1x111_avm_address <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_address;

    -- out_unnamed_conv2d1x111_avm_burstcount(GPOUT,73)
    out_unnamed_conv2d1x111_avm_burstcount <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_burstcount;

    -- out_unnamed_conv2d1x111_avm_byteenable(GPOUT,74)
    out_unnamed_conv2d1x111_avm_byteenable <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_byteenable;

    -- out_unnamed_conv2d1x111_avm_enable(GPOUT,75)
    out_unnamed_conv2d1x111_avm_enable <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_enable;

    -- out_unnamed_conv2d1x111_avm_read(GPOUT,76)
    out_unnamed_conv2d1x111_avm_read <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_read;

    -- out_unnamed_conv2d1x111_avm_write(GPOUT,77)
    out_unnamed_conv2d1x111_avm_write <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_write;

    -- out_unnamed_conv2d1x111_avm_writedata(GPOUT,78)
    out_unnamed_conv2d1x111_avm_writedata <= bb_conv2d1x1_B3_out_unnamed_conv2d1x111_avm_writedata;

    -- out_unnamed_conv2d1x14_avm_address(GPOUT,79)
    out_unnamed_conv2d1x14_avm_address <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_address;

    -- out_unnamed_conv2d1x14_avm_burstcount(GPOUT,80)
    out_unnamed_conv2d1x14_avm_burstcount <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_burstcount;

    -- out_unnamed_conv2d1x14_avm_byteenable(GPOUT,81)
    out_unnamed_conv2d1x14_avm_byteenable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_byteenable;

    -- out_unnamed_conv2d1x14_avm_enable(GPOUT,82)
    out_unnamed_conv2d1x14_avm_enable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_enable;

    -- out_unnamed_conv2d1x14_avm_read(GPOUT,83)
    out_unnamed_conv2d1x14_avm_read <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_read;

    -- out_unnamed_conv2d1x14_avm_write(GPOUT,84)
    out_unnamed_conv2d1x14_avm_write <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_write;

    -- out_unnamed_conv2d1x14_avm_writedata(GPOUT,85)
    out_unnamed_conv2d1x14_avm_writedata <= bb_conv2d1x1_B2_out_unnamed_conv2d1x14_avm_writedata;

    -- out_unnamed_conv2d1x15_avm_address(GPOUT,86)
    out_unnamed_conv2d1x15_avm_address <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_address;

    -- out_unnamed_conv2d1x15_avm_burstcount(GPOUT,87)
    out_unnamed_conv2d1x15_avm_burstcount <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_burstcount;

    -- out_unnamed_conv2d1x15_avm_byteenable(GPOUT,88)
    out_unnamed_conv2d1x15_avm_byteenable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_byteenable;

    -- out_unnamed_conv2d1x15_avm_enable(GPOUT,89)
    out_unnamed_conv2d1x15_avm_enable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_enable;

    -- out_unnamed_conv2d1x15_avm_read(GPOUT,90)
    out_unnamed_conv2d1x15_avm_read <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_read;

    -- out_unnamed_conv2d1x15_avm_write(GPOUT,91)
    out_unnamed_conv2d1x15_avm_write <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_write;

    -- out_unnamed_conv2d1x15_avm_writedata(GPOUT,92)
    out_unnamed_conv2d1x15_avm_writedata <= bb_conv2d1x1_B2_out_unnamed_conv2d1x15_avm_writedata;

    -- out_unnamed_conv2d1x16_avm_address(GPOUT,93)
    out_unnamed_conv2d1x16_avm_address <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_address;

    -- out_unnamed_conv2d1x16_avm_burstcount(GPOUT,94)
    out_unnamed_conv2d1x16_avm_burstcount <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_burstcount;

    -- out_unnamed_conv2d1x16_avm_byteenable(GPOUT,95)
    out_unnamed_conv2d1x16_avm_byteenable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_byteenable;

    -- out_unnamed_conv2d1x16_avm_enable(GPOUT,96)
    out_unnamed_conv2d1x16_avm_enable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_enable;

    -- out_unnamed_conv2d1x16_avm_read(GPOUT,97)
    out_unnamed_conv2d1x16_avm_read <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_read;

    -- out_unnamed_conv2d1x16_avm_write(GPOUT,98)
    out_unnamed_conv2d1x16_avm_write <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_write;

    -- out_unnamed_conv2d1x16_avm_writedata(GPOUT,99)
    out_unnamed_conv2d1x16_avm_writedata <= bb_conv2d1x1_B2_out_unnamed_conv2d1x16_avm_writedata;

    -- out_unnamed_conv2d1x17_avm_address(GPOUT,100)
    out_unnamed_conv2d1x17_avm_address <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_address;

    -- out_unnamed_conv2d1x17_avm_burstcount(GPOUT,101)
    out_unnamed_conv2d1x17_avm_burstcount <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_burstcount;

    -- out_unnamed_conv2d1x17_avm_byteenable(GPOUT,102)
    out_unnamed_conv2d1x17_avm_byteenable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_byteenable;

    -- out_unnamed_conv2d1x17_avm_enable(GPOUT,103)
    out_unnamed_conv2d1x17_avm_enable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_enable;

    -- out_unnamed_conv2d1x17_avm_read(GPOUT,104)
    out_unnamed_conv2d1x17_avm_read <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_read;

    -- out_unnamed_conv2d1x17_avm_write(GPOUT,105)
    out_unnamed_conv2d1x17_avm_write <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_write;

    -- out_unnamed_conv2d1x17_avm_writedata(GPOUT,106)
    out_unnamed_conv2d1x17_avm_writedata <= bb_conv2d1x1_B2_out_unnamed_conv2d1x17_avm_writedata;

    -- out_unnamed_conv2d1x18_avm_address(GPOUT,107)
    out_unnamed_conv2d1x18_avm_address <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_address;

    -- out_unnamed_conv2d1x18_avm_burstcount(GPOUT,108)
    out_unnamed_conv2d1x18_avm_burstcount <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_burstcount;

    -- out_unnamed_conv2d1x18_avm_byteenable(GPOUT,109)
    out_unnamed_conv2d1x18_avm_byteenable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_byteenable;

    -- out_unnamed_conv2d1x18_avm_enable(GPOUT,110)
    out_unnamed_conv2d1x18_avm_enable <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_enable;

    -- out_unnamed_conv2d1x18_avm_read(GPOUT,111)
    out_unnamed_conv2d1x18_avm_read <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_read;

    -- out_unnamed_conv2d1x18_avm_write(GPOUT,112)
    out_unnamed_conv2d1x18_avm_write <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_write;

    -- out_unnamed_conv2d1x18_avm_writedata(GPOUT,113)
    out_unnamed_conv2d1x18_avm_writedata <= bb_conv2d1x1_B2_out_unnamed_conv2d1x18_avm_writedata;

    -- out_valid_out(GPOUT,114)
    out_valid_out <= bb_conv2d1x1_B4_out_valid_out_0;

END normal;
