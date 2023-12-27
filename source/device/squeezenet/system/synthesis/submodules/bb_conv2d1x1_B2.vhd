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

-- VHDL created from bb_conv2d1x1_B2
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

entity bb_conv2d1x1_B2 is
    port (
        in_add16_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_add16_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe14_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe14_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe28_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe28_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe112_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe112_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01014_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01014_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_18_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_18_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_17_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_17_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
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
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_add16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe121 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe28 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe112 : out std_logic_vector(31 downto 0);  -- ufix32
        out_cmp9_phi_decision20_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_01014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
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
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B2;

architecture normal of bb_conv2d1x1_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d1x1_B2_stall_region is
        port (
            in_add16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe112 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_17 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- Floating Point
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
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe121 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe112 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_cmp9_phi_decision20_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x13 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B2_branch is
        port (
            in_add16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe121 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe112 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp9_phi_decision20_xor_RM : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_inc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01014 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe121 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe112 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_cmp9_phi_decision20_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B2_merge is
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
            in_j_01014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01014_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_18_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_18_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_17_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_17_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe112 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_17 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d1x1_B2_stall_region_out_add16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exe121 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exe28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c2_exe112 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_cmp9_phi_decision20_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_j_01014 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_out_add16 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_out_c1_exe121 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_c1_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_c1_exe28 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_out_c2_exe112 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_cmp9_phi_decision20_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_j_01014 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_out_add16 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_out_c1_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_c1_exe28 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_out_c2_exe112 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_j_01014 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_k_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_out_tmp_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d1x1_B2_merge(BLACKBOX,4)
    theconv2d1x1_B2_merge : conv2d1x1_B2_merge
    PORT MAP (
        in_add16_0 => in_add16_0,
        in_add16_1 => in_add16_1,
        in_c0_exe11_0 => in_c0_exe11_0,
        in_c0_exe11_1 => in_c0_exe11_1,
        in_c1_exe14_0 => in_c1_exe14_0,
        in_c1_exe14_1 => in_c1_exe14_1,
        in_c1_exe28_0 => in_c1_exe28_0,
        in_c1_exe28_1 => in_c1_exe28_1,
        in_c2_exe112_0 => in_c2_exe112_0,
        in_c2_exe112_1 => in_c2_exe112_1,
        in_j_01014_0 => in_j_01014_0,
        in_j_01014_1 => in_j_01014_1,
        in_k_18_0 => in_k_18_0,
        in_k_18_1 => in_k_18_1,
        in_stall_in => bb_conv2d1x1_B2_stall_region_out_stall_out,
        in_tmp_17_0 => in_tmp_17_0,
        in_tmp_17_1 => in_tmp_17_1,
        in_unnamed_conv2d1x12_0 => in_unnamed_conv2d1x12_0,
        in_unnamed_conv2d1x12_1 => in_unnamed_conv2d1x12_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_add16 => conv2d1x1_B2_merge_out_add16,
        out_c0_exe11 => conv2d1x1_B2_merge_out_c0_exe11,
        out_c1_exe14 => conv2d1x1_B2_merge_out_c1_exe14,
        out_c1_exe28 => conv2d1x1_B2_merge_out_c1_exe28,
        out_c2_exe112 => conv2d1x1_B2_merge_out_c2_exe112,
        out_j_01014 => conv2d1x1_B2_merge_out_j_01014,
        out_k_18 => conv2d1x1_B2_merge_out_k_18,
        out_stall_out_0 => conv2d1x1_B2_merge_out_stall_out_0,
        out_stall_out_1 => conv2d1x1_B2_merge_out_stall_out_1,
        out_tmp_17 => conv2d1x1_B2_merge_out_tmp_17,
        out_unnamed_conv2d1x12 => conv2d1x1_B2_merge_out_unnamed_conv2d1x12,
        out_valid_out => conv2d1x1_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B2_stall_region(BLACKBOX,2)
    thebb_conv2d1x1_B2_stall_region : bb_conv2d1x1_B2_stall_region
    PORT MAP (
        in_add16 => conv2d1x1_B2_merge_out_add16,
        in_c0_exe11 => conv2d1x1_B2_merge_out_c0_exe11,
        in_c1_exe14 => conv2d1x1_B2_merge_out_c1_exe14,
        in_c1_exe28 => conv2d1x1_B2_merge_out_c1_exe28,
        in_c2_exe112 => conv2d1x1_B2_merge_out_c2_exe112,
        in_filter_weight => in_filter_weight,
        in_flush => in_flush,
        in_input_channels => in_input_channels,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_j_01014 => conv2d1x1_B2_merge_out_j_01014,
        in_k_18 => conv2d1x1_B2_merge_out_k_18,
        in_stall_in => conv2d1x1_B2_branch_out_stall_out,
        in_tmp_17 => conv2d1x1_B2_merge_out_tmp_17,
        in_unnamed_conv2d1x12 => conv2d1x1_B2_merge_out_unnamed_conv2d1x12,
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
        in_valid_in => conv2d1x1_B2_merge_out_valid_out,
        out_add16 => bb_conv2d1x1_B2_stall_region_out_add16,
        out_c0_exe11 => bb_conv2d1x1_B2_stall_region_out_c0_exe11,
        out_c1_exe121 => bb_conv2d1x1_B2_stall_region_out_c1_exe121,
        out_c1_exe14 => bb_conv2d1x1_B2_stall_region_out_c1_exe14,
        out_c1_exe28 => bb_conv2d1x1_B2_stall_region_out_c1_exe28,
        out_c2_exe112 => bb_conv2d1x1_B2_stall_region_out_c2_exe112,
        out_cmp9_phi_decision20_xor_RM => bb_conv2d1x1_B2_stall_region_out_cmp9_phi_decision20_xor_RM,
        out_inc => bb_conv2d1x1_B2_stall_region_out_inc,
        out_j_01014 => bb_conv2d1x1_B2_stall_region_out_j_01014,
        out_stall_out => bb_conv2d1x1_B2_stall_region_out_stall_out,
        out_unnamed_conv2d1x12 => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x12,
        out_unnamed_conv2d1x13 => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13,
        out_unnamed_conv2d1x14_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_writedata,
        out_unnamed_conv2d1x15_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_writedata,
        out_unnamed_conv2d1x16_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_address,
        out_unnamed_conv2d1x16_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_burstcount,
        out_unnamed_conv2d1x16_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_byteenable,
        out_unnamed_conv2d1x16_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_enable,
        out_unnamed_conv2d1x16_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_read,
        out_unnamed_conv2d1x16_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_write,
        out_unnamed_conv2d1x16_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_writedata,
        out_unnamed_conv2d1x17_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_writedata,
        out_unnamed_conv2d1x18_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_address,
        out_unnamed_conv2d1x18_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_burstcount,
        out_unnamed_conv2d1x18_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_byteenable,
        out_unnamed_conv2d1x18_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_enable,
        out_unnamed_conv2d1x18_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_read,
        out_unnamed_conv2d1x18_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_write,
        out_unnamed_conv2d1x18_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_writedata,
        out_valid_out => bb_conv2d1x1_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d1x1_B2_branch(BLACKBOX,3)
    theconv2d1x1_B2_branch : conv2d1x1_B2_branch
    PORT MAP (
        in_add16 => bb_conv2d1x1_B2_stall_region_out_add16,
        in_c0_exe11 => bb_conv2d1x1_B2_stall_region_out_c0_exe11,
        in_c1_exe121 => bb_conv2d1x1_B2_stall_region_out_c1_exe121,
        in_c1_exe14 => bb_conv2d1x1_B2_stall_region_out_c1_exe14,
        in_c1_exe28 => bb_conv2d1x1_B2_stall_region_out_c1_exe28,
        in_c2_exe112 => bb_conv2d1x1_B2_stall_region_out_c2_exe112,
        in_cmp9_phi_decision20_xor_RM => bb_conv2d1x1_B2_stall_region_out_cmp9_phi_decision20_xor_RM,
        in_inc => bb_conv2d1x1_B2_stall_region_out_inc,
        in_j_01014 => bb_conv2d1x1_B2_stall_region_out_j_01014,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d1x12 => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x12,
        in_unnamed_conv2d1x13 => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13,
        in_valid_in => bb_conv2d1x1_B2_stall_region_out_valid_out,
        out_add16 => conv2d1x1_B2_branch_out_add16,
        out_c0_exe11 => conv2d1x1_B2_branch_out_c0_exe11,
        out_c1_exe121 => conv2d1x1_B2_branch_out_c1_exe121,
        out_c1_exe14 => conv2d1x1_B2_branch_out_c1_exe14,
        out_c1_exe28 => conv2d1x1_B2_branch_out_c1_exe28,
        out_c2_exe112 => conv2d1x1_B2_branch_out_c2_exe112,
        out_cmp9_phi_decision20_xor_RM => conv2d1x1_B2_branch_out_cmp9_phi_decision20_xor_RM,
        out_inc => conv2d1x1_B2_branch_out_inc,
        out_j_01014 => conv2d1x1_B2_branch_out_j_01014,
        out_stall_out => conv2d1x1_B2_branch_out_stall_out,
        out_unnamed_conv2d1x12 => conv2d1x1_B2_branch_out_unnamed_conv2d1x12,
        out_valid_out_0 => conv2d1x1_B2_branch_out_valid_out_0,
        out_valid_out_1 => conv2d1x1_B2_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_add16(GPOUT,53)
    out_add16 <= conv2d1x1_B2_branch_out_add16;

    -- out_c0_exe11(GPOUT,54)
    out_c0_exe11 <= conv2d1x1_B2_branch_out_c0_exe11;

    -- out_c1_exe121(GPOUT,55)
    out_c1_exe121 <= conv2d1x1_B2_branch_out_c1_exe121;

    -- out_c1_exe14(GPOUT,56)
    out_c1_exe14 <= conv2d1x1_B2_branch_out_c1_exe14;

    -- out_c1_exe28(GPOUT,57)
    out_c1_exe28 <= conv2d1x1_B2_branch_out_c1_exe28;

    -- out_c2_exe112(GPOUT,58)
    out_c2_exe112 <= conv2d1x1_B2_branch_out_c2_exe112;

    -- out_cmp9_phi_decision20_xor_RM(GPOUT,59)
    out_cmp9_phi_decision20_xor_RM <= conv2d1x1_B2_branch_out_cmp9_phi_decision20_xor_RM;

    -- out_inc(GPOUT,60)
    out_inc <= conv2d1x1_B2_branch_out_inc;

    -- out_j_01014(GPOUT,61)
    out_j_01014 <= conv2d1x1_B2_branch_out_j_01014;

    -- out_stall_out_0(GPOUT,62)
    out_stall_out_0 <= conv2d1x1_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,63)
    out_stall_out_1 <= conv2d1x1_B2_merge_out_stall_out_1;

    -- out_unnamed_conv2d1x12(GPOUT,64)
    out_unnamed_conv2d1x12 <= conv2d1x1_B2_branch_out_unnamed_conv2d1x12;

    -- out_unnamed_conv2d1x14_avm_address(GPOUT,65)
    out_unnamed_conv2d1x14_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_address;

    -- out_unnamed_conv2d1x14_avm_burstcount(GPOUT,66)
    out_unnamed_conv2d1x14_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_burstcount;

    -- out_unnamed_conv2d1x14_avm_byteenable(GPOUT,67)
    out_unnamed_conv2d1x14_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_byteenable;

    -- out_unnamed_conv2d1x14_avm_enable(GPOUT,68)
    out_unnamed_conv2d1x14_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_enable;

    -- out_unnamed_conv2d1x14_avm_read(GPOUT,69)
    out_unnamed_conv2d1x14_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_read;

    -- out_unnamed_conv2d1x14_avm_write(GPOUT,70)
    out_unnamed_conv2d1x14_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_write;

    -- out_unnamed_conv2d1x14_avm_writedata(GPOUT,71)
    out_unnamed_conv2d1x14_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_writedata;

    -- out_unnamed_conv2d1x15_avm_address(GPOUT,72)
    out_unnamed_conv2d1x15_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_address;

    -- out_unnamed_conv2d1x15_avm_burstcount(GPOUT,73)
    out_unnamed_conv2d1x15_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_burstcount;

    -- out_unnamed_conv2d1x15_avm_byteenable(GPOUT,74)
    out_unnamed_conv2d1x15_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_byteenable;

    -- out_unnamed_conv2d1x15_avm_enable(GPOUT,75)
    out_unnamed_conv2d1x15_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_enable;

    -- out_unnamed_conv2d1x15_avm_read(GPOUT,76)
    out_unnamed_conv2d1x15_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_read;

    -- out_unnamed_conv2d1x15_avm_write(GPOUT,77)
    out_unnamed_conv2d1x15_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_write;

    -- out_unnamed_conv2d1x15_avm_writedata(GPOUT,78)
    out_unnamed_conv2d1x15_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_writedata;

    -- out_unnamed_conv2d1x16_avm_address(GPOUT,79)
    out_unnamed_conv2d1x16_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_address;

    -- out_unnamed_conv2d1x16_avm_burstcount(GPOUT,80)
    out_unnamed_conv2d1x16_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_burstcount;

    -- out_unnamed_conv2d1x16_avm_byteenable(GPOUT,81)
    out_unnamed_conv2d1x16_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_byteenable;

    -- out_unnamed_conv2d1x16_avm_enable(GPOUT,82)
    out_unnamed_conv2d1x16_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_enable;

    -- out_unnamed_conv2d1x16_avm_read(GPOUT,83)
    out_unnamed_conv2d1x16_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_read;

    -- out_unnamed_conv2d1x16_avm_write(GPOUT,84)
    out_unnamed_conv2d1x16_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_write;

    -- out_unnamed_conv2d1x16_avm_writedata(GPOUT,85)
    out_unnamed_conv2d1x16_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x16_avm_writedata;

    -- out_unnamed_conv2d1x17_avm_address(GPOUT,86)
    out_unnamed_conv2d1x17_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_address;

    -- out_unnamed_conv2d1x17_avm_burstcount(GPOUT,87)
    out_unnamed_conv2d1x17_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_burstcount;

    -- out_unnamed_conv2d1x17_avm_byteenable(GPOUT,88)
    out_unnamed_conv2d1x17_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_byteenable;

    -- out_unnamed_conv2d1x17_avm_enable(GPOUT,89)
    out_unnamed_conv2d1x17_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_enable;

    -- out_unnamed_conv2d1x17_avm_read(GPOUT,90)
    out_unnamed_conv2d1x17_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_read;

    -- out_unnamed_conv2d1x17_avm_write(GPOUT,91)
    out_unnamed_conv2d1x17_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_write;

    -- out_unnamed_conv2d1x17_avm_writedata(GPOUT,92)
    out_unnamed_conv2d1x17_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x17_avm_writedata;

    -- out_unnamed_conv2d1x18_avm_address(GPOUT,93)
    out_unnamed_conv2d1x18_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_address;

    -- out_unnamed_conv2d1x18_avm_burstcount(GPOUT,94)
    out_unnamed_conv2d1x18_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_burstcount;

    -- out_unnamed_conv2d1x18_avm_byteenable(GPOUT,95)
    out_unnamed_conv2d1x18_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_byteenable;

    -- out_unnamed_conv2d1x18_avm_enable(GPOUT,96)
    out_unnamed_conv2d1x18_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_enable;

    -- out_unnamed_conv2d1x18_avm_read(GPOUT,97)
    out_unnamed_conv2d1x18_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_read;

    -- out_unnamed_conv2d1x18_avm_write(GPOUT,98)
    out_unnamed_conv2d1x18_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_write;

    -- out_unnamed_conv2d1x18_avm_writedata(GPOUT,99)
    out_unnamed_conv2d1x18_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x18_avm_writedata;

    -- out_valid_out_0(GPOUT,100)
    out_valid_out_0 <= conv2d1x1_B2_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,101)
    out_valid_out_1 <= conv2d1x1_B2_branch_out_valid_out_1;

END normal;
