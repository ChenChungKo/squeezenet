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

-- VHDL created from conv2d1x1_B2_branch
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

entity conv2d1x1_B2_branch is
    port (
        in_add16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe121 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe28 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe112 : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp9_phi_decision20_xor_RM : in std_logic_vector(0 downto 0);  -- ufix1
        in_inc : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01014 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x13 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B2_branch;

architecture normal of conv2d1x1_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal add16_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe121_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe14_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe28_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe112_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cmp9_phi_decision20_xor_RM_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inc_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_01014_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x12_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d1x13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,28)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_conv2d1x13_cmp(LOGICAL,47)
    unnamed_conv2d1x13_cmp_q <= not (in_unnamed_conv2d1x13);

    -- valid_out_1_and(LOGICAL,51)
    valid_out_1_and_q <= in_valid_in and unnamed_conv2d1x13_cmp_q;

    -- valid_1_reg(REG,49)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,30)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,32)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,27)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,50)
    valid_out_0_and_q <= in_valid_in and in_unnamed_conv2d1x13;

    -- valid_0_reg(REG,48)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,29)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,31)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- conv2d1x1_B2_branch_enable(LOGICAL,9)
    conv2d1x1_B2_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- add16_reg(REG,2)
    add16_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            add16_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                add16_reg_q <= in_add16;
            END IF;
        END IF;
    END PROCESS;

    -- out_add16(GPOUT,33)
    out_add16 <= add16_reg_q;

    -- c0_exe11_reg(REG,3)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,34)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c1_exe121_reg(REG,4)
    c1_exe121_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe121_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exe121_reg_q <= STD_LOGIC_VECTOR(in_c1_exe121);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe121(GPOUT,35)
    out_c1_exe121 <= c1_exe121_reg_q;

    -- c1_exe14_reg(REG,5)
    c1_exe14_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe14_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exe14_reg_q <= in_c1_exe14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe14(GPOUT,36)
    out_c1_exe14 <= c1_exe14_reg_q;

    -- c1_exe28_reg(REG,6)
    c1_exe28_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe28_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exe28_reg_q <= in_c1_exe28;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe28(GPOUT,37)
    out_c1_exe28 <= c1_exe28_reg_q;

    -- c2_exe112_reg(REG,7)
    c2_exe112_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe112_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c2_exe112_reg_q <= in_c2_exe112;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe112(GPOUT,38)
    out_c2_exe112 <= c2_exe112_reg_q;

    -- cmp9_phi_decision20_xor_RM_reg(REG,8)
    cmp9_phi_decision20_xor_RM_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            cmp9_phi_decision20_xor_RM_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                cmp9_phi_decision20_xor_RM_reg_q <= in_cmp9_phi_decision20_xor_RM;
            END IF;
        END IF;
    END PROCESS;

    -- out_cmp9_phi_decision20_xor_RM(GPOUT,39)
    out_cmp9_phi_decision20_xor_RM <= cmp9_phi_decision20_xor_RM_reg_q;

    -- inc_reg(REG,11)
    inc_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                inc_reg_q <= in_inc;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc(GPOUT,40)
    out_inc <= inc_reg_q;

    -- j_01014_reg(REG,26)
    j_01014_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_01014_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                j_01014_reg_q <= in_j_01014;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_01014(GPOUT,41)
    out_j_01014 <= j_01014_reg_q;

    -- conv2d1x1_B2_branch_enable_not(LOGICAL,10)
    conv2d1x1_B2_branch_enable_not_q <= not (conv2d1x1_B2_branch_enable_q);

    -- out_stall_out(GPOUT,42)
    out_stall_out <= conv2d1x1_B2_branch_enable_not_q;

    -- unnamed_conv2d1x12_reg(REG,46)
    unnamed_conv2d1x12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_conv2d1x12_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                unnamed_conv2d1x12_reg_q <= STD_LOGIC_VECTOR(in_unnamed_conv2d1x12);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_conv2d1x12(GPOUT,43)
    out_unnamed_conv2d1x12 <= unnamed_conv2d1x12_reg_q;

    -- out_valid_out_0(GPOUT,44)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,45)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
