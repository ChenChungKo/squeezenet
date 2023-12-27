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

-- VHDL created from maxpool2d_B2_branch
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

entity maxpool2d_B2_branch is
    port (
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11413 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe126 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe15 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp7_phi_decision16_xor_RM : in std_logic_vector(0 downto 0);  -- ufix1
        in_for_end31_LC_COND : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv7_LC_OuterPHI : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_LC_InnerPHI : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_088 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1610 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_32_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2211 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2414 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end maxpool2d_B2_branch;

architecture normal of maxpool2d_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11413_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe126_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe15_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cmp7_phi_decision16_xor_RM_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal for_end31_LC_COND_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv7_LC_OuterPHI_reg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fpgaindvars_iv_LC_InnerPHI_reg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_088_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_1610_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal k_24_LC_OuterPHI_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_32_LC_InnerPHI_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mul2211_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mul2414_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,36)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- for_end31_LC_COND_cmp(LOGICAL,7)
    for_end31_LC_COND_cmp_q <= not (in_for_end31_LC_COND);

    -- valid_out_1_and(LOGICAL,60)
    valid_out_1_and_q <= in_valid_in and for_end31_LC_COND_cmp_q;

    -- valid_1_reg(REG,58)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,38)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,40)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,35)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,59)
    valid_out_0_and_q <= in_valid_in and in_for_end31_LC_COND;

    -- valid_0_reg(REG,57)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,37)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,39)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- maxpool2d_B2_branch_enable(LOGICAL,31)
    maxpool2d_B2_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe11_reg(REG,3)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,41)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c0_exe11413_reg(REG,2)
    c0_exe11413_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11413_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                c0_exe11413_reg_q <= in_c0_exe11413;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11413(GPOUT,42)
    out_c0_exe11413 <= c0_exe11413_reg_q;

    -- c1_exe126_reg(REG,4)
    c1_exe126_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe126_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                c1_exe126_reg_q <= STD_LOGIC_VECTOR(in_c1_exe126);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe126(GPOUT,43)
    out_c1_exe126 <= c1_exe126_reg_q;

    -- c1_exe15_reg(REG,5)
    c1_exe15_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe15_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                c1_exe15_reg_q <= in_c1_exe15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe15(GPOUT,44)
    out_c1_exe15 <= c1_exe15_reg_q;

    -- cmp7_phi_decision16_xor_RM_reg(REG,6)
    cmp7_phi_decision16_xor_RM_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            cmp7_phi_decision16_xor_RM_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                cmp7_phi_decision16_xor_RM_reg_q <= in_cmp7_phi_decision16_xor_RM;
            END IF;
        END IF;
    END PROCESS;

    -- out_cmp7_phi_decision16_xor_RM(GPOUT,45)
    out_cmp7_phi_decision16_xor_RM <= cmp7_phi_decision16_xor_RM_reg_q;

    -- fpgaindvars_iv7_LC_OuterPHI_reg(REG,8)
    fpgaindvars_iv7_LC_OuterPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv7_LC_OuterPHI_reg_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                fpgaindvars_iv7_LC_OuterPHI_reg_q <= in_fpgaindvars_iv7_LC_OuterPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv7_LC_OuterPHI(GPOUT,46)
    out_fpgaindvars_iv7_LC_OuterPHI <= fpgaindvars_iv7_LC_OuterPHI_reg_q;

    -- fpgaindvars_iv_LC_InnerPHI_reg(REG,9)
    fpgaindvars_iv_LC_InnerPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv_LC_InnerPHI_reg_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                fpgaindvars_iv_LC_InnerPHI_reg_q <= in_fpgaindvars_iv_LC_InnerPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv_LC_InnerPHI(GPOUT,47)
    out_fpgaindvars_iv_LC_InnerPHI <= fpgaindvars_iv_LC_InnerPHI_reg_q;

    -- i_088_reg(REG,10)
    i_088_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_088_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                i_088_reg_q <= in_i_088;
            END IF;
        END IF;
    END PROCESS;

    -- out_i_088(GPOUT,48)
    out_i_088 <= i_088_reg_q;

    -- j_1610_reg(REG,28)
    j_1610_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_1610_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                j_1610_reg_q <= in_j_1610;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_1610(GPOUT,49)
    out_j_1610 <= j_1610_reg_q;

    -- k_24_LC_OuterPHI_reg(REG,29)
    k_24_LC_OuterPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            k_24_LC_OuterPHI_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                k_24_LC_OuterPHI_reg_q <= in_k_24_LC_OuterPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_k_24_LC_OuterPHI(GPOUT,50)
    out_k_24_LC_OuterPHI <= k_24_LC_OuterPHI_reg_q;

    -- l_32_LC_InnerPHI_reg(REG,30)
    l_32_LC_InnerPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            l_32_LC_InnerPHI_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                l_32_LC_InnerPHI_reg_q <= in_l_32_LC_InnerPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_l_32_LC_InnerPHI(GPOUT,51)
    out_l_32_LC_InnerPHI <= l_32_LC_InnerPHI_reg_q;

    -- mul2211_reg(REG,33)
    mul2211_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            mul2211_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                mul2211_reg_q <= in_mul2211;
            END IF;
        END IF;
    END PROCESS;

    -- out_mul2211(GPOUT,52)
    out_mul2211 <= mul2211_reg_q;

    -- mul2414_reg(REG,34)
    mul2414_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            mul2414_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                mul2414_reg_q <= in_mul2414;
            END IF;
        END IF;
    END PROCESS;

    -- out_mul2414(GPOUT,53)
    out_mul2414 <= mul2414_reg_q;

    -- maxpool2d_B2_branch_enable_not(LOGICAL,32)
    maxpool2d_B2_branch_enable_not_q <= not (maxpool2d_B2_branch_enable_q);

    -- out_stall_out(GPOUT,54)
    out_stall_out <= maxpool2d_B2_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,55)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,56)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
