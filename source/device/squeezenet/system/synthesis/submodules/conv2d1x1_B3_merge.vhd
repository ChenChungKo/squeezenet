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

-- VHDL created from conv2d1x1_B3_merge
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

entity conv2d1x1_B3_merge is
    port (
        in_add15_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe12118_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe16_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe27_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe111_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp9_phi_decision20_xor_RM17_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_01013_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x19_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_add15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe12118 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe27 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_cmp9_phi_decision20_xor_RM17 : out std_logic_vector(0 downto 0);  -- ufix1
        out_j_01013 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B3_merge;

architecture normal of conv2d1x1_B3_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_add15(GPOUT,13)
    out_add15 <= in_add15_0;

    -- out_c0_exe13(GPOUT,14)
    out_c0_exe13 <= in_c0_exe13_0;

    -- out_c1_exe12118(GPOUT,15)
    out_c1_exe12118 <= in_c1_exe12118_0;

    -- out_c1_exe16(GPOUT,16)
    out_c1_exe16 <= in_c1_exe16_0;

    -- out_c1_exe27(GPOUT,17)
    out_c1_exe27 <= in_c1_exe27_0;

    -- out_c2_exe111(GPOUT,18)
    out_c2_exe111 <= in_c2_exe111_0;

    -- out_cmp9_phi_decision20_xor_RM17(GPOUT,19)
    out_cmp9_phi_decision20_xor_RM17 <= in_cmp9_phi_decision20_xor_RM17_0;

    -- out_j_01013(GPOUT,20)
    out_j_01013 <= in_j_01013_0;

    -- stall_out(LOGICAL,24)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,21)
    out_stall_out_0 <= stall_out_q;

    -- out_unnamed_conv2d1x19(GPOUT,22)
    out_unnamed_conv2d1x19 <= in_unnamed_conv2d1x19_0;

    -- out_valid_out(GPOUT,23)
    out_valid_out <= in_valid_in_0;

END normal;
