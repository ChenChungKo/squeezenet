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

-- VHDL created from conv2d1x1_B2_merge
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

entity conv2d1x1_B2_merge is
    port (
        in_add16_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_add16_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe14_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe14_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe28_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe28_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe112_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe112_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01014_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01014_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_18_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_18_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_17_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_17_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_add16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe28 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe112 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_01014 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_17 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B2_merge;

architecture normal of conv2d1x1_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal add16_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal add16_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe14_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe14_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe28_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe28_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe112_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe112_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_01014_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_01014_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal k_18_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal k_18_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_17_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_17_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d1x12_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x12_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- add16_mux(MUX,2)
    add16_mux_s <= in_valid_in_0;
    add16_mux_combproc: PROCESS (add16_mux_s, in_add16_1, in_add16_0)
    BEGIN
        CASE (add16_mux_s) IS
            WHEN "0" => add16_mux_q <= in_add16_1;
            WHEN "1" => add16_mux_q <= in_add16_0;
            WHEN OTHERS => add16_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_add16(GPOUT,30)
    out_add16 <= add16_mux_q;

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

    -- out_c0_exe11(GPOUT,31)
    out_c0_exe11 <= c0_exe11_mux_q;

    -- c1_exe14_mux(MUX,4)
    c1_exe14_mux_s <= in_valid_in_0;
    c1_exe14_mux_combproc: PROCESS (c1_exe14_mux_s, in_c1_exe14_1, in_c1_exe14_0)
    BEGIN
        CASE (c1_exe14_mux_s) IS
            WHEN "0" => c1_exe14_mux_q <= in_c1_exe14_1;
            WHEN "1" => c1_exe14_mux_q <= in_c1_exe14_0;
            WHEN OTHERS => c1_exe14_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe14(GPOUT,32)
    out_c1_exe14 <= c1_exe14_mux_q;

    -- c1_exe28_mux(MUX,5)
    c1_exe28_mux_s <= in_valid_in_0;
    c1_exe28_mux_combproc: PROCESS (c1_exe28_mux_s, in_c1_exe28_1, in_c1_exe28_0)
    BEGIN
        CASE (c1_exe28_mux_s) IS
            WHEN "0" => c1_exe28_mux_q <= in_c1_exe28_1;
            WHEN "1" => c1_exe28_mux_q <= in_c1_exe28_0;
            WHEN OTHERS => c1_exe28_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe28(GPOUT,33)
    out_c1_exe28 <= c1_exe28_mux_q;

    -- c2_exe112_mux(MUX,6)
    c2_exe112_mux_s <= in_valid_in_0;
    c2_exe112_mux_combproc: PROCESS (c2_exe112_mux_s, in_c2_exe112_1, in_c2_exe112_0)
    BEGIN
        CASE (c2_exe112_mux_s) IS
            WHEN "0" => c2_exe112_mux_q <= in_c2_exe112_1;
            WHEN "1" => c2_exe112_mux_q <= in_c2_exe112_0;
            WHEN OTHERS => c2_exe112_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe112(GPOUT,34)
    out_c2_exe112 <= c2_exe112_mux_q;

    -- j_01014_mux(MUX,28)
    j_01014_mux_s <= in_valid_in_0;
    j_01014_mux_combproc: PROCESS (j_01014_mux_s, in_j_01014_1, in_j_01014_0)
    BEGIN
        CASE (j_01014_mux_s) IS
            WHEN "0" => j_01014_mux_q <= in_j_01014_1;
            WHEN "1" => j_01014_mux_q <= in_j_01014_0;
            WHEN OTHERS => j_01014_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_01014(GPOUT,35)
    out_j_01014 <= j_01014_mux_q;

    -- k_18_mux(MUX,29)
    k_18_mux_s <= in_valid_in_0;
    k_18_mux_combproc: PROCESS (k_18_mux_s, in_k_18_1, in_k_18_0)
    BEGIN
        CASE (k_18_mux_s) IS
            WHEN "0" => k_18_mux_q <= in_k_18_1;
            WHEN "1" => k_18_mux_q <= in_k_18_0;
            WHEN OTHERS => k_18_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_k_18(GPOUT,36)
    out_k_18 <= k_18_mux_q;

    -- valid_or(LOGICAL,46)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,42)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,37)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,43)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,38)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_17_mux(MUX,44)
    tmp_17_mux_s <= in_valid_in_0;
    tmp_17_mux_combproc: PROCESS (tmp_17_mux_s, in_tmp_17_1, in_tmp_17_0)
    BEGIN
        CASE (tmp_17_mux_s) IS
            WHEN "0" => tmp_17_mux_q <= in_tmp_17_1;
            WHEN "1" => tmp_17_mux_q <= in_tmp_17_0;
            WHEN OTHERS => tmp_17_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_17(GPOUT,39)
    out_tmp_17 <= tmp_17_mux_q;

    -- unnamed_conv2d1x12_mux(MUX,45)
    unnamed_conv2d1x12_mux_s <= in_valid_in_0;
    unnamed_conv2d1x12_mux_combproc: PROCESS (unnamed_conv2d1x12_mux_s, in_unnamed_conv2d1x12_1, in_unnamed_conv2d1x12_0)
    BEGIN
        CASE (unnamed_conv2d1x12_mux_s) IS
            WHEN "0" => unnamed_conv2d1x12_mux_q <= in_unnamed_conv2d1x12_1;
            WHEN "1" => unnamed_conv2d1x12_mux_q <= in_unnamed_conv2d1x12_0;
            WHEN OTHERS => unnamed_conv2d1x12_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_conv2d1x12(GPOUT,40)
    out_unnamed_conv2d1x12 <= unnamed_conv2d1x12_mux_q;

    -- out_valid_out(GPOUT,41)
    out_valid_out <= valid_or_q;

END normal;
