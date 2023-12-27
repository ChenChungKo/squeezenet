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

-- VHDL created from i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345
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

entity i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345 is
    port (
        in_c0_eni4_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni4_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi16_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi16_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi16_16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345;

architecture normal of i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer_conv2d3x363 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_sync_buffer133_conv2d3x360 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_sync_buffer136_conv2d3x356 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_sync_buffer137_conv2d3x352 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_size_sync_buffer146_conv2d3x366 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_pad_sync_buffer142_conv2d3x349 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_stride_sync_buffer143_conv2d3x347 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add29_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul28_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub30_1_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub30_2_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add29_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add29_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add29_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add29_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp1110_neg_or70126_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or70126_demorgan_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or72_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or74_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or76_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or78_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or82128_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or82128_demorgan_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_or84_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp1110_neg_rm_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1110_neg_rm_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1110_neg_rm_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1110_neg_rm_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor103_or_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor91_or_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor93_or_and_and_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor93_or_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor95_or_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor97_or_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor99_or127_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor99_or_and_and_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor_or125_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor_or_and_and_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor_or_and_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor_or_and_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp14_phi_decision87_xor_rm_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp14_phi_decision87_xor_rm_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp14_phi_decision87_xor_rm_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp14_phi_decision87_xor_rm_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp36_1_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_1_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_1_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_1_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp36_2_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_2_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_2_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_2_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp36_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp36_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp39_1_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_1_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_1_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_1_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp39_2_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_2_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_2_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_2_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp39_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp39_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_121_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_1_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_1_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_236_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_2_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_2_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond3_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_123_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_123_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_123_xor_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_1_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_1_xor_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_2_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_238_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_238_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_1_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_1_xor_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_2_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_2_xor_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_xor_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_1_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_2_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_3_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_3_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_4_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_5_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_6_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d3x3_7_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sub30_1_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_1_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_1_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_1_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_2_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_2_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_2_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub30_2_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer133_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer136_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer137_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer146_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_pad_sync_buffer142_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_stride_sync_buffer143_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul28_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul28_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul28_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul28_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul28_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul28_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul28_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul28_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul28_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul28_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul28_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul28_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul28_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul28_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul28_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul28_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul28_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul28_conv2d3x3_im0_cma_reset : std_logic;
    type i_mul28_conv2d3x3_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul28_conv2d3x3_im0_cma_a0 : i_mul28_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul28_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul28_conv2d3x3_im0_cma_c0 : i_mul28_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul28_conv2d3x3_im0_cma_c0 : signal is true;
    type i_mul28_conv2d3x3_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul28_conv2d3x3_im0_cma_p : i_mul28_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im0_cma_u : i_mul28_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im0_cma_w : i_mul28_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im0_cma_x : i_mul28_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im0_cma_y : i_mul28_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im0_cma_s : i_mul28_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul28_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul28_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul28_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul28_conv2d3x3_im10_cma_reset : std_logic;
    type i_mul28_conv2d3x3_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul28_conv2d3x3_im10_cma_a0 : i_mul28_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul28_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul28_conv2d3x3_im10_cma_c0 : i_mul28_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul28_conv2d3x3_im10_cma_c0 : signal is true;
    type i_mul28_conv2d3x3_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul28_conv2d3x3_im10_cma_p : i_mul28_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im10_cma_u : i_mul28_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im10_cma_w : i_mul28_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im10_cma_x : i_mul28_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im10_cma_y : i_mul28_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im10_cma_s : i_mul28_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul28_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul28_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul28_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul28_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul28_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul28_conv2d3x3_ma3_cma_a0 : i_mul28_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul28_conv2d3x3_ma3_cma_a0 : signal is true;
    type i_mul28_conv2d3x3_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul28_conv2d3x3_ma3_cma_c0 : i_mul28_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul28_conv2d3x3_ma3_cma_c0 : signal is true;
    type i_mul28_conv2d3x3_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul28_conv2d3x3_ma3_cma_l : i_mul28_conv2d3x3_ma3_cma_ltype(0 to 1);
    type i_mul28_conv2d3x3_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul28_conv2d3x3_ma3_cma_p : i_mul28_conv2d3x3_ma3_cma_ptype(0 to 1);
    type i_mul28_conv2d3x3_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul28_conv2d3x3_ma3_cma_u : i_mul28_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul28_conv2d3x3_ma3_cma_w : i_mul28_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul28_conv2d3x3_ma3_cma_x : i_mul28_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul28_conv2d3x3_ma3_cma_y : i_mul28_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul28_conv2d3x3_ma3_cma_s : i_mul28_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul28_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul28_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul28_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul28_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul28_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul28_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul28_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul28_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul28_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist3_i_or_cond4_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_or_cond4_2_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_2_2_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_2_1_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_238_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_or_cond4_1_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_or_cond4_1_2_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_or_cond4_1_1_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_or_cond4_123_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_cmp14_phi_decision87_xor_rm_conv2d3x3_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_cmp14_phi_decision87_xor97_or_conv2d3x3_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_cmp14_phi_decision87_xor91_or_conv2d3x3_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_cmp1110_neg_rm_conv2d3x3_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c0_eni4_2_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sync_in_aunroll_x_in_c0_eni4_3_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_sync_in_aunroll_x_in_c0_eni4_4_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_i_valid_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_i_valid_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_sync_in_aunroll_x_in_i_valid_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_bgTrunc_i_mul28_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_reset0 : std_logic;
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_i : signal is true;
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_q : signal is true;
    signal redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist19_sync_in_aunroll_x_in_i_valid_4(DELAY,153)
    redist19_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist19_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist20_sync_in_aunroll_x_in_i_valid_6(DELAY,154)
    redist20_sync_in_aunroll_x_in_i_valid_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist19_sync_in_aunroll_x_in_i_valid_4_q, xout => redist20_sync_in_aunroll_x_in_i_valid_6_q, clk => clock, aclr => resetn );

    -- redist21_sync_in_aunroll_x_in_i_valid_7(DELAY,155)
    redist21_sync_in_aunroll_x_in_i_valid_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_sync_in_aunroll_x_in_i_valid_6_q, xout => redist21_sync_in_aunroll_x_in_i_valid_7_q, clk => clock, aclr => resetn );

    -- redist22_sync_in_aunroll_x_in_i_valid_9(DELAY,156)
    redist22_sync_in_aunroll_x_in_i_valid_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_sync_in_aunroll_x_in_i_valid_7_q, xout => redist22_sync_in_aunroll_x_in_i_valid_9_q, clk => clock, aclr => resetn );

    -- i_or_cond4_2_2_xor_conv2d3x3(LOGICAL,73)@10
    i_or_cond4_2_2_xor_conv2d3x3_q <= redist5_i_or_cond4_2_2_conv2d3x3_q_2_q xor VCC_q;

    -- i_cmp1110_neg_or84_conv2d3x3(LOGICAL,32)@10
    i_cmp1110_neg_or84_conv2d3x3_q <= redist15_i_cmp1110_neg_rm_conv2d3x3_c_2_q or i_or_cond4_2_2_xor_conv2d3x3_q;

    -- i_cmp14_phi_decision87_xor103_or_conv2d3x3(LOGICAL,34)@10
    i_cmp14_phi_decision87_xor103_or_conv2d3x3_q <= i_cmp1110_neg_or84_conv2d3x3_q or redist12_i_cmp14_phi_decision87_xor_rm_conv2d3x3_c_2_q;

    -- dupName_0_c_i32_1gr_x(CONSTANT,7)
    dupName_0_c_i32_1gr_x_q <= "00000000000000000000000000000001";

    -- i_syncbuf_output_size_sync_buffer146_conv2d3x3(BLACKBOX,90)@0
    -- in in_i_dependence@8
    -- in in_valid_in@8
    -- out out_buffer_out@8
    -- out out_valid_out@8
    thei_syncbuf_output_size_sync_buffer146_conv2d3x3 : i_syncbuf_output_size_sync_buffer146_conv2d3x366
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_7_q,
        out_buffer_out => i_syncbuf_output_size_sync_buffer146_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp14_phi_decision87_xor_rm_conv2d3x3(COMPARE,46)@8 + 1
    i_cmp14_phi_decision87_xor_rm_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_output_size_sync_buffer146_conv2d3x3_out_buffer_out(31)) & i_syncbuf_output_size_sync_buffer146_conv2d3x3_out_buffer_out));
    i_cmp14_phi_decision87_xor_rm_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => dupName_0_c_i32_1gr_x_q(31)) & dupName_0_c_i32_1gr_x_q));
    i_cmp14_phi_decision87_xor_rm_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp14_phi_decision87_xor_rm_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp14_phi_decision87_xor_rm_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp14_phi_decision87_xor_rm_conv2d3x3_a) - SIGNED(i_cmp14_phi_decision87_xor_rm_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp14_phi_decision87_xor_rm_conv2d3x3_c(0) <= i_cmp14_phi_decision87_xor_rm_conv2d3x3_o(33);

    -- i_syncbuf_input_size_sync_buffer136_conv2d3x3(BLACKBOX,88)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_sync_buffer136_conv2d3x3 : i_syncbuf_input_size_sync_buffer136_conv2d3x356
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer136_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_pad_sync_buffer142_conv2d3x3(BLACKBOX,91)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_pad_sync_buffer142_conv2d3x3 : i_syncbuf_pad_sync_buffer142_conv2d3x349
    PORT MAP (
        in_buffer_in => in_pad,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist19_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_pad_sync_buffer142_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul28_conv2d3x3_bs4(BITSELECT,117)@1
    i_mul28_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(in_c0_eni4_1(17 downto 0));
    i_mul28_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul28_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul28_conv2d3x3_bjA5(BITJOIN,118)@1
    i_mul28_conv2d3x3_bjA5_q <= GND_q & i_mul28_conv2d3x3_bs4_b;

    -- i_syncbuf_stride_sync_buffer143_conv2d3x3(BLACKBOX,92)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_stride_sync_buffer143_conv2d3x3 : i_syncbuf_stride_sync_buffer143_conv2d3x347
    PORT MAP (
        in_buffer_in => in_stride,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_stride_sync_buffer143_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul28_conv2d3x3_bs2_merged_bit_select(BITSELECT,133)@1
    i_mul28_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_stride_sync_buffer143_conv2d3x3_out_buffer_out(17 downto 0);
    i_mul28_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_stride_sync_buffer143_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_mul28_conv2d3x3_bjB9(BITJOIN,122)@1
    i_mul28_conv2d3x3_bjB9_q <= GND_q & i_mul28_conv2d3x3_bs2_merged_bit_select_b;

    -- i_mul28_conv2d3x3_bs7(BITSELECT,120)@1
    i_mul28_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(in_c0_eni4_1(31 downto 18));

    -- i_mul28_conv2d3x3_ma3_cma(CHAINMULTADD,132)@1 + 2
    i_mul28_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul28_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul28_conv2d3x3_ma3_cma_ena1 <= i_mul28_conv2d3x3_ma3_cma_ena0;
    i_mul28_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul28_conv2d3x3_ma3_cma_a0(0),15));
    i_mul28_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul28_conv2d3x3_ma3_cma_a0(1),15));
    i_mul28_conv2d3x3_ma3_cma_p(0) <= i_mul28_conv2d3x3_ma3_cma_l(0) * i_mul28_conv2d3x3_ma3_cma_c0(0);
    i_mul28_conv2d3x3_ma3_cma_p(1) <= i_mul28_conv2d3x3_ma3_cma_l(1) * i_mul28_conv2d3x3_ma3_cma_c0(1);
    i_mul28_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul28_conv2d3x3_ma3_cma_p(0),35);
    i_mul28_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul28_conv2d3x3_ma3_cma_p(1),35);
    i_mul28_conv2d3x3_ma3_cma_w(0) <= i_mul28_conv2d3x3_ma3_cma_u(0) + i_mul28_conv2d3x3_ma3_cma_u(1);
    i_mul28_conv2d3x3_ma3_cma_x(0) <= i_mul28_conv2d3x3_ma3_cma_w(0);
    i_mul28_conv2d3x3_ma3_cma_y(0) <= i_mul28_conv2d3x3_ma3_cma_x(0);
    i_mul28_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul28_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul28_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul28_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul28_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul28_conv2d3x3_bs7_b),14);
                i_mul28_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul28_conv2d3x3_bs2_merged_bit_select_c),14);
                i_mul28_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul28_conv2d3x3_bjB9_q),19);
                i_mul28_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul28_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul28_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul28_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul28_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul28_conv2d3x3_ma3_cma_s(0) <= i_mul28_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul28_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul28_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul28_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul28_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul28_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul28_conv2d3x3_ma3_cma_q_1(DELAY,134)
    redist0_i_mul28_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul28_conv2d3x3_ma3_cma_q, xout => redist0_i_mul28_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul28_conv2d3x3_align_14(BITSHIFT,127)@4
    i_mul28_conv2d3x3_align_14_qint <= redist0_i_mul28_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul28_conv2d3x3_align_14_q <= i_mul28_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul28_conv2d3x3_bs11(BITSELECT,124)@1
    i_mul28_conv2d3x3_bs11_b <= in_c0_eni4_1(31 downto 18);

    -- i_mul28_conv2d3x3_im10_cma(CHAINMULTADD,131)@1 + 2
    i_mul28_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul28_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul28_conv2d3x3_im10_cma_ena1 <= i_mul28_conv2d3x3_im10_cma_ena0;
    i_mul28_conv2d3x3_im10_cma_p(0) <= i_mul28_conv2d3x3_im10_cma_a0(0) * i_mul28_conv2d3x3_im10_cma_c0(0);
    i_mul28_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul28_conv2d3x3_im10_cma_p(0),28);
    i_mul28_conv2d3x3_im10_cma_w(0) <= i_mul28_conv2d3x3_im10_cma_u(0);
    i_mul28_conv2d3x3_im10_cma_x(0) <= i_mul28_conv2d3x3_im10_cma_w(0);
    i_mul28_conv2d3x3_im10_cma_y(0) <= i_mul28_conv2d3x3_im10_cma_x(0);
    i_mul28_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul28_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul28_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul28_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul28_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul28_conv2d3x3_bs11_b),14);
                i_mul28_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul28_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul28_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul28_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul28_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul28_conv2d3x3_im10_cma_s(0) <= i_mul28_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul28_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul28_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul28_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul28_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul28_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist1_i_mul28_conv2d3x3_im10_cma_q_1(DELAY,135)
    redist1_i_mul28_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul28_conv2d3x3_im10_cma_q, xout => redist1_i_mul28_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul28_conv2d3x3_bs1(BITSELECT,114)@1
    i_mul28_conv2d3x3_bs1_in <= in_c0_eni4_1(17 downto 0);
    i_mul28_conv2d3x3_bs1_b <= i_mul28_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul28_conv2d3x3_im0_cma(CHAINMULTADD,130)@1 + 2
    i_mul28_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul28_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul28_conv2d3x3_im0_cma_ena1 <= i_mul28_conv2d3x3_im0_cma_ena0;
    i_mul28_conv2d3x3_im0_cma_p(0) <= i_mul28_conv2d3x3_im0_cma_a0(0) * i_mul28_conv2d3x3_im0_cma_c0(0);
    i_mul28_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul28_conv2d3x3_im0_cma_p(0),36);
    i_mul28_conv2d3x3_im0_cma_w(0) <= i_mul28_conv2d3x3_im0_cma_u(0);
    i_mul28_conv2d3x3_im0_cma_x(0) <= i_mul28_conv2d3x3_im0_cma_w(0);
    i_mul28_conv2d3x3_im0_cma_y(0) <= i_mul28_conv2d3x3_im0_cma_x(0);
    i_mul28_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul28_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul28_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul28_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul28_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul28_conv2d3x3_bs1_b),18);
                i_mul28_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul28_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul28_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul28_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul28_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul28_conv2d3x3_im0_cma_s(0) <= i_mul28_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul28_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul28_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul28_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul28_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul28_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist2_i_mul28_conv2d3x3_im0_cma_q_1(DELAY,136)
    redist2_i_mul28_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul28_conv2d3x3_im0_cma_q, xout => redist2_i_mul28_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul28_conv2d3x3_join_13(BITJOIN,126)@4
    i_mul28_conv2d3x3_join_13_q <= redist1_i_mul28_conv2d3x3_im10_cma_q_1_q & redist2_i_mul28_conv2d3x3_im0_cma_q_1_q;

    -- i_mul28_conv2d3x3_result_add_0_0(ADD,129)@4
    i_mul28_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul28_conv2d3x3_join_13_q));
    i_mul28_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul28_conv2d3x3_align_14_q(51)) & i_mul28_conv2d3x3_align_14_q));
    i_mul28_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul28_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul28_conv2d3x3_result_add_0_0_b));
    i_mul28_conv2d3x3_result_add_0_0_q <= i_mul28_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul28_conv2d3x3_rnd_sel(BITSELECT,110)@4
    bgTrunc_i_mul28_conv2d3x3_rnd_sel_in <= i_mul28_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul28_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul28_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul28_conv2d3x3_sel_x(BITSELECT,3)@4
    bgTrunc_i_mul28_conv2d3x3_sel_x_b <= bgTrunc_i_mul28_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist25_bgTrunc_i_mul28_conv2d3x3_sel_x_b_1(DELAY,159)
    redist25_bgTrunc_i_mul28_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul28_conv2d3x3_sel_x_b, xout => redist25_bgTrunc_i_mul28_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add29_conv2d3x3(SUB,23)@5
    i_add29_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist25_bgTrunc_i_mul28_conv2d3x3_sel_x_b_1_q);
    i_add29_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & i_syncbuf_pad_sync_buffer142_conv2d3x3_out_buffer_out);
    i_add29_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add29_conv2d3x3_a) - UNSIGNED(i_add29_conv2d3x3_b));
    i_add29_conv2d3x3_q <= i_add29_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add29_conv2d3x3_sel_x(BITSELECT,2)@5
    bgTrunc_i_add29_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(i_add29_conv2d3x3_q(31 downto 0));

    -- redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1(DELAY,160)
    redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add29_conv2d3x3_sel_x_b, xout => redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_sub30_1_conv2d3x3(ADD,84)@6
    i_sub30_1_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1_q);
    i_sub30_1_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub30_1_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub30_1_conv2d3x3_a) + UNSIGNED(i_sub30_1_conv2d3x3_b));
    i_sub30_1_conv2d3x3_q <= i_sub30_1_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_sub30_1_conv2d3x3_sel_x(BITSELECT,4)@6
    bgTrunc_i_sub30_1_conv2d3x3_sel_x_b <= i_sub30_1_conv2d3x3_q(31 downto 0);

    -- redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1(DELAY,158)
    redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub30_1_conv2d3x3_sel_x_b, xout => redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp39_1_conv2d3x3(COMPARE,50)@7 + 1
    i_cmp39_1_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1_q(31)) & redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1_q));
    i_cmp39_1_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer136_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer136_conv2d3x3_out_buffer_out));
    i_cmp39_1_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp39_1_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp39_1_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp39_1_conv2d3x3_a) - SIGNED(i_cmp39_1_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp39_1_conv2d3x3_c(0) <= i_cmp39_1_conv2d3x3_o(33);

    -- c_i32_1gr(CONSTANT,21)
    c_i32_1gr_q <= "11111111111111111111111111111111";

    -- i_cmp36_1_conv2d3x3(COMPARE,47)@7 + 1
    i_cmp36_1_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp36_1_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1_q(31)) & redist24_bgTrunc_i_sub30_1_conv2d3x3_sel_x_b_1_q));
    i_cmp36_1_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp36_1_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp36_1_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp36_1_conv2d3x3_a) - SIGNED(i_cmp36_1_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp36_1_conv2d3x3_c(0) <= i_cmp36_1_conv2d3x3_o(33);

    -- redist16_sync_in_aunroll_x_in_c0_eni4_2_7(DELAY,150)
    redist16_sync_in_aunroll_x_in_c0_eni4_2_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni4_2, xout => redist16_sync_in_aunroll_x_in_c0_eni4_2_7_q, clk => clock, aclr => resetn );

    -- i_or_cond3_1_2_conv2d3x3(LOGICAL,56)@8
    i_or_cond3_1_2_conv2d3x3_q <= redist16_sync_in_aunroll_x_in_c0_eni4_2_7_q and i_cmp36_1_conv2d3x3_c;

    -- i_or_cond4_1_2_conv2d3x3(LOGICAL,67)@8 + 1
    i_or_cond4_1_2_conv2d3x3_qi <= i_or_cond3_1_2_conv2d3x3_q and i_cmp39_1_conv2d3x3_c;
    i_or_cond4_1_2_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_1_2_conv2d3x3_qi, xout => i_or_cond4_1_2_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_size_sync_buffer133_conv2d3x3(BLACKBOX,87)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_sync_buffer133_conv2d3x3 : i_syncbuf_input_size_sync_buffer133_conv2d3x360
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer133_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2(DELAY,161)
    redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1_q, xout => redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_cmp39_conv2d3x3(COMPARE,52)@7 + 1
    i_cmp39_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q(31)) & redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q));
    i_cmp39_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer133_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer133_conv2d3x3_out_buffer_out));
    i_cmp39_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp39_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp39_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp39_conv2d3x3_a) - SIGNED(i_cmp39_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp39_conv2d3x3_c(0) <= i_cmp39_conv2d3x3_o(33);

    -- i_cmp36_conv2d3x3(COMPARE,49)@7 + 1
    i_cmp36_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp36_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q(31)) & redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q));
    i_cmp36_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp36_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp36_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp36_conv2d3x3_a) - SIGNED(i_cmp36_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp36_conv2d3x3_c(0) <= i_cmp36_conv2d3x3_o(33);

    -- i_or_cond3_236_conv2d3x3(LOGICAL,58)@8
    i_or_cond3_236_conv2d3x3_q <= redist16_sync_in_aunroll_x_in_c0_eni4_2_7_q and i_cmp36_conv2d3x3_c;

    -- i_or_cond4_238_conv2d3x3(LOGICAL,69)@8 + 1
    i_or_cond4_238_conv2d3x3_qi <= i_or_cond3_236_conv2d3x3_q and i_cmp39_conv2d3x3_c;
    i_or_cond4_238_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_238_conv2d3x3_qi, xout => i_or_cond4_238_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_cmp1110_neg_or82128_demorgan_conv2d3x3(LOGICAL,31)@9
    i_cmp1110_neg_or82128_demorgan_conv2d3x3_q <= i_or_cond4_238_conv2d3x3_q or i_or_cond4_1_2_conv2d3x3_q;

    -- i_cmp1110_neg_or82128_conv2d3x3(LOGICAL,30)@9
    i_cmp1110_neg_or82128_conv2d3x3_q <= i_cmp1110_neg_or82128_demorgan_conv2d3x3_q xor VCC_q;

    -- i_syncbuf_input_channels_sync_buffer_conv2d3x3(BLACKBOX,86)@0
    -- in in_i_dependence@8
    -- in in_valid_in@8
    -- out out_buffer_out@8
    -- out out_valid_out@8
    thei_syncbuf_input_channels_sync_buffer_conv2d3x3 : i_syncbuf_input_channels_sync_buffer_conv2d3x363
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_7_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp1110_neg_rm_conv2d3x3(COMPARE,33)@8 + 1
    i_cmp1110_neg_rm_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out));
    i_cmp1110_neg_rm_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => dupName_0_c_i32_1gr_x_q(31)) & dupName_0_c_i32_1gr_x_q));
    i_cmp1110_neg_rm_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp1110_neg_rm_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp1110_neg_rm_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp1110_neg_rm_conv2d3x3_a) - SIGNED(i_cmp1110_neg_rm_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp1110_neg_rm_conv2d3x3_c(0) <= i_cmp1110_neg_rm_conv2d3x3_o(33);

    -- i_cmp14_phi_decision87_xor99_or127_conv2d3x3(LOGICAL,41)@9
    i_cmp14_phi_decision87_xor99_or127_conv2d3x3_q <= i_cmp1110_neg_rm_conv2d3x3_c or i_cmp1110_neg_or82128_conv2d3x3_q;

    -- i_reduction_conv2d3x3_3_conv2d3x3(LOGICAL,79)@9 + 1
    i_reduction_conv2d3x3_3_conv2d3x3_qi <= i_cmp14_phi_decision87_xor99_or127_conv2d3x3_q or i_cmp14_phi_decision87_xor_rm_conv2d3x3_c;
    i_reduction_conv2d3x3_3_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_conv2d3x3_3_conv2d3x3_qi, xout => i_reduction_conv2d3x3_3_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_cmp14_phi_decision87_xor99_or_and_and_conv2d3x3(LOGICAL,42)@10
    i_cmp14_phi_decision87_xor99_or_and_and_conv2d3x3_q <= i_reduction_conv2d3x3_3_conv2d3x3_q and i_cmp14_phi_decision87_xor103_or_conv2d3x3_q;

    -- i_syncbuf_input_size_sync_buffer137_conv2d3x3(BLACKBOX,89)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_sync_buffer137_conv2d3x3 : i_syncbuf_input_size_sync_buffer137_conv2d3x352
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer137_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_2gr(CONSTANT,22)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_sub30_2_conv2d3x3(ADD,85)@6
    i_sub30_2_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist26_bgTrunc_i_add29_conv2d3x3_sel_x_b_1_q);
    i_sub30_2_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & c_i32_2gr_q);
    i_sub30_2_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub30_2_conv2d3x3_a) + UNSIGNED(i_sub30_2_conv2d3x3_b));
    i_sub30_2_conv2d3x3_q <= i_sub30_2_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_sub30_2_conv2d3x3_sel_x(BITSELECT,5)@6
    bgTrunc_i_sub30_2_conv2d3x3_sel_x_b <= i_sub30_2_conv2d3x3_q(31 downto 0);

    -- redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1(DELAY,157)
    redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub30_2_conv2d3x3_sel_x_b, xout => redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp39_2_conv2d3x3(COMPARE,51)@7 + 1
    i_cmp39_2_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1_q(31)) & redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1_q));
    i_cmp39_2_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer137_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer137_conv2d3x3_out_buffer_out));
    i_cmp39_2_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp39_2_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp39_2_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp39_2_conv2d3x3_a) - SIGNED(i_cmp39_2_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp39_2_conv2d3x3_c(0) <= i_cmp39_2_conv2d3x3_o(33);

    -- i_cmp36_2_conv2d3x3(COMPARE,48)@7 + 1
    i_cmp36_2_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp36_2_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1_q(31)) & redist23_bgTrunc_i_sub30_2_conv2d3x3_sel_x_b_1_q));
    i_cmp36_2_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp36_2_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp36_2_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp36_2_conv2d3x3_a) - SIGNED(i_cmp36_2_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp36_2_conv2d3x3_c(0) <= i_cmp36_2_conv2d3x3_o(33);

    -- redist17_sync_in_aunroll_x_in_c0_eni4_3_7(DELAY,151)
    redist17_sync_in_aunroll_x_in_c0_eni4_3_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni4_3, xout => redist17_sync_in_aunroll_x_in_c0_eni4_3_7_q, clk => clock, aclr => resetn );

    -- i_or_cond3_2_1_conv2d3x3(LOGICAL,59)@8
    i_or_cond3_2_1_conv2d3x3_q <= redist17_sync_in_aunroll_x_in_c0_eni4_3_7_q and i_cmp36_2_conv2d3x3_c;

    -- i_or_cond4_2_1_conv2d3x3(LOGICAL,70)@8 + 1
    i_or_cond4_2_1_conv2d3x3_qi <= i_or_cond3_2_1_conv2d3x3_q and i_cmp39_2_conv2d3x3_c;
    i_or_cond4_2_1_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_2_1_conv2d3x3_qi, xout => i_or_cond4_2_1_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_or_cond4_2_1_xor_conv2d3x3(LOGICAL,71)@9
    i_or_cond4_2_1_xor_conv2d3x3_q <= i_or_cond4_2_1_conv2d3x3_q xor VCC_q;

    -- i_cmp1110_neg_or78_conv2d3x3(LOGICAL,29)@9
    i_cmp1110_neg_or78_conv2d3x3_q <= i_cmp1110_neg_rm_conv2d3x3_c or i_or_cond4_2_1_xor_conv2d3x3_q;

    -- i_cmp14_phi_decision87_xor97_or_conv2d3x3(LOGICAL,40)@9
    i_cmp14_phi_decision87_xor97_or_conv2d3x3_q <= i_cmp1110_neg_or78_conv2d3x3_q or i_cmp14_phi_decision87_xor_rm_conv2d3x3_c;

    -- redist13_i_cmp14_phi_decision87_xor97_or_conv2d3x3_q_1(DELAY,147)
    redist13_i_cmp14_phi_decision87_xor97_or_conv2d3x3_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp14_phi_decision87_xor97_or_conv2d3x3_q, xout => redist13_i_cmp14_phi_decision87_xor97_or_conv2d3x3_q_1_q, clk => clock, aclr => resetn );

    -- i_or_cond3_1_1_conv2d3x3(LOGICAL,55)@8
    i_or_cond3_1_1_conv2d3x3_q <= redist17_sync_in_aunroll_x_in_c0_eni4_3_7_q and i_cmp36_1_conv2d3x3_c;

    -- i_or_cond4_1_1_conv2d3x3(LOGICAL,65)@8 + 1
    i_or_cond4_1_1_conv2d3x3_qi <= i_or_cond3_1_1_conv2d3x3_q and i_cmp39_1_conv2d3x3_c;
    i_or_cond4_1_1_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_1_1_conv2d3x3_qi, xout => i_or_cond4_1_1_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_or_cond4_1_1_xor_conv2d3x3(LOGICAL,66)@9
    i_or_cond4_1_1_xor_conv2d3x3_q <= i_or_cond4_1_1_conv2d3x3_q xor VCC_q;

    -- i_cmp1110_neg_or76_conv2d3x3(LOGICAL,28)@9
    i_cmp1110_neg_or76_conv2d3x3_q <= i_cmp1110_neg_rm_conv2d3x3_c or i_or_cond4_1_1_xor_conv2d3x3_q;

    -- i_cmp14_phi_decision87_xor95_or_conv2d3x3(LOGICAL,39)@9
    i_cmp14_phi_decision87_xor95_or_conv2d3x3_q <= i_cmp1110_neg_or76_conv2d3x3_q or i_cmp14_phi_decision87_xor_rm_conv2d3x3_c;

    -- i_or_cond3_121_conv2d3x3(LOGICAL,54)@8
    i_or_cond3_121_conv2d3x3_q <= redist17_sync_in_aunroll_x_in_c0_eni4_3_7_q and i_cmp36_conv2d3x3_c;

    -- i_or_cond4_123_conv2d3x3(LOGICAL,63)@8 + 1
    i_or_cond4_123_conv2d3x3_qi <= i_or_cond3_121_conv2d3x3_q and i_cmp39_conv2d3x3_c;
    i_or_cond4_123_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_123_conv2d3x3_qi, xout => i_or_cond4_123_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_or_cond4_123_xor_conv2d3x3(LOGICAL,64)@9
    i_or_cond4_123_xor_conv2d3x3_q <= i_or_cond4_123_conv2d3x3_q xor VCC_q;

    -- i_cmp1110_neg_or74_conv2d3x3(LOGICAL,27)@9
    i_cmp1110_neg_or74_conv2d3x3_q <= i_cmp1110_neg_rm_conv2d3x3_c or i_or_cond4_123_xor_conv2d3x3_q;

    -- i_cmp14_phi_decision87_xor93_or_conv2d3x3(LOGICAL,38)@9
    i_cmp14_phi_decision87_xor93_or_conv2d3x3_q <= i_cmp1110_neg_or74_conv2d3x3_q or i_cmp14_phi_decision87_xor_rm_conv2d3x3_c;

    -- i_cmp14_phi_decision87_xor93_or_and_conv2d3x3(LOGICAL,37)@9 + 1
    i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_qi <= i_cmp14_phi_decision87_xor93_or_conv2d3x3_q and i_cmp14_phi_decision87_xor95_or_conv2d3x3_q;
    i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_qi, xout => i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_cmp14_phi_decision87_xor93_or_and_and_conv2d3x3(LOGICAL,36)@10
    i_cmp14_phi_decision87_xor93_or_and_and_conv2d3x3_q <= i_cmp14_phi_decision87_xor93_or_and_conv2d3x3_q and redist13_i_cmp14_phi_decision87_xor97_or_conv2d3x3_q_1_q;

    -- i_reduction_conv2d3x3_2_conv2d3x3(LOGICAL,78)@9 + 1
    i_reduction_conv2d3x3_2_conv2d3x3_qi <= i_cmp14_phi_decision87_xor95_or_conv2d3x3_q and i_cmp14_phi_decision87_xor97_or_conv2d3x3_q;
    i_reduction_conv2d3x3_2_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_conv2d3x3_2_conv2d3x3_qi, xout => i_reduction_conv2d3x3_2_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_reduction_conv2d3x3_5_conv2d3x3(LOGICAL,81)@10
    i_reduction_conv2d3x3_5_conv2d3x3_q <= i_reduction_conv2d3x3_2_conv2d3x3_q and i_reduction_conv2d3x3_3_conv2d3x3_q;

    -- redist18_sync_in_aunroll_x_in_c0_eni4_4_7(DELAY,152)
    redist18_sync_in_aunroll_x_in_c0_eni4_4_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni4_4, xout => redist18_sync_in_aunroll_x_in_c0_eni4_4_7_q, clk => clock, aclr => resetn );

    -- i_or_cond3_2_conv2d3x3(LOGICAL,61)@8
    i_or_cond3_2_conv2d3x3_q <= redist18_sync_in_aunroll_x_in_c0_eni4_4_7_q and i_cmp36_2_conv2d3x3_c;

    -- i_or_cond4_2_conv2d3x3(LOGICAL,74)@8 + 1
    i_or_cond4_2_conv2d3x3_qi <= i_or_cond3_2_conv2d3x3_q and i_cmp39_2_conv2d3x3_c;
    i_or_cond4_2_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_2_conv2d3x3_qi, xout => i_or_cond4_2_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_or_cond4_2_xor_conv2d3x3(LOGICAL,75)@9
    i_or_cond4_2_xor_conv2d3x3_q <= i_or_cond4_2_conv2d3x3_q xor VCC_q;

    -- i_cmp1110_neg_or72_conv2d3x3(LOGICAL,26)@9
    i_cmp1110_neg_or72_conv2d3x3_q <= i_cmp1110_neg_rm_conv2d3x3_c or i_or_cond4_2_xor_conv2d3x3_q;

    -- i_cmp14_phi_decision87_xor91_or_conv2d3x3(LOGICAL,35)@9
    i_cmp14_phi_decision87_xor91_or_conv2d3x3_q <= i_cmp1110_neg_or72_conv2d3x3_q or i_cmp14_phi_decision87_xor_rm_conv2d3x3_c;

    -- i_reduction_conv2d3x3_1_conv2d3x3(LOGICAL,77)@9 + 1
    i_reduction_conv2d3x3_1_conv2d3x3_qi <= i_cmp14_phi_decision87_xor91_or_conv2d3x3_q and i_cmp14_phi_decision87_xor93_or_conv2d3x3_q;
    i_reduction_conv2d3x3_1_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_conv2d3x3_1_conv2d3x3_qi, xout => i_reduction_conv2d3x3_1_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_or_cond3_1_conv2d3x3(LOGICAL,57)@8
    i_or_cond3_1_conv2d3x3_q <= redist18_sync_in_aunroll_x_in_c0_eni4_4_7_q and i_cmp36_1_conv2d3x3_c;

    -- i_or_cond4_1_conv2d3x3(LOGICAL,68)@8 + 1
    i_or_cond4_1_conv2d3x3_qi <= i_or_cond3_1_conv2d3x3_q and i_cmp39_1_conv2d3x3_c;
    i_or_cond4_1_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_1_conv2d3x3_qi, xout => i_or_cond4_1_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_or_cond3_conv2d3x3(LOGICAL,62)@8
    i_or_cond3_conv2d3x3_q <= redist18_sync_in_aunroll_x_in_c0_eni4_4_7_q and i_cmp36_conv2d3x3_c;

    -- i_or_cond4_conv2d3x3(LOGICAL,76)@8 + 1
    i_or_cond4_conv2d3x3_qi <= i_or_cond3_conv2d3x3_q and i_cmp39_conv2d3x3_c;
    i_or_cond4_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_conv2d3x3_qi, xout => i_or_cond4_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_cmp1110_neg_or70126_demorgan_conv2d3x3(LOGICAL,25)@9
    i_cmp1110_neg_or70126_demorgan_conv2d3x3_q <= i_or_cond4_conv2d3x3_q or i_or_cond4_1_conv2d3x3_q;

    -- i_cmp1110_neg_or70126_conv2d3x3(LOGICAL,24)@9
    i_cmp1110_neg_or70126_conv2d3x3_q <= i_cmp1110_neg_or70126_demorgan_conv2d3x3_q xor VCC_q;

    -- i_cmp14_phi_decision87_xor_or125_conv2d3x3(LOGICAL,43)@9
    i_cmp14_phi_decision87_xor_or125_conv2d3x3_q <= i_cmp1110_neg_rm_conv2d3x3_c or i_cmp1110_neg_or70126_conv2d3x3_q;

    -- i_cmp14_phi_decision87_xor_or_and_conv2d3x3(LOGICAL,45)@9 + 1
    i_cmp14_phi_decision87_xor_or_and_conv2d3x3_qi <= i_cmp14_phi_decision87_xor_or125_conv2d3x3_q or i_cmp14_phi_decision87_xor_rm_conv2d3x3_c;
    i_cmp14_phi_decision87_xor_or_and_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp14_phi_decision87_xor_or_and_conv2d3x3_qi, xout => i_cmp14_phi_decision87_xor_or_and_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_reduction_conv2d3x3_4_conv2d3x3(LOGICAL,80)@10
    i_reduction_conv2d3x3_4_conv2d3x3_q <= i_cmp14_phi_decision87_xor_or_and_conv2d3x3_q and i_reduction_conv2d3x3_1_conv2d3x3_q;

    -- i_reduction_conv2d3x3_6_conv2d3x3(LOGICAL,82)@10
    i_reduction_conv2d3x3_6_conv2d3x3_q <= i_reduction_conv2d3x3_4_conv2d3x3_q and i_reduction_conv2d3x3_5_conv2d3x3_q;

    -- i_reduction_conv2d3x3_7_conv2d3x3(LOGICAL,83)@10
    i_reduction_conv2d3x3_7_conv2d3x3_q <= i_cmp14_phi_decision87_xor103_or_conv2d3x3_q and i_reduction_conv2d3x3_6_conv2d3x3_q;

    -- redist14_i_cmp14_phi_decision87_xor91_or_conv2d3x3_q_1(DELAY,148)
    redist14_i_cmp14_phi_decision87_xor91_or_conv2d3x3_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp14_phi_decision87_xor91_or_conv2d3x3_q, xout => redist14_i_cmp14_phi_decision87_xor91_or_conv2d3x3_q_1_q, clk => clock, aclr => resetn );

    -- i_cmp14_phi_decision87_xor_or_and_and_conv2d3x3(LOGICAL,44)@10
    i_cmp14_phi_decision87_xor_or_and_and_conv2d3x3_q <= i_cmp14_phi_decision87_xor_or_and_conv2d3x3_q and redist14_i_cmp14_phi_decision87_xor91_or_conv2d3x3_q_1_q;

    -- redist12_i_cmp14_phi_decision87_xor_rm_conv2d3x3_c_2(DELAY,146)
    redist12_i_cmp14_phi_decision87_xor_rm_conv2d3x3_c_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp14_phi_decision87_xor_rm_conv2d3x3_c, xout => redist12_i_cmp14_phi_decision87_xor_rm_conv2d3x3_c_2_q, clk => clock, aclr => resetn );

    -- redist15_i_cmp1110_neg_rm_conv2d3x3_c_2(DELAY,149)
    redist15_i_cmp1110_neg_rm_conv2d3x3_c_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp1110_neg_rm_conv2d3x3_c, xout => redist15_i_cmp1110_neg_rm_conv2d3x3_c_2_q, clk => clock, aclr => resetn );

    -- redist3_i_or_cond4_conv2d3x3_q_2(DELAY,137)
    redist3_i_or_cond4_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_conv2d3x3_q, xout => redist3_i_or_cond4_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist8_i_or_cond4_1_conv2d3x3_q_2(DELAY,142)
    redist8_i_or_cond4_1_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_1_conv2d3x3_q, xout => redist8_i_or_cond4_1_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist4_i_or_cond4_2_conv2d3x3_q_2(DELAY,138)
    redist4_i_or_cond4_2_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_2_conv2d3x3_q, xout => redist4_i_or_cond4_2_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist11_i_or_cond4_123_conv2d3x3_q_2(DELAY,145)
    redist11_i_or_cond4_123_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_123_conv2d3x3_q, xout => redist11_i_or_cond4_123_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist10_i_or_cond4_1_1_conv2d3x3_q_2(DELAY,144)
    redist10_i_or_cond4_1_1_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_1_1_conv2d3x3_q, xout => redist10_i_or_cond4_1_1_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist6_i_or_cond4_2_1_conv2d3x3_q_2(DELAY,140)
    redist6_i_or_cond4_2_1_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_2_1_conv2d3x3_q, xout => redist6_i_or_cond4_2_1_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist7_i_or_cond4_238_conv2d3x3_q_2(DELAY,141)
    redist7_i_or_cond4_238_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_238_conv2d3x3_q, xout => redist7_i_or_cond4_238_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist9_i_or_cond4_1_2_conv2d3x3_q_2(DELAY,143)
    redist9_i_or_cond4_1_2_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_1_2_conv2d3x3_q, xout => redist9_i_or_cond4_1_2_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- i_or_cond3_2_2_conv2d3x3(LOGICAL,60)@8
    i_or_cond3_2_2_conv2d3x3_q <= redist16_sync_in_aunroll_x_in_c0_eni4_2_7_q and i_cmp36_2_conv2d3x3_c;

    -- i_or_cond4_2_2_conv2d3x3(LOGICAL,72)@8 + 1
    i_or_cond4_2_2_conv2d3x3_qi <= i_or_cond3_2_2_conv2d3x3_q and i_cmp39_2_conv2d3x3_c;
    i_or_cond4_2_2_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_2_2_conv2d3x3_qi, xout => i_or_cond4_2_2_conv2d3x3_q, clk => clock, aclr => resetn );

    -- redist5_i_or_cond4_2_2_conv2d3x3_q_2(DELAY,139)
    redist5_i_or_cond4_2_2_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond4_2_2_conv2d3x3_q, xout => redist5_i_or_cond4_2_2_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_notEnable(LOGICAL,167)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_nor(LOGICAL,168)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_nor_q <= not (redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_notEnable_q or redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_q);

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_cmpReg(REG,166)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena(REG,169)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_nor_q = "1") THEN
                redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_enaAnd(LOGICAL,170)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_enaAnd_q <= redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_sticky_ena_q and VCC_q;

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt(COUNTER,164)
    -- low=0, high=1, step=1, init=0
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_i <= redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_i, 1)));

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_wraddr(REG,165)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_wraddr_q <= STD_LOGIC_VECTOR(redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem(DUALMEM,163)
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_ia <= STD_LOGIC_VECTOR(redist27_bgTrunc_i_add29_conv2d3x3_sel_x_b_2_q);
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_aa <= redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_wraddr_q;
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_ab <= redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_rdcnt_q;
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_reset0 <= not (resetn);
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_reset0,
        clock1 => clock,
        address_a => redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_aa,
        data_a => redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_ab,
        q_b => redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_iq
    );
    redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_q <= redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_iq(31 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,14)@10
    out_c0_exi16_0 <= GND_q;
    out_c0_exi16_1 <= redist28_bgTrunc_i_add29_conv2d3x3_sel_x_b_5_mem_q;
    out_c0_exi16_2 <= redist5_i_or_cond4_2_2_conv2d3x3_q_2_q;
    out_c0_exi16_3 <= redist9_i_or_cond4_1_2_conv2d3x3_q_2_q;
    out_c0_exi16_4 <= redist7_i_or_cond4_238_conv2d3x3_q_2_q;
    out_c0_exi16_5 <= redist6_i_or_cond4_2_1_conv2d3x3_q_2_q;
    out_c0_exi16_6 <= redist10_i_or_cond4_1_1_conv2d3x3_q_2_q;
    out_c0_exi16_7 <= redist11_i_or_cond4_123_conv2d3x3_q_2_q;
    out_c0_exi16_8 <= redist4_i_or_cond4_2_conv2d3x3_q_2_q;
    out_c0_exi16_9 <= redist8_i_or_cond4_1_conv2d3x3_q_2_q;
    out_c0_exi16_10 <= redist3_i_or_cond4_conv2d3x3_q_2_q;
    out_c0_exi16_11 <= redist15_i_cmp1110_neg_rm_conv2d3x3_c_2_q;
    out_c0_exi16_12 <= redist12_i_cmp14_phi_decision87_xor_rm_conv2d3x3_c_2_q;
    out_c0_exi16_13 <= i_cmp14_phi_decision87_xor_or_and_and_conv2d3x3_q;
    out_c0_exi16_14 <= i_reduction_conv2d3x3_7_conv2d3x3_q;
    out_c0_exi16_15 <= i_cmp14_phi_decision87_xor93_or_and_and_conv2d3x3_q;
    out_c0_exi16_16 <= i_cmp14_phi_decision87_xor99_or_and_and_conv2d3x3_q;
    out_o_valid <= redist22_sync_in_aunroll_x_in_i_valid_9_q;

END normal;
