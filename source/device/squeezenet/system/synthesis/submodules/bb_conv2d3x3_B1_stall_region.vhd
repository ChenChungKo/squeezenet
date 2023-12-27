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

-- VHDL created from bb_conv2d3x3_B1_stall_region
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

entity bb_conv2d3x3_B1_stall_region is
    port (
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe18 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe112 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe117 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe220 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe322 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe426 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe528 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe631 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c3_exe115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_015 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d3x31 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B1_stall_region;

architecture normal of bb_conv2d3x3_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d3x3_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3 is
        port (
            in_c0_eni4_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni4_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit153_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit153_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit153_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;












    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (322 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (46 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_n : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_o : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (322 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,92)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d3x3_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,52)
    bubble_join_stall_entry_q <= in_unnamed_conv2d3x31 & in_j_015 & in_c3_exe115 & in_c2_exe631 & in_c2_exe528 & in_c2_exe426 & in_c2_exe322 & in_c2_exe220 & in_c2_exe117 & in_c1_exe112 & in_c0_exe18;

    -- bubble_select_stall_entry(BITSELECT,53)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(192 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(224 downto 193));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(225 downto 225));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(226 downto 226));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(258 downto 227));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(290 downto 259));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(322 downto 291));

    -- conv2d3x3_B1_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d3x3_B1_merge_reg_aunroll_x : conv2d3x3_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_k,
        in_data_in_1 => bubble_select_stall_entry_b,
        in_data_in_2 => bubble_select_stall_entry_c,
        in_data_in_3 => bubble_select_stall_entry_j,
        in_data_in_4 => bubble_select_stall_entry_d,
        in_data_in_5 => bubble_select_stall_entry_e,
        in_data_in_6 => bubble_select_stall_entry_f,
        in_data_in_7 => bubble_select_stall_entry_g,
        in_data_in_8 => bubble_select_stall_entry_h,
        in_data_in_9 => bubble_select_stall_entry_i,
        in_data_in_10 => bubble_select_stall_entry_l,
        in_stall_in => SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10,
        out_stall_out => conv2d3x3_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d3x3_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d3x3_B1_merge_reg_aunroll_x(STALLENABLE,89)
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg11 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg7 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg8 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg9 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg10 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg11 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg11;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_o_stall) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1 <= (not (redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2 <= (not (redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3 <= (not (redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4 <= (not (redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5 <= (not (redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6 <= (not (redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed7 <= (not (redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg7;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed8 <= (not (redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg8;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed9 <= (not (redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg9;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed10 <= (not (redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg10;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed11 <= (not (redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg11;
    -- Consuming
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg7 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed7;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg8 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed8;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg9 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed9;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg10 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed10;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg11 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed11;
    -- Backward Stall generation
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or1;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or2;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or3;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or4;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or5;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or7 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed7 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or6;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or8 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed8 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or7;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or9 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed9 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or8;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or10 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed10 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or9;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed11 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or10);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V7 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg7);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V8 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg8);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V9 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg9);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V10 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg10);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V11 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg11);
    -- Computing multiple Valid(s)
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid <= conv2d3x3_B1_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_conv2d3x3_B1_merge_reg_aunroll_x(BITJOIN,45)
    bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q <= conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d3x3_B1_merge_reg_aunroll_x(BITSELECT,46)
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(95 downto 32));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(159 downto 96));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(191 downto 160));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(223 downto 192));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(255 downto 224));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(256 downto 256));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(288 downto 257));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(289 downto 289));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(290 downto 290));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(322 downto 291));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x(BLACKBOX,11)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit153_0@13
    -- out out_c0_exit153_1@13
    -- out out_c0_exit153_2@13
    -- out out_c0_exit153_3@13
    -- out out_c0_exit153_4@13
    -- out out_c0_exit153_5@13
    -- out out_c0_exit153_6@13
    -- out out_c0_exit153_7@13
    -- out out_c0_exit153_8@13
    -- out out_c0_exit153_9@13
    -- out out_c0_exit153_10@13
    -- out out_c0_exit153_11@13
    -- out out_c0_exit153_12@13
    -- out out_c0_exit153_13@13
    -- out out_c0_exit153_14@13
    -- out out_c0_exit153_15@13
    -- out out_c0_exit153_16@13
    -- out out_o_stall@20000000
    -- out out_o_valid@13
    thei_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x : i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3
    PORT MAP (
        in_c0_eni4_0 => GND_q,
        in_c0_eni4_1 => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b,
        in_c0_eni4_2 => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_h,
        in_c0_eni4_3 => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_j,
        in_c0_eni4_4 => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_k,
        in_i_stall => SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall,
        in_i_valid => SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V0,
        in_input_channels => in_input_channels,
        in_input_size => in_input_size,
        in_output_size => in_output_size,
        in_pad => in_pad,
        in_stride => in_stride,
        out_c0_exit153_1 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_1,
        out_c0_exit153_2 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_2,
        out_c0_exit153_3 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_3,
        out_c0_exit153_4 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_4,
        out_c0_exit153_5 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_5,
        out_c0_exit153_6 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_6,
        out_c0_exit153_7 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_7,
        out_c0_exit153_8 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_8,
        out_c0_exit153_9 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_9,
        out_c0_exit153_10 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_10,
        out_c0_exit153_11 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_11,
        out_c0_exit153_12 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_12,
        out_c0_exit153_13 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_13,
        out_c0_exit153_14 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_14,
        out_c0_exit153_15 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_15,
        out_c0_exit153_16 => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_16,
        out_o_stall => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(STALLFIFO,33)
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V1;
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b;
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in_bitsignaltemp <= redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in(0);
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in_bitsignaltemp <= redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in(0);
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out(0) <= redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out_bitsignaltemp;
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out(0) <= redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out_bitsignaltemp;
    theredist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b,
        valid_out => redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_stall_out_bitsignaltemp,
        data_out => redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo(STALLFIFO,34)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V2;
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c;
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_in_bitsignaltemp <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_in(0);
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_in_bitsignaltemp <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_in(0);
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_out(0) <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_out_bitsignaltemp;
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_out(0) <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_out_bitsignaltemp;
    theredist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c,
        valid_out => redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_stall_out_bitsignaltemp,
        data_out => redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo(STALLFIFO,35)
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V3;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_in_bitsignaltemp <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_in(0);
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_in_bitsignaltemp <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_in(0);
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_out(0) <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_out_bitsignaltemp;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_out(0) <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_out_bitsignaltemp;
    theredist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d,
        valid_out => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_stall_out_bitsignaltemp,
        data_out => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo(STALLFIFO,36)
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V4;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_in_bitsignaltemp <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_in(0);
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_in_bitsignaltemp <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_in(0);
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_out(0) <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_out_bitsignaltemp;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_out(0) <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_out_bitsignaltemp;
    theredist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e,
        valid_out => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_stall_out_bitsignaltemp,
        data_out => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo(STALLFIFO,37)
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V5;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in_bitsignaltemp <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in(0);
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in_bitsignaltemp <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in(0);
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out(0) <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out_bitsignaltemp;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out(0) <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out_bitsignaltemp;
    theredist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f,
        valid_out => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out_bitsignaltemp,
        data_out => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo(STALLFIFO,38)
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V6;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_in_bitsignaltemp <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_in(0);
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_in_bitsignaltemp <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_in(0);
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_out(0) <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_out_bitsignaltemp;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_out(0) <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_out_bitsignaltemp;
    theredist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g,
        valid_out => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_stall_out_bitsignaltemp,
        data_out => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo(STALLFIFO,39)
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V7;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_h;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_in_bitsignaltemp <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_in(0);
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_in_bitsignaltemp <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_in(0);
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_out(0) <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_out_bitsignaltemp;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_out(0) <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_out_bitsignaltemp;
    theredist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_h,
        valid_out => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_stall_out_bitsignaltemp,
        data_out => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo(STALLFIFO,40)
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V8;
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_i;
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_in_bitsignaltemp <= redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_in(0);
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_in_bitsignaltemp <= redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_in(0);
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_out(0) <= redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_out_bitsignaltemp;
    redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_out(0) <= redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_out_bitsignaltemp;
    theredist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_i,
        valid_out => redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_stall_out_bitsignaltemp,
        data_out => redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo(STALLFIFO,41)
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V9;
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_j;
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_in_bitsignaltemp <= redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_in(0);
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_in_bitsignaltemp <= redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_in(0);
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_out(0) <= redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_out_bitsignaltemp;
    redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_out(0) <= redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_out_bitsignaltemp;
    theredist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_j,
        valid_out => redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_stall_out_bitsignaltemp,
        data_out => redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo(STALLFIFO,42)
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V10;
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_k;
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_in_bitsignaltemp <= redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_in(0);
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_in_bitsignaltemp <= redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_in(0);
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_out(0) <= redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_out_bitsignaltemp;
    redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_out(0) <= redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_out_bitsignaltemp;
    theredist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_k,
        valid_out => redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_stall_out_bitsignaltemp,
        data_out => redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo(STALLFIFO,43)
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V11;
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_in <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall;
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_l;
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_in_bitsignaltemp <= redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_in(0);
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_in_bitsignaltemp <= redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_in(0);
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_out(0) <= redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_out_bitsignaltemp;
    redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_out(0) <= redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_out_bitsignaltemp;
    theredist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_l,
        valid_out => redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_stall_out_bitsignaltemp,
        data_out => redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo(STALLENABLE,115)
    -- Valid signal propagation
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_V0 <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_backStall <= in_stall_in or not (SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and0 <= redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_valid_out;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and1 <= redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and0;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and2 <= redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and1;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and3 <= redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and2;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and4 <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and3;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and5 <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and4;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and6 <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and5;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and7 <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and6;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and8 <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and7;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and9 <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and8;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and10 <= redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_valid_out and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and9;
    SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_wireValid <= i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_o_valid and SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_and10;

    -- bubble_join_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo(BITJOIN,86)
    bubble_join_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_q <= redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_data_out;

    -- bubble_select_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo(BITSELECT,87)
    bubble_select_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_q(31 downto 0));

    -- bubble_join_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(BITJOIN,56)
    bubble_join_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_q <= redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_data_out;

    -- bubble_select_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo(BITSELECT,57)
    bubble_select_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_q(31 downto 0));

    -- bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo(BITJOIN,65)
    bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_q <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_data_out;

    -- bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo(BITSELECT,66)
    bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_q(31 downto 0));

    -- bubble_join_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo(BITJOIN,83)
    bubble_join_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_q <= redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_data_out;

    -- bubble_select_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo(BITSELECT,84)
    bubble_select_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_q(0 downto 0));

    -- bubble_join_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo(BITJOIN,80)
    bubble_join_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_q <= redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_data_out;

    -- bubble_select_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo(BITSELECT,81)
    bubble_select_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_q(0 downto 0));

    -- bubble_join_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo(BITJOIN,77)
    bubble_join_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_q <= redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_data_out;

    -- bubble_select_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo(BITSELECT,78)
    bubble_select_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_q(31 downto 0));

    -- bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo(BITJOIN,74)
    bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_q <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_data_out;

    -- bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo(BITSELECT,75)
    bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_q(0 downto 0));

    -- bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo(BITJOIN,71)
    bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_q <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_data_out;

    -- bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo(BITSELECT,72)
    bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_q(31 downto 0));

    -- bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo(BITJOIN,68)
    bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_q <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_out;

    -- bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo(BITSELECT,69)
    bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_q(31 downto 0));

    -- bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo(BITJOIN,62)
    bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_q <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_data_out;

    -- bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo(BITSELECT,63)
    bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_q(63 downto 0));

    -- bubble_join_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo(BITJOIN,59)
    bubble_join_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_q <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_data_out;

    -- bubble_select_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo(BITSELECT,60)
    bubble_select_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_q(63 downto 0));

    -- bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x(BITJOIN,48)
    bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q <= i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_16 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_15 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_14 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_13 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_12 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_11 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_10 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_9 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_8 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_7 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_6 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_5 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_4 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_3 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_2 & i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_out_c0_exit153_1;

    -- bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x(BITSELECT,49)
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(32 downto 32));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(33 downto 33));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(34 downto 34));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(35 downto 35));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(36 downto 36));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(37 downto 37));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(38 downto 38));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(39 downto 39));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(40 downto 40));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(41 downto 41));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(42 downto 42));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(43 downto 43));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(44 downto 44));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(45 downto 45));
    bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q(46 downto 46));

    -- dupName_0_sync_out_x(GPOUT,7)@13
    out_c0_exe10 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_k;
    out_c0_exe11 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_l;
    out_c0_exe1154 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_b;
    out_c0_exe12 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_m;
    out_c0_exe13 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_n;
    out_c0_exe14 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_o;
    out_c0_exe15 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_p;
    out_c0_exe16 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_q;
    out_c0_exe18 <= bubble_select_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_12_fifo_b;
    out_c0_exe2 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_c;
    out_c0_exe3 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_d;
    out_c0_exe4 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_e;
    out_c0_exe5 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_f;
    out_c0_exe6 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_g;
    out_c0_exe7 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_h;
    out_c0_exe8 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_i;
    out_c0_exe9 <= bubble_select_i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3_aunroll_x_j;
    out_c1_exe112 <= bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_12_fifo_b;
    out_c2_exe117 <= bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_12_fifo_b;
    out_c2_exe220 <= bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_12_fifo_b;
    out_c2_exe322 <= bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_6_12_fifo_b;
    out_c2_exe426 <= bubble_select_redist7_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_7_12_fifo_b;
    out_c2_exe528 <= bubble_select_redist8_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_8_12_fifo_b;
    out_c2_exe631 <= bubble_select_redist9_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_9_12_fifo_b;
    out_c3_exe115 <= bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_12_fifo_b;
    out_j_015 <= bubble_select_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_12_fifo_b;
    out_unnamed_conv2d3x31 <= bubble_select_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_b;
    out_valid_out <= SE_out_redist10_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_10_12_fifo_V0;

    -- sync_out(GPOUT,21)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
