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

-- VHDL created from bb_conv2d1x1_B1
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

entity bb_conv2d1x1_B1 is
    port (
        in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe15_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe29_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe29_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe110_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe110_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_010_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_010_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x11_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x11_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_add : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe29 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe110 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_010 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B1;

architecture normal of bb_conv2d1x1_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d1x1_B1_stall_region is
        port (
            in_c0_exe12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe110 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_010 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe110 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_010 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B1_branch is
        port (
            in_add : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe110 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_010 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe110 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_010 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B1_merge is
        port (
            in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe15_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe15_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe29_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe29_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe110_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe110_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_010_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_010_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x11_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x11_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe110 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_010 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d1x1_B1_stall_region_out_add : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_c1_exe29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_c2_exe110 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_j_010 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_unnamed_conv2d1x11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_branch_out_add : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_branch_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_branch_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_branch_out_c1_exe29 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_branch_out_c2_exe110 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_branch_out_j_010 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_branch_out_unnamed_conv2d1x11 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_merge_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_out_c1_exe29 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_out_c2_exe110 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_out_j_010 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_merge_out_unnamed_conv2d1x11 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d1x1_B1_merge(BLACKBOX,4)
    theconv2d1x1_B1_merge : conv2d1x1_B1_merge
    PORT MAP (
        in_c0_exe12_0 => in_c0_exe12_0,
        in_c0_exe12_1 => in_c0_exe12_1,
        in_c1_exe15_0 => in_c1_exe15_0,
        in_c1_exe15_1 => in_c1_exe15_1,
        in_c1_exe29_0 => in_c1_exe29_0,
        in_c1_exe29_1 => in_c1_exe29_1,
        in_c2_exe110_0 => in_c2_exe110_0,
        in_c2_exe110_1 => in_c2_exe110_1,
        in_j_010_0 => in_j_010_0,
        in_j_010_1 => in_j_010_1,
        in_stall_in => bb_conv2d1x1_B1_stall_region_out_stall_out,
        in_unnamed_conv2d1x11_0 => in_unnamed_conv2d1x11_0,
        in_unnamed_conv2d1x11_1 => in_unnamed_conv2d1x11_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe12 => conv2d1x1_B1_merge_out_c0_exe12,
        out_c1_exe15 => conv2d1x1_B1_merge_out_c1_exe15,
        out_c1_exe29 => conv2d1x1_B1_merge_out_c1_exe29,
        out_c2_exe110 => conv2d1x1_B1_merge_out_c2_exe110,
        out_j_010 => conv2d1x1_B1_merge_out_j_010,
        out_stall_out_0 => conv2d1x1_B1_merge_out_stall_out_0,
        out_stall_out_1 => conv2d1x1_B1_merge_out_stall_out_1,
        out_unnamed_conv2d1x11 => conv2d1x1_B1_merge_out_unnamed_conv2d1x11,
        out_valid_out => conv2d1x1_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B1_stall_region(BLACKBOX,2)
    thebb_conv2d1x1_B1_stall_region : bb_conv2d1x1_B1_stall_region
    PORT MAP (
        in_c0_exe12 => conv2d1x1_B1_merge_out_c0_exe12,
        in_c1_exe15 => conv2d1x1_B1_merge_out_c1_exe15,
        in_c1_exe29 => conv2d1x1_B1_merge_out_c1_exe29,
        in_c2_exe110 => conv2d1x1_B1_merge_out_c2_exe110,
        in_j_010 => conv2d1x1_B1_merge_out_j_010,
        in_stall_in => conv2d1x1_B1_branch_out_stall_out,
        in_unnamed_conv2d1x11 => conv2d1x1_B1_merge_out_unnamed_conv2d1x11,
        in_valid_in => conv2d1x1_B1_merge_out_valid_out,
        out_add => bb_conv2d1x1_B1_stall_region_out_add,
        out_c0_exe12 => bb_conv2d1x1_B1_stall_region_out_c0_exe12,
        out_c1_exe15 => bb_conv2d1x1_B1_stall_region_out_c1_exe15,
        out_c1_exe29 => bb_conv2d1x1_B1_stall_region_out_c1_exe29,
        out_c2_exe110 => bb_conv2d1x1_B1_stall_region_out_c2_exe110,
        out_j_010 => bb_conv2d1x1_B1_stall_region_out_j_010,
        out_stall_out => bb_conv2d1x1_B1_stall_region_out_stall_out,
        out_unnamed_conv2d1x11 => bb_conv2d1x1_B1_stall_region_out_unnamed_conv2d1x11,
        out_valid_out => bb_conv2d1x1_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d1x1_B1_branch(BLACKBOX,3)
    theconv2d1x1_B1_branch : conv2d1x1_B1_branch
    PORT MAP (
        in_add => bb_conv2d1x1_B1_stall_region_out_add,
        in_c0_exe12 => bb_conv2d1x1_B1_stall_region_out_c0_exe12,
        in_c1_exe15 => bb_conv2d1x1_B1_stall_region_out_c1_exe15,
        in_c1_exe29 => bb_conv2d1x1_B1_stall_region_out_c1_exe29,
        in_c2_exe110 => bb_conv2d1x1_B1_stall_region_out_c2_exe110,
        in_j_010 => bb_conv2d1x1_B1_stall_region_out_j_010,
        in_stall_in_0 => in_stall_in_0,
        in_unnamed_conv2d1x11 => bb_conv2d1x1_B1_stall_region_out_unnamed_conv2d1x11,
        in_valid_in => bb_conv2d1x1_B1_stall_region_out_valid_out,
        out_add => conv2d1x1_B1_branch_out_add,
        out_c0_exe12 => conv2d1x1_B1_branch_out_c0_exe12,
        out_c1_exe15 => conv2d1x1_B1_branch_out_c1_exe15,
        out_c1_exe29 => conv2d1x1_B1_branch_out_c1_exe29,
        out_c2_exe110 => conv2d1x1_B1_branch_out_c2_exe110,
        out_j_010 => conv2d1x1_B1_branch_out_j_010,
        out_stall_out => conv2d1x1_B1_branch_out_stall_out,
        out_unnamed_conv2d1x11 => conv2d1x1_B1_branch_out_unnamed_conv2d1x11,
        out_valid_out_0 => conv2d1x1_B1_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_add(GPOUT,25)
    out_add <= conv2d1x1_B1_branch_out_add;

    -- out_c0_exe12(GPOUT,26)
    out_c0_exe12 <= conv2d1x1_B1_branch_out_c0_exe12;

    -- out_c1_exe15(GPOUT,27)
    out_c1_exe15 <= conv2d1x1_B1_branch_out_c1_exe15;

    -- out_c1_exe29(GPOUT,28)
    out_c1_exe29 <= conv2d1x1_B1_branch_out_c1_exe29;

    -- out_c2_exe110(GPOUT,29)
    out_c2_exe110 <= conv2d1x1_B1_branch_out_c2_exe110;

    -- out_j_010(GPOUT,30)
    out_j_010 <= conv2d1x1_B1_branch_out_j_010;

    -- out_stall_out_0(GPOUT,31)
    out_stall_out_0 <= conv2d1x1_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,32)
    out_stall_out_1 <= conv2d1x1_B1_merge_out_stall_out_1;

    -- out_unnamed_conv2d1x11(GPOUT,33)
    out_unnamed_conv2d1x11 <= conv2d1x1_B1_branch_out_unnamed_conv2d1x11;

    -- out_valid_out_0(GPOUT,34)
    out_valid_out_0 <= conv2d1x1_B1_branch_out_valid_out_0;

END normal;
