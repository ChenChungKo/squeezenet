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

-- VHDL created from conv2d3x3_B2_merge
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

entity conv2d3x3_B2_merge is
    port (
        in_c0_exe1045_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1045_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1146_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1146_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115436_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe115436_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1248_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1248_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1349_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1349_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1450_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1450_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1551_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1551_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1652_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1652_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe17_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe17_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe237_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe237_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe338_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe338_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe439_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe439_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe540_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe540_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe641_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe641_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe742_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe742_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe944_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe944_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe111_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe111_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe116_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe116_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe219_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe219_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe324_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe324_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe425_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe425_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe530_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe530_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe633_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe633_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c3_exe114_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01535_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01535_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_112_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_112_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_111_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_111_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_c2_exe116 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe219 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe425 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe530 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe633 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_01535 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_112 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_111 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B2_merge;

architecture normal of conv2d3x3_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1045_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1045_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1146_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1146_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe115436_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe115436_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe1248_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1248_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1349_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1349_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1450_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1450_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1551_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1551_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1652_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1652_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe17_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe17_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe237_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe237_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe338_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe338_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe439_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe439_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe540_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe540_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe641_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe641_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe742_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe742_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe843_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe843_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe944_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe944_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe111_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe111_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c2_exe116_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe116_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe219_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe219_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe324_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe324_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe425_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe425_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe530_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe530_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe633_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exe633_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exe114_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c3_exe114_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_01535_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_01535_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal k_112_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal k_112_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_111_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_111_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d3x32_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d3x32_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe1045_mux(MUX,2)
    c0_exe1045_mux_s <= in_valid_in_0;
    c0_exe1045_mux_combproc: PROCESS (c0_exe1045_mux_s, in_c0_exe1045_1, in_c0_exe1045_0)
    BEGIN
        CASE (c0_exe1045_mux_s) IS
            WHEN "0" => c0_exe1045_mux_q <= in_c0_exe1045_1;
            WHEN "1" => c0_exe1045_mux_q <= in_c0_exe1045_0;
            WHEN OTHERS => c0_exe1045_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1045(GPOUT,90)
    out_c0_exe1045 <= c0_exe1045_mux_q;

    -- c0_exe1146_mux(MUX,3)
    c0_exe1146_mux_s <= in_valid_in_0;
    c0_exe1146_mux_combproc: PROCESS (c0_exe1146_mux_s, in_c0_exe1146_1, in_c0_exe1146_0)
    BEGIN
        CASE (c0_exe1146_mux_s) IS
            WHEN "0" => c0_exe1146_mux_q <= in_c0_exe1146_1;
            WHEN "1" => c0_exe1146_mux_q <= in_c0_exe1146_0;
            WHEN OTHERS => c0_exe1146_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1146(GPOUT,91)
    out_c0_exe1146 <= c0_exe1146_mux_q;

    -- c0_exe115436_mux(MUX,4)
    c0_exe115436_mux_s <= in_valid_in_0;
    c0_exe115436_mux_combproc: PROCESS (c0_exe115436_mux_s, in_c0_exe115436_1, in_c0_exe115436_0)
    BEGIN
        CASE (c0_exe115436_mux_s) IS
            WHEN "0" => c0_exe115436_mux_q <= in_c0_exe115436_1;
            WHEN "1" => c0_exe115436_mux_q <= in_c0_exe115436_0;
            WHEN OTHERS => c0_exe115436_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe115436(GPOUT,92)
    out_c0_exe115436 <= c0_exe115436_mux_q;

    -- c0_exe1248_mux(MUX,5)
    c0_exe1248_mux_s <= in_valid_in_0;
    c0_exe1248_mux_combproc: PROCESS (c0_exe1248_mux_s, in_c0_exe1248_1, in_c0_exe1248_0)
    BEGIN
        CASE (c0_exe1248_mux_s) IS
            WHEN "0" => c0_exe1248_mux_q <= in_c0_exe1248_1;
            WHEN "1" => c0_exe1248_mux_q <= in_c0_exe1248_0;
            WHEN OTHERS => c0_exe1248_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1248(GPOUT,93)
    out_c0_exe1248 <= c0_exe1248_mux_q;

    -- c0_exe1349_mux(MUX,6)
    c0_exe1349_mux_s <= in_valid_in_0;
    c0_exe1349_mux_combproc: PROCESS (c0_exe1349_mux_s, in_c0_exe1349_1, in_c0_exe1349_0)
    BEGIN
        CASE (c0_exe1349_mux_s) IS
            WHEN "0" => c0_exe1349_mux_q <= in_c0_exe1349_1;
            WHEN "1" => c0_exe1349_mux_q <= in_c0_exe1349_0;
            WHEN OTHERS => c0_exe1349_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1349(GPOUT,94)
    out_c0_exe1349 <= c0_exe1349_mux_q;

    -- c0_exe1450_mux(MUX,7)
    c0_exe1450_mux_s <= in_valid_in_0;
    c0_exe1450_mux_combproc: PROCESS (c0_exe1450_mux_s, in_c0_exe1450_1, in_c0_exe1450_0)
    BEGIN
        CASE (c0_exe1450_mux_s) IS
            WHEN "0" => c0_exe1450_mux_q <= in_c0_exe1450_1;
            WHEN "1" => c0_exe1450_mux_q <= in_c0_exe1450_0;
            WHEN OTHERS => c0_exe1450_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1450(GPOUT,95)
    out_c0_exe1450 <= c0_exe1450_mux_q;

    -- c0_exe1551_mux(MUX,8)
    c0_exe1551_mux_s <= in_valid_in_0;
    c0_exe1551_mux_combproc: PROCESS (c0_exe1551_mux_s, in_c0_exe1551_1, in_c0_exe1551_0)
    BEGIN
        CASE (c0_exe1551_mux_s) IS
            WHEN "0" => c0_exe1551_mux_q <= in_c0_exe1551_1;
            WHEN "1" => c0_exe1551_mux_q <= in_c0_exe1551_0;
            WHEN OTHERS => c0_exe1551_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1551(GPOUT,96)
    out_c0_exe1551 <= c0_exe1551_mux_q;

    -- c0_exe1652_mux(MUX,9)
    c0_exe1652_mux_s <= in_valid_in_0;
    c0_exe1652_mux_combproc: PROCESS (c0_exe1652_mux_s, in_c0_exe1652_1, in_c0_exe1652_0)
    BEGIN
        CASE (c0_exe1652_mux_s) IS
            WHEN "0" => c0_exe1652_mux_q <= in_c0_exe1652_1;
            WHEN "1" => c0_exe1652_mux_q <= in_c0_exe1652_0;
            WHEN OTHERS => c0_exe1652_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1652(GPOUT,97)
    out_c0_exe1652 <= c0_exe1652_mux_q;

    -- c0_exe17_mux(MUX,10)
    c0_exe17_mux_s <= in_valid_in_0;
    c0_exe17_mux_combproc: PROCESS (c0_exe17_mux_s, in_c0_exe17_1, in_c0_exe17_0)
    BEGIN
        CASE (c0_exe17_mux_s) IS
            WHEN "0" => c0_exe17_mux_q <= in_c0_exe17_1;
            WHEN "1" => c0_exe17_mux_q <= in_c0_exe17_0;
            WHEN OTHERS => c0_exe17_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe17(GPOUT,98)
    out_c0_exe17 <= c0_exe17_mux_q;

    -- c0_exe237_mux(MUX,11)
    c0_exe237_mux_s <= in_valid_in_0;
    c0_exe237_mux_combproc: PROCESS (c0_exe237_mux_s, in_c0_exe237_1, in_c0_exe237_0)
    BEGIN
        CASE (c0_exe237_mux_s) IS
            WHEN "0" => c0_exe237_mux_q <= in_c0_exe237_1;
            WHEN "1" => c0_exe237_mux_q <= in_c0_exe237_0;
            WHEN OTHERS => c0_exe237_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe237(GPOUT,99)
    out_c0_exe237 <= c0_exe237_mux_q;

    -- c0_exe338_mux(MUX,12)
    c0_exe338_mux_s <= in_valid_in_0;
    c0_exe338_mux_combproc: PROCESS (c0_exe338_mux_s, in_c0_exe338_1, in_c0_exe338_0)
    BEGIN
        CASE (c0_exe338_mux_s) IS
            WHEN "0" => c0_exe338_mux_q <= in_c0_exe338_1;
            WHEN "1" => c0_exe338_mux_q <= in_c0_exe338_0;
            WHEN OTHERS => c0_exe338_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe338(GPOUT,100)
    out_c0_exe338 <= c0_exe338_mux_q;

    -- c0_exe439_mux(MUX,13)
    c0_exe439_mux_s <= in_valid_in_0;
    c0_exe439_mux_combproc: PROCESS (c0_exe439_mux_s, in_c0_exe439_1, in_c0_exe439_0)
    BEGIN
        CASE (c0_exe439_mux_s) IS
            WHEN "0" => c0_exe439_mux_q <= in_c0_exe439_1;
            WHEN "1" => c0_exe439_mux_q <= in_c0_exe439_0;
            WHEN OTHERS => c0_exe439_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe439(GPOUT,101)
    out_c0_exe439 <= c0_exe439_mux_q;

    -- c0_exe540_mux(MUX,14)
    c0_exe540_mux_s <= in_valid_in_0;
    c0_exe540_mux_combproc: PROCESS (c0_exe540_mux_s, in_c0_exe540_1, in_c0_exe540_0)
    BEGIN
        CASE (c0_exe540_mux_s) IS
            WHEN "0" => c0_exe540_mux_q <= in_c0_exe540_1;
            WHEN "1" => c0_exe540_mux_q <= in_c0_exe540_0;
            WHEN OTHERS => c0_exe540_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe540(GPOUT,102)
    out_c0_exe540 <= c0_exe540_mux_q;

    -- c0_exe641_mux(MUX,15)
    c0_exe641_mux_s <= in_valid_in_0;
    c0_exe641_mux_combproc: PROCESS (c0_exe641_mux_s, in_c0_exe641_1, in_c0_exe641_0)
    BEGIN
        CASE (c0_exe641_mux_s) IS
            WHEN "0" => c0_exe641_mux_q <= in_c0_exe641_1;
            WHEN "1" => c0_exe641_mux_q <= in_c0_exe641_0;
            WHEN OTHERS => c0_exe641_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe641(GPOUT,103)
    out_c0_exe641 <= c0_exe641_mux_q;

    -- c0_exe742_mux(MUX,16)
    c0_exe742_mux_s <= in_valid_in_0;
    c0_exe742_mux_combproc: PROCESS (c0_exe742_mux_s, in_c0_exe742_1, in_c0_exe742_0)
    BEGIN
        CASE (c0_exe742_mux_s) IS
            WHEN "0" => c0_exe742_mux_q <= in_c0_exe742_1;
            WHEN "1" => c0_exe742_mux_q <= in_c0_exe742_0;
            WHEN OTHERS => c0_exe742_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe742(GPOUT,104)
    out_c0_exe742 <= c0_exe742_mux_q;

    -- c0_exe843_mux(MUX,17)
    c0_exe843_mux_s <= in_valid_in_0;
    c0_exe843_mux_combproc: PROCESS (c0_exe843_mux_s, in_c0_exe843_1, in_c0_exe843_0)
    BEGIN
        CASE (c0_exe843_mux_s) IS
            WHEN "0" => c0_exe843_mux_q <= in_c0_exe843_1;
            WHEN "1" => c0_exe843_mux_q <= in_c0_exe843_0;
            WHEN OTHERS => c0_exe843_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe843(GPOUT,105)
    out_c0_exe843 <= c0_exe843_mux_q;

    -- c0_exe944_mux(MUX,18)
    c0_exe944_mux_s <= in_valid_in_0;
    c0_exe944_mux_combproc: PROCESS (c0_exe944_mux_s, in_c0_exe944_1, in_c0_exe944_0)
    BEGIN
        CASE (c0_exe944_mux_s) IS
            WHEN "0" => c0_exe944_mux_q <= in_c0_exe944_1;
            WHEN "1" => c0_exe944_mux_q <= in_c0_exe944_0;
            WHEN OTHERS => c0_exe944_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe944(GPOUT,106)
    out_c0_exe944 <= c0_exe944_mux_q;

    -- c1_exe111_mux(MUX,19)
    c1_exe111_mux_s <= in_valid_in_0;
    c1_exe111_mux_combproc: PROCESS (c1_exe111_mux_s, in_c1_exe111_1, in_c1_exe111_0)
    BEGIN
        CASE (c1_exe111_mux_s) IS
            WHEN "0" => c1_exe111_mux_q <= in_c1_exe111_1;
            WHEN "1" => c1_exe111_mux_q <= in_c1_exe111_0;
            WHEN OTHERS => c1_exe111_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe111(GPOUT,107)
    out_c1_exe111 <= c1_exe111_mux_q;

    -- c2_exe116_mux(MUX,20)
    c2_exe116_mux_s <= in_valid_in_0;
    c2_exe116_mux_combproc: PROCESS (c2_exe116_mux_s, in_c2_exe116_1, in_c2_exe116_0)
    BEGIN
        CASE (c2_exe116_mux_s) IS
            WHEN "0" => c2_exe116_mux_q <= in_c2_exe116_1;
            WHEN "1" => c2_exe116_mux_q <= in_c2_exe116_0;
            WHEN OTHERS => c2_exe116_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe116(GPOUT,108)
    out_c2_exe116 <= c2_exe116_mux_q;

    -- c2_exe219_mux(MUX,21)
    c2_exe219_mux_s <= in_valid_in_0;
    c2_exe219_mux_combproc: PROCESS (c2_exe219_mux_s, in_c2_exe219_1, in_c2_exe219_0)
    BEGIN
        CASE (c2_exe219_mux_s) IS
            WHEN "0" => c2_exe219_mux_q <= in_c2_exe219_1;
            WHEN "1" => c2_exe219_mux_q <= in_c2_exe219_0;
            WHEN OTHERS => c2_exe219_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe219(GPOUT,109)
    out_c2_exe219 <= c2_exe219_mux_q;

    -- c2_exe324_mux(MUX,22)
    c2_exe324_mux_s <= in_valid_in_0;
    c2_exe324_mux_combproc: PROCESS (c2_exe324_mux_s, in_c2_exe324_1, in_c2_exe324_0)
    BEGIN
        CASE (c2_exe324_mux_s) IS
            WHEN "0" => c2_exe324_mux_q <= in_c2_exe324_1;
            WHEN "1" => c2_exe324_mux_q <= in_c2_exe324_0;
            WHEN OTHERS => c2_exe324_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe324(GPOUT,110)
    out_c2_exe324 <= c2_exe324_mux_q;

    -- c2_exe425_mux(MUX,23)
    c2_exe425_mux_s <= in_valid_in_0;
    c2_exe425_mux_combproc: PROCESS (c2_exe425_mux_s, in_c2_exe425_1, in_c2_exe425_0)
    BEGIN
        CASE (c2_exe425_mux_s) IS
            WHEN "0" => c2_exe425_mux_q <= in_c2_exe425_1;
            WHEN "1" => c2_exe425_mux_q <= in_c2_exe425_0;
            WHEN OTHERS => c2_exe425_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe425(GPOUT,111)
    out_c2_exe425 <= c2_exe425_mux_q;

    -- c2_exe530_mux(MUX,24)
    c2_exe530_mux_s <= in_valid_in_0;
    c2_exe530_mux_combproc: PROCESS (c2_exe530_mux_s, in_c2_exe530_1, in_c2_exe530_0)
    BEGIN
        CASE (c2_exe530_mux_s) IS
            WHEN "0" => c2_exe530_mux_q <= in_c2_exe530_1;
            WHEN "1" => c2_exe530_mux_q <= in_c2_exe530_0;
            WHEN OTHERS => c2_exe530_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe530(GPOUT,112)
    out_c2_exe530 <= c2_exe530_mux_q;

    -- c2_exe633_mux(MUX,25)
    c2_exe633_mux_s <= in_valid_in_0;
    c2_exe633_mux_combproc: PROCESS (c2_exe633_mux_s, in_c2_exe633_1, in_c2_exe633_0)
    BEGIN
        CASE (c2_exe633_mux_s) IS
            WHEN "0" => c2_exe633_mux_q <= in_c2_exe633_1;
            WHEN "1" => c2_exe633_mux_q <= in_c2_exe633_0;
            WHEN OTHERS => c2_exe633_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c2_exe633(GPOUT,113)
    out_c2_exe633 <= c2_exe633_mux_q;

    -- c3_exe114_mux(MUX,26)
    c3_exe114_mux_s <= in_valid_in_0;
    c3_exe114_mux_combproc: PROCESS (c3_exe114_mux_s, in_c3_exe114_1, in_c3_exe114_0)
    BEGIN
        CASE (c3_exe114_mux_s) IS
            WHEN "0" => c3_exe114_mux_q <= in_c3_exe114_1;
            WHEN "1" => c3_exe114_mux_q <= in_c3_exe114_0;
            WHEN OTHERS => c3_exe114_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c3_exe114(GPOUT,114)
    out_c3_exe114 <= c3_exe114_mux_q;

    -- j_01535_mux(MUX,88)
    j_01535_mux_s <= in_valid_in_0;
    j_01535_mux_combproc: PROCESS (j_01535_mux_s, in_j_01535_1, in_j_01535_0)
    BEGIN
        CASE (j_01535_mux_s) IS
            WHEN "0" => j_01535_mux_q <= in_j_01535_1;
            WHEN "1" => j_01535_mux_q <= in_j_01535_0;
            WHEN OTHERS => j_01535_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_01535(GPOUT,115)
    out_j_01535 <= j_01535_mux_q;

    -- k_112_mux(MUX,89)
    k_112_mux_s <= in_valid_in_0;
    k_112_mux_combproc: PROCESS (k_112_mux_s, in_k_112_1, in_k_112_0)
    BEGIN
        CASE (k_112_mux_s) IS
            WHEN "0" => k_112_mux_q <= in_k_112_1;
            WHEN "1" => k_112_mux_q <= in_k_112_0;
            WHEN OTHERS => k_112_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_k_112(GPOUT,116)
    out_k_112 <= k_112_mux_q;

    -- valid_or(LOGICAL,126)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,122)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,117)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,123)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,118)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_111_mux(MUX,124)
    tmp_111_mux_s <= in_valid_in_0;
    tmp_111_mux_combproc: PROCESS (tmp_111_mux_s, in_tmp_111_1, in_tmp_111_0)
    BEGIN
        CASE (tmp_111_mux_s) IS
            WHEN "0" => tmp_111_mux_q <= in_tmp_111_1;
            WHEN "1" => tmp_111_mux_q <= in_tmp_111_0;
            WHEN OTHERS => tmp_111_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_111(GPOUT,119)
    out_tmp_111 <= tmp_111_mux_q;

    -- unnamed_conv2d3x32_mux(MUX,125)
    unnamed_conv2d3x32_mux_s <= in_valid_in_0;
    unnamed_conv2d3x32_mux_combproc: PROCESS (unnamed_conv2d3x32_mux_s, in_unnamed_conv2d3x32_1, in_unnamed_conv2d3x32_0)
    BEGIN
        CASE (unnamed_conv2d3x32_mux_s) IS
            WHEN "0" => unnamed_conv2d3x32_mux_q <= in_unnamed_conv2d3x32_1;
            WHEN "1" => unnamed_conv2d3x32_mux_q <= in_unnamed_conv2d3x32_0;
            WHEN OTHERS => unnamed_conv2d3x32_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_conv2d3x32(GPOUT,120)
    out_unnamed_conv2d3x32 <= unnamed_conv2d3x32_mux_q;

    -- out_valid_out(GPOUT,121)
    out_valid_out <= valid_or_q;

END normal;
