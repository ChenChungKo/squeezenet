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

-- VHDL created from maxpool2d_B2_merge
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

entity maxpool2d_B2_merge is
    port (
        in_c0_exe11413_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11413_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_fpgaindvars_iv7_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv7_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_088_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_088_1 : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_31_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_31_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe11413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe15 : out std_logic_vector(63 downto 0);  -- ufix64
        out_fpgaindvars_iv : out std_logic_vector(2 downto 0);  -- ufix3
        out_fpgaindvars_iv7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_088 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1610 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2211 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2414 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_31 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end maxpool2d_B2_merge;

architecture normal of maxpool2d_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11413_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11413_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe15_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe15_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fpgaindvars_iv7_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv7_mux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fpgaindvars_iv_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_088_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_088_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_1610_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_1610_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal k_24_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal k_24_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_32_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_32_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mul2211_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul2211_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mul2414_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul2414_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_31_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_31_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe11_mux(MUX,3)
    c0_exe11_mux_s <= in_valid_in_0;
    c0_exe11_mux_combproc: PROCESS (c0_exe11_mux_s, in_c0_exe11_1, in_c0_exe11_0)
    BEGIN
        CASE (c0_exe11_mux_s) IS
            WHEN "0" => c0_exe11_mux_q <= in_c0_exe11_1;
            WHEN "1" => c0_exe11_mux_q <= in_c0_exe11_0;
            WHEN OTHERS => c0_exe11_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe11(GPOUT,40)
    out_c0_exe11 <= c0_exe11_mux_q;

    -- c0_exe11413_mux(MUX,2)
    c0_exe11413_mux_s <= in_valid_in_0;
    c0_exe11413_mux_combproc: PROCESS (c0_exe11413_mux_s, in_c0_exe11413_1, in_c0_exe11413_0)
    BEGIN
        CASE (c0_exe11413_mux_s) IS
            WHEN "0" => c0_exe11413_mux_q <= in_c0_exe11413_1;
            WHEN "1" => c0_exe11413_mux_q <= in_c0_exe11413_0;
            WHEN OTHERS => c0_exe11413_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe11413(GPOUT,41)
    out_c0_exe11413 <= c0_exe11413_mux_q;

    -- c1_exe15_mux(MUX,4)
    c1_exe15_mux_s <= in_valid_in_0;
    c1_exe15_mux_combproc: PROCESS (c1_exe15_mux_s, in_c1_exe15_1, in_c1_exe15_0)
    BEGIN
        CASE (c1_exe15_mux_s) IS
            WHEN "0" => c1_exe15_mux_q <= in_c1_exe15_1;
            WHEN "1" => c1_exe15_mux_q <= in_c1_exe15_0;
            WHEN OTHERS => c1_exe15_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe15(GPOUT,42)
    out_c1_exe15 <= c1_exe15_mux_q;

    -- fpgaindvars_iv_mux(MUX,6)
    fpgaindvars_iv_mux_s <= in_valid_in_0;
    fpgaindvars_iv_mux_combproc: PROCESS (fpgaindvars_iv_mux_s, in_fpgaindvars_iv_1, in_fpgaindvars_iv_0)
    BEGIN
        CASE (fpgaindvars_iv_mux_s) IS
            WHEN "0" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_1;
            WHEN "1" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_0;
            WHEN OTHERS => fpgaindvars_iv_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,43)
    out_fpgaindvars_iv <= fpgaindvars_iv_mux_q;

    -- fpgaindvars_iv7_mux(MUX,5)
    fpgaindvars_iv7_mux_s <= in_valid_in_0;
    fpgaindvars_iv7_mux_combproc: PROCESS (fpgaindvars_iv7_mux_s, in_fpgaindvars_iv7_1, in_fpgaindvars_iv7_0)
    BEGIN
        CASE (fpgaindvars_iv7_mux_s) IS
            WHEN "0" => fpgaindvars_iv7_mux_q <= in_fpgaindvars_iv7_1;
            WHEN "1" => fpgaindvars_iv7_mux_q <= in_fpgaindvars_iv7_0;
            WHEN OTHERS => fpgaindvars_iv7_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv7(GPOUT,44)
    out_fpgaindvars_iv7 <= fpgaindvars_iv7_mux_q;

    -- i_088_mux(MUX,7)
    i_088_mux_s <= in_valid_in_0;
    i_088_mux_combproc: PROCESS (i_088_mux_s, in_i_088_1, in_i_088_0)
    BEGIN
        CASE (i_088_mux_s) IS
            WHEN "0" => i_088_mux_q <= in_i_088_1;
            WHEN "1" => i_088_mux_q <= in_i_088_0;
            WHEN OTHERS => i_088_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i_088(GPOUT,45)
    out_i_088 <= i_088_mux_q;

    -- j_1610_mux(MUX,35)
    j_1610_mux_s <= in_valid_in_0;
    j_1610_mux_combproc: PROCESS (j_1610_mux_s, in_j_1610_1, in_j_1610_0)
    BEGIN
        CASE (j_1610_mux_s) IS
            WHEN "0" => j_1610_mux_q <= in_j_1610_1;
            WHEN "1" => j_1610_mux_q <= in_j_1610_0;
            WHEN OTHERS => j_1610_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_1610(GPOUT,46)
    out_j_1610 <= j_1610_mux_q;

    -- k_24_mux(MUX,36)
    k_24_mux_s <= in_valid_in_0;
    k_24_mux_combproc: PROCESS (k_24_mux_s, in_k_24_1, in_k_24_0)
    BEGIN
        CASE (k_24_mux_s) IS
            WHEN "0" => k_24_mux_q <= in_k_24_1;
            WHEN "1" => k_24_mux_q <= in_k_24_0;
            WHEN OTHERS => k_24_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_k_24(GPOUT,47)
    out_k_24 <= k_24_mux_q;

    -- l_32_mux(MUX,37)
    l_32_mux_s <= in_valid_in_0;
    l_32_mux_combproc: PROCESS (l_32_mux_s, in_l_32_1, in_l_32_0)
    BEGIN
        CASE (l_32_mux_s) IS
            WHEN "0" => l_32_mux_q <= in_l_32_1;
            WHEN "1" => l_32_mux_q <= in_l_32_0;
            WHEN OTHERS => l_32_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_32(GPOUT,48)
    out_l_32 <= l_32_mux_q;

    -- mul2211_mux(MUX,38)
    mul2211_mux_s <= in_valid_in_0;
    mul2211_mux_combproc: PROCESS (mul2211_mux_s, in_mul2211_1, in_mul2211_0)
    BEGIN
        CASE (mul2211_mux_s) IS
            WHEN "0" => mul2211_mux_q <= in_mul2211_1;
            WHEN "1" => mul2211_mux_q <= in_mul2211_0;
            WHEN OTHERS => mul2211_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul2211(GPOUT,49)
    out_mul2211 <= mul2211_mux_q;

    -- mul2414_mux(MUX,39)
    mul2414_mux_s <= in_valid_in_0;
    mul2414_mux_combproc: PROCESS (mul2414_mux_s, in_mul2414_1, in_mul2414_0)
    BEGIN
        CASE (mul2414_mux_s) IS
            WHEN "0" => mul2414_mux_q <= in_mul2414_1;
            WHEN "1" => mul2414_mux_q <= in_mul2414_0;
            WHEN OTHERS => mul2414_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul2414(GPOUT,50)
    out_mul2414 <= mul2414_mux_q;

    -- valid_or(LOGICAL,58)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,55)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,51)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,56)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,52)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_31_mux(MUX,57)
    tmp_31_mux_s <= in_valid_in_0;
    tmp_31_mux_combproc: PROCESS (tmp_31_mux_s, in_tmp_31_1, in_tmp_31_0)
    BEGIN
        CASE (tmp_31_mux_s) IS
            WHEN "0" => tmp_31_mux_q <= in_tmp_31_1;
            WHEN "1" => tmp_31_mux_q <= in_tmp_31_0;
            WHEN OTHERS => tmp_31_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_31(GPOUT,53)
    out_tmp_31 <= tmp_31_mux_q;

    -- out_valid_out(GPOUT,54)
    out_valid_out <= valid_or_q;

END normal;
