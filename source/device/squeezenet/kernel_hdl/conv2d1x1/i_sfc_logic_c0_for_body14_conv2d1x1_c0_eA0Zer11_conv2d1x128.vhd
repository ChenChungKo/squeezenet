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

-- VHDL created from i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x128
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

entity i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x128 is
    port (
        in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi4_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi4_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi4_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi4_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi4_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x128;

architecture normal of i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter11_conv2d1x128 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_im_sync_buffer7_conv2d1x137 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_im_sync_buffer8_conv2d1x134 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_im_sync_buffer9_conv2d1x131 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_im_sync_buffer_conv2d1x140 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add18_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add28_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add39_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add50_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul17_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul27_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul38_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul49_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom19_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom29_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom40_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom51_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add18_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add253_conv2d1x1_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_add253_conv2d1x1_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add253_conv2d1x1_vt_select_31_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_add28_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add28_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add28_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add28_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add364_conv2d1x1_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_add364_conv2d1x1_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add364_conv2d1x1_vt_select_31_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_add39_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add39_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add39_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add39_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add475_conv2d1x1_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_add475_conv2d1x1_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add475_conv2d1x1_vt_select_31_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_add50_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add50_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add50_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add50_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul17_conv2d1x1_vt_const_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_mul17_conv2d1x1_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul17_conv2d1x1_vt_select_31_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_mul38_conv2d1x1_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul38_conv2d1x1_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shl_conv2d1x1_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_conv2d1x1_vt_select_31_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_syncbuf_input_im_sync_buffer7_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer8_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer9_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid198_i_shl_conv2d1x1_conv2d1x130_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul17_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul17_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul27_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul27_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul38_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul38_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul49_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul49_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add253_conv2d1x1_BitSelect_for_a_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_add253_conv2d1x1_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add364_conv2d1x1_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add475_conv2d1x1_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul17_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul17_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul17_conv2d1x1_bs2_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul17_conv2d1x1_bs2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul17_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul17_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul17_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul17_conv2d1x1_bs6_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul17_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul17_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul17_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul17_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul17_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul17_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul17_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul17_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul17_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul17_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul27_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul27_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul27_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul27_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul27_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul27_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul27_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul27_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul38_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul38_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul38_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul38_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul38_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul38_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul38_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul38_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul49_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul49_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul49_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul49_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul49_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul49_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul49_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul49_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul17_conv2d1x1_im0_cma_reset : std_logic;
    type i_mul17_conv2d1x1_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul17_conv2d1x1_im0_cma_a0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul17_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul17_conv2d1x1_im0_cma_c0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul17_conv2d1x1_im0_cma_c0 : signal is true;
    type i_mul17_conv2d1x1_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul17_conv2d1x1_im0_cma_p : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im0_cma_u : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im0_cma_w : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im0_cma_x : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im0_cma_y : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im0_cma_s : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul17_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul17_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul17_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul17_conv2d1x1_im10_cma_reset : std_logic;
    type i_mul17_conv2d1x1_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul17_conv2d1x1_im10_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul17_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul17_conv2d1x1_im10_cma_c0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul17_conv2d1x1_im10_cma_c0 : signal is true;
    type i_mul17_conv2d1x1_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul17_conv2d1x1_im10_cma_p : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im10_cma_u : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im10_cma_w : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im10_cma_x : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im10_cma_y : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im10_cma_s : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul17_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul17_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul17_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul17_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul27_conv2d1x1_im0_cma_reset : std_logic;
    signal i_mul27_conv2d1x1_im0_cma_a0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul27_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul27_conv2d1x1_im0_cma_c0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul27_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_mul27_conv2d1x1_im0_cma_p : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im0_cma_u : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im0_cma_w : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im0_cma_x : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im0_cma_y : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im0_cma_s : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul27_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul27_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul27_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul27_conv2d1x1_im10_cma_reset : std_logic;
    signal i_mul27_conv2d1x1_im10_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul27_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul27_conv2d1x1_im10_cma_c0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul27_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_mul27_conv2d1x1_im10_cma_p : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im10_cma_u : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im10_cma_w : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im10_cma_x : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im10_cma_y : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im10_cma_s : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul27_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul27_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul27_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul27_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul38_conv2d1x1_im0_cma_reset : std_logic;
    signal i_mul38_conv2d1x1_im0_cma_a0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul38_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul38_conv2d1x1_im0_cma_c0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul38_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_mul38_conv2d1x1_im0_cma_p : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im0_cma_u : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im0_cma_w : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im0_cma_x : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im0_cma_y : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im0_cma_s : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul38_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul38_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul38_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul38_conv2d1x1_im10_cma_reset : std_logic;
    signal i_mul38_conv2d1x1_im10_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul38_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul38_conv2d1x1_im10_cma_c0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul38_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_mul38_conv2d1x1_im10_cma_p : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im10_cma_u : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im10_cma_w : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im10_cma_x : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im10_cma_y : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im10_cma_s : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul38_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul38_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul38_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul38_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul49_conv2d1x1_im0_cma_reset : std_logic;
    signal i_mul49_conv2d1x1_im0_cma_a0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul49_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul49_conv2d1x1_im0_cma_c0 : i_mul17_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul49_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_mul49_conv2d1x1_im0_cma_p : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im0_cma_u : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im0_cma_w : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im0_cma_x : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im0_cma_y : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im0_cma_s : i_mul17_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul49_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul49_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul49_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul49_conv2d1x1_im10_cma_reset : std_logic;
    signal i_mul49_conv2d1x1_im10_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul49_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul49_conv2d1x1_im10_cma_c0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul49_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_mul49_conv2d1x1_im10_cma_p : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im10_cma_u : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im10_cma_w : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im10_cma_x : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im10_cma_y : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im10_cma_s : i_mul17_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul49_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul49_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul49_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul49_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul17_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul17_conv2d1x1_ma3_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul17_conv2d1x1_ma3_cma_a0 : signal is true;
    type i_mul17_conv2d1x1_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul17_conv2d1x1_ma3_cma_c0 : i_mul17_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul17_conv2d1x1_ma3_cma_c0 : signal is true;
    type i_mul17_conv2d1x1_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul17_conv2d1x1_ma3_cma_l : i_mul17_conv2d1x1_ma3_cma_ltype(0 to 1);
    type i_mul17_conv2d1x1_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul17_conv2d1x1_ma3_cma_p : i_mul17_conv2d1x1_ma3_cma_ptype(0 to 1);
    type i_mul17_conv2d1x1_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul17_conv2d1x1_ma3_cma_u : i_mul17_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul17_conv2d1x1_ma3_cma_w : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul17_conv2d1x1_ma3_cma_x : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul17_conv2d1x1_ma3_cma_y : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul17_conv2d1x1_ma3_cma_s : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul17_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul17_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul17_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul17_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_mul27_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul27_conv2d1x1_ma3_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul27_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_mul27_conv2d1x1_ma3_cma_c0 : i_mul17_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul27_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_mul27_conv2d1x1_ma3_cma_l : i_mul17_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_mul27_conv2d1x1_ma3_cma_p : i_mul17_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_mul27_conv2d1x1_ma3_cma_u : i_mul17_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul27_conv2d1x1_ma3_cma_w : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul27_conv2d1x1_ma3_cma_x : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul27_conv2d1x1_ma3_cma_y : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul27_conv2d1x1_ma3_cma_s : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul27_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul27_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul27_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul27_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_mul38_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul38_conv2d1x1_ma3_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul38_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_mul38_conv2d1x1_ma3_cma_c0 : i_mul17_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul38_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_mul38_conv2d1x1_ma3_cma_l : i_mul17_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_mul38_conv2d1x1_ma3_cma_p : i_mul17_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_mul38_conv2d1x1_ma3_cma_u : i_mul17_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul38_conv2d1x1_ma3_cma_w : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul38_conv2d1x1_ma3_cma_x : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul38_conv2d1x1_ma3_cma_y : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul38_conv2d1x1_ma3_cma_s : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul38_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul38_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul38_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul38_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_mul49_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul49_conv2d1x1_ma3_cma_a0 : i_mul17_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul49_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_mul49_conv2d1x1_ma3_cma_c0 : i_mul17_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul49_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_mul49_conv2d1x1_ma3_cma_l : i_mul17_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_mul49_conv2d1x1_ma3_cma_p : i_mul17_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_mul49_conv2d1x1_ma3_cma_u : i_mul17_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul49_conv2d1x1_ma3_cma_w : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul49_conv2d1x1_ma3_cma_x : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul49_conv2d1x1_ma3_cma_y : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul49_conv2d1x1_ma3_cma_s : i_mul17_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul49_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul49_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul49_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul49_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul27_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul27_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul38_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul38_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul49_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul49_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul49_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul38_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist2_i_mul27_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist3_i_mul17_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist4_i_mul49_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist5_i_mul49_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist6_i_mul38_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist7_i_mul38_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist8_i_mul27_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist9_i_mul27_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist10_i_mul17_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist11_i_mul17_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist12_i_mul38_conv2d1x1_vt_select_31_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist13_i_mul17_conv2d1x1_vt_select_31_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist15_sync_in_aunroll_x_in_i_valid_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist17_i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist18_i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist19_i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist20_bgTrunc_i_mul49_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_bgTrunc_i_mul27_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_bgTrunc_i_add50_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_bgTrunc_i_add39_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_bgTrunc_i_add28_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_bgTrunc_i_add18_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_reset0 : std_logic;
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_i : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_q : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni3_3_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist15_sync_in_aunroll_x_in_i_valid_6(DELAY,337)
    redist15_sync_in_aunroll_x_in_i_valid_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist15_sync_in_aunroll_x_in_i_valid_6_q, clk => clock, aclr => resetn );

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x(CONSTANT,20)
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_notEnable(LOGICAL,353)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_nor(LOGICAL,354)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_nor_q <= not (redist14_sync_in_aunroll_x_in_c0_eni3_3_4_notEnable_q or redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_q);

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_cmpReg(REG,352)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena(REG,355)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist14_sync_in_aunroll_x_in_c0_eni3_3_4_nor_q = "1") THEN
                redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni3_3_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_enaAnd(LOGICAL,356)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_enaAnd_q <= redist14_sync_in_aunroll_x_in_c0_eni3_3_4_sticky_ena_q and VCC_q;

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt(COUNTER,350)
    -- low=0, high=1, step=1, init=0
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_i <= redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_i, 1)));

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_wraddr(REG,351)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni3_3_4_wraddr_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem(DUALMEM,349)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni3_3);
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_aa <= redist14_sync_in_aunroll_x_in_c0_eni3_3_4_wraddr_q;
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_ab <= redist14_sync_in_aunroll_x_in_c0_eni3_3_4_rdcnt_q;
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_reset0 <= not (resetn);
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_dmem : altera_syncram
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
        clocken1 => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_reset0,
        clock1 => clock,
        address_a => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_aa,
        data_a => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_ab,
        q_b => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_iq
    );
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_q <= redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_iq(31 downto 0);

    -- redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg(DELAY,348)
    redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_mem_q, xout => redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul17_conv2d1x1_bs4(BITSELECT,223)@3
    i_mul17_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(in_c0_eni3_2(17 downto 0));
    i_mul17_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_mul17_conv2d1x1_bs4_in(17 downto 0));

    -- i_mul17_conv2d1x1_bjA5(BITJOIN,224)@3
    i_mul17_conv2d1x1_bjA5_q <= GND_q & i_mul17_conv2d1x1_bs4_b;

    -- leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x(BITSELECT,196)@3
    leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x_in <= in_c0_eni3_1(29 downto 0);
    leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x_b <= leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1_uid198_i_shl_conv2d1x1_conv2d1x130_shift_x(BITJOIN,197)@3
    leftShiftStage0Idx1_uid198_i_shl_conv2d1x1_conv2d1x130_shift_x_q <= leftShiftStage0Idx1Rng2_uid197_i_shl_conv2d1x1_conv2d1x130_shift_x_b & i_mul17_conv2d1x1_vt_const_1_q;

    -- leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x(MUX,199)@3
    leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_s <= VCC_q;
    leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_combproc: PROCESS (leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_s, in_c0_eni3_1, leftShiftStage0Idx1_uid198_i_shl_conv2d1x1_conv2d1x130_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_q <= in_c0_eni3_1;
            WHEN "1" => leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_q <= leftShiftStage0Idx1_uid198_i_shl_conv2d1x1_conv2d1x130_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl_conv2d1x1_vt_select_31(BITSELECT,114)@3
    i_shl_conv2d1x1_vt_select_31_b <= leftShiftStage0_uid200_i_shl_conv2d1x1_conv2d1x130_shift_x_q(31 downto 2);

    -- i_mul17_conv2d1x1_vt_const_1(CONSTANT,103)
    i_mul17_conv2d1x1_vt_const_1_q <= "00";

    -- i_shl_conv2d1x1_vt_join(BITJOIN,113)@3
    i_shl_conv2d1x1_vt_join_q <= i_shl_conv2d1x1_vt_select_31_b & i_mul17_conv2d1x1_vt_const_1_q;

    -- i_add253_conv2d1x1_BitSelect_for_a(BITSELECT,209)@3
    i_add253_conv2d1x1_BitSelect_for_a_b <= i_shl_conv2d1x1_vt_join_q(31 downto 2);

    -- i_add475_conv2d1x1_join(BITJOIN,214)@3
    i_add475_conv2d1x1_join_q <= i_add253_conv2d1x1_BitSelect_for_a_b & VCC_q & VCC_q;

    -- i_add475_conv2d1x1_vt_select_31(BITSELECT,92)@3
    i_add475_conv2d1x1_vt_select_31_b <= i_add475_conv2d1x1_join_q(31 downto 2);

    -- i_add475_conv2d1x1_vt_const_1(CONSTANT,90)
    i_add475_conv2d1x1_vt_const_1_q <= "11";

    -- i_add475_conv2d1x1_vt_join(BITJOIN,91)@3
    i_add475_conv2d1x1_vt_join_q <= i_add475_conv2d1x1_vt_select_31_b & i_add475_conv2d1x1_vt_const_1_q;

    -- i_mul49_conv2d1x1_bs2_merged_bit_select(BITSELECT,321)@3
    i_mul49_conv2d1x1_bs2_merged_bit_select_b <= i_add475_conv2d1x1_vt_join_q(17 downto 0);
    i_mul49_conv2d1x1_bs2_merged_bit_select_c <= i_add475_conv2d1x1_vt_join_q(31 downto 18);

    -- i_mul49_conv2d1x1_bjB9(BITJOIN,279)@3
    i_mul49_conv2d1x1_bjB9_q <= GND_q & i_mul49_conv2d1x1_bs2_merged_bit_select_b;

    -- i_mul17_conv2d1x1_bs7(BITSELECT,226)@3
    i_mul17_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(in_c0_eni3_2(31 downto 18));

    -- i_mul49_conv2d1x1_ma3_cma(CHAINMULTADD,314)@3 + 2
    i_mul49_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul49_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul49_conv2d1x1_ma3_cma_ena1 <= i_mul49_conv2d1x1_ma3_cma_ena0;
    i_mul49_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul49_conv2d1x1_ma3_cma_a0(0),15));
    i_mul49_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul49_conv2d1x1_ma3_cma_a0(1),15));
    i_mul49_conv2d1x1_ma3_cma_p(0) <= i_mul49_conv2d1x1_ma3_cma_l(0) * i_mul49_conv2d1x1_ma3_cma_c0(0);
    i_mul49_conv2d1x1_ma3_cma_p(1) <= i_mul49_conv2d1x1_ma3_cma_l(1) * i_mul49_conv2d1x1_ma3_cma_c0(1);
    i_mul49_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul49_conv2d1x1_ma3_cma_p(0),35);
    i_mul49_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul49_conv2d1x1_ma3_cma_p(1),35);
    i_mul49_conv2d1x1_ma3_cma_w(0) <= i_mul49_conv2d1x1_ma3_cma_u(0) + i_mul49_conv2d1x1_ma3_cma_u(1);
    i_mul49_conv2d1x1_ma3_cma_x(0) <= i_mul49_conv2d1x1_ma3_cma_w(0);
    i_mul49_conv2d1x1_ma3_cma_y(0) <= i_mul49_conv2d1x1_ma3_cma_x(0);
    i_mul49_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul49_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul49_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul49_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul49_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs7_b),14);
                i_mul49_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul49_conv2d1x1_bs2_merged_bit_select_c),14);
                i_mul49_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul49_conv2d1x1_bjB9_q),19);
                i_mul49_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul17_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul49_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul49_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul49_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul49_conv2d1x1_ma3_cma_s(0) <= i_mul49_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul49_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul49_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul49_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul49_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul49_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul49_conv2d1x1_ma3_cma_q_1(DELAY,322)
    redist0_i_mul49_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul49_conv2d1x1_ma3_cma_q, xout => redist0_i_mul49_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul49_conv2d1x1_align_14(BITSHIFT,284)@6
    i_mul49_conv2d1x1_align_14_qint <= redist0_i_mul49_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul49_conv2d1x1_align_14_q <= i_mul49_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul17_conv2d1x1_bs11(BITSELECT,230)@3
    i_mul17_conv2d1x1_bs11_b <= in_c0_eni3_2(31 downto 18);

    -- i_mul49_conv2d1x1_im10_cma(CHAINMULTADD,310)@3 + 2
    i_mul49_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul49_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul49_conv2d1x1_im10_cma_ena1 <= i_mul49_conv2d1x1_im10_cma_ena0;
    i_mul49_conv2d1x1_im10_cma_p(0) <= i_mul49_conv2d1x1_im10_cma_a0(0) * i_mul49_conv2d1x1_im10_cma_c0(0);
    i_mul49_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul49_conv2d1x1_im10_cma_p(0),28);
    i_mul49_conv2d1x1_im10_cma_w(0) <= i_mul49_conv2d1x1_im10_cma_u(0);
    i_mul49_conv2d1x1_im10_cma_x(0) <= i_mul49_conv2d1x1_im10_cma_w(0);
    i_mul49_conv2d1x1_im10_cma_y(0) <= i_mul49_conv2d1x1_im10_cma_x(0);
    i_mul49_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul49_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul49_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul49_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul49_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs11_b),14);
                i_mul49_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul49_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul49_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul49_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul49_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul49_conv2d1x1_im10_cma_s(0) <= i_mul49_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul49_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul49_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul49_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul49_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul49_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist4_i_mul49_conv2d1x1_im10_cma_q_1(DELAY,326)
    redist4_i_mul49_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul49_conv2d1x1_im10_cma_q, xout => redist4_i_mul49_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul17_conv2d1x1_bs1(BITSELECT,220)@3
    i_mul17_conv2d1x1_bs1_in <= in_c0_eni3_2(17 downto 0);
    i_mul17_conv2d1x1_bs1_b <= i_mul17_conv2d1x1_bs1_in(17 downto 0);

    -- i_mul49_conv2d1x1_im0_cma(CHAINMULTADD,309)@3 + 2
    i_mul49_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul49_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul49_conv2d1x1_im0_cma_ena1 <= i_mul49_conv2d1x1_im0_cma_ena0;
    i_mul49_conv2d1x1_im0_cma_p(0) <= i_mul49_conv2d1x1_im0_cma_a0(0) * i_mul49_conv2d1x1_im0_cma_c0(0);
    i_mul49_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul49_conv2d1x1_im0_cma_p(0),36);
    i_mul49_conv2d1x1_im0_cma_w(0) <= i_mul49_conv2d1x1_im0_cma_u(0);
    i_mul49_conv2d1x1_im0_cma_x(0) <= i_mul49_conv2d1x1_im0_cma_w(0);
    i_mul49_conv2d1x1_im0_cma_y(0) <= i_mul49_conv2d1x1_im0_cma_x(0);
    i_mul49_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul49_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul49_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul49_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul49_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs1_b),18);
                i_mul49_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul49_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul49_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul49_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul49_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul49_conv2d1x1_im0_cma_s(0) <= i_mul49_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul49_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul49_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul49_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul49_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul49_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist5_i_mul49_conv2d1x1_im0_cma_q_1(DELAY,327)
    redist5_i_mul49_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul49_conv2d1x1_im0_cma_q, xout => redist5_i_mul49_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul49_conv2d1x1_join_13(BITJOIN,283)@6
    i_mul49_conv2d1x1_join_13_q <= redist4_i_mul49_conv2d1x1_im10_cma_q_1_q & redist5_i_mul49_conv2d1x1_im0_cma_q_1_q;

    -- i_mul49_conv2d1x1_result_add_0_0(ADD,286)@6
    i_mul49_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul49_conv2d1x1_join_13_q));
    i_mul49_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul49_conv2d1x1_align_14_q(51)) & i_mul49_conv2d1x1_align_14_q));
    i_mul49_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul49_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul49_conv2d1x1_result_add_0_0_b));
    i_mul49_conv2d1x1_result_add_0_0_q <= i_mul49_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul49_conv2d1x1_rnd_sel(BITSELECT,208)@6
    bgTrunc_i_mul49_conv2d1x1_rnd_sel_in <= i_mul49_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul49_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul49_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul49_conv2d1x1_sel_x(BITSELECT,9)@6
    bgTrunc_i_mul49_conv2d1x1_sel_x_b <= bgTrunc_i_mul49_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist20_bgTrunc_i_mul49_conv2d1x1_sel_x_b_1(DELAY,342)
    redist20_bgTrunc_i_mul49_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul49_conv2d1x1_sel_x_b, xout => redist20_bgTrunc_i_mul49_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add50_conv2d1x1(ADD,93)@7
    i_add50_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist20_bgTrunc_i_mul49_conv2d1x1_sel_x_b_1_q);
    i_add50_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg_q);
    i_add50_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add50_conv2d1x1_a) + UNSIGNED(i_add50_conv2d1x1_b));
    i_add50_conv2d1x1_q <= i_add50_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add50_conv2d1x1_sel_x(BITSELECT,5)@7
    bgTrunc_i_add50_conv2d1x1_sel_x_b <= i_add50_conv2d1x1_q(31 downto 0);

    -- redist22_bgTrunc_i_add50_conv2d1x1_sel_x_b_1(DELAY,344)
    redist22_bgTrunc_i_add50_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add50_conv2d1x1_sel_x_b, xout => redist22_bgTrunc_i_add50_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom51_conv2d1x1_sel_x(BITSELECT,59)@8
    i_idxprom51_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist22_bgTrunc_i_add50_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select(BITSELECT,318)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_b <= i_idxprom51_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_c <= i_idxprom51_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_d <= i_idxprom51_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_e <= i_idxprom51_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0(BITSHIFT,300)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0_qint <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15(BITSHIFT,189)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0(BITSHIFT,301)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0_qint <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14(BITSHIFT,188)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_16(BITJOIN,190)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_16_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_15_q & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_14_q;

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0(BITSHIFT,302)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0_qint <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12(BITSHIFT,186)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0(BITSHIFT,299)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0_qint <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_13(BITJOIN,187)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_13_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_im0_shift0_q);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0(ADD,191)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_13_q);
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_join_16_q);
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_b));
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_q <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_mult_extender_x(BITJOIN,49)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_mult_extender_x_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x_q & i_arrayidx52_conv2d1x1_conv2d1x142_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x(BITSELECT,51)@8
    i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b <= i_arrayidx52_conv2d1x1_conv2d1x142_mult_extender_x_q(63 downto 0);

    -- redist16_i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b_1(DELAY,338)
    redist16_i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b, xout => redist16_i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer_conv2d1x1(BLACKBOX,118)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_input_im_sync_buffer_conv2d1x1 : i_syncbuf_input_im_sync_buffer_conv2d1x140
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist15_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx52_conv2d1x1_conv2d1x142_add_x(ADD,52)@9
    i_arrayidx52_conv2d1x1_conv2d1x142_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer_conv2d1x1_out_buffer_out);
    i_arrayidx52_conv2d1x1_conv2d1x142_add_x_b <= STD_LOGIC_VECTOR("0" & redist16_i_arrayidx52_conv2d1x1_conv2d1x142_trunc_sel_x_b_1_q);
    i_arrayidx52_conv2d1x1_conv2d1x142_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx52_conv2d1x1_conv2d1x142_add_x_a) + UNSIGNED(i_arrayidx52_conv2d1x1_conv2d1x142_add_x_b));
    i_arrayidx52_conv2d1x1_conv2d1x142_add_x_q <= i_arrayidx52_conv2d1x1_conv2d1x142_add_x_o(64 downto 0);

    -- i_arrayidx52_conv2d1x1_conv2d1x142_dupName_0_trunc_sel_x(BITSELECT,46)@9
    i_arrayidx52_conv2d1x1_conv2d1x142_dupName_0_trunc_sel_x_b <= i_arrayidx52_conv2d1x1_conv2d1x142_add_x_q(63 downto 0);

    -- i_add364_conv2d1x1_join(BITJOIN,212)@3
    i_add364_conv2d1x1_join_q <= i_add253_conv2d1x1_BitSelect_for_a_b & VCC_q & GND_q;

    -- i_add364_conv2d1x1_vt_select_31(BITSELECT,87)@3
    i_add364_conv2d1x1_vt_select_31_b <= i_add364_conv2d1x1_join_q(31 downto 2);

    -- i_add364_conv2d1x1_vt_const_1(CONSTANT,85)
    i_add364_conv2d1x1_vt_const_1_q <= "10";

    -- i_add364_conv2d1x1_vt_join(BITJOIN,86)@3
    i_add364_conv2d1x1_vt_join_q <= i_add364_conv2d1x1_vt_select_31_b & i_add364_conv2d1x1_vt_const_1_q;

    -- i_mul38_conv2d1x1_bs2_merged_bit_select(BITSELECT,320)@3
    i_mul38_conv2d1x1_bs2_merged_bit_select_b <= i_add364_conv2d1x1_vt_join_q(17 downto 0);
    i_mul38_conv2d1x1_bs2_merged_bit_select_c <= i_add364_conv2d1x1_vt_join_q(31 downto 18);

    -- i_mul38_conv2d1x1_bjB9(BITJOIN,262)@3
    i_mul38_conv2d1x1_bjB9_q <= GND_q & i_mul38_conv2d1x1_bs2_merged_bit_select_b;

    -- i_mul38_conv2d1x1_ma3_cma(CHAINMULTADD,313)@3 + 2
    i_mul38_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul38_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul38_conv2d1x1_ma3_cma_ena1 <= i_mul38_conv2d1x1_ma3_cma_ena0;
    i_mul38_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul38_conv2d1x1_ma3_cma_a0(0),15));
    i_mul38_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul38_conv2d1x1_ma3_cma_a0(1),15));
    i_mul38_conv2d1x1_ma3_cma_p(0) <= i_mul38_conv2d1x1_ma3_cma_l(0) * i_mul38_conv2d1x1_ma3_cma_c0(0);
    i_mul38_conv2d1x1_ma3_cma_p(1) <= i_mul38_conv2d1x1_ma3_cma_l(1) * i_mul38_conv2d1x1_ma3_cma_c0(1);
    i_mul38_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul38_conv2d1x1_ma3_cma_p(0),35);
    i_mul38_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul38_conv2d1x1_ma3_cma_p(1),35);
    i_mul38_conv2d1x1_ma3_cma_w(0) <= i_mul38_conv2d1x1_ma3_cma_u(0) + i_mul38_conv2d1x1_ma3_cma_u(1);
    i_mul38_conv2d1x1_ma3_cma_x(0) <= i_mul38_conv2d1x1_ma3_cma_w(0);
    i_mul38_conv2d1x1_ma3_cma_y(0) <= i_mul38_conv2d1x1_ma3_cma_x(0);
    i_mul38_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul38_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul38_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul38_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul38_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs7_b),14);
                i_mul38_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul38_conv2d1x1_bs2_merged_bit_select_c),14);
                i_mul38_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul38_conv2d1x1_bjB9_q),19);
                i_mul38_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul17_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul38_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul38_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul38_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul38_conv2d1x1_ma3_cma_s(0) <= i_mul38_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul38_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul38_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul38_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul38_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul38_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist1_i_mul38_conv2d1x1_ma3_cma_q_1(DELAY,323)
    redist1_i_mul38_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul38_conv2d1x1_ma3_cma_q, xout => redist1_i_mul38_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul38_conv2d1x1_align_14(BITSHIFT,267)@6
    i_mul38_conv2d1x1_align_14_qint <= redist1_i_mul38_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul38_conv2d1x1_align_14_q <= i_mul38_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul38_conv2d1x1_im10_cma(CHAINMULTADD,308)@3 + 2
    i_mul38_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul38_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul38_conv2d1x1_im10_cma_ena1 <= i_mul38_conv2d1x1_im10_cma_ena0;
    i_mul38_conv2d1x1_im10_cma_p(0) <= i_mul38_conv2d1x1_im10_cma_a0(0) * i_mul38_conv2d1x1_im10_cma_c0(0);
    i_mul38_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul38_conv2d1x1_im10_cma_p(0),28);
    i_mul38_conv2d1x1_im10_cma_w(0) <= i_mul38_conv2d1x1_im10_cma_u(0);
    i_mul38_conv2d1x1_im10_cma_x(0) <= i_mul38_conv2d1x1_im10_cma_w(0);
    i_mul38_conv2d1x1_im10_cma_y(0) <= i_mul38_conv2d1x1_im10_cma_x(0);
    i_mul38_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul38_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul38_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul38_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul38_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs11_b),14);
                i_mul38_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul38_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul38_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul38_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul38_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul38_conv2d1x1_im10_cma_s(0) <= i_mul38_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul38_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul38_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul38_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul38_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul38_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist6_i_mul38_conv2d1x1_im10_cma_q_1(DELAY,328)
    redist6_i_mul38_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul38_conv2d1x1_im10_cma_q, xout => redist6_i_mul38_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul38_conv2d1x1_im0_cma(CHAINMULTADD,307)@3 + 2
    i_mul38_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul38_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul38_conv2d1x1_im0_cma_ena1 <= i_mul38_conv2d1x1_im0_cma_ena0;
    i_mul38_conv2d1x1_im0_cma_p(0) <= i_mul38_conv2d1x1_im0_cma_a0(0) * i_mul38_conv2d1x1_im0_cma_c0(0);
    i_mul38_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul38_conv2d1x1_im0_cma_p(0),36);
    i_mul38_conv2d1x1_im0_cma_w(0) <= i_mul38_conv2d1x1_im0_cma_u(0);
    i_mul38_conv2d1x1_im0_cma_x(0) <= i_mul38_conv2d1x1_im0_cma_w(0);
    i_mul38_conv2d1x1_im0_cma_y(0) <= i_mul38_conv2d1x1_im0_cma_x(0);
    i_mul38_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul38_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul38_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul38_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul38_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs1_b),18);
                i_mul38_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul38_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul38_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul38_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul38_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul38_conv2d1x1_im0_cma_s(0) <= i_mul38_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul38_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul38_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul38_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul38_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul38_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist7_i_mul38_conv2d1x1_im0_cma_q_1(DELAY,329)
    redist7_i_mul38_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul38_conv2d1x1_im0_cma_q, xout => redist7_i_mul38_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul38_conv2d1x1_join_13(BITJOIN,266)@6
    i_mul38_conv2d1x1_join_13_q <= redist6_i_mul38_conv2d1x1_im10_cma_q_1_q & redist7_i_mul38_conv2d1x1_im0_cma_q_1_q;

    -- i_mul38_conv2d1x1_result_add_0_0(ADD,269)@6
    i_mul38_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul38_conv2d1x1_join_13_q));
    i_mul38_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul38_conv2d1x1_align_14_q(51)) & i_mul38_conv2d1x1_align_14_q));
    i_mul38_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul38_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul38_conv2d1x1_result_add_0_0_b));
    i_mul38_conv2d1x1_result_add_0_0_q <= i_mul38_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul38_conv2d1x1_rnd_sel(BITSELECT,207)@6
    bgTrunc_i_mul38_conv2d1x1_rnd_sel_in <= i_mul38_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul38_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul38_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul38_conv2d1x1_sel_x(BITSELECT,8)@6
    bgTrunc_i_mul38_conv2d1x1_sel_x_b <= bgTrunc_i_mul38_conv2d1x1_rnd_sel_b(31 downto 0);

    -- i_mul38_conv2d1x1_vt_select_31(BITSELECT,110)@6
    i_mul38_conv2d1x1_vt_select_31_b <= bgTrunc_i_mul38_conv2d1x1_sel_x_b(31 downto 1);

    -- redist12_i_mul38_conv2d1x1_vt_select_31_b_1(DELAY,334)
    redist12_i_mul38_conv2d1x1_vt_select_31_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul38_conv2d1x1_vt_select_31_b, xout => redist12_i_mul38_conv2d1x1_vt_select_31_b_1_q, clk => clock, aclr => resetn );

    -- i_mul38_conv2d1x1_vt_join(BITJOIN,109)@7
    i_mul38_conv2d1x1_vt_join_q <= redist12_i_mul38_conv2d1x1_vt_select_31_b_1_q & GND_q;

    -- i_add39_conv2d1x1(ADD,88)@7
    i_add39_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & i_mul38_conv2d1x1_vt_join_q);
    i_add39_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg_q);
    i_add39_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add39_conv2d1x1_a) + UNSIGNED(i_add39_conv2d1x1_b));
    i_add39_conv2d1x1_q <= i_add39_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add39_conv2d1x1_sel_x(BITSELECT,4)@7
    bgTrunc_i_add39_conv2d1x1_sel_x_b <= i_add39_conv2d1x1_q(31 downto 0);

    -- redist23_bgTrunc_i_add39_conv2d1x1_sel_x_b_1(DELAY,345)
    redist23_bgTrunc_i_add39_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add39_conv2d1x1_sel_x_b, xout => redist23_bgTrunc_i_add39_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom40_conv2d1x1_sel_x(BITSELECT,58)@8
    i_idxprom40_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist23_bgTrunc_i_add39_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select(BITSELECT,317)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_b <= i_idxprom40_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_c <= i_idxprom40_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_d <= i_idxprom40_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_e <= i_idxprom40_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0(BITSHIFT,296)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0_qint <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15(BITSHIFT,171)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0(BITSHIFT,297)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0_qint <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14(BITSHIFT,170)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_16(BITJOIN,172)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_16_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_15_q & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_14_q;

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0(BITSHIFT,298)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0_qint <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12(BITSHIFT,168)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0(BITSHIFT,295)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0_qint <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_13(BITJOIN,169)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_13_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_im0_shift0_q);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0(ADD,173)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_13_q);
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_join_16_q);
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_b));
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_q <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_mult_extender_x(BITJOIN,39)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_mult_extender_x_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x_q & i_arrayidx41_conv2d1x1_conv2d1x139_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x(BITSELECT,41)@8
    i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b <= i_arrayidx41_conv2d1x1_conv2d1x139_mult_extender_x_q(63 downto 0);

    -- redist17_i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b_1(DELAY,339)
    redist17_i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b, xout => redist17_i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer7_conv2d1x1(BLACKBOX,115)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_input_im_sync_buffer7_conv2d1x1 : i_syncbuf_input_im_sync_buffer7_conv2d1x137
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist15_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer7_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx41_conv2d1x1_conv2d1x139_add_x(ADD,42)@9
    i_arrayidx41_conv2d1x1_conv2d1x139_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer7_conv2d1x1_out_buffer_out);
    i_arrayidx41_conv2d1x1_conv2d1x139_add_x_b <= STD_LOGIC_VECTOR("0" & redist17_i_arrayidx41_conv2d1x1_conv2d1x139_trunc_sel_x_b_1_q);
    i_arrayidx41_conv2d1x1_conv2d1x139_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx41_conv2d1x1_conv2d1x139_add_x_a) + UNSIGNED(i_arrayidx41_conv2d1x1_conv2d1x139_add_x_b));
    i_arrayidx41_conv2d1x1_conv2d1x139_add_x_q <= i_arrayidx41_conv2d1x1_conv2d1x139_add_x_o(64 downto 0);

    -- i_arrayidx41_conv2d1x1_conv2d1x139_dupName_0_trunc_sel_x(BITSELECT,36)@9
    i_arrayidx41_conv2d1x1_conv2d1x139_dupName_0_trunc_sel_x_b <= i_arrayidx41_conv2d1x1_conv2d1x139_add_x_q(63 downto 0);

    -- i_add253_conv2d1x1_join(BITJOIN,210)@3
    i_add253_conv2d1x1_join_q <= i_add253_conv2d1x1_BitSelect_for_a_b & GND_q & VCC_q;

    -- i_add253_conv2d1x1_vt_select_31(BITSELECT,82)@3
    i_add253_conv2d1x1_vt_select_31_b <= i_add253_conv2d1x1_join_q(31 downto 2);

    -- i_add253_conv2d1x1_vt_const_1(CONSTANT,80)
    i_add253_conv2d1x1_vt_const_1_q <= "01";

    -- i_add253_conv2d1x1_vt_join(BITJOIN,81)@3
    i_add253_conv2d1x1_vt_join_q <= i_add253_conv2d1x1_vt_select_31_b & i_add253_conv2d1x1_vt_const_1_q;

    -- i_mul27_conv2d1x1_bs2_merged_bit_select(BITSELECT,319)@3
    i_mul27_conv2d1x1_bs2_merged_bit_select_b <= i_add253_conv2d1x1_vt_join_q(17 downto 0);
    i_mul27_conv2d1x1_bs2_merged_bit_select_c <= i_add253_conv2d1x1_vt_join_q(31 downto 18);

    -- i_mul27_conv2d1x1_bjB9(BITJOIN,245)@3
    i_mul27_conv2d1x1_bjB9_q <= GND_q & i_mul27_conv2d1x1_bs2_merged_bit_select_b;

    -- i_mul27_conv2d1x1_ma3_cma(CHAINMULTADD,312)@3 + 2
    i_mul27_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul27_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul27_conv2d1x1_ma3_cma_ena1 <= i_mul27_conv2d1x1_ma3_cma_ena0;
    i_mul27_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul27_conv2d1x1_ma3_cma_a0(0),15));
    i_mul27_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul27_conv2d1x1_ma3_cma_a0(1),15));
    i_mul27_conv2d1x1_ma3_cma_p(0) <= i_mul27_conv2d1x1_ma3_cma_l(0) * i_mul27_conv2d1x1_ma3_cma_c0(0);
    i_mul27_conv2d1x1_ma3_cma_p(1) <= i_mul27_conv2d1x1_ma3_cma_l(1) * i_mul27_conv2d1x1_ma3_cma_c0(1);
    i_mul27_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul27_conv2d1x1_ma3_cma_p(0),35);
    i_mul27_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul27_conv2d1x1_ma3_cma_p(1),35);
    i_mul27_conv2d1x1_ma3_cma_w(0) <= i_mul27_conv2d1x1_ma3_cma_u(0) + i_mul27_conv2d1x1_ma3_cma_u(1);
    i_mul27_conv2d1x1_ma3_cma_x(0) <= i_mul27_conv2d1x1_ma3_cma_w(0);
    i_mul27_conv2d1x1_ma3_cma_y(0) <= i_mul27_conv2d1x1_ma3_cma_x(0);
    i_mul27_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul27_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul27_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul27_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs7_b),14);
                i_mul27_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul27_conv2d1x1_bs2_merged_bit_select_c),14);
                i_mul27_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul27_conv2d1x1_bjB9_q),19);
                i_mul27_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul17_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul27_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul27_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul27_conv2d1x1_ma3_cma_s(0) <= i_mul27_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul27_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul27_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul27_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul27_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul27_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist2_i_mul27_conv2d1x1_ma3_cma_q_1(DELAY,324)
    redist2_i_mul27_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul27_conv2d1x1_ma3_cma_q, xout => redist2_i_mul27_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul27_conv2d1x1_align_14(BITSHIFT,250)@6
    i_mul27_conv2d1x1_align_14_qint <= redist2_i_mul27_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul27_conv2d1x1_align_14_q <= i_mul27_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul27_conv2d1x1_im10_cma(CHAINMULTADD,306)@3 + 2
    i_mul27_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul27_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul27_conv2d1x1_im10_cma_ena1 <= i_mul27_conv2d1x1_im10_cma_ena0;
    i_mul27_conv2d1x1_im10_cma_p(0) <= i_mul27_conv2d1x1_im10_cma_a0(0) * i_mul27_conv2d1x1_im10_cma_c0(0);
    i_mul27_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul27_conv2d1x1_im10_cma_p(0),28);
    i_mul27_conv2d1x1_im10_cma_w(0) <= i_mul27_conv2d1x1_im10_cma_u(0);
    i_mul27_conv2d1x1_im10_cma_x(0) <= i_mul27_conv2d1x1_im10_cma_w(0);
    i_mul27_conv2d1x1_im10_cma_y(0) <= i_mul27_conv2d1x1_im10_cma_x(0);
    i_mul27_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul27_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul27_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul27_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs11_b),14);
                i_mul27_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul27_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul27_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul27_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul27_conv2d1x1_im10_cma_s(0) <= i_mul27_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul27_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul27_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul27_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul27_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul27_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist8_i_mul27_conv2d1x1_im10_cma_q_1(DELAY,330)
    redist8_i_mul27_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul27_conv2d1x1_im10_cma_q, xout => redist8_i_mul27_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul27_conv2d1x1_im0_cma(CHAINMULTADD,305)@3 + 2
    i_mul27_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul27_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul27_conv2d1x1_im0_cma_ena1 <= i_mul27_conv2d1x1_im0_cma_ena0;
    i_mul27_conv2d1x1_im0_cma_p(0) <= i_mul27_conv2d1x1_im0_cma_a0(0) * i_mul27_conv2d1x1_im0_cma_c0(0);
    i_mul27_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul27_conv2d1x1_im0_cma_p(0),36);
    i_mul27_conv2d1x1_im0_cma_w(0) <= i_mul27_conv2d1x1_im0_cma_u(0);
    i_mul27_conv2d1x1_im0_cma_x(0) <= i_mul27_conv2d1x1_im0_cma_w(0);
    i_mul27_conv2d1x1_im0_cma_y(0) <= i_mul27_conv2d1x1_im0_cma_x(0);
    i_mul27_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul27_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul27_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul27_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs1_b),18);
                i_mul27_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul27_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul27_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul27_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul27_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul27_conv2d1x1_im0_cma_s(0) <= i_mul27_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul27_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul27_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul27_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul27_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul27_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist9_i_mul27_conv2d1x1_im0_cma_q_1(DELAY,331)
    redist9_i_mul27_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul27_conv2d1x1_im0_cma_q, xout => redist9_i_mul27_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul27_conv2d1x1_join_13(BITJOIN,249)@6
    i_mul27_conv2d1x1_join_13_q <= redist8_i_mul27_conv2d1x1_im10_cma_q_1_q & redist9_i_mul27_conv2d1x1_im0_cma_q_1_q;

    -- i_mul27_conv2d1x1_result_add_0_0(ADD,252)@6
    i_mul27_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul27_conv2d1x1_join_13_q));
    i_mul27_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul27_conv2d1x1_align_14_q(51)) & i_mul27_conv2d1x1_align_14_q));
    i_mul27_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul27_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul27_conv2d1x1_result_add_0_0_b));
    i_mul27_conv2d1x1_result_add_0_0_q <= i_mul27_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul27_conv2d1x1_rnd_sel(BITSELECT,206)@6
    bgTrunc_i_mul27_conv2d1x1_rnd_sel_in <= i_mul27_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul27_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul27_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul27_conv2d1x1_sel_x(BITSELECT,7)@6
    bgTrunc_i_mul27_conv2d1x1_sel_x_b <= bgTrunc_i_mul27_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist21_bgTrunc_i_mul27_conv2d1x1_sel_x_b_1(DELAY,343)
    redist21_bgTrunc_i_mul27_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul27_conv2d1x1_sel_x_b, xout => redist21_bgTrunc_i_mul27_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add28_conv2d1x1(ADD,83)@7
    i_add28_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist21_bgTrunc_i_mul27_conv2d1x1_sel_x_b_1_q);
    i_add28_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg_q);
    i_add28_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add28_conv2d1x1_a) + UNSIGNED(i_add28_conv2d1x1_b));
    i_add28_conv2d1x1_q <= i_add28_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add28_conv2d1x1_sel_x(BITSELECT,3)@7
    bgTrunc_i_add28_conv2d1x1_sel_x_b <= i_add28_conv2d1x1_q(31 downto 0);

    -- redist24_bgTrunc_i_add28_conv2d1x1_sel_x_b_1(DELAY,346)
    redist24_bgTrunc_i_add28_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add28_conv2d1x1_sel_x_b, xout => redist24_bgTrunc_i_add28_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom29_conv2d1x1_sel_x(BITSELECT,57)@8
    i_idxprom29_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist24_bgTrunc_i_add28_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select(BITSELECT,316)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_b <= i_idxprom29_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_c <= i_idxprom29_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_d <= i_idxprom29_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_e <= i_idxprom29_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0(BITSHIFT,292)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0_qint <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15(BITSHIFT,153)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0(BITSHIFT,293)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0_qint <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14(BITSHIFT,152)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_16(BITJOIN,154)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_16_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_15_q & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_14_q;

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0(BITSHIFT,294)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0_qint <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12(BITSHIFT,150)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0(BITSHIFT,291)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0_qint <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_13(BITJOIN,151)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_13_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_im0_shift0_q);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0(ADD,155)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_13_q);
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_join_16_q);
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_b));
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_q <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_mult_extender_x(BITJOIN,29)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_mult_extender_x_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x_q & i_arrayidx30_conv2d1x1_conv2d1x136_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x(BITSELECT,31)@8
    i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b <= i_arrayidx30_conv2d1x1_conv2d1x136_mult_extender_x_q(63 downto 0);

    -- redist18_i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b_1(DELAY,340)
    redist18_i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b, xout => redist18_i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer8_conv2d1x1(BLACKBOX,116)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_input_im_sync_buffer8_conv2d1x1 : i_syncbuf_input_im_sync_buffer8_conv2d1x134
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist15_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer8_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx30_conv2d1x1_conv2d1x136_add_x(ADD,32)@9
    i_arrayidx30_conv2d1x1_conv2d1x136_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer8_conv2d1x1_out_buffer_out);
    i_arrayidx30_conv2d1x1_conv2d1x136_add_x_b <= STD_LOGIC_VECTOR("0" & redist18_i_arrayidx30_conv2d1x1_conv2d1x136_trunc_sel_x_b_1_q);
    i_arrayidx30_conv2d1x1_conv2d1x136_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx30_conv2d1x1_conv2d1x136_add_x_a) + UNSIGNED(i_arrayidx30_conv2d1x1_conv2d1x136_add_x_b));
    i_arrayidx30_conv2d1x1_conv2d1x136_add_x_q <= i_arrayidx30_conv2d1x1_conv2d1x136_add_x_o(64 downto 0);

    -- i_arrayidx30_conv2d1x1_conv2d1x136_dupName_0_trunc_sel_x(BITSELECT,26)@9
    i_arrayidx30_conv2d1x1_conv2d1x136_dupName_0_trunc_sel_x_b <= i_arrayidx30_conv2d1x1_conv2d1x136_add_x_q(63 downto 0);

    -- i_mul17_conv2d1x1_bs6(BITSELECT,225)@3
    i_mul17_conv2d1x1_bs6_b <= i_shl_conv2d1x1_vt_join_q(31 downto 18);

    -- i_mul17_conv2d1x1_bs2(BITSELECT,221)@3
    i_mul17_conv2d1x1_bs2_in <= i_shl_conv2d1x1_vt_join_q(17 downto 0);
    i_mul17_conv2d1x1_bs2_b <= i_mul17_conv2d1x1_bs2_in(17 downto 0);

    -- i_mul17_conv2d1x1_bjB9(BITJOIN,228)@3
    i_mul17_conv2d1x1_bjB9_q <= GND_q & i_mul17_conv2d1x1_bs2_b;

    -- i_mul17_conv2d1x1_ma3_cma(CHAINMULTADD,311)@3 + 2
    i_mul17_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul17_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul17_conv2d1x1_ma3_cma_ena1 <= i_mul17_conv2d1x1_ma3_cma_ena0;
    i_mul17_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul17_conv2d1x1_ma3_cma_a0(0),15));
    i_mul17_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul17_conv2d1x1_ma3_cma_a0(1),15));
    i_mul17_conv2d1x1_ma3_cma_p(0) <= i_mul17_conv2d1x1_ma3_cma_l(0) * i_mul17_conv2d1x1_ma3_cma_c0(0);
    i_mul17_conv2d1x1_ma3_cma_p(1) <= i_mul17_conv2d1x1_ma3_cma_l(1) * i_mul17_conv2d1x1_ma3_cma_c0(1);
    i_mul17_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul17_conv2d1x1_ma3_cma_p(0),35);
    i_mul17_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul17_conv2d1x1_ma3_cma_p(1),35);
    i_mul17_conv2d1x1_ma3_cma_w(0) <= i_mul17_conv2d1x1_ma3_cma_u(0) + i_mul17_conv2d1x1_ma3_cma_u(1);
    i_mul17_conv2d1x1_ma3_cma_x(0) <= i_mul17_conv2d1x1_ma3_cma_w(0);
    i_mul17_conv2d1x1_ma3_cma_y(0) <= i_mul17_conv2d1x1_ma3_cma_x(0);
    i_mul17_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul17_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul17_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul17_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul17_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs7_b),14);
                i_mul17_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs6_b),14);
                i_mul17_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul17_conv2d1x1_bjB9_q),19);
                i_mul17_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul17_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul17_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul17_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul17_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul17_conv2d1x1_ma3_cma_s(0) <= i_mul17_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul17_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul17_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul17_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul17_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul17_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist3_i_mul17_conv2d1x1_ma3_cma_q_1(DELAY,325)
    redist3_i_mul17_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul17_conv2d1x1_ma3_cma_q, xout => redist3_i_mul17_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul17_conv2d1x1_align_14(BITSHIFT,233)@6
    i_mul17_conv2d1x1_align_14_qint <= redist3_i_mul17_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul17_conv2d1x1_align_14_q <= i_mul17_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul17_conv2d1x1_im10_cma(CHAINMULTADD,304)@3 + 2
    i_mul17_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul17_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul17_conv2d1x1_im10_cma_ena1 <= i_mul17_conv2d1x1_im10_cma_ena0;
    i_mul17_conv2d1x1_im10_cma_p(0) <= i_mul17_conv2d1x1_im10_cma_a0(0) * i_mul17_conv2d1x1_im10_cma_c0(0);
    i_mul17_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul17_conv2d1x1_im10_cma_p(0),28);
    i_mul17_conv2d1x1_im10_cma_w(0) <= i_mul17_conv2d1x1_im10_cma_u(0);
    i_mul17_conv2d1x1_im10_cma_x(0) <= i_mul17_conv2d1x1_im10_cma_w(0);
    i_mul17_conv2d1x1_im10_cma_y(0) <= i_mul17_conv2d1x1_im10_cma_x(0);
    i_mul17_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul17_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul17_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul17_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul17_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs11_b),14);
                i_mul17_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs6_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul17_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul17_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul17_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul17_conv2d1x1_im10_cma_s(0) <= i_mul17_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul17_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul17_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul17_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul17_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul17_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist10_i_mul17_conv2d1x1_im10_cma_q_1(DELAY,332)
    redist10_i_mul17_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul17_conv2d1x1_im10_cma_q, xout => redist10_i_mul17_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul17_conv2d1x1_im0_cma(CHAINMULTADD,303)@3 + 2
    i_mul17_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul17_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul17_conv2d1x1_im0_cma_ena1 <= i_mul17_conv2d1x1_im0_cma_ena0;
    i_mul17_conv2d1x1_im0_cma_p(0) <= i_mul17_conv2d1x1_im0_cma_a0(0) * i_mul17_conv2d1x1_im0_cma_c0(0);
    i_mul17_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul17_conv2d1x1_im0_cma_p(0),36);
    i_mul17_conv2d1x1_im0_cma_w(0) <= i_mul17_conv2d1x1_im0_cma_u(0);
    i_mul17_conv2d1x1_im0_cma_x(0) <= i_mul17_conv2d1x1_im0_cma_w(0);
    i_mul17_conv2d1x1_im0_cma_y(0) <= i_mul17_conv2d1x1_im0_cma_x(0);
    i_mul17_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul17_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul17_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul17_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul17_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs1_b),18);
                i_mul17_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul17_conv2d1x1_bs2_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul17_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul17_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul17_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul17_conv2d1x1_im0_cma_s(0) <= i_mul17_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul17_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul17_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul17_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul17_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul17_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist11_i_mul17_conv2d1x1_im0_cma_q_1(DELAY,333)
    redist11_i_mul17_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul17_conv2d1x1_im0_cma_q, xout => redist11_i_mul17_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul17_conv2d1x1_join_13(BITJOIN,232)@6
    i_mul17_conv2d1x1_join_13_q <= redist10_i_mul17_conv2d1x1_im10_cma_q_1_q & redist11_i_mul17_conv2d1x1_im0_cma_q_1_q;

    -- i_mul17_conv2d1x1_result_add_0_0(ADD,235)@6
    i_mul17_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul17_conv2d1x1_join_13_q));
    i_mul17_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul17_conv2d1x1_align_14_q(51)) & i_mul17_conv2d1x1_align_14_q));
    i_mul17_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul17_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul17_conv2d1x1_result_add_0_0_b));
    i_mul17_conv2d1x1_result_add_0_0_q <= i_mul17_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul17_conv2d1x1_rnd_sel(BITSELECT,205)@6
    bgTrunc_i_mul17_conv2d1x1_rnd_sel_in <= i_mul17_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul17_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul17_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul17_conv2d1x1_sel_x(BITSELECT,6)@6
    bgTrunc_i_mul17_conv2d1x1_sel_x_b <= bgTrunc_i_mul17_conv2d1x1_rnd_sel_b(31 downto 0);

    -- i_mul17_conv2d1x1_vt_select_31(BITSELECT,105)@6
    i_mul17_conv2d1x1_vt_select_31_b <= bgTrunc_i_mul17_conv2d1x1_sel_x_b(31 downto 2);

    -- redist13_i_mul17_conv2d1x1_vt_select_31_b_1(DELAY,335)
    redist13_i_mul17_conv2d1x1_vt_select_31_b_1 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul17_conv2d1x1_vt_select_31_b, xout => redist13_i_mul17_conv2d1x1_vt_select_31_b_1_q, clk => clock, aclr => resetn );

    -- i_mul17_conv2d1x1_vt_join(BITJOIN,104)@7
    i_mul17_conv2d1x1_vt_join_q <= redist13_i_mul17_conv2d1x1_vt_select_31_b_1_q & i_mul17_conv2d1x1_vt_const_1_q;

    -- i_add18_conv2d1x1(ADD,78)@7
    i_add18_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & i_mul17_conv2d1x1_vt_join_q);
    i_add18_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni3_3_4_outputreg_q);
    i_add18_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add18_conv2d1x1_a) + UNSIGNED(i_add18_conv2d1x1_b));
    i_add18_conv2d1x1_q <= i_add18_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add18_conv2d1x1_sel_x(BITSELECT,2)@7
    bgTrunc_i_add18_conv2d1x1_sel_x_b <= i_add18_conv2d1x1_q(31 downto 0);

    -- redist25_bgTrunc_i_add18_conv2d1x1_sel_x_b_1(DELAY,347)
    redist25_bgTrunc_i_add18_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add18_conv2d1x1_sel_x_b, xout => redist25_bgTrunc_i_add18_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom19_conv2d1x1_sel_x(BITSELECT,56)@8
    i_idxprom19_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist25_bgTrunc_i_add18_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select(BITSELECT,315)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_b <= i_idxprom19_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_c <= i_idxprom19_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_d <= i_idxprom19_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_e <= i_idxprom19_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0(BITSHIFT,288)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15(BITSHIFT,135)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0(BITSHIFT,289)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14(BITSHIFT,134)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_16(BITJOIN,136)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_16_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_15_q & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_14_q;

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0(BITSHIFT,290)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12(BITSHIFT,132)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0(BITSHIFT,287)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_13(BITJOIN,133)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_13_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_im0_shift0_q);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0(ADD,137)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_13_q);
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_join_16_q);
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_b));
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_mult_extender_x(BITJOIN,19)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_mult_extender_x_q <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_multconst_x_q & i_arrayidx20_conv2d1x1_conv2d1x133_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x(BITSELECT,21)@8
    i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b <= i_arrayidx20_conv2d1x1_conv2d1x133_mult_extender_x_q(63 downto 0);

    -- redist19_i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b_1(DELAY,341)
    redist19_i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b, xout => redist19_i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer9_conv2d1x1(BLACKBOX,117)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_input_im_sync_buffer9_conv2d1x1 : i_syncbuf_input_im_sync_buffer9_conv2d1x131
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist15_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer9_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx20_conv2d1x1_conv2d1x133_add_x(ADD,22)@9
    i_arrayidx20_conv2d1x1_conv2d1x133_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer9_conv2d1x1_out_buffer_out);
    i_arrayidx20_conv2d1x1_conv2d1x133_add_x_b <= STD_LOGIC_VECTOR("0" & redist19_i_arrayidx20_conv2d1x1_conv2d1x133_trunc_sel_x_b_1_q);
    i_arrayidx20_conv2d1x1_conv2d1x133_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x133_add_x_a) + UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x133_add_x_b));
    i_arrayidx20_conv2d1x1_conv2d1x133_add_x_q <= i_arrayidx20_conv2d1x1_conv2d1x133_add_x_o(64 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x133_dupName_0_trunc_sel_x(BITSELECT,16)@9
    i_arrayidx20_conv2d1x1_conv2d1x133_dupName_0_trunc_sel_x_b <= i_arrayidx20_conv2d1x1_conv2d1x133_add_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,65)@9
    out_c0_exi4_0 <= GND_q;
    out_c0_exi4_1 <= i_arrayidx20_conv2d1x1_conv2d1x133_dupName_0_trunc_sel_x_b;
    out_c0_exi4_2 <= i_arrayidx30_conv2d1x1_conv2d1x136_dupName_0_trunc_sel_x_b;
    out_c0_exi4_3 <= i_arrayidx41_conv2d1x1_conv2d1x139_dupName_0_trunc_sel_x_b;
    out_c0_exi4_4 <= i_arrayidx52_conv2d1x1_conv2d1x142_dupName_0_trunc_sel_x_b;
    out_o_valid <= redist15_sync_in_aunroll_x_in_i_valid_6_q;

END normal;
