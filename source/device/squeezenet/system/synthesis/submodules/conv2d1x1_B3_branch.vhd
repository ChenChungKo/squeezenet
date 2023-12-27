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

-- VHDL created from conv2d1x1_B3_branch
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

entity conv2d1x1_B3_branch is
    port (
        in_c0_exe13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe27 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe111 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc68 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x110 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x19 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe27 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc68 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B3_branch;

architecture normal of conv2d1x1_B3_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe13_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe16_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe27_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe111_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inc68_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x110_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x19_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,20)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_conv2d1x110_cmp(LOGICAL,34)
    unnamed_conv2d1x110_cmp_q <= not (in_unnamed_conv2d1x110);

    -- valid_out_1_and(LOGICAL,39)
    valid_out_1_and_q <= in_valid_in and unnamed_conv2d1x110_cmp_q;

    -- valid_1_reg(REG,37)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,22)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,24)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,19)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,38)
    valid_out_0_and_q <= in_valid_in and in_unnamed_conv2d1x110;

    -- valid_0_reg(REG,36)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,21)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,23)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- conv2d1x1_B3_branch_enable(LOGICAL,6)
    conv2d1x1_B3_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe13_reg(REG,2)
    c0_exe13_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe13_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                c0_exe13_reg_q <= in_c0_exe13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe13(GPOUT,25)
    out_c0_exe13 <= c0_exe13_reg_q;

    -- c1_exe16_reg(REG,3)
    c1_exe16_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe16_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                c1_exe16_reg_q <= in_c1_exe16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe16(GPOUT,26)
    out_c1_exe16 <= c1_exe16_reg_q;

    -- c1_exe27_reg(REG,4)
    c1_exe27_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe27_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                c1_exe27_reg_q <= in_c1_exe27;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe27(GPOUT,27)
    out_c1_exe27 <= c1_exe27_reg_q;

    -- c2_exe111_reg(REG,5)
    c2_exe111_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe111_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                c2_exe111_reg_q <= in_c2_exe111;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe111(GPOUT,28)
    out_c2_exe111 <= c2_exe111_reg_q;

    -- inc68_reg(REG,8)
    inc68_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc68_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                inc68_reg_q <= in_inc68;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc68(GPOUT,29)
    out_inc68 <= inc68_reg_q;

    -- conv2d1x1_B3_branch_enable_not(LOGICAL,7)
    conv2d1x1_B3_branch_enable_not_q <= not (conv2d1x1_B3_branch_enable_q);

    -- out_stall_out(GPOUT,30)
    out_stall_out <= conv2d1x1_B3_branch_enable_not_q;

    -- unnamed_conv2d1x19_reg(REG,35)
    unnamed_conv2d1x19_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_conv2d1x19_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B3_branch_enable_q = "1") THEN
                unnamed_conv2d1x19_reg_q <= STD_LOGIC_VECTOR(in_unnamed_conv2d1x19);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_conv2d1x19(GPOUT,31)
    out_unnamed_conv2d1x19 <= unnamed_conv2d1x19_reg_q;

    -- out_valid_out_0(GPOUT,32)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,33)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
