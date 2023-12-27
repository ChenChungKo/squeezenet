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

-- VHDL created from conv2d1x1_B1_merge
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

entity conv2d1x1_B1_merge is
    port (
        in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe15_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe29_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe29_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe110_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe110_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_010_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_010_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x11_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x11_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe29 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe110 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_010 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B1_merge;

architecture normal of conv2d1x1_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe15_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe15_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe29_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe29_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe110_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe110_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_010_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_010_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x11_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe12_mux(MUX,2)
    c0_exe12_mux_s <= in_valid_in_0;
    c0_exe12_mux_combproc: PROCESS (c0_exe12_mux_s, in_c0_exe12_1, in_c0_exe12_0)
    BEGIN
        CASE (c0_exe12_mux_s) IS
            WHEN "0" => c0_exe12_mux_q <= in_c0_exe12_1;
            WHEN "1" => c0_exe12_mux_q <= in_c0_exe12_0;
            WHEN OTHERS => c0_exe12_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe12(GPOUT,22)
    out_c0_exe12 <= c0_exe12_mux_q;

    -- c1_exe15_mux(MUX,3)
    c1_exe15_mux_s <= in_valid_in_0;
    c1_exe15_mux_combproc: PROCESS (c1_exe15_mux_s, in_c1_exe15_1, in_c1_exe15_0)
    BEGIN
        CASE (c1_exe15_mux_s) IS
            WHEN "0" => c1_exe15_mux_q <= in_c1_exe15_1;
            WHEN "1" => c1_exe15_mux_q <= in_c1_exe15_0;
            WHEN OTHERS => c1_exe15_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe15(GPOUT,23)
    out_c1_exe15 <= c1_exe15_mux_q;

    -- c1_exe29_mux(MUX,4)
    c1_exe29_mux_s <= in_valid_in_0;
    c1_exe29_mux_combproc: PROCESS (c1_exe29_mux_s, in_c1_exe29_1, in_c1_exe29_0)
    BEGIN
        CASE (c1_exe29_mux_s) IS
            WHEN "0" => c1_exe29_mux_q <= in_c1_exe29_1;
            WHEN "1" => c1_exe29_mux_q <= in_c1_exe29_0;
            WHEN OTHERS => c1_exe29_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe29(GPOUT,24)
    out_c1_exe29 <= c1_exe29_mux_q;

    -- c2_exe110_mux(MUX,5)
    c2_exe110_mux_s <= in_valid_in_0;
    c2_exe110_mux_combproc: PROCESS (c2_exe110_mux_s, in_c2_exe110_1, in_c2_exe110_0)
    BEGIN
        CASE (c2_exe110_mux_s) IS
            WHEN "0" => c2_exe110_mux_q <= in_c2_exe110_1;
            WHEN "1" => c2_exe110_mux_q <= in_c2_exe110_0;
            WHEN OTHERS => c2_exe110_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe110(GPOUT,25)
    out_c2_exe110 <= c2_exe110_mux_q;

    -- j_010_mux(MUX,21)
    j_010_mux_s <= in_valid_in_0;
    j_010_mux_combproc: PROCESS (j_010_mux_s, in_j_010_1, in_j_010_0)
    BEGIN
        CASE (j_010_mux_s) IS
            WHEN "0" => j_010_mux_q <= in_j_010_1;
            WHEN "1" => j_010_mux_q <= in_j_010_0;
            WHEN OTHERS => j_010_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_010(GPOUT,26)
    out_j_010 <= j_010_mux_q;

    -- valid_or(LOGICAL,34)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,31)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,27)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,32)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,28)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_conv2d1x11_mux(MUX,33)
    unnamed_conv2d1x11_mux_s <= in_valid_in_0;
    unnamed_conv2d1x11_mux_combproc: PROCESS (unnamed_conv2d1x11_mux_s, in_unnamed_conv2d1x11_1, in_unnamed_conv2d1x11_0)
    BEGIN
        CASE (unnamed_conv2d1x11_mux_s) IS
            WHEN "0" => unnamed_conv2d1x11_mux_q <= in_unnamed_conv2d1x11_1;
            WHEN "1" => unnamed_conv2d1x11_mux_q <= in_unnamed_conv2d1x11_0;
            WHEN OTHERS => unnamed_conv2d1x11_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_conv2d1x11(GPOUT,29)
    out_unnamed_conv2d1x11 <= unnamed_conv2d1x11_mux_q;

    -- out_valid_out(GPOUT,30)
    out_valid_out <= valid_or_q;

END normal;
