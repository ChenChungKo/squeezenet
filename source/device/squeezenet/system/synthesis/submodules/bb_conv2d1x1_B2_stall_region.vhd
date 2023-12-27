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

-- VHDL created from bb_conv2d1x1_B2_stall_region
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

entity bb_conv2d1x1_B2_stall_region is
    port (
        in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_add16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe28 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe112 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01014 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_17 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_add16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe121 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe28 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe112 : out std_logic_vector(31 downto 0);  -- ufix32
        out_cmp9_phi_decision20_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_01014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d1x13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x16_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x16_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x16_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x16_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_conv2d1x18_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x18_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x18_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x18_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x18_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x18_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x18_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x18_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B2_stall_region;

architecture normal of bb_conv2d1x1_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1 is
        port (
            in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_0_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_1_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_2_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_3_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit20_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit20_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x18_conv2d1x156 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x18_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x18_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1 is
        port (
            in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit14_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit14_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit14_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit14_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit14_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x14_conv2d1x148 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x15_conv2d1x150 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x16_conv2d1x152 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x17_conv2d1x154 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_weight_sync_buffer_conv2d1x124 is
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


    component i_syncbuf_input_channels_sync_buffer2_conv2d1x126 is
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


    component i_syncbuf_input_channels_sync_buffer_conv2d1x122 is
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


    component i_syncbuf_input_size_sync_buffer6_conv2d1x120 is
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
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_c1_exit20_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_inc_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_multconst_x_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom21_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_ptr_sum_conv2d1x1_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d1x1_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d1x1_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d1x1_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_cmp126_neg_rm_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp126_neg_rm_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp126_neg_rm_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp126_neg_rm_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp9_phi_decision20_xor_rm_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_phi_decision20_xor_rm_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_phi_decision20_xor_rm_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_phi_decision20_xor_rm_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_guard_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x158_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (351 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x16_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x16_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x17_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x17_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_channels_sync_buffer_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_channels_sync_buffer_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_sync_buffer6_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_sync_buffer6_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (351 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp126_neg_rm_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp126_neg_rm_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp126_neg_rm_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp126_neg_rm_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp126_neg_rm_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp126_neg_rm_conv2d1x1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_conv2d1x1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data5 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data6 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data7 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D5 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D6 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D7 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- i_load_unnamed_conv2d1x17_conv2d1x1(BLACKBOX,75)@12
    -- in in_i_stall@20000000
    -- out out_o_readdata@134
    -- out out_o_stall@20000000
    -- out out_o_valid@134
    -- out out_unnamed_conv2d1x17_avm_address@20000000
    -- out out_unnamed_conv2d1x17_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x17_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x17_avm_enable@20000000
    -- out out_unnamed_conv2d1x17_avm_read@20000000
    -- out out_unnamed_conv2d1x17_avm_write@20000000
    -- out out_unnamed_conv2d1x17_avm_writedata@20000000
    thei_load_unnamed_conv2d1x17_conv2d1x1 : i_load_unnamed_conv2d1x17_conv2d1x154
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D7,
        in_i_predicate => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D4,
        in_i_stall => SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall,
        in_i_valid => SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V3,
        in_unnamed_conv2d1x17_avm_readdata => in_unnamed_conv2d1x17_avm_readdata,
        in_unnamed_conv2d1x17_avm_readdatavalid => in_unnamed_conv2d1x17_avm_readdatavalid,
        in_unnamed_conv2d1x17_avm_waitrequest => in_unnamed_conv2d1x17_avm_waitrequest,
        in_unnamed_conv2d1x17_avm_writeack => in_unnamed_conv2d1x17_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x17_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x17_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x17_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x17_avm_address => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- i_load_unnamed_conv2d1x16_conv2d1x1(BLACKBOX,74)@12
    -- in in_i_stall@20000000
    -- out out_o_readdata@134
    -- out out_o_stall@20000000
    -- out out_o_valid@134
    -- out out_unnamed_conv2d1x16_avm_address@20000000
    -- out out_unnamed_conv2d1x16_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x16_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x16_avm_enable@20000000
    -- out out_unnamed_conv2d1x16_avm_read@20000000
    -- out out_unnamed_conv2d1x16_avm_write@20000000
    -- out out_unnamed_conv2d1x16_avm_writedata@20000000
    thei_load_unnamed_conv2d1x16_conv2d1x1 : i_load_unnamed_conv2d1x16_conv2d1x152
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D6,
        in_i_predicate => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D3,
        in_i_stall => SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall,
        in_i_valid => SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V2,
        in_unnamed_conv2d1x16_avm_readdata => in_unnamed_conv2d1x16_avm_readdata,
        in_unnamed_conv2d1x16_avm_readdatavalid => in_unnamed_conv2d1x16_avm_readdatavalid,
        in_unnamed_conv2d1x16_avm_waitrequest => in_unnamed_conv2d1x16_avm_waitrequest,
        in_unnamed_conv2d1x16_avm_writeack => in_unnamed_conv2d1x16_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x16_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x16_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x16_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x16_avm_address => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_address,
        out_unnamed_conv2d1x16_avm_burstcount => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_burstcount,
        out_unnamed_conv2d1x16_avm_byteenable => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_byteenable,
        out_unnamed_conv2d1x16_avm_enable => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_enable,
        out_unnamed_conv2d1x16_avm_read => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_read,
        out_unnamed_conv2d1x16_avm_write => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_write,
        out_unnamed_conv2d1x16_avm_writedata => i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- i_load_unnamed_conv2d1x14_conv2d1x1(BLACKBOX,72)@12
    -- in in_i_stall@20000000
    -- out out_o_readdata@134
    -- out out_o_stall@20000000
    -- out out_o_valid@134
    -- out out_unnamed_conv2d1x14_avm_address@20000000
    -- out out_unnamed_conv2d1x14_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x14_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x14_avm_enable@20000000
    -- out out_unnamed_conv2d1x14_avm_read@20000000
    -- out out_unnamed_conv2d1x14_avm_write@20000000
    -- out out_unnamed_conv2d1x14_avm_writedata@20000000
    thei_load_unnamed_conv2d1x14_conv2d1x1 : i_load_unnamed_conv2d1x14_conv2d1x148
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D0,
        in_i_predicate => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D1,
        in_i_stall => SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall,
        in_i_valid => SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V0,
        in_unnamed_conv2d1x14_avm_readdata => in_unnamed_conv2d1x14_avm_readdata,
        in_unnamed_conv2d1x14_avm_readdatavalid => in_unnamed_conv2d1x14_avm_readdatavalid,
        in_unnamed_conv2d1x14_avm_waitrequest => in_unnamed_conv2d1x14_avm_waitrequest,
        in_unnamed_conv2d1x14_avm_writeack => in_unnamed_conv2d1x14_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x14_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x14_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x14_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x14_avm_address => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo(STALLENABLE,299)
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg1 <= (others => '0');
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg2 <= (others => '0');
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg0 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg1 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg1;
            -- Succesor 2
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg2 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg2;
            -- Succesor 3
            SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg3 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed0 <= (not (i_load_unnamed_conv2d1x14_conv2d1x1_out_o_stall) and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid) or SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg0;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed1 <= (not (i_load_unnamed_conv2d1x15_conv2d1x1_out_o_stall) and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid) or SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg1;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed2 <= (not (i_load_unnamed_conv2d1x16_conv2d1x1_out_o_stall) and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid) or SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg2;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed3 <= (not (i_load_unnamed_conv2d1x17_conv2d1x1_out_o_stall) and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid) or SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg3;
    -- Consuming
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_StallValid <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg0 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_StallValid and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed0;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg1 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_StallValid and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed1;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg2 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_StallValid and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed2;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_toReg3 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_StallValid and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed3;
    -- Backward Stall generation
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or0 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed0;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or1 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed1 and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or0;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or2 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed2 and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or1;
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireStall <= not (SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_consumed3 and SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_or2);
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V0 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid and not (SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg0);
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V1 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid and not (SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg1);
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V2 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid and not (SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg2);
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V3 <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid and not (SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_fromReg3);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_wireValid <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V;

    -- i_idxprom21_conv2d1x1_sel_x(BITSELECT,52)@1
    i_idxprom21_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_add_ptr_sum_conv2d1x1(ADD,63)@1
    i_add_ptr_sum_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & i_idxprom21_conv2d1x1_sel_x_b);
    i_add_ptr_sum_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d);
    i_add_ptr_sum_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr_sum_conv2d1x1_a) + UNSIGNED(i_add_ptr_sum_conv2d1x1_b));
    i_add_ptr_sum_conv2d1x1_q <= i_add_ptr_sum_conv2d1x1_o(64 downto 0);

    -- bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x(BITSELECT,3)@1
    bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b <= i_add_ptr_sum_conv2d1x1_q(63 downto 0);

    -- bubble_join_conv2d1x1_B2_merge_reg_aunroll_x(BITJOIN,167)
    bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q <= conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d1x1_B2_merge_reg_aunroll_x(BITSELECT,168)
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(159 downto 128));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(223 downto 160));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(255 downto 224));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(287 downto 256));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(319 downto 288));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(351 downto 320));

    -- redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0(REG,156)
    redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0(REG,149)
    redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0(REG,144)
    redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_multconst_x(CONSTANT,46)
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0(REG,161)
    redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D3);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select(BITSELECT,120)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_b <= redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_c <= redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_d <= redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_e <= redist18_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0(BITSHIFT,117)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_c & "0000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0_qint(13 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15(BITSHIFT,110)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im3_shift0_q) & "0000000000000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0(BITSHIFT,118)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_d & "0000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0_qint(21 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14(BITSHIFT,109)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14_qint(40 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_16(BITJOIN,111)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_16_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_15_q & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_14_q;

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0(BITSHIFT,119)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_e & "0000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0_qint(21 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12(BITSHIFT,107)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0(BITSHIFT,116)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_bs1_merged_bit_select_b & "0000";
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0_qint(21 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_13(BITJOIN,108)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_13_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_im0_shift0_q);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0(ADD,112)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_13_q);
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_join_16_q);
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_b));
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_o(69 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_mult_extender_x(BITJOIN,45)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_mult_extender_x_q <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_multconst_x_q & i_arrayidx22_conv2d1x1_conv2d1x147_mult_x_result_add_0_0_q(68 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x(BITSELECT,47)@2
    i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b <= i_arrayidx22_conv2d1x1_conv2d1x147_mult_extender_x_q(63 downto 0);

    -- redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1(REG,145)
    redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo(STALLENABLE,306)
    -- Valid signal propagation
    SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_V0 <= SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_backStall <= SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backStall or not (SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_wireValid <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_out;

    -- redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo(STALLFIFO,146)
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_in <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V2;
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_in <= SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_backStall;
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_data_in <= redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_q;
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_in_bitsignaltemp <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_in(0);
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_in_bitsignaltemp <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_in(0);
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_out(0) <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_out_bitsignaltemp;
    redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_out(0) <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_out_bitsignaltemp;
    theredist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_in_bitsignaltemp,
        data_in => redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        valid_out => redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_out_bitsignaltemp,
        data_out => redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1(REG,157)
    redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1(REG,150)
    redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x(BLACKBOX,54)@3
    -- in in_i_stall@20000000
    -- out out_c0_exit14_0@12
    -- out out_c0_exit14_1@12
    -- out out_c0_exit14_2@12
    -- out out_c0_exit14_3@12
    -- out out_c0_exit14_4@12
    -- out out_o_stall@20000000
    -- out out_o_valid@12
    thei_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x : i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1
    PORT MAP (
        in_c0_eni3_0 => GND_q,
        in_c0_eni3_1 => redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_c0_eni3_2 => redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_q,
        in_c0_eni3_3 => redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_q,
        in_i_stall => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall,
        in_i_valid => SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V1,
        in_input_im => in_input_im,
        out_c0_exit14_1 => i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_1,
        out_c0_exit14_2 => i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_2,
        out_c0_exit14_3 => i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_3,
        out_c0_exit14_4 => i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_4,
        out_o_stall => i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,58)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- bubble_join_i_syncbuf_input_channels_sync_buffer_conv2d1x1(BITJOIN,199)
    bubble_join_i_syncbuf_input_channels_sync_buffer_conv2d1x1_q <= i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_channels_sync_buffer_conv2d1x1(BITSELECT,200)
    bubble_select_i_syncbuf_input_channels_sync_buffer_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_channels_sync_buffer_conv2d1x1_q(31 downto 0));

    -- SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1(STALLENABLE,279)
    -- Valid signal propagation
    SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_V0 <= SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_backStall <= SR_SE_i_cmp126_neg_rm_conv2d1x1_backStall or not (SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_wireValid <= i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_valid_out;

    -- SR_SE_i_cmp126_neg_rm_conv2d1x1(STALLREG,452)
    SR_SE_i_cmp126_neg_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_cmp126_neg_rm_conv2d1x1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid <= SE_i_cmp126_neg_rm_conv2d1x1_backStall and (SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid or SR_SE_i_cmp126_neg_rm_conv2d1x1_i_valid);

            IF (SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp126_neg_rm_conv2d1x1_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_channels_sync_buffer_conv2d1x1_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp126_neg_rm_conv2d1x1_i_valid <= SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_V0;
    -- Stall signal propagation
    SR_SE_i_cmp126_neg_rm_conv2d1x1_backStall <= SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid or not (SR_SE_i_cmp126_neg_rm_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_cmp126_neg_rm_conv2d1x1_V <= SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid WHEN SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid = "1" ELSE SR_SE_i_cmp126_neg_rm_conv2d1x1_i_valid;

    SR_SE_i_cmp126_neg_rm_conv2d1x1_D0 <= SR_SE_i_cmp126_neg_rm_conv2d1x1_r_data0 WHEN SR_SE_i_cmp126_neg_rm_conv2d1x1_r_valid = "1" ELSE bubble_select_i_syncbuf_input_channels_sync_buffer_conv2d1x1_b;

    -- i_cmp126_neg_rm_conv2d1x1(COMPARE,64)@2 + 1
    i_cmp126_neg_rm_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp126_neg_rm_conv2d1x1_D0(31)) & SR_SE_i_cmp126_neg_rm_conv2d1x1_D0));
    i_cmp126_neg_rm_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp126_neg_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp126_neg_rm_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp126_neg_rm_conv2d1x1_backEN = "1") THEN
                i_cmp126_neg_rm_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp126_neg_rm_conv2d1x1_a) - SIGNED(i_cmp126_neg_rm_conv2d1x1_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp126_neg_rm_conv2d1x1_c(0) <= i_cmp126_neg_rm_conv2d1x1_o(33);

    -- bubble_join_i_syncbuf_input_size_sync_buffer6_conv2d1x1(BITJOIN,202)
    bubble_join_i_syncbuf_input_size_sync_buffer6_conv2d1x1_q <= i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_sync_buffer6_conv2d1x1(BITSELECT,203)
    bubble_select_i_syncbuf_input_size_sync_buffer6_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_sync_buffer6_conv2d1x1_q(31 downto 0));

    -- SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1(STALLENABLE,281)
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_backStall <= SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backStall or not (SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_wireValid <= i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_valid_out;

    -- SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1(STALLREG,453)
    SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backStall and (SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid or SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_i_valid);

            IF (SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_size_sync_buffer6_conv2d1x1_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_i_valid <= SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_V0;
    -- Stall signal propagation
    SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backStall <= SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid or not (SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V <= SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid WHEN SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid = "1" ELSE SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_i_valid;

    SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_D0 <= SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_data0 WHEN SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_r_valid = "1" ELSE bubble_select_i_syncbuf_input_size_sync_buffer6_conv2d1x1_b;

    -- i_cmp9_phi_decision20_xor_rm_conv2d1x1(COMPARE,66)@2 + 1
    i_cmp9_phi_decision20_xor_rm_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_D0(31)) & SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_D0));
    i_cmp9_phi_decision20_xor_rm_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp9_phi_decision20_xor_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp9_phi_decision20_xor_rm_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN = "1") THEN
                i_cmp9_phi_decision20_xor_rm_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp9_phi_decision20_xor_rm_conv2d1x1_a) - SIGNED(i_cmp9_phi_decision20_xor_rm_conv2d1x1_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp9_phi_decision20_xor_rm_conv2d1x1_c(0) <= i_cmp9_phi_decision20_xor_rm_conv2d1x1_o(33);

    -- i_cmp9_phi_decision20_xor_or_rm_conv2d1x1(LOGICAL,65)@3
    i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q <= i_cmp9_phi_decision20_xor_rm_conv2d1x1_c or i_cmp126_neg_rm_conv2d1x1_c;

    -- redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo(STALLFIFO,141)
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_in <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_V1;
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_in <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall;
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_data_in <= i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q;
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_in_bitsignaltemp <= redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_in(0);
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_in_bitsignaltemp <= redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_in(0);
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_out(0) <= redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_out_bitsignaltemp;
    redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_out(0) <= redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_out_bitsignaltemp;
    theredist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q,
        valid_out => redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1(STALLENABLE,262)
    -- Valid signal propagation
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V0 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0;
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V1 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1;
    -- Stall signal propagation
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_0 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_backStall and SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0;
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_1 <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_out and SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1;
    -- Backward Enable generation
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_or0 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_0;
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN <= not (SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_1 or SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_or0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_v_s_0 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN and SR_SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backStall <= not (SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN);
    SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0 <= (others => '0');
            SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN = "0") THEN
                SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0 and SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_0;
            ELSE
                SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_0 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_v_s_0;
            END IF;

            IF (SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_backEN = "0") THEN
                SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1 and SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_s_tv_1;
            ELSE
                SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_R_v_1 <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_cmp126_neg_rm_conv2d1x1(STALLENABLE,260)
    -- Valid signal propagation
    SE_i_cmp126_neg_rm_conv2d1x1_V0 <= SE_i_cmp126_neg_rm_conv2d1x1_R_v_0;
    SE_i_cmp126_neg_rm_conv2d1x1_V1 <= SE_i_cmp126_neg_rm_conv2d1x1_R_v_1;
    -- Stall signal propagation
    SE_i_cmp126_neg_rm_conv2d1x1_s_tv_0 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_backStall and SE_i_cmp126_neg_rm_conv2d1x1_R_v_0;
    SE_i_cmp126_neg_rm_conv2d1x1_s_tv_1 <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_out and SE_i_cmp126_neg_rm_conv2d1x1_R_v_1;
    -- Backward Enable generation
    SE_i_cmp126_neg_rm_conv2d1x1_or0 <= SE_i_cmp126_neg_rm_conv2d1x1_s_tv_0;
    SE_i_cmp126_neg_rm_conv2d1x1_backEN <= not (SE_i_cmp126_neg_rm_conv2d1x1_s_tv_1 or SE_i_cmp126_neg_rm_conv2d1x1_or0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp126_neg_rm_conv2d1x1_v_s_0 <= SE_i_cmp126_neg_rm_conv2d1x1_backEN and SR_SE_i_cmp126_neg_rm_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_cmp126_neg_rm_conv2d1x1_backStall <= not (SE_i_cmp126_neg_rm_conv2d1x1_backEN);
    SE_i_cmp126_neg_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp126_neg_rm_conv2d1x1_R_v_0 <= (others => '0');
            SE_i_cmp126_neg_rm_conv2d1x1_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp126_neg_rm_conv2d1x1_backEN = "0") THEN
                SE_i_cmp126_neg_rm_conv2d1x1_R_v_0 <= SE_i_cmp126_neg_rm_conv2d1x1_R_v_0 and SE_i_cmp126_neg_rm_conv2d1x1_s_tv_0;
            ELSE
                SE_i_cmp126_neg_rm_conv2d1x1_R_v_0 <= SE_i_cmp126_neg_rm_conv2d1x1_v_s_0;
            END IF;

            IF (SE_i_cmp126_neg_rm_conv2d1x1_backEN = "0") THEN
                SE_i_cmp126_neg_rm_conv2d1x1_R_v_1 <= SE_i_cmp126_neg_rm_conv2d1x1_R_v_1 and SE_i_cmp126_neg_rm_conv2d1x1_s_tv_1;
            ELSE
                SE_i_cmp126_neg_rm_conv2d1x1_R_v_1 <= SE_i_cmp126_neg_rm_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1(STALLENABLE,261)
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg0 <= (others => '0');
            SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg0 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_toReg0;
            -- Succesor 1
            SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg1 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed0 <= (not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall) and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid) or SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg0;
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed1 <= (not (redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_stall_out) and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid) or SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg1;
    -- Consuming
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_StallValid <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_backStall and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid;
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_toReg0 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_StallValid and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed0;
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_toReg1 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_StallValid and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_or0 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed0;
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireStall <= not (SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_consumed1 and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_or0);
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_backStall <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_V0 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid and not (SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg0);
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_V1 <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid and not (SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_and0 <= SE_i_cmp126_neg_rm_conv2d1x1_V0;
    SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_wireValid <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V0 and SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_and0;

    -- SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3(STALLENABLE,345)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_V0 <= SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_backStall <= i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_stall_out or not (SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_wireValid <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_out;

    -- i_syncbuf_filter_weight_sync_buffer_conv2d1x1(BLACKBOX,76)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_weight_sync_buffer_conv2d1x1 : i_syncbuf_filter_weight_sync_buffer_conv2d1x124
    PORT MAP (
        in_buffer_in => in_filter_weight,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_V0,
        out_buffer_out => i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1(STALLENABLE,275)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_V0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_stall or not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and0 <= i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_valid_out;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and1 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and0;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid <= SE_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and1;

    -- SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0(STALLENABLE,302)
    -- Valid signal propagation
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V0 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V1 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V2 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V3 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V4 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4;
    -- Stall signal propagation
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_1 <= i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_o_stall and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_2 <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_stall_out and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_3 <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_out and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_4 <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_out and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4;
    -- Backward Enable generation
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or0 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or1 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_1 or SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or0;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or2 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_2 or SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or1;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or3 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_3 or SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or2;
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN <= not (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_4 or SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_or3);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN and SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backStall <= not (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN);
    SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
            SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2 <= (others => '0');
            SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3 <= (others => '0');
            SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0 and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_0 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1 and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_1 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2 and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_2;
            ELSE
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_2 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3 and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_3;
            ELSE
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_3 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4 and SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_s_tv_4;
            ELSE
                SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_R_v_4 <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0(STALLREG,451)
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
            SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data1 <= (others => '-');
            SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data2 <= (others => '-');
            SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backStall and (SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid or SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b);
                SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data1 <= STD_LOGIC_VECTOR(redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_q);
                SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data2 <= STD_LOGIC_VECTOR(redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0_q);
                SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data3 <= STD_LOGIC_VECTOR(redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_i_valid <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V2;
    -- Stall signal propagation
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backStall <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_i_valid;

    -- Data0
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D0 <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b;
    -- Data1
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D1 <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data1 WHEN SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid = "1" ELSE redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_q;
    -- Data2
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D2 <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data2 WHEN SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid = "1" ELSE redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_0_q;
    -- Data3
    SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D3 <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_data3 WHEN SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_r_valid = "1" ELSE redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_0_q;

    -- i_syncbuf_input_channels_sync_buffer_conv2d1x1(BLACKBOX,78)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_channels_sync_buffer_conv2d1x1 : i_syncbuf_input_channels_sync_buffer_conv2d1x122
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_channels_sync_buffer_conv2d1x1_backStall,
        in_valid_in => SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V1,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_input_size_sync_buffer6_conv2d1x1(BLACKBOX,79)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_sync_buffer6_conv2d1x1 : i_syncbuf_input_size_sync_buffer6_conv2d1x120
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_sync_buffer6_conv2d1x1_backStall,
        in_valid_in => SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V0,
        out_buffer_out => i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0(STALLENABLE,303)
    -- Valid signal propagation
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V0 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V1 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1;
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V2 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2;
    -- Stall signal propagation
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 <= i_syncbuf_input_size_sync_buffer6_conv2d1x1_out_stall_out and SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_1 <= i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_stall_out and SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1;
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_2 <= SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backStall and SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2;
    -- Backward Enable generation
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_or0 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0;
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_or1 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_1 or SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_or0;
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN <= not (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_2 or SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN and SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V;
    -- Backward Stall generation
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backStall <= not (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN);
    SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= (others => '0');
            SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1 <= (others => '0');
            SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "0") THEN
                SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 and SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0;
            ELSE
                SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0;
            END IF;

            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "0") THEN
                SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1 and SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_1;
            ELSE
                SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_1 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0;
            END IF;

            IF (SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "0") THEN
                SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2 and SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_2;
            ELSE
                SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_2 <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0(STALLREG,450)
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid <= (others => '0');
            SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data0 <= (others => '-');
            SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data1 <= (others => '-');
            SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data2 <= (others => '-');
            SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid <= SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backStall and (SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid or SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_i_valid);

            IF (SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b);
                SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data1 <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e);
                SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data2 <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_j);
                SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data3 <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_i_valid <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V2;
    -- Stall signal propagation
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backStall <= SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid or not (SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_i_valid);

    -- Valid
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_V <= SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid WHEN SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid = "1" ELSE SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_i_valid;

    -- Data0
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D0 <= SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data0 WHEN SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid = "1" ELSE bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b;
    -- Data1
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D1 <= SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data1 WHEN SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid = "1" ELSE bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e;
    -- Data2
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D2 <= SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data2 WHEN SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid = "1" ELSE bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_j;
    -- Data3
    SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_D3 <= SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_data3 WHEN SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_r_valid = "1" ELSE bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b;

    -- bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg(STALLFIFO,446)
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V0;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_in <= SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_backStall;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_in(0);
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_in(0);
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_out(0) <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_out(0) <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,283)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d1x1_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,205)
    bubble_join_stall_entry_q <= in_unnamed_conv2d1x12 & in_tmp_17 & in_k_18 & in_j_01014 & in_c2_exe112 & in_c1_exe28 & in_c1_exe14 & in_c0_exe11 & in_add16;

    -- bubble_select_stall_entry(BITSELECT,206)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 224));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(287 downto 256));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(319 downto 288));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(351 downto 320));

    -- conv2d1x1_B2_merge_reg_aunroll_x(BLACKBOX,5)@0
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
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d1x1_B2_merge_reg_aunroll_x : conv2d1x1_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_h,
        in_data_in_1 => bubble_select_stall_entry_i,
        in_data_in_2 => bubble_select_stall_entry_c,
        in_data_in_3 => bubble_select_stall_entry_d,
        in_data_in_4 => bubble_select_stall_entry_e,
        in_data_in_5 => bubble_select_stall_entry_f,
        in_data_in_6 => bubble_select_stall_entry_j,
        in_data_in_7 => bubble_select_stall_entry_g,
        in_data_in_8 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8,
        out_stall_out => conv2d1x1_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d1x1_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d1x1_B2_merge_reg_aunroll_x(STALLENABLE,249)
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg8 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg8 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg8;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_3_reg_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2 <= (not (SR_SE_redist4_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_2_0_backStall) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3 <= (not (redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4 <= (not (redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5 <= (not (redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6 <= (not (redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7 <= (not (redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed8 <= (not (redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg8;
    -- Consuming
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg8 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed8;
    -- Backward Stall generation
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or1;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or2;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or3;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or4;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or5;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or6;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed8 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or7);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V8 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg8);
    -- Computing multiple Valid(s)
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid <= conv2d1x1_B2_merge_reg_aunroll_x_out_valid_out;

    -- bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg(STALLFIFO,447)
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V1;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_in <= SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_backStall;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_in(0);
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_in(0);
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_out(0) <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_out(0) <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 203,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4(STALLENABLE,347)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_V0 <= SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_backStall <= i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_stall_out or not (SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_wireValid <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_reg_valid_out;

    -- i_syncbuf_input_channels_sync_buffer2_conv2d1x1(BLACKBOX,77)@203
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_channels_sync_buffer2_conv2d1x1 : i_syncbuf_input_channels_sync_buffer2_conv2d1x126
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_4_V0,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_channels_sync_buffer2_conv2d1x1(BITJOIN,195)
    bubble_join_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_q <= i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_channels_sync_buffer2_conv2d1x1(BITSELECT,196)
    bubble_select_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_q(31 downto 0));

    -- redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0(REG,159)
    redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN = "1") THEN
                redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg(STALLREG,449)
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid <= bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backStall and (SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid or SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_i_valid <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backStall <= SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_V <= SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_i_valid;


    -- SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1(STALLENABLE,277)
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg0 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg1 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed0 <= (not (SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backStall) and SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg0;
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed1 <= (not (SR_SE_i_exitcond_conv2d1x1_backStall) and SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_StallValid <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_backStall and SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid;
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_toReg0 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_StallValid and SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_toReg1 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_StallValid and SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_or0 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireStall <= not (SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_consumed1 and SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_or0);
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_backStall <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_V0 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg0);
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_V1 <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_wireValid <= i_syncbuf_input_channels_sync_buffer2_conv2d1x1_out_valid_out;

    -- SR_SE_i_exitcond_conv2d1x1(STALLREG,455)
    SR_SE_i_exitcond_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_exitcond_conv2d1x1_r_data0 <= (others => '-');
            SR_SE_i_exitcond_conv2d1x1_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond_conv2d1x1_r_valid <= SE_i_exitcond_conv2d1x1_backStall and (SR_SE_i_exitcond_conv2d1x1_r_valid or SR_SE_i_exitcond_conv2d1x1_i_valid);

            IF (SR_SE_i_exitcond_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond_conv2d1x1_r_data0 <= STD_LOGIC_VECTOR(redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_q);
                SR_SE_i_exitcond_conv2d1x1_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond_conv2d1x1_and0 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V0;
    SR_SE_i_exitcond_conv2d1x1_i_valid <= SE_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_V1 and SR_SE_i_exitcond_conv2d1x1_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond_conv2d1x1_backStall <= SR_SE_i_exitcond_conv2d1x1_r_valid or not (SR_SE_i_exitcond_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_exitcond_conv2d1x1_V <= SR_SE_i_exitcond_conv2d1x1_r_valid WHEN SR_SE_i_exitcond_conv2d1x1_r_valid = "1" ELSE SR_SE_i_exitcond_conv2d1x1_i_valid;

    -- Data0
    SR_SE_i_exitcond_conv2d1x1_D0 <= SR_SE_i_exitcond_conv2d1x1_r_data0 WHEN SR_SE_i_exitcond_conv2d1x1_r_valid = "1" ELSE redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond_conv2d1x1_D1 <= SR_SE_i_exitcond_conv2d1x1_r_data1 WHEN SR_SE_i_exitcond_conv2d1x1_r_valid = "1" ELSE bubble_select_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_b;

    -- bubble_join_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo(BITJOIN,218)
    bubble_join_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_q <= redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_data_out;

    -- bubble_select_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo(BITSELECT,219)
    bubble_select_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_q(31 downto 0));

    -- i_inc_conv2d1x1(ADD,71)@202
    i_inc_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_b);
    i_inc_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_conv2d1x1_a) + UNSIGNED(i_inc_conv2d1x1_b));
    i_inc_conv2d1x1_q <= i_inc_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc_conv2d1x1_sel_x(BITSELECT,4)@202
    bgTrunc_i_inc_conv2d1x1_sel_x_b <= i_inc_conv2d1x1_q(31 downto 0);

    -- SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0(STALLREG,454)
    SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backStall and (SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid or SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_inc_conv2d1x1_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_i_valid <= SE_out_redist5_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_201_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backStall <= SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid or not (SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V <= SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid WHEN SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_i_valid;

    SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_D0 <= SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_data0 WHEN SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_inc_conv2d1x1_sel_x_b;

    -- SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0(STALLENABLE,327)
    -- Valid signal propagation
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V0 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0;
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V1 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_0 <= SR_SE_i_exitcond_conv2d1x1_backStall and SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0;
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_1 <= SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backStall and SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_or0 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_0;
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN <= not (SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_1 or SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_v_s_0 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN and SR_SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backStall <= not (SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN);
    SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN = "0") THEN
                SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0 and SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_0 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_backEN = "0") THEN
                SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1 and SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_R_v_1 <= SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0(STALLENABLE,328)
    -- Valid signal propagation
    SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_V0 <= SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall and SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backEN <= not (SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_v_s_0 <= SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backEN and SE_redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_V1;
    -- Backward Stall generation
    SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backStall <= not (SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_v_s_0);
    SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backEN = "0") THEN
                SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0 <= SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0 and SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_s_tv_0;
            ELSE
                SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_R_v_0 <= SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_exitcond_conv2d1x1(STALLENABLE,263)
    -- Valid signal propagation
    SE_i_exitcond_conv2d1x1_V0 <= SE_i_exitcond_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond_conv2d1x1_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall and SE_i_exitcond_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond_conv2d1x1_backEN <= not (SE_i_exitcond_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond_conv2d1x1_v_s_0 <= SE_i_exitcond_conv2d1x1_backEN and SR_SE_i_exitcond_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_exitcond_conv2d1x1_backStall <= not (SE_i_exitcond_conv2d1x1_backEN);
    SE_i_exitcond_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond_conv2d1x1_backEN = "0") THEN
                SE_i_exitcond_conv2d1x1_R_v_0 <= SE_i_exitcond_conv2d1x1_R_v_0 and SE_i_exitcond_conv2d1x1_s_tv_0;
            ELSE
                SE_i_exitcond_conv2d1x1_R_v_0 <= SE_i_exitcond_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo(STALLFIFO,140)
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_in <= SE_i_cmp9_phi_decision20_xor_rm_conv2d1x1_V1;
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_data_in <= i_cmp9_phi_decision20_xor_rm_conv2d1x1_c;
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_in_bitsignaltemp <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_in(0);
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_in_bitsignaltemp <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_in(0);
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_out(0) <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_out_bitsignaltemp;
    redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_out(0) <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_out_bitsignaltemp;
    theredist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 202,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp9_phi_decision20_xor_rm_conv2d1x1_c,
        valid_out => redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo(STALLFIFO,142)
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_in <= SE_i_cmp126_neg_rm_conv2d1x1_V1;
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_data_in <= i_cmp126_neg_rm_conv2d1x1_c;
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_in_bitsignaltemp <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_in(0);
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_in_bitsignaltemp <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_in(0);
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_out(0) <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_out_bitsignaltemp;
    redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_out(0) <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_out_bitsignaltemp;
    theredist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 202,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp126_neg_rm_conv2d1x1_c,
        valid_out => redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo(STALLFIFO,148)
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V4;
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d;
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_in_bitsignaltemp <= redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_in(0);
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_in_bitsignaltemp <= redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_in(0);
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_out(0) <= redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_out_bitsignaltemp;
    redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_out(0) <= redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_out_bitsignaltemp;
    theredist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 204,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d,
        valid_out => redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_stall_out_bitsignaltemp,
        data_out => redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo(STALLFIFO,151)
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_in <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V3;
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_data_in <= redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_q;
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_in_bitsignaltemp <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_in(0);
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_in_bitsignaltemp <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_in(0);
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_out(0) <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_out_bitsignaltemp;
    redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_out(0) <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_out_bitsignaltemp;
    theredist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 202,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_in_bitsignaltemp,
        data_in => redist8_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_2_1_q,
        valid_out => redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_stall_out_bitsignaltemp,
        data_out => redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo(STALLFIFO,152)
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V5;
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f;
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_in_bitsignaltemp <= redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_in(0);
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_in_bitsignaltemp <= redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_in(0);
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_out(0) <= redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_out_bitsignaltemp;
    redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_out(0) <= redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_out_bitsignaltemp;
    theredist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 204,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f,
        valid_out => redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_stall_out_bitsignaltemp,
        data_out => redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo(STALLFIFO,153)
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V6;
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g;
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_in_bitsignaltemp <= redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_in(0);
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_in_bitsignaltemp <= redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_in(0);
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_out(0) <= redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_out_bitsignaltemp;
    redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_out(0) <= redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_out_bitsignaltemp;
    theredist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 204,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g,
        valid_out => redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_stall_out_bitsignaltemp,
        data_out => redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo(STALLFIFO,154)
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V7;
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h;
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_in_bitsignaltemp <= redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_in(0);
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_in_bitsignaltemp <= redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_in(0);
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_out(0) <= redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_out_bitsignaltemp;
    redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_out(0) <= redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_out_bitsignaltemp;
    theredist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 204,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h,
        valid_out => redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_stall_out_bitsignaltemp,
        data_out => redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo(STALLFIFO,155)
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V8;
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i;
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_in_bitsignaltemp <= redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_in(0);
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_in_bitsignaltemp <= redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_in(0);
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_out(0) <= redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_out_bitsignaltemp;
    redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_out(0) <= redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_out_bitsignaltemp;
    theredist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 204,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i,
        valid_out => redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_stall_out_bitsignaltemp,
        data_out => redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo(STALLFIFO,158)
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_in <= SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_V4;
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall;
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_data_in <= redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_q;
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_in_bitsignaltemp <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_in(0);
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_in_bitsignaltemp <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_in(0);
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_out(0) <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_out_bitsignaltemp;
    redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_out(0) <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_out_bitsignaltemp;
    theredist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 202,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_in_bitsignaltemp,
        data_in => redist14_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_2_1_q,
        valid_out => redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_stall_out_bitsignaltemp,
        data_out => redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg(STALLENABLE,448)
    -- Valid signal propagation
    bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_V0 <= bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall and bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backEN <= not (bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_v_s_0 <= bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backEN and SR_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backStall <= not (bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backEN);
    bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0 and bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1(STALLENABLE,381)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_V0 <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and0 <= bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_reg_V0;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and1 <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and0;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and2 <= redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and1;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and3 <= redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and2;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and4 <= redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and3;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and5 <= redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and4;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and6 <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and5;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and7 <= redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and6;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and8 <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and7;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and9 <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and8;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and10 <= SE_i_exitcond_conv2d1x1_V0 and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and9;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and11 <= i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_o_valid and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and10;
    SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_wireValid <= SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_V0 and SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_and11;

    -- bubble_join_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo(BITJOIN,221)
    bubble_join_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_q <= redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_data_out;

    -- bubble_select_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo(BITSELECT,222)
    bubble_select_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x17_conv2d1x1(BITJOIN,189)
    bubble_join_i_load_unnamed_conv2d1x17_conv2d1x1_q <= i_load_unnamed_conv2d1x17_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x17_conv2d1x1(BITSELECT,190)
    bubble_select_i_load_unnamed_conv2d1x17_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x17_conv2d1x1_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x16_conv2d1x1(BITJOIN,186)
    bubble_join_i_load_unnamed_conv2d1x16_conv2d1x1_q <= i_load_unnamed_conv2d1x16_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x16_conv2d1x1(BITSELECT,187)
    bubble_select_i_load_unnamed_conv2d1x16_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x16_conv2d1x1_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1(BITJOIN,183)
    bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1_q <= i_load_unnamed_conv2d1x15_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1(BITSELECT,184)
    bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1(BITJOIN,180)
    bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1_q <= i_load_unnamed_conv2d1x14_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1(BITSELECT,181)
    bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x(BITJOIN,174)
    bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_q <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_3 & i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_2 & i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_1 & i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x(BITSELECT,175)
    bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_q(31 downto 0));
    bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_q(63 downto 32));
    bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_q(95 downto 64));
    bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_q(127 downto 96));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x(BLACKBOX,2)@134
    -- in in_i_stall@20000000
    -- out out_c1_exit20_0@204
    -- out out_c1_exit20_1@204
    -- out out_o_stall@20000000
    -- out out_o_valid@204
    thei_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x : i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1
    PORT MAP (
        in_c1_eni6_0 => GND_q,
        in_c1_eni6_0_1 => bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_b,
        in_c1_eni6_1_1 => bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_c,
        in_c1_eni6_2 => bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1_b,
        in_c1_eni6_2_1 => bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_d,
        in_c1_eni6_3 => bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1_b,
        in_c1_eni6_3_1 => bubble_select_i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_e,
        in_c1_eni6_4 => bubble_select_i_load_unnamed_conv2d1x16_conv2d1x1_b,
        in_c1_eni6_5 => bubble_select_i_load_unnamed_conv2d1x17_conv2d1x1_b,
        in_c1_eni6_6 => bubble_select_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_b,
        in_i_stall => SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_backStall,
        in_i_valid => SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_V0,
        out_c1_exit20_1 => i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_c1_exit20_1,
        out_o_stall => i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0(REG,143)
    redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1(BITJOIN,192)
    bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_q <= i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1(BITSELECT,193)
    bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_q(63 downto 0));

    -- i_arrayidx22_conv2d1x1_conv2d1x147_add_x(ADD,48)@3
    i_arrayidx22_conv2d1x1_conv2d1x147_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_b);
    i_arrayidx22_conv2d1x1_conv2d1x147_add_x_b <= STD_LOGIC_VECTOR("0" & redist3_i_arrayidx22_conv2d1x1_conv2d1x147_trunc_sel_x_b_1_0_q);
    i_arrayidx22_conv2d1x1_conv2d1x147_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x147_add_x_a) + UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x147_add_x_b));
    i_arrayidx22_conv2d1x1_conv2d1x147_add_x_q <= i_arrayidx22_conv2d1x1_conv2d1x147_add_x_o(64 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x147_dupName_0_trunc_sel_x(BITSELECT,42)@3
    i_arrayidx22_conv2d1x1_conv2d1x147_dupName_0_trunc_sel_x_b <= i_arrayidx22_conv2d1x1_conv2d1x147_add_x_q(63 downto 0);

    -- i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x(BLACKBOX,53)@3
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@134
    -- out out_o_readdata_1@134
    -- out out_o_readdata_2@134
    -- out out_o_readdata_3@134
    -- out out_o_stall@20000000
    -- out out_o_valid@134
    -- out out_unnamed_conv2d1x18_avm_address@20000000
    -- out out_unnamed_conv2d1x18_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x18_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x18_avm_enable@20000000
    -- out out_unnamed_conv2d1x18_avm_read@20000000
    -- out out_unnamed_conv2d1x18_avm_write@20000000
    -- out out_unnamed_conv2d1x18_avm_writedata@20000000
    thei_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x : i_load_unnamed_conv2d1x18_conv2d1x156
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx22_conv2d1x1_conv2d1x147_dupName_0_trunc_sel_x_b,
        in_i_predicate => i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q,
        in_i_stall => SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_V0,
        in_unnamed_conv2d1x18_avm_readdata => in_unnamed_conv2d1x18_avm_readdata,
        in_unnamed_conv2d1x18_avm_readdatavalid => in_unnamed_conv2d1x18_avm_readdatavalid,
        in_unnamed_conv2d1x18_avm_waitrequest => in_unnamed_conv2d1x18_avm_waitrequest,
        in_unnamed_conv2d1x18_avm_writeack => in_unnamed_conv2d1x18_avm_writeack,
        out_o_readdata_0 => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_readdata_3,
        out_o_stall => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_valid,
        out_unnamed_conv2d1x18_avm_address => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_address,
        out_unnamed_conv2d1x18_avm_burstcount => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_burstcount,
        out_unnamed_conv2d1x18_avm_byteenable => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_byteenable,
        out_unnamed_conv2d1x18_avm_enable => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_enable,
        out_unnamed_conv2d1x18_avm_read => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_read,
        out_unnamed_conv2d1x18_avm_write => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_write,
        out_unnamed_conv2d1x18_avm_writedata => i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo(STALLFIFO,147)
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V3;
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_in <= SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall;
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c;
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_in_bitsignaltemp <= redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_in(0);
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_in_bitsignaltemp <= redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_in(0);
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_out(0) <= redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_out_bitsignaltemp;
    redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_out(0) <= redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_out_bitsignaltemp;
    theredist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 134,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c,
        valid_out => redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_stall_out_bitsignaltemp,
        data_out => redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo(STALLENABLE,308)
    -- Valid signal propagation
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_V0 <= SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall <= i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_o_stall or not (SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and0 <= redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_valid_out;
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and1 <= i_load_unnamed_conv2d1x17_conv2d1x1_out_o_valid and SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and0;
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and2 <= i_load_unnamed_conv2d1x16_conv2d1x1_out_o_valid and SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and1;
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and3 <= i_load_unnamed_conv2d1x15_conv2d1x1_out_o_valid and SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and2;
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and4 <= i_load_unnamed_conv2d1x14_conv2d1x1_out_o_valid and SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and3;
    SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_wireValid <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_o_valid and SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_and4;

    -- bubble_join_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo(BITJOIN,212)
    bubble_join_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_q <= redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_data_out;

    -- bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo(BITSELECT,213)
    bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x(BITJOIN,177)
    bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_q <= i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_4 & i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_3 & i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_2 & i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_c0_exit14_1;

    -- bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x(BITSELECT,178)
    bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_q(63 downto 0));
    bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_q(127 downto 64));
    bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_q(191 downto 128));
    bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_q(255 downto 192));

    -- SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo(STALLREG,456)
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid <= (others => '0');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data0 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data1 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data2 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data3 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data4 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data5 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data6 <= (others => '-');
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data7 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid <= SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall and (SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid or SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_i_valid);

            IF (SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data0 <= bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_b;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data1 <= bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data2 <= bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data3 <= bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data4 <= bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data5 <= bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_c;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data6 <= bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_d;
                SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data7 <= bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_e;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_and0 <= redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_valid_out;
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_i_valid <= i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_out_o_valid and SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_and0;
    -- Stall signal propagation
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_backStall <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid or not (SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_i_valid);

    -- Valid
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_i_valid;

    -- Data0
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D0 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data0 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_b;
    -- Data1
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D1 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data1 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
    -- Data2
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D2 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data2 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
    -- Data3
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D3 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data3 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
    -- Data4
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D4 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data4 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_b;
    -- Data5
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D5 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data5 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_c;
    -- Data6
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D6 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data6 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_d;
    -- Data7
    SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D7 <= SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_data7 WHEN SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x1_aunroll_x_e;

    -- i_load_unnamed_conv2d1x15_conv2d1x1(BLACKBOX,73)@12
    -- in in_i_stall@20000000
    -- out out_o_readdata@134
    -- out out_o_stall@20000000
    -- out out_o_valid@134
    -- out out_unnamed_conv2d1x15_avm_address@20000000
    -- out out_unnamed_conv2d1x15_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x15_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x15_avm_enable@20000000
    -- out out_unnamed_conv2d1x15_avm_read@20000000
    -- out out_unnamed_conv2d1x15_avm_write@20000000
    -- out out_unnamed_conv2d1x15_avm_writedata@20000000
    thei_load_unnamed_conv2d1x15_conv2d1x1 : i_load_unnamed_conv2d1x15_conv2d1x150
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D5,
        in_i_predicate => SR_SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_D2,
        in_i_stall => SE_out_redist6_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_133_fifo_backStall,
        in_i_valid => SE_out_redist1_i_cmp9_phi_decision20_xor_or_rm_conv2d1x1_q_9_fifo_V1,
        in_unnamed_conv2d1x15_avm_readdata => in_unnamed_conv2d1x15_avm_readdata,
        in_unnamed_conv2d1x15_avm_readdatavalid => in_unnamed_conv2d1x15_avm_readdatavalid,
        in_unnamed_conv2d1x15_avm_waitrequest => in_unnamed_conv2d1x15_avm_waitrequest,
        in_unnamed_conv2d1x15_avm_writeack => in_unnamed_conv2d1x15_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x15_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x15_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x15_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x15_avm_address => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,7)
    out_unnamed_conv2d1x15_avm_address <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_address;
    out_unnamed_conv2d1x15_avm_enable <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_enable;
    out_unnamed_conv2d1x15_avm_read <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_read;
    out_unnamed_conv2d1x15_avm_write <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_write;
    out_unnamed_conv2d1x15_avm_writedata <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_writedata;
    out_unnamed_conv2d1x15_avm_byteenable <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_byteenable;
    out_unnamed_conv2d1x15_avm_burstcount <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_burstcount;

    -- bubble_join_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo(BITJOIN,215)
    bubble_join_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_q <= redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_data_out;

    -- bubble_select_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo(BITSELECT,216)
    bubble_select_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_q(0 downto 0));

    -- i_exitcond_conv2d1x1(LOGICAL,67)@203 + 1
    i_exitcond_conv2d1x1_qi <= "1" WHEN SR_SE_i_exitcond_conv2d1x1_D0 = SR_SE_i_exitcond_conv2d1x1_D1 ELSE "0";
    i_exitcond_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_conv2d1x1_qi, xout => i_exitcond_conv2d1x1_q, ena => SE_i_exitcond_conv2d1x1_backEN(0), clk => clock, aclr => resetn );

    -- i_exitcond_guard_conv2d1x1(LOGICAL,68)@204
    i_exitcond_guard_conv2d1x1_q <= i_exitcond_conv2d1x1_q or bubble_select_redist2_i_cmp126_neg_rm_conv2d1x1_c_202_fifo_b;

    -- i_unnamed_conv2d1x158(LOGICAL,80)@204
    i_unnamed_conv2d1x158_q <= i_exitcond_guard_conv2d1x1_q or bubble_select_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_b;

    -- bubble_join_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo(BITJOIN,236)
    bubble_join_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_q <= redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_data_out;

    -- bubble_select_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo(BITSELECT,237)
    bubble_select_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_q(31 downto 0));

    -- bubble_join_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo(BITJOIN,239)
    bubble_join_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_q <= redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_data_out;

    -- bubble_select_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo(BITSELECT,240)
    bubble_select_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_q(31 downto 0));

    -- redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0(REG,160)
    redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_backEN = "1") THEN
                redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(redist16_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo(BITJOIN,209)
    bubble_join_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_q <= redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_data_out;

    -- bubble_select_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo(BITSELECT,210)
    bubble_select_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_q(0 downto 0));

    -- bubble_join_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo(BITJOIN,233)
    bubble_join_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_q <= redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_data_out;

    -- bubble_select_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo(BITSELECT,234)
    bubble_select_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_q(31 downto 0));

    -- bubble_join_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo(BITJOIN,230)
    bubble_join_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_q <= redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_data_out;

    -- bubble_select_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo(BITSELECT,231)
    bubble_select_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_q(63 downto 0));

    -- bubble_join_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo(BITJOIN,227)
    bubble_join_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_q <= redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_data_out;

    -- bubble_select_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo(BITSELECT,228)
    bubble_select_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_q(31 downto 0));

    -- bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x(BITJOIN,163)
    bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_q <= i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_out_c1_exit20_1;

    -- bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x(BITSELECT,164)
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_q(31 downto 0));

    -- bubble_join_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo(BITJOIN,224)
    bubble_join_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_q <= redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_data_out;

    -- bubble_select_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo(BITSELECT,225)
    bubble_select_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_q(63 downto 0));

    -- bubble_join_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo(BITJOIN,242)
    bubble_join_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_q <= redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_data_out;

    -- bubble_select_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo(BITSELECT,243)
    bubble_select_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_q(31 downto 0));

    -- dupName_0_sync_out_x(GPOUT,12)@204
    out_add16 <= bubble_select_redist15_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_8_203_fifo_b;
    out_c0_exe11 <= bubble_select_redist7_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_203_fifo_b;
    out_c1_exe121 <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x1_aunroll_vunroll_x_b;
    out_c1_exe14 <= bubble_select_redist9_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_203_fifo_b;
    out_c1_exe28 <= bubble_select_redist10_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_203_fifo_b;
    out_c2_exe112 <= bubble_select_redist11_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_203_fifo_b;
    out_cmp9_phi_decision20_xor_RM <= bubble_select_redist0_i_cmp9_phi_decision20_xor_rm_conv2d1x1_c_202_fifo_b;
    out_inc <= redist17_bgTrunc_i_inc_conv2d1x1_sel_x_b_2_0_q;
    out_j_01014 <= bubble_select_redist13_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_203_fifo_b;
    out_unnamed_conv2d1x12 <= bubble_select_redist12_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_203_fifo_b;
    out_unnamed_conv2d1x13 <= i_unnamed_conv2d1x158_q;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_input_channels_sync_buffer2_conv2d1x1_1_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,14)
    out_unnamed_conv2d1x16_avm_address <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_address;
    out_unnamed_conv2d1x16_avm_enable <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_enable;
    out_unnamed_conv2d1x16_avm_read <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_read;
    out_unnamed_conv2d1x16_avm_write <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_write;
    out_unnamed_conv2d1x16_avm_writedata <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_writedata;
    out_unnamed_conv2d1x16_avm_byteenable <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_byteenable;
    out_unnamed_conv2d1x16_avm_burstcount <= i_load_unnamed_conv2d1x16_conv2d1x1_out_unnamed_conv2d1x16_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,19)
    out_unnamed_conv2d1x17_avm_address <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_address;
    out_unnamed_conv2d1x17_avm_enable <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_enable;
    out_unnamed_conv2d1x17_avm_read <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_read;
    out_unnamed_conv2d1x17_avm_write <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_write;
    out_unnamed_conv2d1x17_avm_writedata <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_writedata;
    out_unnamed_conv2d1x17_avm_byteenable <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_byteenable;
    out_unnamed_conv2d1x17_avm_burstcount <= i_load_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_burstcount;

    -- dupName_3_ext_sig_sync_out_x(GPOUT,24)
    out_unnamed_conv2d1x18_avm_address <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_address;
    out_unnamed_conv2d1x18_avm_enable <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_enable;
    out_unnamed_conv2d1x18_avm_read <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_read;
    out_unnamed_conv2d1x18_avm_write <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_write;
    out_unnamed_conv2d1x18_avm_writedata <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_writedata;
    out_unnamed_conv2d1x18_avm_byteenable <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_byteenable;
    out_unnamed_conv2d1x18_avm_burstcount <= i_load_unnamed_conv2d1x18_conv2d1x1_vunroll_x_out_unnamed_conv2d1x18_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,62)
    out_unnamed_conv2d1x14_avm_address <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_address;
    out_unnamed_conv2d1x14_avm_enable <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_enable;
    out_unnamed_conv2d1x14_avm_read <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_read;
    out_unnamed_conv2d1x14_avm_write <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_write;
    out_unnamed_conv2d1x14_avm_writedata <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_writedata;
    out_unnamed_conv2d1x14_avm_byteenable <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_byteenable;
    out_unnamed_conv2d1x14_avm_burstcount <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_burstcount;

    -- sync_out(GPOUT,94)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
