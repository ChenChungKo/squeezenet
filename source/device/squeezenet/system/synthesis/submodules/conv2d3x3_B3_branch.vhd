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

-- VHDL created from conv2d3x3_B3_branch
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

entity conv2d3x3_B3_branch is
    port (
        in_c0_exe19 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe110 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe118 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe221 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe323 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe427 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe529 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe632 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe113 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc72 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x34 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x35 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe19 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe110 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe118 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe221 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe323 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe427 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe529 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe632 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe113 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc72 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x34 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B3_branch;

architecture normal of conv2d3x3_B3_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe19_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe110_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe118_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe221_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe323_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe427_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe529_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe632_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exe113_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inc72_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d3x34_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d3x35_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,30)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_conv2d3x35_cmp(LOGICAL,50)
    unnamed_conv2d3x35_cmp_q <= not (in_unnamed_conv2d3x35);

    -- valid_out_1_and(LOGICAL,54)
    valid_out_1_and_q <= in_valid_in and unnamed_conv2d3x35_cmp_q;

    -- valid_1_reg(REG,52)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,32)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,34)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,29)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,53)
    valid_out_0_and_q <= in_valid_in and in_unnamed_conv2d3x35;

    -- valid_0_reg(REG,51)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,31)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,33)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- conv2d3x3_B3_branch_enable(LOGICAL,11)
    conv2d3x3_B3_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe19_reg(REG,2)
    c0_exe19_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe19_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c0_exe19_reg_q <= in_c0_exe19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe19(GPOUT,35)
    out_c0_exe19 <= c0_exe19_reg_q;

    -- c1_exe110_reg(REG,3)
    c1_exe110_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe110_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c1_exe110_reg_q <= in_c1_exe110;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe110(GPOUT,36)
    out_c1_exe110 <= c1_exe110_reg_q;

    -- c2_exe118_reg(REG,4)
    c2_exe118_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe118_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c2_exe118_reg_q <= in_c2_exe118;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe118(GPOUT,37)
    out_c2_exe118 <= c2_exe118_reg_q;

    -- c2_exe221_reg(REG,5)
    c2_exe221_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe221_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c2_exe221_reg_q <= in_c2_exe221;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe221(GPOUT,38)
    out_c2_exe221 <= c2_exe221_reg_q;

    -- c2_exe323_reg(REG,6)
    c2_exe323_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe323_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c2_exe323_reg_q <= in_c2_exe323;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe323(GPOUT,39)
    out_c2_exe323 <= c2_exe323_reg_q;

    -- c2_exe427_reg(REG,7)
    c2_exe427_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe427_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c2_exe427_reg_q <= in_c2_exe427;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe427(GPOUT,40)
    out_c2_exe427 <= c2_exe427_reg_q;

    -- c2_exe529_reg(REG,8)
    c2_exe529_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe529_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c2_exe529_reg_q <= in_c2_exe529;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe529(GPOUT,41)
    out_c2_exe529 <= c2_exe529_reg_q;

    -- c2_exe632_reg(REG,9)
    c2_exe632_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe632_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c2_exe632_reg_q <= in_c2_exe632;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe632(GPOUT,42)
    out_c2_exe632 <= c2_exe632_reg_q;

    -- c3_exe113_reg(REG,10)
    c3_exe113_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c3_exe113_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                c3_exe113_reg_q <= in_c3_exe113;
            END IF;
        END IF;
    END PROCESS;

    -- out_c3_exe113(GPOUT,43)
    out_c3_exe113 <= c3_exe113_reg_q;

    -- inc72_reg(REG,13)
    inc72_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc72_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                inc72_reg_q <= in_inc72;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc72(GPOUT,44)
    out_inc72 <= inc72_reg_q;

    -- conv2d3x3_B3_branch_enable_not(LOGICAL,12)
    conv2d3x3_B3_branch_enable_not_q <= not (conv2d3x3_B3_branch_enable_q);

    -- out_stall_out(GPOUT,45)
    out_stall_out <= conv2d3x3_B3_branch_enable_not_q;

    -- unnamed_conv2d3x34_reg(REG,49)
    unnamed_conv2d3x34_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_conv2d3x34_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B3_branch_enable_q = "1") THEN
                unnamed_conv2d3x34_reg_q <= STD_LOGIC_VECTOR(in_unnamed_conv2d3x34);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_conv2d3x34(GPOUT,46)
    out_unnamed_conv2d3x34 <= unnamed_conv2d3x34_reg_q;

    -- out_valid_out_0(GPOUT,47)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,48)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
