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

-- VHDL created from conv2d3x3_B2_branch
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

entity conv2d3x3_B2_branch is
    port (
        in_c0_exe1045 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1146 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115436 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1248 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1349 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1450 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1551 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1652 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe17 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe237 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe338 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe439 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe540 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe641 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe742 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe944 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe111 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe1176 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exe116 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe219 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe324 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe425 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe530 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe633 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe114 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc60 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01535 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x33 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1045 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1146 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe115436 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1248 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1349 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1450 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1551 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1652 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe17 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe237 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe338 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe439 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe540 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe641 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe742 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe843 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe944 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe111 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1176 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exe116 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe219 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe425 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe530 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe633 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc60 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_01535 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B2_branch;

architecture normal of conv2d3x3_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1045_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1146_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe115436_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1248_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1349_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1450_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1551_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1652_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe17_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe237_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe338_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe439_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe540_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe641_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe742_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe843_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe944_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe111_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe1176_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe116_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe219_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe324_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe425_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe530_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe633_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exe114_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inc60_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_01535_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d3x32_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d3x33_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,66)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_conv2d3x33_cmp(LOGICAL,104)
    unnamed_conv2d3x33_cmp_q <= not (in_unnamed_conv2d3x33);

    -- valid_out_1_and(LOGICAL,108)
    valid_out_1_and_q <= in_valid_in and unnamed_conv2d3x33_cmp_q;

    -- valid_1_reg(REG,106)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,68)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,70)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,65)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,107)
    valid_out_0_and_q <= in_valid_in and in_unnamed_conv2d3x33;

    -- valid_0_reg(REG,105)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,67)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,69)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- conv2d3x3_B2_branch_enable(LOGICAL,28)
    conv2d3x3_B2_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe1045_reg(REG,2)
    c0_exe1045_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1045_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1045_reg_q <= in_c0_exe1045;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1045(GPOUT,71)
    out_c0_exe1045 <= c0_exe1045_reg_q;

    -- c0_exe1146_reg(REG,3)
    c0_exe1146_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1146_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1146_reg_q <= in_c0_exe1146;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1146(GPOUT,72)
    out_c0_exe1146 <= c0_exe1146_reg_q;

    -- c0_exe115436_reg(REG,4)
    c0_exe115436_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe115436_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe115436_reg_q <= in_c0_exe115436;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe115436(GPOUT,73)
    out_c0_exe115436 <= c0_exe115436_reg_q;

    -- c0_exe1248_reg(REG,5)
    c0_exe1248_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1248_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1248_reg_q <= in_c0_exe1248;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1248(GPOUT,74)
    out_c0_exe1248 <= c0_exe1248_reg_q;

    -- c0_exe1349_reg(REG,6)
    c0_exe1349_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1349_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1349_reg_q <= in_c0_exe1349;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1349(GPOUT,75)
    out_c0_exe1349 <= c0_exe1349_reg_q;

    -- c0_exe1450_reg(REG,7)
    c0_exe1450_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1450_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1450_reg_q <= in_c0_exe1450;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1450(GPOUT,76)
    out_c0_exe1450 <= c0_exe1450_reg_q;

    -- c0_exe1551_reg(REG,8)
    c0_exe1551_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1551_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1551_reg_q <= in_c0_exe1551;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1551(GPOUT,77)
    out_c0_exe1551 <= c0_exe1551_reg_q;

    -- c0_exe1652_reg(REG,9)
    c0_exe1652_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1652_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe1652_reg_q <= in_c0_exe1652;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1652(GPOUT,78)
    out_c0_exe1652 <= c0_exe1652_reg_q;

    -- c0_exe17_reg(REG,10)
    c0_exe17_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe17_reg_q <= in_c0_exe17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17(GPOUT,79)
    out_c0_exe17 <= c0_exe17_reg_q;

    -- c0_exe237_reg(REG,11)
    c0_exe237_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe237_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe237_reg_q <= in_c0_exe237;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe237(GPOUT,80)
    out_c0_exe237 <= c0_exe237_reg_q;

    -- c0_exe338_reg(REG,12)
    c0_exe338_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe338_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe338_reg_q <= in_c0_exe338;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe338(GPOUT,81)
    out_c0_exe338 <= c0_exe338_reg_q;

    -- c0_exe439_reg(REG,13)
    c0_exe439_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe439_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe439_reg_q <= in_c0_exe439;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe439(GPOUT,82)
    out_c0_exe439 <= c0_exe439_reg_q;

    -- c0_exe540_reg(REG,14)
    c0_exe540_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe540_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe540_reg_q <= in_c0_exe540;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe540(GPOUT,83)
    out_c0_exe540 <= c0_exe540_reg_q;

    -- c0_exe641_reg(REG,15)
    c0_exe641_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe641_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe641_reg_q <= in_c0_exe641;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe641(GPOUT,84)
    out_c0_exe641 <= c0_exe641_reg_q;

    -- c0_exe742_reg(REG,16)
    c0_exe742_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe742_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe742_reg_q <= in_c0_exe742;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe742(GPOUT,85)
    out_c0_exe742 <= c0_exe742_reg_q;

    -- c0_exe843_reg(REG,17)
    c0_exe843_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe843_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe843_reg_q <= in_c0_exe843;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe843(GPOUT,86)
    out_c0_exe843 <= c0_exe843_reg_q;

    -- c0_exe944_reg(REG,18)
    c0_exe944_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe944_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe944_reg_q <= in_c0_exe944;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe944(GPOUT,87)
    out_c0_exe944 <= c0_exe944_reg_q;

    -- c1_exe111_reg(REG,19)
    c1_exe111_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe111_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe111_reg_q <= in_c1_exe111;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe111(GPOUT,88)
    out_c1_exe111 <= c1_exe111_reg_q;

    -- c1_exe1176_reg(REG,20)
    c1_exe1176_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe1176_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe1176_reg_q <= STD_LOGIC_VECTOR(in_c1_exe1176);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe1176(GPOUT,89)
    out_c1_exe1176 <= c1_exe1176_reg_q;

    -- c2_exe116_reg(REG,21)
    c2_exe116_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe116_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c2_exe116_reg_q <= in_c2_exe116;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe116(GPOUT,90)
    out_c2_exe116 <= c2_exe116_reg_q;

    -- c2_exe219_reg(REG,22)
    c2_exe219_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe219_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c2_exe219_reg_q <= in_c2_exe219;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe219(GPOUT,91)
    out_c2_exe219 <= c2_exe219_reg_q;

    -- c2_exe324_reg(REG,23)
    c2_exe324_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe324_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c2_exe324_reg_q <= in_c2_exe324;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe324(GPOUT,92)
    out_c2_exe324 <= c2_exe324_reg_q;

    -- c2_exe425_reg(REG,24)
    c2_exe425_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe425_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c2_exe425_reg_q <= in_c2_exe425;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe425(GPOUT,93)
    out_c2_exe425 <= c2_exe425_reg_q;

    -- c2_exe530_reg(REG,25)
    c2_exe530_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe530_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c2_exe530_reg_q <= in_c2_exe530;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe530(GPOUT,94)
    out_c2_exe530 <= c2_exe530_reg_q;

    -- c2_exe633_reg(REG,26)
    c2_exe633_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe633_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c2_exe633_reg_q <= in_c2_exe633;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe633(GPOUT,95)
    out_c2_exe633 <= c2_exe633_reg_q;

    -- c3_exe114_reg(REG,27)
    c3_exe114_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c3_exe114_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c3_exe114_reg_q <= in_c3_exe114;
            END IF;
        END IF;
    END PROCESS;

    -- out_c3_exe114(GPOUT,96)
    out_c3_exe114 <= c3_exe114_reg_q;

    -- inc60_reg(REG,30)
    inc60_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc60_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                inc60_reg_q <= in_inc60;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc60(GPOUT,97)
    out_inc60 <= inc60_reg_q;

    -- j_01535_reg(REG,64)
    j_01535_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_01535_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                j_01535_reg_q <= in_j_01535;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_01535(GPOUT,98)
    out_j_01535 <= j_01535_reg_q;

    -- conv2d3x3_B2_branch_enable_not(LOGICAL,29)
    conv2d3x3_B2_branch_enable_not_q <= not (conv2d3x3_B2_branch_enable_q);

    -- out_stall_out(GPOUT,99)
    out_stall_out <= conv2d3x3_B2_branch_enable_not_q;

    -- unnamed_conv2d3x32_reg(REG,103)
    unnamed_conv2d3x32_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_conv2d3x32_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                unnamed_conv2d3x32_reg_q <= STD_LOGIC_VECTOR(in_unnamed_conv2d3x32);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_conv2d3x32(GPOUT,100)
    out_unnamed_conv2d3x32 <= unnamed_conv2d3x32_reg_q;

    -- out_valid_out_0(GPOUT,101)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,102)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
