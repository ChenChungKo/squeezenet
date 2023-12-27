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

-- VHDL created from conv2d3x3_B0_branch
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

entity conv2d3x3_B0_branch is
    port (
        in_c0_exe1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B0_branch;

architecture normal of conv2d3x3_B0_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe1(GPOUT,14)
    out_c0_exe1 <= in_c0_exe1;

    -- out_c1_exe1(GPOUT,15)
    out_c1_exe1 <= in_c1_exe1;

    -- out_c2_exe1(GPOUT,16)
    out_c2_exe1 <= in_c2_exe1;

    -- out_c2_exe2(GPOUT,17)
    out_c2_exe2 <= in_c2_exe2;

    -- out_c2_exe3(GPOUT,18)
    out_c2_exe3 <= in_c2_exe3;

    -- out_c2_exe4(GPOUT,19)
    out_c2_exe4 <= in_c2_exe4;

    -- out_c2_exe5(GPOUT,20)
    out_c2_exe5 <= in_c2_exe5;

    -- out_c2_exe6(GPOUT,21)
    out_c2_exe6 <= in_c2_exe6;

    -- out_c3_exe1(GPOUT,22)
    out_c3_exe1 <= in_c3_exe1;

    -- stall_out(LOGICAL,26)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,23)
    out_stall_out <= stall_out_q;

    -- out_unnamed_conv2d3x30(GPOUT,24)
    out_unnamed_conv2d3x30 <= in_unnamed_conv2d3x30;

    -- out_valid_out_0(GPOUT,25)
    out_valid_out_0 <= in_valid_in;

END normal;
