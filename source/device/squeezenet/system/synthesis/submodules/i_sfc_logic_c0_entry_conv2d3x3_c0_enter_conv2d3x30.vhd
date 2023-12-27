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

-- VHDL created from i_sfc_logic_c0_entry_conv2d3x3_c0_enter_conv2d3x30
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

entity i_sfc_logic_c0_entry_conv2d3x3_c0_enter_conv2d3x30 is
    port (
        in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi1_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_entry_conv2d3x3_c0_enter_conv2d3x30;

architecture normal of i_sfc_logic_c0_entry_conv2d3x3_c0_enter_conv2d3x30 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer129_conv2d3x36 is
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


    component i_syncbuf_input_channels_sync_buffer130_conv2d3x32 is
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
    signal bgTrunc_i_mul3_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul_add62_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_idx_ext_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_add62_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul_add62_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul_add62_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul_add62_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_input_channels_sync_buffer129_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer130_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x34_vt_const_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_unnamed_conv2d3x34_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x34_vt_select_31_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx1Pad2_uid30_i_unnamed_conv2d3x35_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid32_i_unnamed_conv2d3x35_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid37_i_unnamed_conv2d3x35_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul3_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul3_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul3_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul3_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul3_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul3_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul3_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul3_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul3_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_reset : std_logic;
    type i_mul3_conv2d3x3_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_a0 : i_mul3_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul3_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul3_conv2d3x3_im0_cma_c0 : i_mul3_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im0_cma_c0 : signal is true;
    type i_mul3_conv2d3x3_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_p : i_mul3_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_u : i_mul3_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_w : i_mul3_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_x : i_mul3_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_y : i_mul3_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_s : i_mul3_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul3_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_im10_cma_reset : std_logic;
    type i_mul3_conv2d3x3_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul3_conv2d3x3_im10_cma_a0 : i_mul3_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul3_conv2d3x3_im10_cma_c0 : i_mul3_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im10_cma_c0 : signal is true;
    type i_mul3_conv2d3x3_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul3_conv2d3x3_im10_cma_p : i_mul3_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_u : i_mul3_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_w : i_mul3_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_x : i_mul3_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_y : i_mul3_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_s : i_mul3_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul3_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul3_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul3_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul3_conv2d3x3_ma3_cma_a0 : i_mul3_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul3_conv2d3x3_ma3_cma_a0 : signal is true;
    type i_mul3_conv2d3x3_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_c0 : i_mul3_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul3_conv2d3x3_ma3_cma_c0 : signal is true;
    type i_mul3_conv2d3x3_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_l : i_mul3_conv2d3x3_ma3_cma_ltype(0 to 1);
    type i_mul3_conv2d3x3_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_p : i_mul3_conv2d3x3_ma3_cma_ptype(0 to 1);
    type i_mul3_conv2d3x3_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_u : i_mul3_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul3_conv2d3x3_ma3_cma_w : i_mul3_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_x : i_mul3_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_y : i_mul3_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_s : i_mul3_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul3_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul3_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul3_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul3_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni1_1_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist4_sync_in_aunroll_x_in_i_valid_4(DELAY,68)
    redist4_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist4_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer129_conv2d3x3(BLACKBOX,20)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_input_channels_sync_buffer129_conv2d3x3 : i_syncbuf_input_channels_sync_buffer129_conv2d3x36
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer129_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x(BITSELECT,35)@4
    leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x_in <= leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x_b <= leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x_in(30 downto 0);

    -- leftShiftStage1Idx1_uid37_i_unnamed_conv2d3x35_shift_x(BITJOIN,36)@4
    leftShiftStage1Idx1_uid37_i_unnamed_conv2d3x35_shift_x_q <= leftShiftStage1Idx1Rng1_uid36_i_unnamed_conv2d3x35_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x(BITSELECT,30)@4
    leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x_in <= i_syncbuf_input_channels_sync_buffer130_conv2d3x3_out_buffer_out(29 downto 0);
    leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x_b <= leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1Pad2_uid30_i_unnamed_conv2d3x35_shift_x(CONSTANT,29)
    leftShiftStage0Idx1Pad2_uid30_i_unnamed_conv2d3x35_shift_x_q <= "00";

    -- leftShiftStage0Idx1_uid32_i_unnamed_conv2d3x35_shift_x(BITJOIN,31)@4
    leftShiftStage0Idx1_uid32_i_unnamed_conv2d3x35_shift_x_q <= leftShiftStage0Idx1Rng2_uid31_i_unnamed_conv2d3x35_shift_x_b & leftShiftStage0Idx1Pad2_uid30_i_unnamed_conv2d3x35_shift_x_q;

    -- i_syncbuf_input_channels_sync_buffer130_conv2d3x3(BLACKBOX,21)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_input_channels_sync_buffer130_conv2d3x3 : i_syncbuf_input_channels_sync_buffer130_conv2d3x32
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer130_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x(MUX,33)@4
    leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_s <= VCC_q;
    leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_combproc: PROCESS (leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_s, i_syncbuf_input_channels_sync_buffer130_conv2d3x3_out_buffer_out, leftShiftStage0Idx1_uid32_i_unnamed_conv2d3x35_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q <= i_syncbuf_input_channels_sync_buffer130_conv2d3x3_out_buffer_out;
            WHEN "1" => leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q <= leftShiftStage0Idx1_uid32_i_unnamed_conv2d3x35_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x(MUX,38)@4
    leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_s <= VCC_q;
    leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_combproc: PROCESS (leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_s, leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q, leftShiftStage1Idx1_uid37_i_unnamed_conv2d3x35_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_q <= leftShiftStage0_uid34_i_unnamed_conv2d3x35_shift_x_q;
            WHEN "1" => leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_q <= leftShiftStage1Idx1_uid37_i_unnamed_conv2d3x35_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_conv2d3x34_vt_select_31(BITSELECT,24)@4
    i_unnamed_conv2d3x34_vt_select_31_b <= leftShiftStage1_uid39_i_unnamed_conv2d3x35_shift_x_q(31 downto 3);

    -- i_unnamed_conv2d3x34_vt_const_2(CONSTANT,22)
    i_unnamed_conv2d3x34_vt_const_2_q <= "000";

    -- i_unnamed_conv2d3x34_vt_join(BITJOIN,23)@4
    i_unnamed_conv2d3x34_vt_join_q <= i_unnamed_conv2d3x34_vt_select_31_b & i_unnamed_conv2d3x34_vt_const_2_q;

    -- i_mul_add62_conv2d3x3(ADD,19)@4
    i_mul_add62_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & i_unnamed_conv2d3x34_vt_join_q);
    i_mul_add62_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_channels_sync_buffer129_conv2d3x3_out_buffer_out);
    i_mul_add62_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_add62_conv2d3x3_a) + UNSIGNED(i_mul_add62_conv2d3x3_b));
    i_mul_add62_conv2d3x3_q <= i_mul_add62_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul_add62_conv2d3x3_sel_x(BITSELECT,3)@4
    bgTrunc_i_mul_add62_conv2d3x3_sel_x_b <= i_mul_add62_conv2d3x3_q(31 downto 0);

    -- redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1(DELAY,69)
    redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul_add62_conv2d3x3_sel_x_b, xout => redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_bs4(BITSELECT,47)@5
    i_mul3_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1_q(17 downto 0));
    i_mul3_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul3_conv2d3x3_bjA5(BITJOIN,48)@5
    i_mul3_conv2d3x3_bjA5_q <= GND_q & i_mul3_conv2d3x3_bs4_b;

    -- redist3_sync_in_aunroll_x_in_c0_eni1_1_1(DELAY,67)
    redist3_sync_in_aunroll_x_in_c0_eni1_1_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni1_1, xout => redist3_sync_in_aunroll_x_in_c0_eni1_1_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_bs2_merged_bit_select(BITSELECT,63)@5
    i_mul3_conv2d3x3_bs2_merged_bit_select_b <= redist3_sync_in_aunroll_x_in_c0_eni1_1_1_q(17 downto 0);
    i_mul3_conv2d3x3_bs2_merged_bit_select_c <= redist3_sync_in_aunroll_x_in_c0_eni1_1_1_q(31 downto 18);

    -- i_mul3_conv2d3x3_bjB9(BITJOIN,52)@5
    i_mul3_conv2d3x3_bjB9_q <= GND_q & i_mul3_conv2d3x3_bs2_merged_bit_select_b;

    -- i_mul3_conv2d3x3_bs7(BITSELECT,50)@5
    i_mul3_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1_q(31 downto 18));

    -- i_mul3_conv2d3x3_ma3_cma(CHAINMULTADD,62)@5 + 2
    i_mul3_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul3_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul3_conv2d3x3_ma3_cma_ena1 <= i_mul3_conv2d3x3_ma3_cma_ena0;
    i_mul3_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul3_conv2d3x3_ma3_cma_a0(0),15));
    i_mul3_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul3_conv2d3x3_ma3_cma_a0(1),15));
    i_mul3_conv2d3x3_ma3_cma_p(0) <= i_mul3_conv2d3x3_ma3_cma_l(0) * i_mul3_conv2d3x3_ma3_cma_c0(0);
    i_mul3_conv2d3x3_ma3_cma_p(1) <= i_mul3_conv2d3x3_ma3_cma_l(1) * i_mul3_conv2d3x3_ma3_cma_c0(1);
    i_mul3_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul3_conv2d3x3_ma3_cma_p(0),35);
    i_mul3_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul3_conv2d3x3_ma3_cma_p(1),35);
    i_mul3_conv2d3x3_ma3_cma_w(0) <= i_mul3_conv2d3x3_ma3_cma_u(0) + i_mul3_conv2d3x3_ma3_cma_u(1);
    i_mul3_conv2d3x3_ma3_cma_x(0) <= i_mul3_conv2d3x3_ma3_cma_w(0);
    i_mul3_conv2d3x3_ma3_cma_y(0) <= i_mul3_conv2d3x3_ma3_cma_x(0);
    i_mul3_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul3_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul3_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs7_b),14);
                i_mul3_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs2_merged_bit_select_c),14);
                i_mul3_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul3_conv2d3x3_bjB9_q),19);
                i_mul3_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul3_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul3_conv2d3x3_ma3_cma_s(0) <= i_mul3_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul3_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul3_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul3_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul3_conv2d3x3_ma3_cma_q_1(DELAY,64)
    redist0_i_mul3_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul3_conv2d3x3_ma3_cma_q, xout => redist0_i_mul3_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_align_14(BITSHIFT,57)@8
    i_mul3_conv2d3x3_align_14_qint <= redist0_i_mul3_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul3_conv2d3x3_align_14_q <= i_mul3_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul3_conv2d3x3_bs11(BITSELECT,54)@5
    i_mul3_conv2d3x3_bs11_b <= redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1_q(31 downto 18);

    -- i_mul3_conv2d3x3_im10_cma(CHAINMULTADD,61)@5 + 2
    i_mul3_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul3_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul3_conv2d3x3_im10_cma_ena1 <= i_mul3_conv2d3x3_im10_cma_ena0;
    i_mul3_conv2d3x3_im10_cma_p(0) <= i_mul3_conv2d3x3_im10_cma_a0(0) * i_mul3_conv2d3x3_im10_cma_c0(0);
    i_mul3_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul3_conv2d3x3_im10_cma_p(0),28);
    i_mul3_conv2d3x3_im10_cma_w(0) <= i_mul3_conv2d3x3_im10_cma_u(0);
    i_mul3_conv2d3x3_im10_cma_x(0) <= i_mul3_conv2d3x3_im10_cma_w(0);
    i_mul3_conv2d3x3_im10_cma_y(0) <= i_mul3_conv2d3x3_im10_cma_x(0);
    i_mul3_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul3_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul3_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs11_b),14);
                i_mul3_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul3_conv2d3x3_im10_cma_s(0) <= i_mul3_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul3_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul3_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist1_i_mul3_conv2d3x3_im10_cma_q_1(DELAY,65)
    redist1_i_mul3_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul3_conv2d3x3_im10_cma_q, xout => redist1_i_mul3_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_bs1(BITSELECT,44)@5
    i_mul3_conv2d3x3_bs1_in <= redist5_bgTrunc_i_mul_add62_conv2d3x3_sel_x_b_1_q(17 downto 0);
    i_mul3_conv2d3x3_bs1_b <= i_mul3_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul3_conv2d3x3_im0_cma(CHAINMULTADD,60)@5 + 2
    i_mul3_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul3_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul3_conv2d3x3_im0_cma_ena1 <= i_mul3_conv2d3x3_im0_cma_ena0;
    i_mul3_conv2d3x3_im0_cma_p(0) <= i_mul3_conv2d3x3_im0_cma_a0(0) * i_mul3_conv2d3x3_im0_cma_c0(0);
    i_mul3_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul3_conv2d3x3_im0_cma_p(0),36);
    i_mul3_conv2d3x3_im0_cma_w(0) <= i_mul3_conv2d3x3_im0_cma_u(0);
    i_mul3_conv2d3x3_im0_cma_x(0) <= i_mul3_conv2d3x3_im0_cma_w(0);
    i_mul3_conv2d3x3_im0_cma_y(0) <= i_mul3_conv2d3x3_im0_cma_x(0);
    i_mul3_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul3_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul3_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs1_b),18);
                i_mul3_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul3_conv2d3x3_im0_cma_s(0) <= i_mul3_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul3_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul3_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist2_i_mul3_conv2d3x3_im0_cma_q_1(DELAY,66)
    redist2_i_mul3_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul3_conv2d3x3_im0_cma_q, xout => redist2_i_mul3_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_join_13(BITJOIN,56)@8
    i_mul3_conv2d3x3_join_13_q <= redist1_i_mul3_conv2d3x3_im10_cma_q_1_q & redist2_i_mul3_conv2d3x3_im0_cma_q_1_q;

    -- i_mul3_conv2d3x3_result_add_0_0(ADD,59)@8
    i_mul3_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul3_conv2d3x3_join_13_q));
    i_mul3_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul3_conv2d3x3_align_14_q(51)) & i_mul3_conv2d3x3_align_14_q));
    i_mul3_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul3_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul3_conv2d3x3_result_add_0_0_b));
    i_mul3_conv2d3x3_result_add_0_0_q <= i_mul3_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul3_conv2d3x3_rnd_sel(BITSELECT,40)@8
    bgTrunc_i_mul3_conv2d3x3_rnd_sel_in <= i_mul3_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul3_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul3_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul3_conv2d3x3_sel_x(BITSELECT,2)@8
    bgTrunc_i_mul3_conv2d3x3_sel_x_b <= bgTrunc_i_mul3_conv2d3x3_rnd_sel_b(31 downto 0);

    -- i_idx_ext_conv2d3x3_sel_x(BITSELECT,5)@8
    i_idx_ext_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bgTrunc_i_mul3_conv2d3x3_sel_x_b(31 downto 0)), 64)));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,11)@8
    out_c0_exi1_0 <= GND_q;
    out_c0_exi1_1 <= i_idx_ext_conv2d3x3_sel_x_b;
    out_o_valid <= redist4_sync_in_aunroll_x_in_i_valid_4_q;

END normal;
