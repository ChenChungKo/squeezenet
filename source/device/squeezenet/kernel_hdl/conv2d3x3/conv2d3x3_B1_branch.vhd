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

-- VHDL created from conv2d3x3_B1_branch
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

entity conv2d3x3_B1_branch is
    port (
        in_c0_exe10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1154 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe18 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe112 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe117 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe220 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe322 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe426 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe528 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe631 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_015 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x31 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1154 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe18 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe112 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe117 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe220 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe322 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe426 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe528 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe631 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_015 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B1_branch;

architecture normal of conv2d3x3_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe10(GPOUT,31)
    out_c0_exe10 <= in_c0_exe10;

    -- out_c0_exe11(GPOUT,32)
    out_c0_exe11 <= in_c0_exe11;

    -- out_c0_exe1154(GPOUT,33)
    out_c0_exe1154 <= in_c0_exe1154;

    -- out_c0_exe12(GPOUT,34)
    out_c0_exe12 <= in_c0_exe12;

    -- out_c0_exe13(GPOUT,35)
    out_c0_exe13 <= in_c0_exe13;

    -- out_c0_exe14(GPOUT,36)
    out_c0_exe14 <= in_c0_exe14;

    -- out_c0_exe15(GPOUT,37)
    out_c0_exe15 <= in_c0_exe15;

    -- out_c0_exe16(GPOUT,38)
    out_c0_exe16 <= in_c0_exe16;

    -- out_c0_exe18(GPOUT,39)
    out_c0_exe18 <= in_c0_exe18;

    -- out_c0_exe2(GPOUT,40)
    out_c0_exe2 <= in_c0_exe2;

    -- out_c0_exe3(GPOUT,41)
    out_c0_exe3 <= in_c0_exe3;

    -- out_c0_exe4(GPOUT,42)
    out_c0_exe4 <= in_c0_exe4;

    -- out_c0_exe5(GPOUT,43)
    out_c0_exe5 <= in_c0_exe5;

    -- out_c0_exe6(GPOUT,44)
    out_c0_exe6 <= in_c0_exe6;

    -- out_c0_exe7(GPOUT,45)
    out_c0_exe7 <= in_c0_exe7;

    -- out_c0_exe8(GPOUT,46)
    out_c0_exe8 <= in_c0_exe8;

    -- out_c0_exe9(GPOUT,47)
    out_c0_exe9 <= in_c0_exe9;

    -- out_c1_exe112(GPOUT,48)
    out_c1_exe112 <= in_c1_exe112;

    -- out_c2_exe117(GPOUT,49)
    out_c2_exe117 <= in_c2_exe117;

    -- out_c2_exe220(GPOUT,50)
    out_c2_exe220 <= in_c2_exe220;

    -- out_c2_exe322(GPOUT,51)
    out_c2_exe322 <= in_c2_exe322;

    -- out_c2_exe426(GPOUT,52)
    out_c2_exe426 <= in_c2_exe426;

    -- out_c2_exe528(GPOUT,53)
    out_c2_exe528 <= in_c2_exe528;

    -- out_c2_exe631(GPOUT,54)
    out_c2_exe631 <= in_c2_exe631;

    -- out_c3_exe115(GPOUT,55)
    out_c3_exe115 <= in_c3_exe115;

    -- out_j_015(GPOUT,56)
    out_j_015 <= in_j_015;

    -- stall_out(LOGICAL,60)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,57)
    out_stall_out <= stall_out_q;

    -- out_unnamed_conv2d3x31(GPOUT,58)
    out_unnamed_conv2d3x31 <= in_unnamed_conv2d3x31;

    -- out_valid_out_0(GPOUT,59)
    out_valid_out_0 <= in_valid_in;

END normal;
