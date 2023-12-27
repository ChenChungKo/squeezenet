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

-- VHDL created from maxpool2d_B3_merge
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

entity maxpool2d_B3_merge is
    port (
        in_c0_exe11412_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe12616_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe14_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp7_phi_decision16_xor_RM15_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_087_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_169_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11412 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe12616 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe14 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp7_phi_decision16_xor_RM15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_087 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_169 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end maxpool2d_B3_merge;

architecture normal of maxpool2d_B3_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe11412(GPOUT,11)
    out_c0_exe11412 <= in_c0_exe11412_0;

    -- out_c0_exe13(GPOUT,12)
    out_c0_exe13 <= in_c0_exe13_0;

    -- out_c1_exe12616(GPOUT,13)
    out_c1_exe12616 <= in_c1_exe12616_0;

    -- out_c1_exe14(GPOUT,14)
    out_c1_exe14 <= in_c1_exe14_0;

    -- out_cmp7_phi_decision16_xor_RM15(GPOUT,15)
    out_cmp7_phi_decision16_xor_RM15 <= in_cmp7_phi_decision16_xor_RM15_0;

    -- out_i_087(GPOUT,16)
    out_i_087 <= in_i_087_0;

    -- out_j_169(GPOUT,17)
    out_j_169 <= in_j_169_0;

    -- stall_out(LOGICAL,20)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,18)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,19)
    out_valid_out <= in_valid_in_0;

END normal;
