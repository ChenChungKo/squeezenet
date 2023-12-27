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

-- VHDL created from i_sfc_logic_c2_entry_conv2d3x3_c2_enter_conv2d3x323
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

entity i_sfc_logic_c2_entry_conv2d3x3_c2_enter_conv2d3x323 is
    port (
        in_c2_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_eni1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exi6_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi6_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exi6_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exi6_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi6_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exi6_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi6_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c2_entry_conv2d3x3_c2_enter_conv2d3x323;

architecture normal of i_sfc_logic_c2_entry_conv2d3x3_c2_enter_conv2d3x323 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_size_sync_buffer138_conv2d3x334 is
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


    component i_syncbuf_input_size_sync_buffer140_conv2d3x330 is
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


    component i_syncbuf_input_size_sync_buffer_conv2d3x338 is
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


    component i_syncbuf_pad_sync_buffer_conv2d3x327 is
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


    component i_syncbuf_stride_sync_buffer_conv2d3x325 is
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
    signal bgTrunc_i_add21_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul20_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub_1_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub_2_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add21_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add21_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add21_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add21_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp31_1_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_1_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_1_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_1_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp31_2_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_2_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_2_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_2_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp31_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp31_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp33_1_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_1_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_1_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_1_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp33_2_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_2_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_2_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_2_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp33_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sub_1_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_1_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_1_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_1_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_2_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_2_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_2_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_2_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_input_size_sync_buffer138_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer140_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_pad_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_stride_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul20_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul20_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul20_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul20_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul20_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul20_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul20_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul20_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul20_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul20_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul20_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul20_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul20_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul20_conv2d3x3_im0_cma_reset : std_logic;
    type i_mul20_conv2d3x3_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul20_conv2d3x3_im0_cma_a0 : i_mul20_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul20_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul20_conv2d3x3_im0_cma_c0 : i_mul20_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul20_conv2d3x3_im0_cma_c0 : signal is true;
    type i_mul20_conv2d3x3_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul20_conv2d3x3_im0_cma_p : i_mul20_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im0_cma_u : i_mul20_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im0_cma_w : i_mul20_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im0_cma_x : i_mul20_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im0_cma_y : i_mul20_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im0_cma_s : i_mul20_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul20_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul20_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul20_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul20_conv2d3x3_im10_cma_reset : std_logic;
    type i_mul20_conv2d3x3_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul20_conv2d3x3_im10_cma_a0 : i_mul20_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul20_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul20_conv2d3x3_im10_cma_c0 : i_mul20_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul20_conv2d3x3_im10_cma_c0 : signal is true;
    type i_mul20_conv2d3x3_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul20_conv2d3x3_im10_cma_p : i_mul20_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im10_cma_u : i_mul20_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im10_cma_w : i_mul20_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im10_cma_x : i_mul20_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im10_cma_y : i_mul20_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im10_cma_s : i_mul20_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul20_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul20_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul20_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul20_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul20_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul20_conv2d3x3_ma3_cma_a0 : i_mul20_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul20_conv2d3x3_ma3_cma_a0 : signal is true;
    type i_mul20_conv2d3x3_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul20_conv2d3x3_ma3_cma_c0 : i_mul20_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul20_conv2d3x3_ma3_cma_c0 : signal is true;
    type i_mul20_conv2d3x3_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul20_conv2d3x3_ma3_cma_l : i_mul20_conv2d3x3_ma3_cma_ltype(0 to 1);
    type i_mul20_conv2d3x3_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul20_conv2d3x3_ma3_cma_p : i_mul20_conv2d3x3_ma3_cma_ptype(0 to 1);
    type i_mul20_conv2d3x3_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul20_conv2d3x3_ma3_cma_u : i_mul20_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul20_conv2d3x3_ma3_cma_w : i_mul20_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul20_conv2d3x3_ma3_cma_x : i_mul20_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul20_conv2d3x3_ma3_cma_y : i_mul20_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul20_conv2d3x3_ma3_cma_s : i_mul20_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul20_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul20_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul20_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul20_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul20_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul20_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul20_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul20_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist3_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_i_valid_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_i_valid_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_mul20_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_bgTrunc_i_add21_conv2d3x3_sel_x_b_3_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist3_sync_in_aunroll_x_in_i_valid_4(DELAY,78)
    redist3_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist3_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist4_sync_in_aunroll_x_in_i_valid_6(DELAY,79)
    redist4_sync_in_aunroll_x_in_i_valid_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_sync_in_aunroll_x_in_i_valid_4_q, xout => redist4_sync_in_aunroll_x_in_i_valid_6_q, clk => clock, aclr => resetn );

    -- redist5_sync_in_aunroll_x_in_i_valid_7(DELAY,80)
    redist5_sync_in_aunroll_x_in_i_valid_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_sync_in_aunroll_x_in_i_valid_6_q, xout => redist5_sync_in_aunroll_x_in_i_valid_7_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_size_sync_buffer_conv2d3x3(BLACKBOX,35)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_sync_buffer_conv2d3x3 : i_syncbuf_input_size_sync_buffer_conv2d3x338
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist4_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_pad_sync_buffer_conv2d3x3(BLACKBOX,36)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_pad_sync_buffer_conv2d3x3 : i_syncbuf_pad_sync_buffer_conv2d3x327
    PORT MAP (
        in_buffer_in => in_pad,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist3_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_pad_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_stride_sync_buffer_conv2d3x3(BLACKBOX,37)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_stride_sync_buffer_conv2d3x3 : i_syncbuf_stride_sync_buffer_conv2d3x325
    PORT MAP (
        in_buffer_in => in_stride,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_stride_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul20_conv2d3x3_bs4(BITSELECT,58)@1
    i_mul20_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(i_syncbuf_stride_sync_buffer_conv2d3x3_out_buffer_out(17 downto 0));
    i_mul20_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul20_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul20_conv2d3x3_bjA5(BITJOIN,59)@1
    i_mul20_conv2d3x3_bjA5_q <= GND_q & i_mul20_conv2d3x3_bs4_b;

    -- i_mul20_conv2d3x3_bs2_merged_bit_select(BITSELECT,74)@1
    i_mul20_conv2d3x3_bs2_merged_bit_select_b <= in_c2_eni1_1(17 downto 0);
    i_mul20_conv2d3x3_bs2_merged_bit_select_c <= in_c2_eni1_1(31 downto 18);

    -- i_mul20_conv2d3x3_bjB9(BITJOIN,63)@1
    i_mul20_conv2d3x3_bjB9_q <= GND_q & i_mul20_conv2d3x3_bs2_merged_bit_select_b;

    -- i_mul20_conv2d3x3_bs7(BITSELECT,61)@1
    i_mul20_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(i_syncbuf_stride_sync_buffer_conv2d3x3_out_buffer_out(31 downto 18));

    -- i_mul20_conv2d3x3_ma3_cma(CHAINMULTADD,73)@1 + 2
    i_mul20_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul20_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul20_conv2d3x3_ma3_cma_ena1 <= i_mul20_conv2d3x3_ma3_cma_ena0;
    i_mul20_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul20_conv2d3x3_ma3_cma_a0(0),15));
    i_mul20_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul20_conv2d3x3_ma3_cma_a0(1),15));
    i_mul20_conv2d3x3_ma3_cma_p(0) <= i_mul20_conv2d3x3_ma3_cma_l(0) * i_mul20_conv2d3x3_ma3_cma_c0(0);
    i_mul20_conv2d3x3_ma3_cma_p(1) <= i_mul20_conv2d3x3_ma3_cma_l(1) * i_mul20_conv2d3x3_ma3_cma_c0(1);
    i_mul20_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul20_conv2d3x3_ma3_cma_p(0),35);
    i_mul20_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul20_conv2d3x3_ma3_cma_p(1),35);
    i_mul20_conv2d3x3_ma3_cma_w(0) <= i_mul20_conv2d3x3_ma3_cma_u(0) + i_mul20_conv2d3x3_ma3_cma_u(1);
    i_mul20_conv2d3x3_ma3_cma_x(0) <= i_mul20_conv2d3x3_ma3_cma_w(0);
    i_mul20_conv2d3x3_ma3_cma_y(0) <= i_mul20_conv2d3x3_ma3_cma_x(0);
    i_mul20_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul20_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul20_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul20_conv2d3x3_bs7_b),14);
                i_mul20_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul20_conv2d3x3_bs2_merged_bit_select_c),14);
                i_mul20_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul20_conv2d3x3_bjB9_q),19);
                i_mul20_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul20_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul20_conv2d3x3_ma3_cma_s(0) <= i_mul20_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul20_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul20_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul20_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul20_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul20_conv2d3x3_ma3_cma_q_1(DELAY,75)
    redist0_i_mul20_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul20_conv2d3x3_ma3_cma_q, xout => redist0_i_mul20_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul20_conv2d3x3_align_14(BITSHIFT,68)@4
    i_mul20_conv2d3x3_align_14_qint <= redist0_i_mul20_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul20_conv2d3x3_align_14_q <= i_mul20_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul20_conv2d3x3_bs11(BITSELECT,65)@1
    i_mul20_conv2d3x3_bs11_b <= i_syncbuf_stride_sync_buffer_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_mul20_conv2d3x3_im10_cma(CHAINMULTADD,72)@1 + 2
    i_mul20_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul20_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul20_conv2d3x3_im10_cma_ena1 <= i_mul20_conv2d3x3_im10_cma_ena0;
    i_mul20_conv2d3x3_im10_cma_p(0) <= i_mul20_conv2d3x3_im10_cma_a0(0) * i_mul20_conv2d3x3_im10_cma_c0(0);
    i_mul20_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul20_conv2d3x3_im10_cma_p(0),28);
    i_mul20_conv2d3x3_im10_cma_w(0) <= i_mul20_conv2d3x3_im10_cma_u(0);
    i_mul20_conv2d3x3_im10_cma_x(0) <= i_mul20_conv2d3x3_im10_cma_w(0);
    i_mul20_conv2d3x3_im10_cma_y(0) <= i_mul20_conv2d3x3_im10_cma_x(0);
    i_mul20_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul20_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul20_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul20_conv2d3x3_bs11_b),14);
                i_mul20_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul20_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul20_conv2d3x3_im10_cma_s(0) <= i_mul20_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul20_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul20_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul20_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul20_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist1_i_mul20_conv2d3x3_im10_cma_q_1(DELAY,76)
    redist1_i_mul20_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul20_conv2d3x3_im10_cma_q, xout => redist1_i_mul20_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul20_conv2d3x3_bs1(BITSELECT,55)@1
    i_mul20_conv2d3x3_bs1_in <= i_syncbuf_stride_sync_buffer_conv2d3x3_out_buffer_out(17 downto 0);
    i_mul20_conv2d3x3_bs1_b <= i_mul20_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul20_conv2d3x3_im0_cma(CHAINMULTADD,71)@1 + 2
    i_mul20_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul20_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul20_conv2d3x3_im0_cma_ena1 <= i_mul20_conv2d3x3_im0_cma_ena0;
    i_mul20_conv2d3x3_im0_cma_p(0) <= i_mul20_conv2d3x3_im0_cma_a0(0) * i_mul20_conv2d3x3_im0_cma_c0(0);
    i_mul20_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul20_conv2d3x3_im0_cma_p(0),36);
    i_mul20_conv2d3x3_im0_cma_w(0) <= i_mul20_conv2d3x3_im0_cma_u(0);
    i_mul20_conv2d3x3_im0_cma_x(0) <= i_mul20_conv2d3x3_im0_cma_w(0);
    i_mul20_conv2d3x3_im0_cma_y(0) <= i_mul20_conv2d3x3_im0_cma_x(0);
    i_mul20_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul20_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul20_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul20_conv2d3x3_bs1_b),18);
                i_mul20_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul20_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul20_conv2d3x3_im0_cma_s(0) <= i_mul20_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul20_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul20_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul20_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul20_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist2_i_mul20_conv2d3x3_im0_cma_q_1(DELAY,77)
    redist2_i_mul20_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul20_conv2d3x3_im0_cma_q, xout => redist2_i_mul20_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul20_conv2d3x3_join_13(BITJOIN,67)@4
    i_mul20_conv2d3x3_join_13_q <= redist1_i_mul20_conv2d3x3_im10_cma_q_1_q & redist2_i_mul20_conv2d3x3_im0_cma_q_1_q;

    -- i_mul20_conv2d3x3_result_add_0_0(ADD,70)@4
    i_mul20_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul20_conv2d3x3_join_13_q));
    i_mul20_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul20_conv2d3x3_align_14_q(51)) & i_mul20_conv2d3x3_align_14_q));
    i_mul20_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul20_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul20_conv2d3x3_result_add_0_0_b));
    i_mul20_conv2d3x3_result_add_0_0_q <= i_mul20_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul20_conv2d3x3_rnd_sel(BITSELECT,51)@4
    bgTrunc_i_mul20_conv2d3x3_rnd_sel_in <= i_mul20_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul20_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul20_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul20_conv2d3x3_sel_x(BITSELECT,3)@4
    bgTrunc_i_mul20_conv2d3x3_sel_x_b <= bgTrunc_i_mul20_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist10_bgTrunc_i_mul20_conv2d3x3_sel_x_b_1(DELAY,85)
    redist10_bgTrunc_i_mul20_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul20_conv2d3x3_sel_x_b, xout => redist10_bgTrunc_i_mul20_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add21_conv2d3x3(SUB,20)@5
    i_add21_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist10_bgTrunc_i_mul20_conv2d3x3_sel_x_b_1_q);
    i_add21_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & i_syncbuf_pad_sync_buffer_conv2d3x3_out_buffer_out);
    i_add21_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add21_conv2d3x3_a) - UNSIGNED(i_add21_conv2d3x3_b));
    i_add21_conv2d3x3_q <= i_add21_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add21_conv2d3x3_sel_x(BITSELECT,2)@5
    bgTrunc_i_add21_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(i_add21_conv2d3x3_q(31 downto 0));

    -- redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1(DELAY,86)
    redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add21_conv2d3x3_sel_x_b, xout => redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2(DELAY,87)
    redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1_q, xout => redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_cmp33_conv2d3x3(COMPARE,26)@7 + 1
    i_cmp33_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q(31)) & redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q));
    i_cmp33_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out));
    i_cmp33_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp33_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp33_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp33_conv2d3x3_a) - SIGNED(i_cmp33_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp33_conv2d3x3_c(0) <= i_cmp33_conv2d3x3_o(33);

    -- c_i32_1gr(CONSTANT,18)
    c_i32_1gr_q <= "11111111111111111111111111111111";

    -- i_cmp31_conv2d3x3(COMPARE,23)@7 + 1
    i_cmp31_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp31_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q(31)) & redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q));
    i_cmp31_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp31_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp31_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp31_conv2d3x3_a) - SIGNED(i_cmp31_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp31_conv2d3x3_c(0) <= i_cmp31_conv2d3x3_o(33);

    -- i_or_cond_conv2d3x3(LOGICAL,30)@8
    i_or_cond_conv2d3x3_q <= i_cmp31_conv2d3x3_c and i_cmp33_conv2d3x3_c;

    -- i_syncbuf_input_size_sync_buffer138_conv2d3x3(BLACKBOX,33)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_sync_buffer138_conv2d3x3 : i_syncbuf_input_size_sync_buffer138_conv2d3x334
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist4_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer138_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_1gr_x(CONSTANT,7)
    dupName_0_c_i32_1gr_x_q <= "00000000000000000000000000000001";

    -- i_sub_1_conv2d3x3(ADD,31)@6
    i_sub_1_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1_q);
    i_sub_1_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sub_1_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_1_conv2d3x3_a) + UNSIGNED(i_sub_1_conv2d3x3_b));
    i_sub_1_conv2d3x3_q <= i_sub_1_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_sub_1_conv2d3x3_sel_x(BITSELECT,4)@6
    bgTrunc_i_sub_1_conv2d3x3_sel_x_b <= i_sub_1_conv2d3x3_q(31 downto 0);

    -- redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1(DELAY,83)
    redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_1_conv2d3x3_sel_x_b, xout => redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp33_1_conv2d3x3(COMPARE,24)@7 + 1
    i_cmp33_1_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q(31)) & redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q));
    i_cmp33_1_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer138_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer138_conv2d3x3_out_buffer_out));
    i_cmp33_1_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp33_1_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp33_1_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp33_1_conv2d3x3_a) - SIGNED(i_cmp33_1_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp33_1_conv2d3x3_c(0) <= i_cmp33_1_conv2d3x3_o(33);

    -- i_cmp31_1_conv2d3x3(COMPARE,21)@7 + 1
    i_cmp31_1_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp31_1_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q(31)) & redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q));
    i_cmp31_1_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp31_1_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp31_1_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp31_1_conv2d3x3_a) - SIGNED(i_cmp31_1_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp31_1_conv2d3x3_c(0) <= i_cmp31_1_conv2d3x3_o(33);

    -- i_or_cond_1_conv2d3x3(LOGICAL,28)@8
    i_or_cond_1_conv2d3x3_q <= i_cmp31_1_conv2d3x3_c and i_cmp33_1_conv2d3x3_c;

    -- redist9_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_2(DELAY,84)
    redist9_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_1_q, xout => redist9_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_size_sync_buffer140_conv2d3x3(BLACKBOX,34)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_sync_buffer140_conv2d3x3 : i_syncbuf_input_size_sync_buffer140_conv2d3x330
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist4_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer140_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_2gr(CONSTANT,19)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_sub_2_conv2d3x3(ADD,32)@6
    i_sub_2_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist11_bgTrunc_i_add21_conv2d3x3_sel_x_b_1_q);
    i_sub_2_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & c_i32_2gr_q);
    i_sub_2_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_2_conv2d3x3_a) + UNSIGNED(i_sub_2_conv2d3x3_b));
    i_sub_2_conv2d3x3_q <= i_sub_2_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_sub_2_conv2d3x3_sel_x(BITSELECT,5)@6
    bgTrunc_i_sub_2_conv2d3x3_sel_x_b <= i_sub_2_conv2d3x3_q(31 downto 0);

    -- redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1(DELAY,81)
    redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_2_conv2d3x3_sel_x_b, xout => redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp33_2_conv2d3x3(COMPARE,25)@7 + 1
    i_cmp33_2_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q(31)) & redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q));
    i_cmp33_2_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer140_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer140_conv2d3x3_out_buffer_out));
    i_cmp33_2_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp33_2_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp33_2_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp33_2_conv2d3x3_a) - SIGNED(i_cmp33_2_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp33_2_conv2d3x3_c(0) <= i_cmp33_2_conv2d3x3_o(33);

    -- i_cmp31_2_conv2d3x3(COMPARE,22)@7 + 1
    i_cmp31_2_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp31_2_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q(31)) & redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q));
    i_cmp31_2_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp31_2_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp31_2_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp31_2_conv2d3x3_a) - SIGNED(i_cmp31_2_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp31_2_conv2d3x3_c(0) <= i_cmp31_2_conv2d3x3_o(33);

    -- i_or_cond_2_conv2d3x3(LOGICAL,29)@8
    i_or_cond_2_conv2d3x3_q <= i_cmp31_2_conv2d3x3_c and i_cmp33_2_conv2d3x3_c;

    -- redist7_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_2(DELAY,82)
    redist7_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_1_q, xout => redist7_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- redist13_bgTrunc_i_add21_conv2d3x3_sel_x_b_3(DELAY,88)
    redist13_bgTrunc_i_add21_conv2d3x3_sel_x_b_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_bgTrunc_i_add21_conv2d3x3_sel_x_b_2_q, xout => redist13_bgTrunc_i_add21_conv2d3x3_sel_x_b_3_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,12)@8
    out_c2_exi6_0 <= GND_q;
    out_c2_exi6_1 <= redist13_bgTrunc_i_add21_conv2d3x3_sel_x_b_3_q;
    out_c2_exi6_2 <= redist7_bgTrunc_i_sub_2_conv2d3x3_sel_x_b_2_q;
    out_c2_exi6_3 <= i_or_cond_2_conv2d3x3_q;
    out_c2_exi6_4 <= redist9_bgTrunc_i_sub_1_conv2d3x3_sel_x_b_2_q;
    out_c2_exi6_5 <= i_or_cond_1_conv2d3x3_q;
    out_c2_exi6_6 <= i_or_cond_conv2d3x3_q;
    out_o_valid <= redist5_sync_in_aunroll_x_in_i_valid_7_q;

END normal;
