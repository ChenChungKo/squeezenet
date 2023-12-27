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

-- VHDL created from conv2d3x3_B1_merge
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

entity conv2d3x3_B1_merge is
    port (
        in_c0_exe18_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe18_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe112_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe112_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe117_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe117_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe220_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe220_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe322_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe322_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe426_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe426_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe528_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe528_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe631_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe631_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe115_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exe115_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_015_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_015_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x31_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x31_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe18 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe112 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe117 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe220 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe322 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe426 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe528 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe631 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_015 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B1_merge;

architecture normal of conv2d3x3_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe18_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe18_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe112_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe112_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe117_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe117_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe220_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe220_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe322_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe322_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe426_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe426_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe528_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe528_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe631_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe631_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exe115_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exe115_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_015_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_015_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d3x31_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d3x31_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe18_mux(MUX,2)
    c0_exe18_mux_s <= in_valid_in_0;
    c0_exe18_mux_combproc: PROCESS (c0_exe18_mux_s, in_c0_exe18_1, in_c0_exe18_0)
    BEGIN
        CASE (c0_exe18_mux_s) IS
            WHEN "0" => c0_exe18_mux_q <= in_c0_exe18_1;
            WHEN "1" => c0_exe18_mux_q <= in_c0_exe18_0;
            WHEN OTHERS => c0_exe18_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe18(GPOUT,37)
    out_c0_exe18 <= c0_exe18_mux_q;

    -- c1_exe112_mux(MUX,3)
    c1_exe112_mux_s <= in_valid_in_0;
    c1_exe112_mux_combproc: PROCESS (c1_exe112_mux_s, in_c1_exe112_1, in_c1_exe112_0)
    BEGIN
        CASE (c1_exe112_mux_s) IS
            WHEN "0" => c1_exe112_mux_q <= in_c1_exe112_1;
            WHEN "1" => c1_exe112_mux_q <= in_c1_exe112_0;
            WHEN OTHERS => c1_exe112_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe112(GPOUT,38)
    out_c1_exe112 <= c1_exe112_mux_q;

    -- c2_exe117_mux(MUX,4)
    c2_exe117_mux_s <= in_valid_in_0;
    c2_exe117_mux_combproc: PROCESS (c2_exe117_mux_s, in_c2_exe117_1, in_c2_exe117_0)
    BEGIN
        CASE (c2_exe117_mux_s) IS
            WHEN "0" => c2_exe117_mux_q <= in_c2_exe117_1;
            WHEN "1" => c2_exe117_mux_q <= in_c2_exe117_0;
            WHEN OTHERS => c2_exe117_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe117(GPOUT,39)
    out_c2_exe117 <= c2_exe117_mux_q;

    -- c2_exe220_mux(MUX,5)
    c2_exe220_mux_s <= in_valid_in_0;
    c2_exe220_mux_combproc: PROCESS (c2_exe220_mux_s, in_c2_exe220_1, in_c2_exe220_0)
    BEGIN
        CASE (c2_exe220_mux_s) IS
            WHEN "0" => c2_exe220_mux_q <= in_c2_exe220_1;
            WHEN "1" => c2_exe220_mux_q <= in_c2_exe220_0;
            WHEN OTHERS => c2_exe220_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe220(GPOUT,40)
    out_c2_exe220 <= c2_exe220_mux_q;

    -- c2_exe322_mux(MUX,6)
    c2_exe322_mux_s <= in_valid_in_0;
    c2_exe322_mux_combproc: PROCESS (c2_exe322_mux_s, in_c2_exe322_1, in_c2_exe322_0)
    BEGIN
        CASE (c2_exe322_mux_s) IS
            WHEN "0" => c2_exe322_mux_q <= in_c2_exe322_1;
            WHEN "1" => c2_exe322_mux_q <= in_c2_exe322_0;
            WHEN OTHERS => c2_exe322_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe322(GPOUT,41)
    out_c2_exe322 <= c2_exe322_mux_q;

    -- c2_exe426_mux(MUX,7)
    c2_exe426_mux_s <= in_valid_in_0;
    c2_exe426_mux_combproc: PROCESS (c2_exe426_mux_s, in_c2_exe426_1, in_c2_exe426_0)
    BEGIN
        CASE (c2_exe426_mux_s) IS
            WHEN "0" => c2_exe426_mux_q <= in_c2_exe426_1;
            WHEN "1" => c2_exe426_mux_q <= in_c2_exe426_0;
            WHEN OTHERS => c2_exe426_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe426(GPOUT,42)
    out_c2_exe426 <= c2_exe426_mux_q;

    -- c2_exe528_mux(MUX,8)
    c2_exe528_mux_s <= in_valid_in_0;
    c2_exe528_mux_combproc: PROCESS (c2_exe528_mux_s, in_c2_exe528_1, in_c2_exe528_0)
    BEGIN
        CASE (c2_exe528_mux_s) IS
            WHEN "0" => c2_exe528_mux_q <= in_c2_exe528_1;
            WHEN "1" => c2_exe528_mux_q <= in_c2_exe528_0;
            WHEN OTHERS => c2_exe528_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe528(GPOUT,43)
    out_c2_exe528 <= c2_exe528_mux_q;

    -- c2_exe631_mux(MUX,9)
    c2_exe631_mux_s <= in_valid_in_0;
    c2_exe631_mux_combproc: PROCESS (c2_exe631_mux_s, in_c2_exe631_1, in_c2_exe631_0)
    BEGIN
        CASE (c2_exe631_mux_s) IS
            WHEN "0" => c2_exe631_mux_q <= in_c2_exe631_1;
            WHEN "1" => c2_exe631_mux_q <= in_c2_exe631_0;
            WHEN OTHERS => c2_exe631_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe631(GPOUT,44)
    out_c2_exe631 <= c2_exe631_mux_q;

    -- c3_exe115_mux(MUX,10)
    c3_exe115_mux_s <= in_valid_in_0;
    c3_exe115_mux_combproc: PROCESS (c3_exe115_mux_s, in_c3_exe115_1, in_c3_exe115_0)
    BEGIN
        CASE (c3_exe115_mux_s) IS
            WHEN "0" => c3_exe115_mux_q <= in_c3_exe115_1;
            WHEN "1" => c3_exe115_mux_q <= in_c3_exe115_0;
            WHEN OTHERS => c3_exe115_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c3_exe115(GPOUT,45)
    out_c3_exe115 <= c3_exe115_mux_q;

    -- j_015_mux(MUX,36)
    j_015_mux_s <= in_valid_in_0;
    j_015_mux_combproc: PROCESS (j_015_mux_s, in_j_015_1, in_j_015_0)
    BEGIN
        CASE (j_015_mux_s) IS
            WHEN "0" => j_015_mux_q <= in_j_015_1;
            WHEN "1" => j_015_mux_q <= in_j_015_0;
            WHEN OTHERS => j_015_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_015(GPOUT,46)
    out_j_015 <= j_015_mux_q;

    -- valid_or(LOGICAL,54)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,51)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,47)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,52)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,48)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_conv2d3x31_mux(MUX,53)
    unnamed_conv2d3x31_mux_s <= in_valid_in_0;
    unnamed_conv2d3x31_mux_combproc: PROCESS (unnamed_conv2d3x31_mux_s, in_unnamed_conv2d3x31_1, in_unnamed_conv2d3x31_0)
    BEGIN
        CASE (unnamed_conv2d3x31_mux_s) IS
            WHEN "0" => unnamed_conv2d3x31_mux_q <= in_unnamed_conv2d3x31_1;
            WHEN "1" => unnamed_conv2d3x31_mux_q <= in_unnamed_conv2d3x31_0;
            WHEN OTHERS => unnamed_conv2d3x31_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_conv2d3x31(GPOUT,49)
    out_unnamed_conv2d3x31 <= unnamed_conv2d3x31_mux_q;

    -- out_valid_out(GPOUT,50)
    out_valid_out <= valid_or_q;

END normal;
