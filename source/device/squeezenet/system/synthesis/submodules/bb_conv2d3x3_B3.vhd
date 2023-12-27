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

-- VHDL created from bb_conv2d3x3_B3
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

entity bb_conv2d3x3_B3 is
    port (
        in_c0_exe1247_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe19_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe110_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe117653_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exe118_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe221_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe323_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe427_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe529_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe632_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe113_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01534_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d3x34_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x36_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x36_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe19 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe110 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe118 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe221 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe323 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe427 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe529 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe632 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe113 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc72 : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_conv2d3x36_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x34 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d3x36_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d3x36_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x36_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x36_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x36_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x36_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x36_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B3;

architecture normal of bb_conv2d3x3_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d3x3_B3_stall_region is
        port (
            in_c0_exe1247 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe110 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe117653 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exe118 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe221 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe323 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe427 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe529 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe632 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe113 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01534 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x34 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe110 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe118 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe323 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe427 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe529 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe632 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc72 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d3x36_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x34 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B3_branch is
        port (
            in_c0_exe19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe110 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe118 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe221 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe323 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe427 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe529 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe632 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe113 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc72 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x34 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe110 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe118 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe323 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe427 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe529 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe632 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc72 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x34 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B3_merge is
        port (
            in_c0_exe1247_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe19_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe110_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe117653_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exe118_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe221_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe323_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe427_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe529_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe632_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe113_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01534_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x34_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1247 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe110 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe117653 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exe118 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe323 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe427 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe529 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe632 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_01534 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x34 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d3x3_B3_stall_region_out_c0_exe19 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c1_exe110 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c2_exe118 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c2_exe221 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c2_exe323 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c2_exe427 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c2_exe529 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c2_exe632 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c3_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_inc72 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_lsu_unnamed_conv2d3x36_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_c0_exe19 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_branch_out_c1_exe110 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_branch_out_c2_exe118 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_c2_exe221 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_c2_exe323 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_c2_exe427 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_c2_exe529 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_c2_exe632 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_c3_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_inc72 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_unnamed_conv2d3x34 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_out_c0_exe1247 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_out_c0_exe19 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_merge_out_c1_exe110 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_merge_out_c1_exe117653 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_c2_exe118 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_c2_exe221 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_c2_exe323 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_out_c2_exe427 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_c2_exe529 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_out_c2_exe632 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_out_c3_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_j_01534 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_out_unnamed_conv2d3x34 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d3x3_B3_merge(BLACKBOX,4)
    theconv2d3x3_B3_merge : conv2d3x3_B3_merge
    PORT MAP (
        in_c0_exe1247_0 => in_c0_exe1247_0,
        in_c0_exe19_0 => in_c0_exe19_0,
        in_c1_exe110_0 => in_c1_exe110_0,
        in_c1_exe117653_0 => in_c1_exe117653_0,
        in_c2_exe118_0 => in_c2_exe118_0,
        in_c2_exe221_0 => in_c2_exe221_0,
        in_c2_exe323_0 => in_c2_exe323_0,
        in_c2_exe427_0 => in_c2_exe427_0,
        in_c2_exe529_0 => in_c2_exe529_0,
        in_c2_exe632_0 => in_c2_exe632_0,
        in_c3_exe113_0 => in_c3_exe113_0,
        in_j_01534_0 => in_j_01534_0,
        in_stall_in => bb_conv2d3x3_B3_stall_region_out_stall_out,
        in_unnamed_conv2d3x34_0 => in_unnamed_conv2d3x34_0,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exe1247 => conv2d3x3_B3_merge_out_c0_exe1247,
        out_c0_exe19 => conv2d3x3_B3_merge_out_c0_exe19,
        out_c1_exe110 => conv2d3x3_B3_merge_out_c1_exe110,
        out_c1_exe117653 => conv2d3x3_B3_merge_out_c1_exe117653,
        out_c2_exe118 => conv2d3x3_B3_merge_out_c2_exe118,
        out_c2_exe221 => conv2d3x3_B3_merge_out_c2_exe221,
        out_c2_exe323 => conv2d3x3_B3_merge_out_c2_exe323,
        out_c2_exe427 => conv2d3x3_B3_merge_out_c2_exe427,
        out_c2_exe529 => conv2d3x3_B3_merge_out_c2_exe529,
        out_c2_exe632 => conv2d3x3_B3_merge_out_c2_exe632,
        out_c3_exe113 => conv2d3x3_B3_merge_out_c3_exe113,
        out_j_01534 => conv2d3x3_B3_merge_out_j_01534,
        out_stall_out_0 => conv2d3x3_B3_merge_out_stall_out_0,
        out_unnamed_conv2d3x34 => conv2d3x3_B3_merge_out_unnamed_conv2d3x34,
        out_valid_out => conv2d3x3_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B3_stall_region(BLACKBOX,2)
    thebb_conv2d3x3_B3_stall_region : bb_conv2d3x3_B3_stall_region
    PORT MAP (
        in_c0_exe1247 => conv2d3x3_B3_merge_out_c0_exe1247,
        in_c0_exe19 => conv2d3x3_B3_merge_out_c0_exe19,
        in_c1_exe110 => conv2d3x3_B3_merge_out_c1_exe110,
        in_c1_exe117653 => conv2d3x3_B3_merge_out_c1_exe117653,
        in_c2_exe118 => conv2d3x3_B3_merge_out_c2_exe118,
        in_c2_exe221 => conv2d3x3_B3_merge_out_c2_exe221,
        in_c2_exe323 => conv2d3x3_B3_merge_out_c2_exe323,
        in_c2_exe427 => conv2d3x3_B3_merge_out_c2_exe427,
        in_c2_exe529 => conv2d3x3_B3_merge_out_c2_exe529,
        in_c2_exe632 => conv2d3x3_B3_merge_out_c2_exe632,
        in_c3_exe113 => conv2d3x3_B3_merge_out_c3_exe113,
        in_flush => in_flush,
        in_input_channels => in_input_channels,
        in_j_01534 => conv2d3x3_B3_merge_out_j_01534,
        in_output_im => in_output_im,
        in_output_size => in_output_size,
        in_stall_in => conv2d3x3_B3_branch_out_stall_out,
        in_unnamed_conv2d3x34 => conv2d3x3_B3_merge_out_unnamed_conv2d3x34,
        in_unnamed_conv2d3x36_avm_readdata => in_unnamed_conv2d3x36_avm_readdata,
        in_unnamed_conv2d3x36_avm_readdatavalid => in_unnamed_conv2d3x36_avm_readdatavalid,
        in_unnamed_conv2d3x36_avm_waitrequest => in_unnamed_conv2d3x36_avm_waitrequest,
        in_unnamed_conv2d3x36_avm_writeack => in_unnamed_conv2d3x36_avm_writeack,
        in_valid_in => conv2d3x3_B3_merge_out_valid_out,
        out_c0_exe19 => bb_conv2d3x3_B3_stall_region_out_c0_exe19,
        out_c1_exe110 => bb_conv2d3x3_B3_stall_region_out_c1_exe110,
        out_c2_exe118 => bb_conv2d3x3_B3_stall_region_out_c2_exe118,
        out_c2_exe221 => bb_conv2d3x3_B3_stall_region_out_c2_exe221,
        out_c2_exe323 => bb_conv2d3x3_B3_stall_region_out_c2_exe323,
        out_c2_exe427 => bb_conv2d3x3_B3_stall_region_out_c2_exe427,
        out_c2_exe529 => bb_conv2d3x3_B3_stall_region_out_c2_exe529,
        out_c2_exe632 => bb_conv2d3x3_B3_stall_region_out_c2_exe632,
        out_c3_exe113 => bb_conv2d3x3_B3_stall_region_out_c3_exe113,
        out_inc72 => bb_conv2d3x3_B3_stall_region_out_inc72,
        out_lsu_unnamed_conv2d3x36_o_active => bb_conv2d3x3_B3_stall_region_out_lsu_unnamed_conv2d3x36_o_active,
        out_stall_out => bb_conv2d3x3_B3_stall_region_out_stall_out,
        out_unnamed_conv2d3x34 => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x34,
        out_unnamed_conv2d3x35 => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35,
        out_unnamed_conv2d3x36_avm_address => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_address,
        out_unnamed_conv2d3x36_avm_burstcount => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_burstcount,
        out_unnamed_conv2d3x36_avm_byteenable => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_byteenable,
        out_unnamed_conv2d3x36_avm_enable => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_enable,
        out_unnamed_conv2d3x36_avm_read => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_read,
        out_unnamed_conv2d3x36_avm_write => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_write,
        out_unnamed_conv2d3x36_avm_writedata => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_writedata,
        out_valid_out => bb_conv2d3x3_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d3x3_B3_branch(BLACKBOX,3)
    theconv2d3x3_B3_branch : conv2d3x3_B3_branch
    PORT MAP (
        in_c0_exe19 => bb_conv2d3x3_B3_stall_region_out_c0_exe19,
        in_c1_exe110 => bb_conv2d3x3_B3_stall_region_out_c1_exe110,
        in_c2_exe118 => bb_conv2d3x3_B3_stall_region_out_c2_exe118,
        in_c2_exe221 => bb_conv2d3x3_B3_stall_region_out_c2_exe221,
        in_c2_exe323 => bb_conv2d3x3_B3_stall_region_out_c2_exe323,
        in_c2_exe427 => bb_conv2d3x3_B3_stall_region_out_c2_exe427,
        in_c2_exe529 => bb_conv2d3x3_B3_stall_region_out_c2_exe529,
        in_c2_exe632 => bb_conv2d3x3_B3_stall_region_out_c2_exe632,
        in_c3_exe113 => bb_conv2d3x3_B3_stall_region_out_c3_exe113,
        in_inc72 => bb_conv2d3x3_B3_stall_region_out_inc72,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d3x34 => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x34,
        in_unnamed_conv2d3x35 => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35,
        in_valid_in => bb_conv2d3x3_B3_stall_region_out_valid_out,
        out_c0_exe19 => conv2d3x3_B3_branch_out_c0_exe19,
        out_c1_exe110 => conv2d3x3_B3_branch_out_c1_exe110,
        out_c2_exe118 => conv2d3x3_B3_branch_out_c2_exe118,
        out_c2_exe221 => conv2d3x3_B3_branch_out_c2_exe221,
        out_c2_exe323 => conv2d3x3_B3_branch_out_c2_exe323,
        out_c2_exe427 => conv2d3x3_B3_branch_out_c2_exe427,
        out_c2_exe529 => conv2d3x3_B3_branch_out_c2_exe529,
        out_c2_exe632 => conv2d3x3_B3_branch_out_c2_exe632,
        out_c3_exe113 => conv2d3x3_B3_branch_out_c3_exe113,
        out_inc72 => conv2d3x3_B3_branch_out_inc72,
        out_stall_out => conv2d3x3_B3_branch_out_stall_out,
        out_unnamed_conv2d3x34 => conv2d3x3_B3_branch_out_unnamed_conv2d3x34,
        out_valid_out_0 => conv2d3x3_B3_branch_out_valid_out_0,
        out_valid_out_1 => conv2d3x3_B3_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe19(GPOUT,34)
    out_c0_exe19 <= conv2d3x3_B3_branch_out_c0_exe19;

    -- out_c1_exe110(GPOUT,35)
    out_c1_exe110 <= conv2d3x3_B3_branch_out_c1_exe110;

    -- out_c2_exe118(GPOUT,36)
    out_c2_exe118 <= conv2d3x3_B3_branch_out_c2_exe118;

    -- out_c2_exe221(GPOUT,37)
    out_c2_exe221 <= conv2d3x3_B3_branch_out_c2_exe221;

    -- out_c2_exe323(GPOUT,38)
    out_c2_exe323 <= conv2d3x3_B3_branch_out_c2_exe323;

    -- out_c2_exe427(GPOUT,39)
    out_c2_exe427 <= conv2d3x3_B3_branch_out_c2_exe427;

    -- out_c2_exe529(GPOUT,40)
    out_c2_exe529 <= conv2d3x3_B3_branch_out_c2_exe529;

    -- out_c2_exe632(GPOUT,41)
    out_c2_exe632 <= conv2d3x3_B3_branch_out_c2_exe632;

    -- out_c3_exe113(GPOUT,42)
    out_c3_exe113 <= conv2d3x3_B3_branch_out_c3_exe113;

    -- out_inc72(GPOUT,43)
    out_inc72 <= conv2d3x3_B3_branch_out_inc72;

    -- out_lsu_unnamed_conv2d3x36_o_active(GPOUT,44)
    out_lsu_unnamed_conv2d3x36_o_active <= bb_conv2d3x3_B3_stall_region_out_lsu_unnamed_conv2d3x36_o_active;

    -- out_stall_out_0(GPOUT,45)
    out_stall_out_0 <= conv2d3x3_B3_merge_out_stall_out_0;

    -- out_unnamed_conv2d3x34(GPOUT,46)
    out_unnamed_conv2d3x34 <= conv2d3x3_B3_branch_out_unnamed_conv2d3x34;

    -- out_unnamed_conv2d3x36_avm_address(GPOUT,47)
    out_unnamed_conv2d3x36_avm_address <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_address;

    -- out_unnamed_conv2d3x36_avm_burstcount(GPOUT,48)
    out_unnamed_conv2d3x36_avm_burstcount <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_burstcount;

    -- out_unnamed_conv2d3x36_avm_byteenable(GPOUT,49)
    out_unnamed_conv2d3x36_avm_byteenable <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_byteenable;

    -- out_unnamed_conv2d3x36_avm_enable(GPOUT,50)
    out_unnamed_conv2d3x36_avm_enable <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_enable;

    -- out_unnamed_conv2d3x36_avm_read(GPOUT,51)
    out_unnamed_conv2d3x36_avm_read <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_read;

    -- out_unnamed_conv2d3x36_avm_write(GPOUT,52)
    out_unnamed_conv2d3x36_avm_write <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_write;

    -- out_unnamed_conv2d3x36_avm_writedata(GPOUT,53)
    out_unnamed_conv2d3x36_avm_writedata <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x36_avm_writedata;

    -- out_valid_out_0(GPOUT,54)
    out_valid_out_0 <= conv2d3x3_B3_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,55)
    out_valid_out_1 <= conv2d3x3_B3_branch_out_valid_out_1;

END normal;
