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

-- VHDL created from bb_maxpool2d_B2
-- VHDL created on Sun Oct 01 23:33:46 2023


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

entity bb_maxpool2d_B2 is
    port (
        in_c0_exe11413_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11413_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv7_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv7_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_088_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_088_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1610_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1610_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_32_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_32_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2211_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2211_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2414_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2414_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_31_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_31_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_maxpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_maxpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe11413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe126 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe15 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp7_phi_decision16_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv7_LC_OuterPHI : out std_logic_vector(2 downto 0);  -- ufix3
        out_fpgaindvars_iv_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_088 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1610 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_24_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_32_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2211 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2414 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_maxpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_maxpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_maxpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B2;

architecture normal of bb_maxpool2d_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_maxpool2d_B2_stall_region is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11413 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe15 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv7 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_088 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2211 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2414 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_31 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_maxpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe11413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe126 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe15 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp7_phi_decision16_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_for_end31_LC_COND : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv7_LC_OuterPHI : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_088 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1610 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_24_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_32_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2211 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2414 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B2_branch is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11413 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe126 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe15 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp7_phi_decision16_xor_RM : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_for_end31_LC_COND : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv7_LC_OuterPHI : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_LC_InnerPHI : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_088 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_32_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2211 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2414 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe11413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe126 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe15 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp7_phi_decision16_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv7_LC_OuterPHI : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_088 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1610 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_24_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_32_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2211 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2414 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B2_merge is
        port (
            in_c0_exe11413_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11413_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe15_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe15_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_fpgaindvars_iv7_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv7_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_088_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_088_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_32_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_32_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2211_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2211_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2414_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2414_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_31_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_31_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe11413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_fpgaindvars_iv7 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_088 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1610 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2211 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2414 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_31 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_maxpool2d_B2_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_c0_exe11413 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_c1_exe126 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_c1_exe15 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_cmp7_phi_decision16_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_for_end31_LC_COND : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv7_LC_OuterPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv_LC_InnerPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_i_088 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_j_1610 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_k_24_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_l_32_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_mul2211 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_mul2414 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_branch_out_c0_exe11413 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_c1_exe126 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_c1_exe15 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_branch_out_cmp7_phi_decision16_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_fpgaindvars_iv7_LC_OuterPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_branch_out_fpgaindvars_iv_LC_InnerPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_branch_out_i_088 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_j_1610 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_k_24_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_l_32_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_mul2211 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_mul2414 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_out_c0_exe11413 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_c1_exe15 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_out_fpgaindvars_iv : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_merge_out_fpgaindvars_iv7 : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_merge_out_i_088 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_j_1610 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_k_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_l_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_mul2211 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_mul2414 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_out_tmp_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- maxpool2d_B2_merge(BLACKBOX,41)
    themaxpool2d_B2_merge : maxpool2d_B2_merge
    PORT MAP (
        in_c0_exe11413_0 => in_c0_exe11413_0,
        in_c0_exe11413_1 => in_c0_exe11413_1,
        in_c0_exe11_0 => in_c0_exe11_0,
        in_c0_exe11_1 => in_c0_exe11_1,
        in_c1_exe15_0 => in_c1_exe15_0,
        in_c1_exe15_1 => in_c1_exe15_1,
        in_fpgaindvars_iv7_0 => in_fpgaindvars_iv7_0,
        in_fpgaindvars_iv7_1 => in_fpgaindvars_iv7_1,
        in_fpgaindvars_iv_0 => in_fpgaindvars_iv_0,
        in_fpgaindvars_iv_1 => in_fpgaindvars_iv_1,
        in_i_088_0 => in_i_088_0,
        in_i_088_1 => in_i_088_1,
        in_j_1610_0 => in_j_1610_0,
        in_j_1610_1 => in_j_1610_1,
        in_k_24_0 => in_k_24_0,
        in_k_24_1 => in_k_24_1,
        in_l_32_0 => in_l_32_0,
        in_l_32_1 => in_l_32_1,
        in_mul2211_0 => in_mul2211_0,
        in_mul2211_1 => in_mul2211_1,
        in_mul2414_0 => in_mul2414_0,
        in_mul2414_1 => in_mul2414_1,
        in_stall_in => bb_maxpool2d_B2_stall_region_out_stall_out,
        in_tmp_31_0 => in_tmp_31_0,
        in_tmp_31_1 => in_tmp_31_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe11 => maxpool2d_B2_merge_out_c0_exe11,
        out_c0_exe11413 => maxpool2d_B2_merge_out_c0_exe11413,
        out_c1_exe15 => maxpool2d_B2_merge_out_c1_exe15,
        out_fpgaindvars_iv => maxpool2d_B2_merge_out_fpgaindvars_iv,
        out_fpgaindvars_iv7 => maxpool2d_B2_merge_out_fpgaindvars_iv7,
        out_i_088 => maxpool2d_B2_merge_out_i_088,
        out_j_1610 => maxpool2d_B2_merge_out_j_1610,
        out_k_24 => maxpool2d_B2_merge_out_k_24,
        out_l_32 => maxpool2d_B2_merge_out_l_32,
        out_mul2211 => maxpool2d_B2_merge_out_mul2211,
        out_mul2414 => maxpool2d_B2_merge_out_mul2414,
        out_stall_out_0 => maxpool2d_B2_merge_out_stall_out_0,
        out_stall_out_1 => maxpool2d_B2_merge_out_stall_out_1,
        out_tmp_31 => maxpool2d_B2_merge_out_tmp_31,
        out_valid_out => maxpool2d_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B2_stall_region(BLACKBOX,2)
    thebb_maxpool2d_B2_stall_region : bb_maxpool2d_B2_stall_region
    PORT MAP (
        in_c0_exe11 => maxpool2d_B2_merge_out_c0_exe11,
        in_c0_exe11413 => maxpool2d_B2_merge_out_c0_exe11413,
        in_c1_exe15 => maxpool2d_B2_merge_out_c1_exe15,
        in_flush => in_flush,
        in_fpgaindvars_iv => maxpool2d_B2_merge_out_fpgaindvars_iv,
        in_fpgaindvars_iv7 => maxpool2d_B2_merge_out_fpgaindvars_iv7,
        in_i_088 => maxpool2d_B2_merge_out_i_088,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_j_1610 => maxpool2d_B2_merge_out_j_1610,
        in_k_24 => maxpool2d_B2_merge_out_k_24,
        in_l_32 => maxpool2d_B2_merge_out_l_32,
        in_mul2211 => maxpool2d_B2_merge_out_mul2211,
        in_mul2414 => maxpool2d_B2_merge_out_mul2414,
        in_output_size => in_output_size,
        in_stall_in => maxpool2d_B2_branch_out_stall_out,
        in_tmp_31 => maxpool2d_B2_merge_out_tmp_31,
        in_unnamed_maxpool2d0_avm_readdata => in_unnamed_maxpool2d0_avm_readdata,
        in_unnamed_maxpool2d0_avm_readdatavalid => in_unnamed_maxpool2d0_avm_readdatavalid,
        in_unnamed_maxpool2d0_avm_waitrequest => in_unnamed_maxpool2d0_avm_waitrequest,
        in_unnamed_maxpool2d0_avm_writeack => in_unnamed_maxpool2d0_avm_writeack,
        in_valid_in => maxpool2d_B2_merge_out_valid_out,
        out_c0_exe11 => bb_maxpool2d_B2_stall_region_out_c0_exe11,
        out_c0_exe11413 => bb_maxpool2d_B2_stall_region_out_c0_exe11413,
        out_c1_exe126 => bb_maxpool2d_B2_stall_region_out_c1_exe126,
        out_c1_exe15 => bb_maxpool2d_B2_stall_region_out_c1_exe15,
        out_cmp7_phi_decision16_xor_RM => bb_maxpool2d_B2_stall_region_out_cmp7_phi_decision16_xor_RM,
        out_for_end31_LC_COND => bb_maxpool2d_B2_stall_region_out_for_end31_LC_COND,
        out_fpgaindvars_iv7_LC_OuterPHI => bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv7_LC_OuterPHI,
        out_fpgaindvars_iv_LC_InnerPHI => bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv_LC_InnerPHI,
        out_i_088 => bb_maxpool2d_B2_stall_region_out_i_088,
        out_j_1610 => bb_maxpool2d_B2_stall_region_out_j_1610,
        out_k_24_LC_OuterPHI => bb_maxpool2d_B2_stall_region_out_k_24_LC_OuterPHI,
        out_l_32_LC_InnerPHI => bb_maxpool2d_B2_stall_region_out_l_32_LC_InnerPHI,
        out_mul2211 => bb_maxpool2d_B2_stall_region_out_mul2211,
        out_mul2414 => bb_maxpool2d_B2_stall_region_out_mul2414,
        out_stall_out => bb_maxpool2d_B2_stall_region_out_stall_out,
        out_unnamed_maxpool2d0_avm_address => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_address,
        out_unnamed_maxpool2d0_avm_burstcount => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_burstcount,
        out_unnamed_maxpool2d0_avm_byteenable => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_byteenable,
        out_unnamed_maxpool2d0_avm_enable => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_enable,
        out_unnamed_maxpool2d0_avm_read => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_read,
        out_unnamed_maxpool2d0_avm_write => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_write,
        out_unnamed_maxpool2d0_avm_writedata => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_writedata,
        out_valid_out => bb_maxpool2d_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- maxpool2d_B2_branch(BLACKBOX,40)
    themaxpool2d_B2_branch : maxpool2d_B2_branch
    PORT MAP (
        in_c0_exe11 => bb_maxpool2d_B2_stall_region_out_c0_exe11,
        in_c0_exe11413 => bb_maxpool2d_B2_stall_region_out_c0_exe11413,
        in_c1_exe126 => bb_maxpool2d_B2_stall_region_out_c1_exe126,
        in_c1_exe15 => bb_maxpool2d_B2_stall_region_out_c1_exe15,
        in_cmp7_phi_decision16_xor_RM => bb_maxpool2d_B2_stall_region_out_cmp7_phi_decision16_xor_RM,
        in_for_end31_LC_COND => bb_maxpool2d_B2_stall_region_out_for_end31_LC_COND,
        in_fpgaindvars_iv7_LC_OuterPHI => bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv7_LC_OuterPHI,
        in_fpgaindvars_iv_LC_InnerPHI => bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv_LC_InnerPHI,
        in_i_088 => bb_maxpool2d_B2_stall_region_out_i_088,
        in_j_1610 => bb_maxpool2d_B2_stall_region_out_j_1610,
        in_k_24_LC_OuterPHI => bb_maxpool2d_B2_stall_region_out_k_24_LC_OuterPHI,
        in_l_32_LC_InnerPHI => bb_maxpool2d_B2_stall_region_out_l_32_LC_InnerPHI,
        in_mul2211 => bb_maxpool2d_B2_stall_region_out_mul2211,
        in_mul2414 => bb_maxpool2d_B2_stall_region_out_mul2414,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_maxpool2d_B2_stall_region_out_valid_out,
        out_c0_exe11 => maxpool2d_B2_branch_out_c0_exe11,
        out_c0_exe11413 => maxpool2d_B2_branch_out_c0_exe11413,
        out_c1_exe126 => maxpool2d_B2_branch_out_c1_exe126,
        out_c1_exe15 => maxpool2d_B2_branch_out_c1_exe15,
        out_cmp7_phi_decision16_xor_RM => maxpool2d_B2_branch_out_cmp7_phi_decision16_xor_RM,
        out_fpgaindvars_iv7_LC_OuterPHI => maxpool2d_B2_branch_out_fpgaindvars_iv7_LC_OuterPHI,
        out_fpgaindvars_iv_LC_InnerPHI => maxpool2d_B2_branch_out_fpgaindvars_iv_LC_InnerPHI,
        out_i_088 => maxpool2d_B2_branch_out_i_088,
        out_j_1610 => maxpool2d_B2_branch_out_j_1610,
        out_k_24_LC_OuterPHI => maxpool2d_B2_branch_out_k_24_LC_OuterPHI,
        out_l_32_LC_InnerPHI => maxpool2d_B2_branch_out_l_32_LC_InnerPHI,
        out_mul2211 => maxpool2d_B2_branch_out_mul2211,
        out_mul2414 => maxpool2d_B2_branch_out_mul2414,
        out_stall_out => maxpool2d_B2_branch_out_stall_out,
        out_valid_out_0 => maxpool2d_B2_branch_out_valid_out_0,
        out_valid_out_1 => maxpool2d_B2_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe11(GPOUT,42)
    out_c0_exe11 <= maxpool2d_B2_branch_out_c0_exe11;

    -- out_c0_exe11413(GPOUT,43)
    out_c0_exe11413 <= maxpool2d_B2_branch_out_c0_exe11413;

    -- out_c1_exe126(GPOUT,44)
    out_c1_exe126 <= maxpool2d_B2_branch_out_c1_exe126;

    -- out_c1_exe15(GPOUT,45)
    out_c1_exe15 <= maxpool2d_B2_branch_out_c1_exe15;

    -- out_cmp7_phi_decision16_xor_RM(GPOUT,46)
    out_cmp7_phi_decision16_xor_RM <= maxpool2d_B2_branch_out_cmp7_phi_decision16_xor_RM;

    -- out_fpgaindvars_iv7_LC_OuterPHI(GPOUT,47)
    out_fpgaindvars_iv7_LC_OuterPHI <= maxpool2d_B2_branch_out_fpgaindvars_iv7_LC_OuterPHI;

    -- out_fpgaindvars_iv_LC_InnerPHI(GPOUT,48)
    out_fpgaindvars_iv_LC_InnerPHI <= maxpool2d_B2_branch_out_fpgaindvars_iv_LC_InnerPHI;

    -- out_i_088(GPOUT,49)
    out_i_088 <= maxpool2d_B2_branch_out_i_088;

    -- out_j_1610(GPOUT,50)
    out_j_1610 <= maxpool2d_B2_branch_out_j_1610;

    -- out_k_24_LC_OuterPHI(GPOUT,51)
    out_k_24_LC_OuterPHI <= maxpool2d_B2_branch_out_k_24_LC_OuterPHI;

    -- out_l_32_LC_InnerPHI(GPOUT,52)
    out_l_32_LC_InnerPHI <= maxpool2d_B2_branch_out_l_32_LC_InnerPHI;

    -- out_mul2211(GPOUT,53)
    out_mul2211 <= maxpool2d_B2_branch_out_mul2211;

    -- out_mul2414(GPOUT,54)
    out_mul2414 <= maxpool2d_B2_branch_out_mul2414;

    -- out_stall_out_0(GPOUT,55)
    out_stall_out_0 <= maxpool2d_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,56)
    out_stall_out_1 <= maxpool2d_B2_merge_out_stall_out_1;

    -- out_unnamed_maxpool2d0_avm_address(GPOUT,57)
    out_unnamed_maxpool2d0_avm_address <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_address;

    -- out_unnamed_maxpool2d0_avm_burstcount(GPOUT,58)
    out_unnamed_maxpool2d0_avm_burstcount <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_burstcount;

    -- out_unnamed_maxpool2d0_avm_byteenable(GPOUT,59)
    out_unnamed_maxpool2d0_avm_byteenable <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_byteenable;

    -- out_unnamed_maxpool2d0_avm_enable(GPOUT,60)
    out_unnamed_maxpool2d0_avm_enable <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_enable;

    -- out_unnamed_maxpool2d0_avm_read(GPOUT,61)
    out_unnamed_maxpool2d0_avm_read <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_read;

    -- out_unnamed_maxpool2d0_avm_write(GPOUT,62)
    out_unnamed_maxpool2d0_avm_write <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_write;

    -- out_unnamed_maxpool2d0_avm_writedata(GPOUT,63)
    out_unnamed_maxpool2d0_avm_writedata <= bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0_avm_writedata;

    -- out_valid_out_0(GPOUT,64)
    out_valid_out_0 <= maxpool2d_B2_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,65)
    out_valid_out_1 <= maxpool2d_B2_branch_out_valid_out_1;

END normal;
