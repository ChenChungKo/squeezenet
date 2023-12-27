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

-- VHDL created from bb_conv2d3x3_B1
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

entity bb_conv2d3x3_B1 is
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
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_015_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_015_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d3x31_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x31_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1154 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe18 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe9 : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B1;

architecture normal of bb_conv2d3x3_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d3x3_B1_stall_region is
        port (
            in_c0_exe18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe112 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe117 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe220 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe322 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe426 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe528 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe631 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_015 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x31 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe112 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe117 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe220 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe322 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe426 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe528 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe631 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B1_branch is
        port (
            in_c0_exe10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1154 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe112 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe117 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe220 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe322 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe426 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe528 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe631 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_015 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x31 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe112 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe117 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe220 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe322 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe426 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe528 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe631 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B1_merge is
        port (
            in_c0_exe18_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe18_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe112_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe112_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe117_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe117_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe220_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe220_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe322_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe322_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe426_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe426_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe528_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe528_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe631_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe631_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c3_exe115_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_015_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_015_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x31_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x31_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe112 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe117 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe220 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe322 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe426 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe528 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe631 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_015 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d3x3_B1_stall_region_out_c0_exe10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe1154 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe18 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c0_exe9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c1_exe112 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c2_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c2_exe220 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c2_exe322 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c2_exe426 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c2_exe528 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c2_exe631 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_c3_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_j_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_unnamed_conv2d3x31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe10 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe1154 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe13 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe14 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe15 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe16 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe18 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe4 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe8 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c0_exe9 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c1_exe112 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_branch_out_c2_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_c2_exe220 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_c2_exe322 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c2_exe426 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_c2_exe528 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c2_exe631 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_c3_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_j_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_branch_out_unnamed_conv2d3x31 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_out_c0_exe18 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_out_c1_exe112 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_out_c2_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_out_c2_exe220 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_out_c2_exe322 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_out_c2_exe426 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_out_c2_exe528 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_out_c2_exe631 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_out_c3_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_out_j_015 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_out_unnamed_conv2d3x31 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d3x3_B1_merge(BLACKBOX,4)
    theconv2d3x3_B1_merge : conv2d3x3_B1_merge
    PORT MAP (
        in_c0_exe18_0 => in_c0_exe18_0,
        in_c0_exe18_1 => in_c0_exe18_1,
        in_c1_exe112_0 => in_c1_exe112_0,
        in_c1_exe112_1 => in_c1_exe112_1,
        in_c2_exe117_0 => in_c2_exe117_0,
        in_c2_exe117_1 => in_c2_exe117_1,
        in_c2_exe220_0 => in_c2_exe220_0,
        in_c2_exe220_1 => in_c2_exe220_1,
        in_c2_exe322_0 => in_c2_exe322_0,
        in_c2_exe322_1 => in_c2_exe322_1,
        in_c2_exe426_0 => in_c2_exe426_0,
        in_c2_exe426_1 => in_c2_exe426_1,
        in_c2_exe528_0 => in_c2_exe528_0,
        in_c2_exe528_1 => in_c2_exe528_1,
        in_c2_exe631_0 => in_c2_exe631_0,
        in_c2_exe631_1 => in_c2_exe631_1,
        in_c3_exe115_0 => in_c3_exe115_0,
        in_c3_exe115_1 => in_c3_exe115_1,
        in_j_015_0 => in_j_015_0,
        in_j_015_1 => in_j_015_1,
        in_stall_in => bb_conv2d3x3_B1_stall_region_out_stall_out,
        in_unnamed_conv2d3x31_0 => in_unnamed_conv2d3x31_0,
        in_unnamed_conv2d3x31_1 => in_unnamed_conv2d3x31_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe18 => conv2d3x3_B1_merge_out_c0_exe18,
        out_c1_exe112 => conv2d3x3_B1_merge_out_c1_exe112,
        out_c2_exe117 => conv2d3x3_B1_merge_out_c2_exe117,
        out_c2_exe220 => conv2d3x3_B1_merge_out_c2_exe220,
        out_c2_exe322 => conv2d3x3_B1_merge_out_c2_exe322,
        out_c2_exe426 => conv2d3x3_B1_merge_out_c2_exe426,
        out_c2_exe528 => conv2d3x3_B1_merge_out_c2_exe528,
        out_c2_exe631 => conv2d3x3_B1_merge_out_c2_exe631,
        out_c3_exe115 => conv2d3x3_B1_merge_out_c3_exe115,
        out_j_015 => conv2d3x3_B1_merge_out_j_015,
        out_stall_out_0 => conv2d3x3_B1_merge_out_stall_out_0,
        out_stall_out_1 => conv2d3x3_B1_merge_out_stall_out_1,
        out_unnamed_conv2d3x31 => conv2d3x3_B1_merge_out_unnamed_conv2d3x31,
        out_valid_out => conv2d3x3_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B1_stall_region(BLACKBOX,2)
    thebb_conv2d3x3_B1_stall_region : bb_conv2d3x3_B1_stall_region
    PORT MAP (
        in_c0_exe18 => conv2d3x3_B1_merge_out_c0_exe18,
        in_c1_exe112 => conv2d3x3_B1_merge_out_c1_exe112,
        in_c2_exe117 => conv2d3x3_B1_merge_out_c2_exe117,
        in_c2_exe220 => conv2d3x3_B1_merge_out_c2_exe220,
        in_c2_exe322 => conv2d3x3_B1_merge_out_c2_exe322,
        in_c2_exe426 => conv2d3x3_B1_merge_out_c2_exe426,
        in_c2_exe528 => conv2d3x3_B1_merge_out_c2_exe528,
        in_c2_exe631 => conv2d3x3_B1_merge_out_c2_exe631,
        in_c3_exe115 => conv2d3x3_B1_merge_out_c3_exe115,
        in_input_channels => in_input_channels,
        in_input_size => in_input_size,
        in_j_015 => conv2d3x3_B1_merge_out_j_015,
        in_output_size => in_output_size,
        in_pad => in_pad,
        in_stall_in => conv2d3x3_B1_branch_out_stall_out,
        in_stride => in_stride,
        in_unnamed_conv2d3x31 => conv2d3x3_B1_merge_out_unnamed_conv2d3x31,
        in_valid_in => conv2d3x3_B1_merge_out_valid_out,
        out_c0_exe10 => bb_conv2d3x3_B1_stall_region_out_c0_exe10,
        out_c0_exe11 => bb_conv2d3x3_B1_stall_region_out_c0_exe11,
        out_c0_exe1154 => bb_conv2d3x3_B1_stall_region_out_c0_exe1154,
        out_c0_exe12 => bb_conv2d3x3_B1_stall_region_out_c0_exe12,
        out_c0_exe13 => bb_conv2d3x3_B1_stall_region_out_c0_exe13,
        out_c0_exe14 => bb_conv2d3x3_B1_stall_region_out_c0_exe14,
        out_c0_exe15 => bb_conv2d3x3_B1_stall_region_out_c0_exe15,
        out_c0_exe16 => bb_conv2d3x3_B1_stall_region_out_c0_exe16,
        out_c0_exe18 => bb_conv2d3x3_B1_stall_region_out_c0_exe18,
        out_c0_exe2 => bb_conv2d3x3_B1_stall_region_out_c0_exe2,
        out_c0_exe3 => bb_conv2d3x3_B1_stall_region_out_c0_exe3,
        out_c0_exe4 => bb_conv2d3x3_B1_stall_region_out_c0_exe4,
        out_c0_exe5 => bb_conv2d3x3_B1_stall_region_out_c0_exe5,
        out_c0_exe6 => bb_conv2d3x3_B1_stall_region_out_c0_exe6,
        out_c0_exe7 => bb_conv2d3x3_B1_stall_region_out_c0_exe7,
        out_c0_exe8 => bb_conv2d3x3_B1_stall_region_out_c0_exe8,
        out_c0_exe9 => bb_conv2d3x3_B1_stall_region_out_c0_exe9,
        out_c1_exe112 => bb_conv2d3x3_B1_stall_region_out_c1_exe112,
        out_c2_exe117 => bb_conv2d3x3_B1_stall_region_out_c2_exe117,
        out_c2_exe220 => bb_conv2d3x3_B1_stall_region_out_c2_exe220,
        out_c2_exe322 => bb_conv2d3x3_B1_stall_region_out_c2_exe322,
        out_c2_exe426 => bb_conv2d3x3_B1_stall_region_out_c2_exe426,
        out_c2_exe528 => bb_conv2d3x3_B1_stall_region_out_c2_exe528,
        out_c2_exe631 => bb_conv2d3x3_B1_stall_region_out_c2_exe631,
        out_c3_exe115 => bb_conv2d3x3_B1_stall_region_out_c3_exe115,
        out_j_015 => bb_conv2d3x3_B1_stall_region_out_j_015,
        out_stall_out => bb_conv2d3x3_B1_stall_region_out_stall_out,
        out_unnamed_conv2d3x31 => bb_conv2d3x3_B1_stall_region_out_unnamed_conv2d3x31,
        out_valid_out => bb_conv2d3x3_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d3x3_B1_branch(BLACKBOX,3)
    theconv2d3x3_B1_branch : conv2d3x3_B1_branch
    PORT MAP (
        in_c0_exe10 => bb_conv2d3x3_B1_stall_region_out_c0_exe10,
        in_c0_exe11 => bb_conv2d3x3_B1_stall_region_out_c0_exe11,
        in_c0_exe1154 => bb_conv2d3x3_B1_stall_region_out_c0_exe1154,
        in_c0_exe12 => bb_conv2d3x3_B1_stall_region_out_c0_exe12,
        in_c0_exe13 => bb_conv2d3x3_B1_stall_region_out_c0_exe13,
        in_c0_exe14 => bb_conv2d3x3_B1_stall_region_out_c0_exe14,
        in_c0_exe15 => bb_conv2d3x3_B1_stall_region_out_c0_exe15,
        in_c0_exe16 => bb_conv2d3x3_B1_stall_region_out_c0_exe16,
        in_c0_exe18 => bb_conv2d3x3_B1_stall_region_out_c0_exe18,
        in_c0_exe2 => bb_conv2d3x3_B1_stall_region_out_c0_exe2,
        in_c0_exe3 => bb_conv2d3x3_B1_stall_region_out_c0_exe3,
        in_c0_exe4 => bb_conv2d3x3_B1_stall_region_out_c0_exe4,
        in_c0_exe5 => bb_conv2d3x3_B1_stall_region_out_c0_exe5,
        in_c0_exe6 => bb_conv2d3x3_B1_stall_region_out_c0_exe6,
        in_c0_exe7 => bb_conv2d3x3_B1_stall_region_out_c0_exe7,
        in_c0_exe8 => bb_conv2d3x3_B1_stall_region_out_c0_exe8,
        in_c0_exe9 => bb_conv2d3x3_B1_stall_region_out_c0_exe9,
        in_c1_exe112 => bb_conv2d3x3_B1_stall_region_out_c1_exe112,
        in_c2_exe117 => bb_conv2d3x3_B1_stall_region_out_c2_exe117,
        in_c2_exe220 => bb_conv2d3x3_B1_stall_region_out_c2_exe220,
        in_c2_exe322 => bb_conv2d3x3_B1_stall_region_out_c2_exe322,
        in_c2_exe426 => bb_conv2d3x3_B1_stall_region_out_c2_exe426,
        in_c2_exe528 => bb_conv2d3x3_B1_stall_region_out_c2_exe528,
        in_c2_exe631 => bb_conv2d3x3_B1_stall_region_out_c2_exe631,
        in_c3_exe115 => bb_conv2d3x3_B1_stall_region_out_c3_exe115,
        in_j_015 => bb_conv2d3x3_B1_stall_region_out_j_015,
        in_stall_in_0 => in_stall_in_0,
        in_unnamed_conv2d3x31 => bb_conv2d3x3_B1_stall_region_out_unnamed_conv2d3x31,
        in_valid_in => bb_conv2d3x3_B1_stall_region_out_valid_out,
        out_c0_exe10 => conv2d3x3_B1_branch_out_c0_exe10,
        out_c0_exe11 => conv2d3x3_B1_branch_out_c0_exe11,
        out_c0_exe1154 => conv2d3x3_B1_branch_out_c0_exe1154,
        out_c0_exe12 => conv2d3x3_B1_branch_out_c0_exe12,
        out_c0_exe13 => conv2d3x3_B1_branch_out_c0_exe13,
        out_c0_exe14 => conv2d3x3_B1_branch_out_c0_exe14,
        out_c0_exe15 => conv2d3x3_B1_branch_out_c0_exe15,
        out_c0_exe16 => conv2d3x3_B1_branch_out_c0_exe16,
        out_c0_exe18 => conv2d3x3_B1_branch_out_c0_exe18,
        out_c0_exe2 => conv2d3x3_B1_branch_out_c0_exe2,
        out_c0_exe3 => conv2d3x3_B1_branch_out_c0_exe3,
        out_c0_exe4 => conv2d3x3_B1_branch_out_c0_exe4,
        out_c0_exe5 => conv2d3x3_B1_branch_out_c0_exe5,
        out_c0_exe6 => conv2d3x3_B1_branch_out_c0_exe6,
        out_c0_exe7 => conv2d3x3_B1_branch_out_c0_exe7,
        out_c0_exe8 => conv2d3x3_B1_branch_out_c0_exe8,
        out_c0_exe9 => conv2d3x3_B1_branch_out_c0_exe9,
        out_c1_exe112 => conv2d3x3_B1_branch_out_c1_exe112,
        out_c2_exe117 => conv2d3x3_B1_branch_out_c2_exe117,
        out_c2_exe220 => conv2d3x3_B1_branch_out_c2_exe220,
        out_c2_exe322 => conv2d3x3_B1_branch_out_c2_exe322,
        out_c2_exe426 => conv2d3x3_B1_branch_out_c2_exe426,
        out_c2_exe528 => conv2d3x3_B1_branch_out_c2_exe528,
        out_c2_exe631 => conv2d3x3_B1_branch_out_c2_exe631,
        out_c3_exe115 => conv2d3x3_B1_branch_out_c3_exe115,
        out_j_015 => conv2d3x3_B1_branch_out_j_015,
        out_stall_out => conv2d3x3_B1_branch_out_stall_out,
        out_unnamed_conv2d3x31 => conv2d3x3_B1_branch_out_unnamed_conv2d3x31,
        out_valid_out_0 => conv2d3x3_B1_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe10(GPOUT,38)
    out_c0_exe10 <= conv2d3x3_B1_branch_out_c0_exe10;

    -- out_c0_exe11(GPOUT,39)
    out_c0_exe11 <= conv2d3x3_B1_branch_out_c0_exe11;

    -- out_c0_exe1154(GPOUT,40)
    out_c0_exe1154 <= conv2d3x3_B1_branch_out_c0_exe1154;

    -- out_c0_exe12(GPOUT,41)
    out_c0_exe12 <= conv2d3x3_B1_branch_out_c0_exe12;

    -- out_c0_exe13(GPOUT,42)
    out_c0_exe13 <= conv2d3x3_B1_branch_out_c0_exe13;

    -- out_c0_exe14(GPOUT,43)
    out_c0_exe14 <= conv2d3x3_B1_branch_out_c0_exe14;

    -- out_c0_exe15(GPOUT,44)
    out_c0_exe15 <= conv2d3x3_B1_branch_out_c0_exe15;

    -- out_c0_exe16(GPOUT,45)
    out_c0_exe16 <= conv2d3x3_B1_branch_out_c0_exe16;

    -- out_c0_exe18(GPOUT,46)
    out_c0_exe18 <= conv2d3x3_B1_branch_out_c0_exe18;

    -- out_c0_exe2(GPOUT,47)
    out_c0_exe2 <= conv2d3x3_B1_branch_out_c0_exe2;

    -- out_c0_exe3(GPOUT,48)
    out_c0_exe3 <= conv2d3x3_B1_branch_out_c0_exe3;

    -- out_c0_exe4(GPOUT,49)
    out_c0_exe4 <= conv2d3x3_B1_branch_out_c0_exe4;

    -- out_c0_exe5(GPOUT,50)
    out_c0_exe5 <= conv2d3x3_B1_branch_out_c0_exe5;

    -- out_c0_exe6(GPOUT,51)
    out_c0_exe6 <= conv2d3x3_B1_branch_out_c0_exe6;

    -- out_c0_exe7(GPOUT,52)
    out_c0_exe7 <= conv2d3x3_B1_branch_out_c0_exe7;

    -- out_c0_exe8(GPOUT,53)
    out_c0_exe8 <= conv2d3x3_B1_branch_out_c0_exe8;

    -- out_c0_exe9(GPOUT,54)
    out_c0_exe9 <= conv2d3x3_B1_branch_out_c0_exe9;

    -- out_c1_exe112(GPOUT,55)
    out_c1_exe112 <= conv2d3x3_B1_branch_out_c1_exe112;

    -- out_c2_exe117(GPOUT,56)
    out_c2_exe117 <= conv2d3x3_B1_branch_out_c2_exe117;

    -- out_c2_exe220(GPOUT,57)
    out_c2_exe220 <= conv2d3x3_B1_branch_out_c2_exe220;

    -- out_c2_exe322(GPOUT,58)
    out_c2_exe322 <= conv2d3x3_B1_branch_out_c2_exe322;

    -- out_c2_exe426(GPOUT,59)
    out_c2_exe426 <= conv2d3x3_B1_branch_out_c2_exe426;

    -- out_c2_exe528(GPOUT,60)
    out_c2_exe528 <= conv2d3x3_B1_branch_out_c2_exe528;

    -- out_c2_exe631(GPOUT,61)
    out_c2_exe631 <= conv2d3x3_B1_branch_out_c2_exe631;

    -- out_c3_exe115(GPOUT,62)
    out_c3_exe115 <= conv2d3x3_B1_branch_out_c3_exe115;

    -- out_j_015(GPOUT,63)
    out_j_015 <= conv2d3x3_B1_branch_out_j_015;

    -- out_stall_out_0(GPOUT,64)
    out_stall_out_0 <= conv2d3x3_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,65)
    out_stall_out_1 <= conv2d3x3_B1_merge_out_stall_out_1;

    -- out_unnamed_conv2d3x31(GPOUT,66)
    out_unnamed_conv2d3x31 <= conv2d3x3_B1_branch_out_unnamed_conv2d3x31;

    -- out_valid_out_0(GPOUT,67)
    out_valid_out_0 <= conv2d3x3_B1_branch_out_valid_out_0;

END normal;
