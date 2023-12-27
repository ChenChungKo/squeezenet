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

-- VHDL created from i_sfc_logic_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x374
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

entity i_sfc_logic_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x374 is
    port (
        in_c0_eni5_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni5_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni5_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni5_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni5_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni5_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi3166_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi3166_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi3166_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi3166_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x374;

architecture normal of i_sfc_logic_c0_for_cond15_preheader_conv2d3x3_c0_enter159_conv2d3x374 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_im_sync_buffer147_conv2d3x385 is
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


    component i_syncbuf_input_im_sync_buffer148_conv2d3x390 is
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


    component i_syncbuf_input_im_sync_buffer_conv2d3x380 is
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


    component i_syncbuf_input_size_sync_buffer134_conv2d3x376 is
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


    component i_syncbuf_input_size_sync_buffer135_conv2d3x378 is
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


    component i_syncbuf_input_size_sync_buffer139_conv2d3x383 is
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


    component i_syncbuf_input_size_sync_buffer141_conv2d3x388 is
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
    signal bgTrunc_i_add44_1_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add44_2_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add44_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add45_124_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add45_239_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add45_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul41_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul425_1_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul425_2_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul425_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom46_125_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom46_240_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom46_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add45_124_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_124_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_124_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_124_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_239_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_239_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_239_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_239_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add45_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_1_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_1_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_1_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_1_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_2_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_2_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_2_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_2_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul425_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_input_im_sync_buffer147_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer148_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_size_sync_buffer134_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer135_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer139_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer141_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal bgTrunc_i_add44_1_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_add44_1_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_add44_2_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_add44_2_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_add44_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_add44_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul41_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul41_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add44_1_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_1_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_1_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_1_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_1_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add44_1_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_1_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add44_1_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_1_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add44_1_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add44_1_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add44_1_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_1_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_1_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_1_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_add44_2_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_2_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_2_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_2_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_2_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add44_2_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_2_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add44_2_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_2_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add44_2_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add44_2_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add44_2_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_2_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_2_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_2_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_add44_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add44_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add44_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add44_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add44_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add44_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add44_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul41_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul41_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul41_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul41_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul41_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul41_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul41_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul41_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul41_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul41_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul41_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul41_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul41_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul41_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul41_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add44_1_conv2d3x3_im0_cma_reset : std_logic;
    type i_add44_1_conv2d3x3_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_add44_1_conv2d3x3_im0_cma_a0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_add44_1_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_add44_1_conv2d3x3_im0_cma_c0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_add44_1_conv2d3x3_im0_cma_c0 : signal is true;
    type i_add44_1_conv2d3x3_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_add44_1_conv2d3x3_im0_cma_p : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im0_cma_u : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im0_cma_w : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im0_cma_x : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im0_cma_y : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im0_cma_s : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add44_1_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add44_1_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_add44_1_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_add44_1_conv2d3x3_im10_cma_reset : std_logic;
    type i_add44_1_conv2d3x3_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_add44_1_conv2d3x3_im10_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add44_1_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_add44_1_conv2d3x3_im10_cma_c0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add44_1_conv2d3x3_im10_cma_c0 : signal is true;
    type i_add44_1_conv2d3x3_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_add44_1_conv2d3x3_im10_cma_p : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im10_cma_u : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im10_cma_w : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im10_cma_x : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im10_cma_y : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im10_cma_s : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_1_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add44_1_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add44_1_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_add44_1_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_add44_2_conv2d3x3_im0_cma_reset : std_logic;
    signal i_add44_2_conv2d3x3_im0_cma_a0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_add44_2_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_add44_2_conv2d3x3_im0_cma_c0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_add44_2_conv2d3x3_im0_cma_c0 : signal is true;
    signal i_add44_2_conv2d3x3_im0_cma_p : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im0_cma_u : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im0_cma_w : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im0_cma_x : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im0_cma_y : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im0_cma_s : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add44_2_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add44_2_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_add44_2_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_add44_2_conv2d3x3_im10_cma_reset : std_logic;
    signal i_add44_2_conv2d3x3_im10_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add44_2_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_add44_2_conv2d3x3_im10_cma_c0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add44_2_conv2d3x3_im10_cma_c0 : signal is true;
    signal i_add44_2_conv2d3x3_im10_cma_p : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im10_cma_u : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im10_cma_w : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im10_cma_x : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im10_cma_y : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im10_cma_s : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_2_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add44_2_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add44_2_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_add44_2_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_add44_conv2d3x3_im0_cma_reset : std_logic;
    signal i_add44_conv2d3x3_im0_cma_a0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_add44_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_add44_conv2d3x3_im0_cma_c0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_add44_conv2d3x3_im0_cma_c0 : signal is true;
    signal i_add44_conv2d3x3_im0_cma_p : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im0_cma_u : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im0_cma_w : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im0_cma_x : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im0_cma_y : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im0_cma_s : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add44_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add44_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_add44_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_add44_conv2d3x3_im10_cma_reset : std_logic;
    signal i_add44_conv2d3x3_im10_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add44_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_add44_conv2d3x3_im10_cma_c0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add44_conv2d3x3_im10_cma_c0 : signal is true;
    signal i_add44_conv2d3x3_im10_cma_p : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im10_cma_u : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im10_cma_w : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im10_cma_x : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im10_cma_y : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im10_cma_s : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add44_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add44_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add44_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_add44_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul41_conv2d3x3_im0_cma_reset : std_logic;
    signal i_mul41_conv2d3x3_im0_cma_a0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul41_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul41_conv2d3x3_im0_cma_c0 : i_add44_1_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul41_conv2d3x3_im0_cma_c0 : signal is true;
    signal i_mul41_conv2d3x3_im0_cma_p : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im0_cma_u : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im0_cma_w : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im0_cma_x : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im0_cma_y : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im0_cma_s : i_add44_1_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul41_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul41_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul41_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul41_conv2d3x3_im10_cma_reset : std_logic;
    signal i_mul41_conv2d3x3_im10_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul41_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul41_conv2d3x3_im10_cma_c0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul41_conv2d3x3_im10_cma_c0 : signal is true;
    signal i_mul41_conv2d3x3_im10_cma_p : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im10_cma_u : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im10_cma_w : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im10_cma_x : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im10_cma_y : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im10_cma_s : i_add44_1_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul41_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul41_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul41_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul41_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_add44_1_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_add44_1_conv2d3x3_ma3_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_add44_1_conv2d3x3_ma3_cma_a0 : signal is true;
    type i_add44_1_conv2d3x3_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_add44_1_conv2d3x3_ma3_cma_c0 : i_add44_1_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_add44_1_conv2d3x3_ma3_cma_c0 : signal is true;
    type i_add44_1_conv2d3x3_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_add44_1_conv2d3x3_ma3_cma_l : i_add44_1_conv2d3x3_ma3_cma_ltype(0 to 1);
    type i_add44_1_conv2d3x3_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_add44_1_conv2d3x3_ma3_cma_p : i_add44_1_conv2d3x3_ma3_cma_ptype(0 to 1);
    type i_add44_1_conv2d3x3_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_add44_1_conv2d3x3_ma3_cma_u : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_add44_1_conv2d3x3_ma3_cma_w : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_1_conv2d3x3_ma3_cma_x : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_1_conv2d3x3_ma3_cma_y : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_1_conv2d3x3_ma3_cma_s : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_1_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add44_1_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add44_1_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_add44_1_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_add44_2_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_add44_2_conv2d3x3_ma3_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_add44_2_conv2d3x3_ma3_cma_a0 : signal is true;
    signal i_add44_2_conv2d3x3_ma3_cma_c0 : i_add44_1_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_add44_2_conv2d3x3_ma3_cma_c0 : signal is true;
    signal i_add44_2_conv2d3x3_ma3_cma_l : i_add44_1_conv2d3x3_ma3_cma_ltype(0 to 1);
    signal i_add44_2_conv2d3x3_ma3_cma_p : i_add44_1_conv2d3x3_ma3_cma_ptype(0 to 1);
    signal i_add44_2_conv2d3x3_ma3_cma_u : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_add44_2_conv2d3x3_ma3_cma_w : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_2_conv2d3x3_ma3_cma_x : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_2_conv2d3x3_ma3_cma_y : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_2_conv2d3x3_ma3_cma_s : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_2_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add44_2_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add44_2_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_add44_2_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_add44_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_add44_conv2d3x3_ma3_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_add44_conv2d3x3_ma3_cma_a0 : signal is true;
    signal i_add44_conv2d3x3_ma3_cma_c0 : i_add44_1_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_add44_conv2d3x3_ma3_cma_c0 : signal is true;
    signal i_add44_conv2d3x3_ma3_cma_l : i_add44_1_conv2d3x3_ma3_cma_ltype(0 to 1);
    signal i_add44_conv2d3x3_ma3_cma_p : i_add44_1_conv2d3x3_ma3_cma_ptype(0 to 1);
    signal i_add44_conv2d3x3_ma3_cma_u : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_add44_conv2d3x3_ma3_cma_w : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_conv2d3x3_ma3_cma_x : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_conv2d3x3_ma3_cma_y : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_conv2d3x3_ma3_cma_s : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add44_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add44_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add44_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_add44_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul41_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul41_conv2d3x3_ma3_cma_a0 : i_add44_1_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul41_conv2d3x3_ma3_cma_a0 : signal is true;
    signal i_mul41_conv2d3x3_ma3_cma_c0 : i_add44_1_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul41_conv2d3x3_ma3_cma_c0 : signal is true;
    signal i_mul41_conv2d3x3_ma3_cma_l : i_add44_1_conv2d3x3_ma3_cma_ltype(0 to 1);
    signal i_mul41_conv2d3x3_ma3_cma_p : i_add44_1_conv2d3x3_ma3_cma_ptype(0 to 1);
    signal i_mul41_conv2d3x3_ma3_cma_u : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul41_conv2d3x3_ma3_cma_w : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul41_conv2d3x3_ma3_cma_x : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul41_conv2d3x3_ma3_cma_y : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul41_conv2d3x3_ma3_cma_s : i_add44_1_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul41_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul41_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul41_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul41_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul41_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul41_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_1_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_1_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add44_2_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add44_2_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul41_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_add44_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist2_i_add44_2_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist3_i_add44_1_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist4_i_mul41_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist5_i_mul41_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist6_i_add44_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist7_i_add44_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist8_i_add44_2_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist9_i_add44_2_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist10_i_add44_1_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist11_i_add44_1_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist16_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sync_in_aunroll_x_in_i_valid_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist19_i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist20_i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_bgTrunc_i_add45_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_bgTrunc_i_add45_239_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_bgTrunc_i_add45_124_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_add44_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_bgTrunc_i_add44_2_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_bgTrunc_i_add44_1_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_reset0 : std_logic;
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_i : signal is true;
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_q : signal is true;
    signal redist12_sync_in_aunroll_x_in_c0_eni5_2_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_reset0 : std_logic;
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i : signal is true;
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_eq : std_logic;
    attribute preserve of redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_eq : signal is true;
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_q : signal is true;
    signal redist13_sync_in_aunroll_x_in_c0_eni5_3_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_reset0 : std_logic;
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_i : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_q : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni5_4_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_reset0 : std_logic;
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_i : signal is true;
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_q : signal is true;
    signal redist15_sync_in_aunroll_x_in_c0_eni5_5_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist16_sync_in_aunroll_x_in_i_valid_5(DELAY,275)
    redist16_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist16_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist17_sync_in_aunroll_x_in_i_valid_11(DELAY,276)
    redist17_sync_in_aunroll_x_in_i_valid_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_sync_in_aunroll_x_in_i_valid_5_q, xout => redist17_sync_in_aunroll_x_in_i_valid_11_q, clk => clock, aclr => resetn );

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_multconst_x(CONSTANT,24)
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_mul41_conv2d3x3_bs4(BITSELECT,215)@83
    i_mul41_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(in_c0_eni5_1(17 downto 0));
    i_mul41_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul41_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul41_conv2d3x3_bjA5(BITJOIN,216)@83
    i_mul41_conv2d3x3_bjA5_q <= GND_q & i_mul41_conv2d3x3_bs4_b;

    -- i_syncbuf_input_size_sync_buffer134_conv2d3x3(BLACKBOX,88)@0
    -- in in_i_dependence@83
    -- in in_valid_in@83
    -- out out_buffer_out@83
    -- out out_valid_out@83
    thei_syncbuf_input_size_sync_buffer134_conv2d3x3 : i_syncbuf_input_size_sync_buffer134_conv2d3x376
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_size_sync_buffer134_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul41_conv2d3x3_bs2_merged_bit_select(BITSELECT,255)@83
    i_mul41_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer134_conv2d3x3_out_buffer_out(17 downto 0);
    i_mul41_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer134_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_mul41_conv2d3x3_bjB9(BITJOIN,220)@83
    i_mul41_conv2d3x3_bjB9_q <= GND_q & i_mul41_conv2d3x3_bs2_merged_bit_select_b;

    -- i_mul41_conv2d3x3_bs7(BITSELECT,218)@83
    i_mul41_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(in_c0_eni5_1(31 downto 18));

    -- i_mul41_conv2d3x3_ma3_cma(CHAINMULTADD,251)@83 + 2
    i_mul41_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul41_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul41_conv2d3x3_ma3_cma_ena1 <= i_mul41_conv2d3x3_ma3_cma_ena0;
    i_mul41_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul41_conv2d3x3_ma3_cma_a0(0),15));
    i_mul41_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul41_conv2d3x3_ma3_cma_a0(1),15));
    i_mul41_conv2d3x3_ma3_cma_p(0) <= i_mul41_conv2d3x3_ma3_cma_l(0) * i_mul41_conv2d3x3_ma3_cma_c0(0);
    i_mul41_conv2d3x3_ma3_cma_p(1) <= i_mul41_conv2d3x3_ma3_cma_l(1) * i_mul41_conv2d3x3_ma3_cma_c0(1);
    i_mul41_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul41_conv2d3x3_ma3_cma_p(0),35);
    i_mul41_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul41_conv2d3x3_ma3_cma_p(1),35);
    i_mul41_conv2d3x3_ma3_cma_w(0) <= i_mul41_conv2d3x3_ma3_cma_u(0) + i_mul41_conv2d3x3_ma3_cma_u(1);
    i_mul41_conv2d3x3_ma3_cma_x(0) <= i_mul41_conv2d3x3_ma3_cma_w(0);
    i_mul41_conv2d3x3_ma3_cma_y(0) <= i_mul41_conv2d3x3_ma3_cma_x(0);
    i_mul41_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul41_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul41_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul41_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul41_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul41_conv2d3x3_bs7_b),14);
                i_mul41_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul41_conv2d3x3_bs2_merged_bit_select_c),14);
                i_mul41_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul41_conv2d3x3_bjB9_q),19);
                i_mul41_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul41_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul41_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul41_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul41_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul41_conv2d3x3_ma3_cma_s(0) <= i_mul41_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul41_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul41_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul41_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul41_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul41_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul41_conv2d3x3_ma3_cma_q_1(DELAY,259)
    redist0_i_mul41_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul41_conv2d3x3_ma3_cma_q, xout => redist0_i_mul41_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul41_conv2d3x3_align_14(BITSHIFT,225)@86
    i_mul41_conv2d3x3_align_14_qint <= redist0_i_mul41_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul41_conv2d3x3_align_14_q <= i_mul41_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul41_conv2d3x3_bs11(BITSELECT,222)@83
    i_mul41_conv2d3x3_bs11_b <= in_c0_eni5_1(31 downto 18);

    -- i_mul41_conv2d3x3_im10_cma(CHAINMULTADD,247)@83 + 2
    i_mul41_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul41_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul41_conv2d3x3_im10_cma_ena1 <= i_mul41_conv2d3x3_im10_cma_ena0;
    i_mul41_conv2d3x3_im10_cma_p(0) <= i_mul41_conv2d3x3_im10_cma_a0(0) * i_mul41_conv2d3x3_im10_cma_c0(0);
    i_mul41_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul41_conv2d3x3_im10_cma_p(0),28);
    i_mul41_conv2d3x3_im10_cma_w(0) <= i_mul41_conv2d3x3_im10_cma_u(0);
    i_mul41_conv2d3x3_im10_cma_x(0) <= i_mul41_conv2d3x3_im10_cma_w(0);
    i_mul41_conv2d3x3_im10_cma_y(0) <= i_mul41_conv2d3x3_im10_cma_x(0);
    i_mul41_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul41_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul41_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul41_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul41_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul41_conv2d3x3_bs11_b),14);
                i_mul41_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul41_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul41_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul41_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul41_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul41_conv2d3x3_im10_cma_s(0) <= i_mul41_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul41_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul41_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul41_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul41_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul41_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist4_i_mul41_conv2d3x3_im10_cma_q_1(DELAY,263)
    redist4_i_mul41_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul41_conv2d3x3_im10_cma_q, xout => redist4_i_mul41_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul41_conv2d3x3_bs1(BITSELECT,212)@83
    i_mul41_conv2d3x3_bs1_in <= in_c0_eni5_1(17 downto 0);
    i_mul41_conv2d3x3_bs1_b <= i_mul41_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul41_conv2d3x3_im0_cma(CHAINMULTADD,246)@83 + 2
    i_mul41_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul41_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul41_conv2d3x3_im0_cma_ena1 <= i_mul41_conv2d3x3_im0_cma_ena0;
    i_mul41_conv2d3x3_im0_cma_p(0) <= i_mul41_conv2d3x3_im0_cma_a0(0) * i_mul41_conv2d3x3_im0_cma_c0(0);
    i_mul41_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul41_conv2d3x3_im0_cma_p(0),36);
    i_mul41_conv2d3x3_im0_cma_w(0) <= i_mul41_conv2d3x3_im0_cma_u(0);
    i_mul41_conv2d3x3_im0_cma_x(0) <= i_mul41_conv2d3x3_im0_cma_w(0);
    i_mul41_conv2d3x3_im0_cma_y(0) <= i_mul41_conv2d3x3_im0_cma_x(0);
    i_mul41_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul41_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul41_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul41_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul41_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul41_conv2d3x3_bs1_b),18);
                i_mul41_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul41_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul41_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul41_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul41_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul41_conv2d3x3_im0_cma_s(0) <= i_mul41_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul41_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul41_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul41_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul41_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul41_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist5_i_mul41_conv2d3x3_im0_cma_q_1(DELAY,264)
    redist5_i_mul41_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul41_conv2d3x3_im0_cma_q, xout => redist5_i_mul41_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul41_conv2d3x3_join_13(BITJOIN,224)@86
    i_mul41_conv2d3x3_join_13_q <= redist4_i_mul41_conv2d3x3_im10_cma_q_1_q & redist5_i_mul41_conv2d3x3_im0_cma_q_1_q;

    -- i_mul41_conv2d3x3_result_add_0_0(ADD,227)@86
    i_mul41_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul41_conv2d3x3_join_13_q));
    i_mul41_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul41_conv2d3x3_align_14_q(51)) & i_mul41_conv2d3x3_align_14_q));
    i_mul41_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul41_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul41_conv2d3x3_result_add_0_0_b));
    i_mul41_conv2d3x3_result_add_0_0_q <= i_mul41_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul41_conv2d3x3_rnd_sel(BITSELECT,153)@86
    bgTrunc_i_mul41_conv2d3x3_rnd_sel_in <= i_mul41_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul41_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul41_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul41_conv2d3x3_sel_x(BITSELECT,8)@86
    bgTrunc_i_mul41_conv2d3x3_sel_x_b <= bgTrunc_i_mul41_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1(DELAY,283)
    redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul41_conv2d3x3_sel_x_b, xout => redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_notEnable(LOGICAL,324)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_nor(LOGICAL,325)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_nor_q <= not (redist15_sync_in_aunroll_x_in_c0_eni5_5_4_notEnable_q or redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_q);

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_cmpReg(REG,323)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena(REG,326)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist15_sync_in_aunroll_x_in_c0_eni5_5_4_nor_q = "1") THEN
                redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_sync_in_aunroll_x_in_c0_eni5_5_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_enaAnd(LOGICAL,327)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_enaAnd_q <= redist15_sync_in_aunroll_x_in_c0_eni5_5_4_sticky_ena_q and VCC_q;

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt(COUNTER,321)
    -- low=0, high=1, step=1, init=0
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_i <= redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_i, 1)));

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_wraddr(REG,322)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist15_sync_in_aunroll_x_in_c0_eni5_5_4_wraddr_q <= STD_LOGIC_VECTOR(redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem(DUALMEM,320)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni5_5);
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_aa <= redist15_sync_in_aunroll_x_in_c0_eni5_5_4_wraddr_q;
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_ab <= redist15_sync_in_aunroll_x_in_c0_eni5_5_4_rdcnt_q;
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_reset0 <= not (resetn);
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_dmem : altera_syncram
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
        clocken1 => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_reset0,
        clock1 => clock,
        address_a => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_aa,
        data_a => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_ab,
        q_b => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_iq
    );
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_q <= redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_iq(31 downto 0);

    -- redist15_sync_in_aunroll_x_in_c0_eni5_5_4_outputreg(DELAY,319)
    redist15_sync_in_aunroll_x_in_c0_eni5_5_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_mem_q, xout => redist15_sync_in_aunroll_x_in_c0_eni5_5_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul425_2_conv2d3x3(ADD,83)@87
    i_mul425_2_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist15_sync_in_aunroll_x_in_c0_eni5_5_4_outputreg_q);
    i_mul425_2_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1_q);
    i_mul425_2_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul425_2_conv2d3x3_a) + UNSIGNED(i_mul425_2_conv2d3x3_b));
    i_mul425_2_conv2d3x3_q <= i_mul425_2_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul425_2_conv2d3x3_sel_x(BITSELECT,10)@87
    bgTrunc_i_mul425_2_conv2d3x3_sel_x_b <= i_mul425_2_conv2d3x3_q(31 downto 0);

    -- redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1(DELAY,281)
    redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul425_2_conv2d3x3_sel_x_b, xout => redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add44_2_conv2d3x3_bs4(BITSELECT,178)@88
    i_add44_2_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1_q(17 downto 0));
    i_add44_2_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_bs4_in(17 downto 0));

    -- i_add44_2_conv2d3x3_bjA5(BITJOIN,179)@88
    i_add44_2_conv2d3x3_bjA5_q <= GND_q & i_add44_2_conv2d3x3_bs4_b;

    -- i_syncbuf_input_size_sync_buffer141_conv2d3x3(BLACKBOX,91)@0
    -- in in_i_dependence@88
    -- in in_valid_in@88
    -- out out_buffer_out@88
    -- out out_valid_out@88
    thei_syncbuf_input_size_sync_buffer141_conv2d3x3 : i_syncbuf_input_size_sync_buffer141_conv2d3x388
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist16_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer141_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_add44_2_conv2d3x3_bs2_merged_bit_select(BITSELECT,258)@88
    i_add44_2_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer141_conv2d3x3_out_buffer_out(17 downto 0);
    i_add44_2_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer141_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_add44_2_conv2d3x3_bjB9(BITJOIN,183)@88
    i_add44_2_conv2d3x3_bjB9_q <= GND_q & i_add44_2_conv2d3x3_bs2_merged_bit_select_b;

    -- i_add44_2_conv2d3x3_bs7(BITSELECT,181)@88
    i_add44_2_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1_q(31 downto 18));

    -- i_add44_2_conv2d3x3_ma3_cma(CHAINMULTADD,249)@88 + 2
    i_add44_2_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_add44_2_conv2d3x3_ma3_cma_ena0 <= '1';
    i_add44_2_conv2d3x3_ma3_cma_ena1 <= i_add44_2_conv2d3x3_ma3_cma_ena0;
    i_add44_2_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_add44_2_conv2d3x3_ma3_cma_a0(0),15));
    i_add44_2_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_add44_2_conv2d3x3_ma3_cma_a0(1),15));
    i_add44_2_conv2d3x3_ma3_cma_p(0) <= i_add44_2_conv2d3x3_ma3_cma_l(0) * i_add44_2_conv2d3x3_ma3_cma_c0(0);
    i_add44_2_conv2d3x3_ma3_cma_p(1) <= i_add44_2_conv2d3x3_ma3_cma_l(1) * i_add44_2_conv2d3x3_ma3_cma_c0(1);
    i_add44_2_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_add44_2_conv2d3x3_ma3_cma_p(0),35);
    i_add44_2_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_add44_2_conv2d3x3_ma3_cma_p(1),35);
    i_add44_2_conv2d3x3_ma3_cma_w(0) <= i_add44_2_conv2d3x3_ma3_cma_u(0) + i_add44_2_conv2d3x3_ma3_cma_u(1);
    i_add44_2_conv2d3x3_ma3_cma_x(0) <= i_add44_2_conv2d3x3_ma3_cma_w(0);
    i_add44_2_conv2d3x3_ma3_cma_y(0) <= i_add44_2_conv2d3x3_ma3_cma_x(0);
    i_add44_2_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_2_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_add44_2_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_2_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_add44_2_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_2_conv2d3x3_bs7_b),14);
                i_add44_2_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_add44_2_conv2d3x3_bs2_merged_bit_select_c),14);
                i_add44_2_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_add44_2_conv2d3x3_bjB9_q),19);
                i_add44_2_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_add44_2_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_add44_2_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_2_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_2_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_add44_2_conv2d3x3_ma3_cma_s(0) <= i_add44_2_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_2_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_add44_2_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_add44_2_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist2_i_add44_2_conv2d3x3_ma3_cma_q_1(DELAY,261)
    redist2_i_add44_2_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_2_conv2d3x3_ma3_cma_q, xout => redist2_i_add44_2_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_2_conv2d3x3_align_14(BITSHIFT,188)@91
    i_add44_2_conv2d3x3_align_14_qint <= redist2_i_add44_2_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_add44_2_conv2d3x3_align_14_q <= i_add44_2_conv2d3x3_align_14_qint(51 downto 0);

    -- i_add44_2_conv2d3x3_bs11(BITSELECT,185)@88
    i_add44_2_conv2d3x3_bs11_b <= redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1_q(31 downto 18);

    -- i_add44_2_conv2d3x3_im10_cma(CHAINMULTADD,243)@88 + 2
    i_add44_2_conv2d3x3_im10_cma_reset <= not (resetn);
    i_add44_2_conv2d3x3_im10_cma_ena0 <= '1';
    i_add44_2_conv2d3x3_im10_cma_ena1 <= i_add44_2_conv2d3x3_im10_cma_ena0;
    i_add44_2_conv2d3x3_im10_cma_p(0) <= i_add44_2_conv2d3x3_im10_cma_a0(0) * i_add44_2_conv2d3x3_im10_cma_c0(0);
    i_add44_2_conv2d3x3_im10_cma_u(0) <= RESIZE(i_add44_2_conv2d3x3_im10_cma_p(0),28);
    i_add44_2_conv2d3x3_im10_cma_w(0) <= i_add44_2_conv2d3x3_im10_cma_u(0);
    i_add44_2_conv2d3x3_im10_cma_x(0) <= i_add44_2_conv2d3x3_im10_cma_w(0);
    i_add44_2_conv2d3x3_im10_cma_y(0) <= i_add44_2_conv2d3x3_im10_cma_x(0);
    i_add44_2_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_2_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_add44_2_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_2_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_add44_2_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_2_conv2d3x3_bs11_b),14);
                i_add44_2_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_add44_2_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_add44_2_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_2_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_2_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_add44_2_conv2d3x3_im10_cma_s(0) <= i_add44_2_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_2_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_add44_2_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_add44_2_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist8_i_add44_2_conv2d3x3_im10_cma_q_1(DELAY,267)
    redist8_i_add44_2_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_2_conv2d3x3_im10_cma_q, xout => redist8_i_add44_2_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_2_conv2d3x3_bs1(BITSELECT,175)@88
    i_add44_2_conv2d3x3_bs1_in <= redist22_bgTrunc_i_mul425_2_conv2d3x3_sel_x_b_1_q(17 downto 0);
    i_add44_2_conv2d3x3_bs1_b <= i_add44_2_conv2d3x3_bs1_in(17 downto 0);

    -- i_add44_2_conv2d3x3_im0_cma(CHAINMULTADD,242)@88 + 2
    i_add44_2_conv2d3x3_im0_cma_reset <= not (resetn);
    i_add44_2_conv2d3x3_im0_cma_ena0 <= '1';
    i_add44_2_conv2d3x3_im0_cma_ena1 <= i_add44_2_conv2d3x3_im0_cma_ena0;
    i_add44_2_conv2d3x3_im0_cma_p(0) <= i_add44_2_conv2d3x3_im0_cma_a0(0) * i_add44_2_conv2d3x3_im0_cma_c0(0);
    i_add44_2_conv2d3x3_im0_cma_u(0) <= RESIZE(i_add44_2_conv2d3x3_im0_cma_p(0),36);
    i_add44_2_conv2d3x3_im0_cma_w(0) <= i_add44_2_conv2d3x3_im0_cma_u(0);
    i_add44_2_conv2d3x3_im0_cma_x(0) <= i_add44_2_conv2d3x3_im0_cma_w(0);
    i_add44_2_conv2d3x3_im0_cma_y(0) <= i_add44_2_conv2d3x3_im0_cma_x(0);
    i_add44_2_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_2_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_add44_2_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_2_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_add44_2_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_2_conv2d3x3_bs1_b),18);
                i_add44_2_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_add44_2_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_add44_2_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_2_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_2_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_add44_2_conv2d3x3_im0_cma_s(0) <= i_add44_2_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_2_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_add44_2_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_add44_2_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_add44_2_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist9_i_add44_2_conv2d3x3_im0_cma_q_1(DELAY,268)
    redist9_i_add44_2_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_2_conv2d3x3_im0_cma_q, xout => redist9_i_add44_2_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_2_conv2d3x3_join_13(BITJOIN,187)@91
    i_add44_2_conv2d3x3_join_13_q <= redist8_i_add44_2_conv2d3x3_im10_cma_q_1_q & redist9_i_add44_2_conv2d3x3_im0_cma_q_1_q;

    -- i_add44_2_conv2d3x3_result_add_0_0(ADD,190)@91
    i_add44_2_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_add44_2_conv2d3x3_join_13_q));
    i_add44_2_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_add44_2_conv2d3x3_align_14_q(51)) & i_add44_2_conv2d3x3_align_14_q));
    i_add44_2_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_add44_2_conv2d3x3_result_add_0_0_a) + SIGNED(i_add44_2_conv2d3x3_result_add_0_0_b));
    i_add44_2_conv2d3x3_result_add_0_0_q <= i_add44_2_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_add44_2_conv2d3x3_rnd_sel(BITSELECT,148)@91
    bgTrunc_i_add44_2_conv2d3x3_rnd_sel_in <= i_add44_2_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_add44_2_conv2d3x3_rnd_sel_b <= bgTrunc_i_add44_2_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_add44_2_conv2d3x3_sel_x(BITSELECT,3)@91
    bgTrunc_i_add44_2_conv2d3x3_sel_x_b <= bgTrunc_i_add44_2_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist29_bgTrunc_i_add44_2_conv2d3x3_sel_x_b_1(DELAY,288)
    redist29_bgTrunc_i_add44_2_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add44_2_conv2d3x3_sel_x_b, xout => redist29_bgTrunc_i_add44_2_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_notEnable(LOGICAL,306)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_nor(LOGICAL,307)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_nor_q <= not (redist13_sync_in_aunroll_x_in_c0_eni5_3_9_notEnable_q or redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_q);

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_last(CONSTANT,303)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_last_q <= "0101";

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp(LOGICAL,304)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_q);
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp_q <= "1" WHEN redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_last_q = redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp_b ELSE "0";

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmpReg(REG,305)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmpReg_q <= STD_LOGIC_VECTOR(redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena(REG,308)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist13_sync_in_aunroll_x_in_c0_eni5_3_9_nor_q = "1") THEN
                redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist13_sync_in_aunroll_x_in_c0_eni5_3_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_enaAnd(LOGICAL,309)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_enaAnd_q <= redist13_sync_in_aunroll_x_in_c0_eni5_3_9_sticky_ena_q and VCC_q;

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt(COUNTER,301)
    -- low=0, high=6, step=1, init=0
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_eq <= '1';
            ELSE
                redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_eq <= '0';
            END IF;
            IF (redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_eq = '1') THEN
                redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i <= redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i + 2;
            ELSE
                redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i <= redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_i, 3)));

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_wraddr(REG,302)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist13_sync_in_aunroll_x_in_c0_eni5_3_9_wraddr_q <= STD_LOGIC_VECTOR(redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem(DUALMEM,300)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni5_3);
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_aa <= redist13_sync_in_aunroll_x_in_c0_eni5_3_9_wraddr_q;
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_ab <= redist13_sync_in_aunroll_x_in_c0_eni5_3_9_rdcnt_q;
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_reset0 <= not (resetn);
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_reset0,
        clock1 => clock,
        address_a => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_aa,
        data_a => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_ab,
        q_b => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_iq
    );
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_q <= redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_iq(31 downto 0);

    -- redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg(DELAY,299)
    redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_mem_q, xout => redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg_q, clk => clock, aclr => resetn );

    -- i_add45_239_conv2d3x3(ADD,70)@92
    i_add45_239_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg_q);
    i_add45_239_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist29_bgTrunc_i_add44_2_conv2d3x3_sel_x_b_1_q);
    i_add45_239_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add45_239_conv2d3x3_a) + UNSIGNED(i_add45_239_conv2d3x3_b));
    i_add45_239_conv2d3x3_q <= i_add45_239_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add45_239_conv2d3x3_sel_x(BITSELECT,6)@92
    bgTrunc_i_add45_239_conv2d3x3_sel_x_b <= i_add45_239_conv2d3x3_q(31 downto 0);

    -- redist26_bgTrunc_i_add45_239_conv2d3x3_sel_x_b_1(DELAY,285)
    redist26_bgTrunc_i_add45_239_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add45_239_conv2d3x3_sel_x_b, xout => redist26_bgTrunc_i_add45_239_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom46_240_conv2d3x3_sel_x(BITSELECT,51)@93
    i_idxprom46_240_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist26_bgTrunc_i_add45_239_conv2d3x3_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select(BITSELECT,253)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_b <= i_idxprom46_240_conv2d3x3_sel_x_b(17 downto 0);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_c <= i_idxprom46_240_conv2d3x3_sel_x_b(63 downto 54);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_d <= i_idxprom46_240_conv2d3x3_sel_x_b(35 downto 18);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_e <= i_idxprom46_240_conv2d3x3_sel_x_b(53 downto 36);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0(BITSHIFT,233)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0_qint <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15(BITSHIFT,126)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0(BITSHIFT,234)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0_qint <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14(BITSHIFT,125)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_16(BITJOIN,127)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_16_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_15_q & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_14_q;

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0(BITSHIFT,235)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0_qint <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12(BITSHIFT,123)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0(BITSHIFT,232)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0_qint <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_13(BITJOIN,124)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_13_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_im0_shift0_q);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0(ADD,128)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_13_q);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_join_16_q);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_b));
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_extender_x(BITJOIN,33)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_extender_x_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_multconst_x_q & i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x(BITSELECT,35)@93
    i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b <= i_arrayidx47_241_conv2d3x3_conv2d3x392_mult_extender_x_q(63 downto 0);

    -- redist19_i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b_1(DELAY,278)
    redist19_i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b, xout => redist19_i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer148_conv2d3x3(BLACKBOX,86)@0
    -- in in_i_dependence@94
    -- in in_valid_in@94
    -- out out_buffer_out@94
    -- out out_valid_out@94
    thei_syncbuf_input_im_sync_buffer148_conv2d3x3 : i_syncbuf_input_im_sync_buffer148_conv2d3x390
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer148_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x(ADD,36)@94
    i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer148_conv2d3x3_out_buffer_out);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_b <= STD_LOGIC_VECTOR("0" & redist19_i_arrayidx47_241_conv2d3x3_conv2d3x392_trunc_sel_x_b_1_q);
    i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_a) + UNSIGNED(i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_b));
    i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_q <= i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_o(64 downto 0);

    -- i_arrayidx47_241_conv2d3x3_conv2d3x392_dupName_0_trunc_sel_x(BITSELECT,30)@94
    i_arrayidx47_241_conv2d3x3_conv2d3x392_dupName_0_trunc_sel_x_b <= i_arrayidx47_241_conv2d3x3_conv2d3x392_add_x_q(63 downto 0);

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_notEnable(LOGICAL,315)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_nor(LOGICAL,316)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_nor_q <= not (redist14_sync_in_aunroll_x_in_c0_eni5_4_4_notEnable_q or redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_q);

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_cmpReg(REG,314)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena(REG,317)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist14_sync_in_aunroll_x_in_c0_eni5_4_4_nor_q = "1") THEN
                redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni5_4_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_enaAnd(LOGICAL,318)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_enaAnd_q <= redist14_sync_in_aunroll_x_in_c0_eni5_4_4_sticky_ena_q and VCC_q;

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt(COUNTER,312)
    -- low=0, high=1, step=1, init=0
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_i <= redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_i, 1)));

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_wraddr(REG,313)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni5_4_4_wraddr_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem(DUALMEM,311)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni5_4);
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_aa <= redist14_sync_in_aunroll_x_in_c0_eni5_4_4_wraddr_q;
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_ab <= redist14_sync_in_aunroll_x_in_c0_eni5_4_4_rdcnt_q;
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_reset0 <= not (resetn);
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_dmem : altera_syncram
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
        clocken1 => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_reset0,
        clock1 => clock,
        address_a => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_aa,
        data_a => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_ab,
        q_b => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_iq
    );
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_q <= redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_iq(31 downto 0);

    -- redist14_sync_in_aunroll_x_in_c0_eni5_4_4_outputreg(DELAY,310)
    redist14_sync_in_aunroll_x_in_c0_eni5_4_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_mem_q, xout => redist14_sync_in_aunroll_x_in_c0_eni5_4_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul425_1_conv2d3x3(ADD,82)@87
    i_mul425_1_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni5_4_4_outputreg_q);
    i_mul425_1_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1_q);
    i_mul425_1_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul425_1_conv2d3x3_a) + UNSIGNED(i_mul425_1_conv2d3x3_b));
    i_mul425_1_conv2d3x3_q <= i_mul425_1_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul425_1_conv2d3x3_sel_x(BITSELECT,9)@87
    bgTrunc_i_mul425_1_conv2d3x3_sel_x_b <= i_mul425_1_conv2d3x3_q(31 downto 0);

    -- redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1(DELAY,282)
    redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul425_1_conv2d3x3_sel_x_b, xout => redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add44_1_conv2d3x3_bs4(BITSELECT,161)@88
    i_add44_1_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1_q(17 downto 0));
    i_add44_1_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_bs4_in(17 downto 0));

    -- i_add44_1_conv2d3x3_bjA5(BITJOIN,162)@88
    i_add44_1_conv2d3x3_bjA5_q <= GND_q & i_add44_1_conv2d3x3_bs4_b;

    -- i_syncbuf_input_size_sync_buffer139_conv2d3x3(BLACKBOX,90)@0
    -- in in_i_dependence@88
    -- in in_valid_in@88
    -- out out_buffer_out@88
    -- out out_valid_out@88
    thei_syncbuf_input_size_sync_buffer139_conv2d3x3 : i_syncbuf_input_size_sync_buffer139_conv2d3x383
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist16_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer139_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_add44_1_conv2d3x3_bs2_merged_bit_select(BITSELECT,257)@88
    i_add44_1_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer139_conv2d3x3_out_buffer_out(17 downto 0);
    i_add44_1_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer139_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_add44_1_conv2d3x3_bjB9(BITJOIN,166)@88
    i_add44_1_conv2d3x3_bjB9_q <= GND_q & i_add44_1_conv2d3x3_bs2_merged_bit_select_b;

    -- i_add44_1_conv2d3x3_bs7(BITSELECT,164)@88
    i_add44_1_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1_q(31 downto 18));

    -- i_add44_1_conv2d3x3_ma3_cma(CHAINMULTADD,248)@88 + 2
    i_add44_1_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_add44_1_conv2d3x3_ma3_cma_ena0 <= '1';
    i_add44_1_conv2d3x3_ma3_cma_ena1 <= i_add44_1_conv2d3x3_ma3_cma_ena0;
    i_add44_1_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_add44_1_conv2d3x3_ma3_cma_a0(0),15));
    i_add44_1_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_add44_1_conv2d3x3_ma3_cma_a0(1),15));
    i_add44_1_conv2d3x3_ma3_cma_p(0) <= i_add44_1_conv2d3x3_ma3_cma_l(0) * i_add44_1_conv2d3x3_ma3_cma_c0(0);
    i_add44_1_conv2d3x3_ma3_cma_p(1) <= i_add44_1_conv2d3x3_ma3_cma_l(1) * i_add44_1_conv2d3x3_ma3_cma_c0(1);
    i_add44_1_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_add44_1_conv2d3x3_ma3_cma_p(0),35);
    i_add44_1_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_add44_1_conv2d3x3_ma3_cma_p(1),35);
    i_add44_1_conv2d3x3_ma3_cma_w(0) <= i_add44_1_conv2d3x3_ma3_cma_u(0) + i_add44_1_conv2d3x3_ma3_cma_u(1);
    i_add44_1_conv2d3x3_ma3_cma_x(0) <= i_add44_1_conv2d3x3_ma3_cma_w(0);
    i_add44_1_conv2d3x3_ma3_cma_y(0) <= i_add44_1_conv2d3x3_ma3_cma_x(0);
    i_add44_1_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_1_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_add44_1_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_1_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_add44_1_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_1_conv2d3x3_bs7_b),14);
                i_add44_1_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_add44_1_conv2d3x3_bs2_merged_bit_select_c),14);
                i_add44_1_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_add44_1_conv2d3x3_bjB9_q),19);
                i_add44_1_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_add44_1_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_add44_1_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_1_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_1_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_add44_1_conv2d3x3_ma3_cma_s(0) <= i_add44_1_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_1_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_add44_1_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_add44_1_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist3_i_add44_1_conv2d3x3_ma3_cma_q_1(DELAY,262)
    redist3_i_add44_1_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_1_conv2d3x3_ma3_cma_q, xout => redist3_i_add44_1_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_1_conv2d3x3_align_14(BITSHIFT,171)@91
    i_add44_1_conv2d3x3_align_14_qint <= redist3_i_add44_1_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_add44_1_conv2d3x3_align_14_q <= i_add44_1_conv2d3x3_align_14_qint(51 downto 0);

    -- i_add44_1_conv2d3x3_bs11(BITSELECT,168)@88
    i_add44_1_conv2d3x3_bs11_b <= redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1_q(31 downto 18);

    -- i_add44_1_conv2d3x3_im10_cma(CHAINMULTADD,241)@88 + 2
    i_add44_1_conv2d3x3_im10_cma_reset <= not (resetn);
    i_add44_1_conv2d3x3_im10_cma_ena0 <= '1';
    i_add44_1_conv2d3x3_im10_cma_ena1 <= i_add44_1_conv2d3x3_im10_cma_ena0;
    i_add44_1_conv2d3x3_im10_cma_p(0) <= i_add44_1_conv2d3x3_im10_cma_a0(0) * i_add44_1_conv2d3x3_im10_cma_c0(0);
    i_add44_1_conv2d3x3_im10_cma_u(0) <= RESIZE(i_add44_1_conv2d3x3_im10_cma_p(0),28);
    i_add44_1_conv2d3x3_im10_cma_w(0) <= i_add44_1_conv2d3x3_im10_cma_u(0);
    i_add44_1_conv2d3x3_im10_cma_x(0) <= i_add44_1_conv2d3x3_im10_cma_w(0);
    i_add44_1_conv2d3x3_im10_cma_y(0) <= i_add44_1_conv2d3x3_im10_cma_x(0);
    i_add44_1_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_1_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_add44_1_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_1_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_add44_1_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_1_conv2d3x3_bs11_b),14);
                i_add44_1_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_add44_1_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_add44_1_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_1_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_1_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_add44_1_conv2d3x3_im10_cma_s(0) <= i_add44_1_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_1_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_add44_1_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_add44_1_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist10_i_add44_1_conv2d3x3_im10_cma_q_1(DELAY,269)
    redist10_i_add44_1_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_1_conv2d3x3_im10_cma_q, xout => redist10_i_add44_1_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_1_conv2d3x3_bs1(BITSELECT,158)@88
    i_add44_1_conv2d3x3_bs1_in <= redist23_bgTrunc_i_mul425_1_conv2d3x3_sel_x_b_1_q(17 downto 0);
    i_add44_1_conv2d3x3_bs1_b <= i_add44_1_conv2d3x3_bs1_in(17 downto 0);

    -- i_add44_1_conv2d3x3_im0_cma(CHAINMULTADD,240)@88 + 2
    i_add44_1_conv2d3x3_im0_cma_reset <= not (resetn);
    i_add44_1_conv2d3x3_im0_cma_ena0 <= '1';
    i_add44_1_conv2d3x3_im0_cma_ena1 <= i_add44_1_conv2d3x3_im0_cma_ena0;
    i_add44_1_conv2d3x3_im0_cma_p(0) <= i_add44_1_conv2d3x3_im0_cma_a0(0) * i_add44_1_conv2d3x3_im0_cma_c0(0);
    i_add44_1_conv2d3x3_im0_cma_u(0) <= RESIZE(i_add44_1_conv2d3x3_im0_cma_p(0),36);
    i_add44_1_conv2d3x3_im0_cma_w(0) <= i_add44_1_conv2d3x3_im0_cma_u(0);
    i_add44_1_conv2d3x3_im0_cma_x(0) <= i_add44_1_conv2d3x3_im0_cma_w(0);
    i_add44_1_conv2d3x3_im0_cma_y(0) <= i_add44_1_conv2d3x3_im0_cma_x(0);
    i_add44_1_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_1_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_add44_1_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_1_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_add44_1_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_1_conv2d3x3_bs1_b),18);
                i_add44_1_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_add44_1_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_add44_1_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_1_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_1_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_add44_1_conv2d3x3_im0_cma_s(0) <= i_add44_1_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_1_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_add44_1_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_add44_1_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_add44_1_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist11_i_add44_1_conv2d3x3_im0_cma_q_1(DELAY,270)
    redist11_i_add44_1_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_1_conv2d3x3_im0_cma_q, xout => redist11_i_add44_1_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_1_conv2d3x3_join_13(BITJOIN,170)@91
    i_add44_1_conv2d3x3_join_13_q <= redist10_i_add44_1_conv2d3x3_im10_cma_q_1_q & redist11_i_add44_1_conv2d3x3_im0_cma_q_1_q;

    -- i_add44_1_conv2d3x3_result_add_0_0(ADD,173)@91
    i_add44_1_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_add44_1_conv2d3x3_join_13_q));
    i_add44_1_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_add44_1_conv2d3x3_align_14_q(51)) & i_add44_1_conv2d3x3_align_14_q));
    i_add44_1_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_add44_1_conv2d3x3_result_add_0_0_a) + SIGNED(i_add44_1_conv2d3x3_result_add_0_0_b));
    i_add44_1_conv2d3x3_result_add_0_0_q <= i_add44_1_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_add44_1_conv2d3x3_rnd_sel(BITSELECT,147)@91
    bgTrunc_i_add44_1_conv2d3x3_rnd_sel_in <= i_add44_1_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_add44_1_conv2d3x3_rnd_sel_b <= bgTrunc_i_add44_1_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_add44_1_conv2d3x3_sel_x(BITSELECT,2)@91
    bgTrunc_i_add44_1_conv2d3x3_sel_x_b <= bgTrunc_i_add44_1_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist30_bgTrunc_i_add44_1_conv2d3x3_sel_x_b_1(DELAY,289)
    redist30_bgTrunc_i_add44_1_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add44_1_conv2d3x3_sel_x_b, xout => redist30_bgTrunc_i_add44_1_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add45_124_conv2d3x3(ADD,69)@92
    i_add45_124_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg_q);
    i_add45_124_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist30_bgTrunc_i_add44_1_conv2d3x3_sel_x_b_1_q);
    i_add45_124_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add45_124_conv2d3x3_a) + UNSIGNED(i_add45_124_conv2d3x3_b));
    i_add45_124_conv2d3x3_q <= i_add45_124_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add45_124_conv2d3x3_sel_x(BITSELECT,5)@92
    bgTrunc_i_add45_124_conv2d3x3_sel_x_b <= i_add45_124_conv2d3x3_q(31 downto 0);

    -- redist27_bgTrunc_i_add45_124_conv2d3x3_sel_x_b_1(DELAY,286)
    redist27_bgTrunc_i_add45_124_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add45_124_conv2d3x3_sel_x_b, xout => redist27_bgTrunc_i_add45_124_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom46_125_conv2d3x3_sel_x(BITSELECT,50)@93
    i_idxprom46_125_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist27_bgTrunc_i_add45_124_conv2d3x3_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select(BITSELECT,252)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_b <= i_idxprom46_125_conv2d3x3_sel_x_b(17 downto 0);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_c <= i_idxprom46_125_conv2d3x3_sel_x_b(63 downto 54);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_d <= i_idxprom46_125_conv2d3x3_sel_x_b(35 downto 18);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_e <= i_idxprom46_125_conv2d3x3_sel_x_b(53 downto 36);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0(BITSHIFT,229)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0_qint <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15(BITSHIFT,108)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0(BITSHIFT,230)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0_qint <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14(BITSHIFT,107)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_16(BITJOIN,109)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_16_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_15_q & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_14_q;

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0(BITSHIFT,231)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0_qint <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12(BITSHIFT,105)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0(BITSHIFT,228)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0_qint <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_13(BITJOIN,106)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_13_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_im0_shift0_q);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0(ADD,110)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_13_q);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_join_16_q);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_b));
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_extender_x(BITJOIN,23)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_extender_x_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_multconst_x_q & i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x(BITSELECT,25)@93
    i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_extender_x_q(63 downto 0);

    -- redist20_i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b_1(DELAY,279)
    redist20_i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b, xout => redist20_i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer147_conv2d3x3(BLACKBOX,85)@0
    -- in in_i_dependence@94
    -- in in_valid_in@94
    -- out out_buffer_out@94
    -- out out_valid_out@94
    thei_syncbuf_input_im_sync_buffer147_conv2d3x3 : i_syncbuf_input_im_sync_buffer147_conv2d3x385
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer147_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x(ADD,26)@94
    i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer147_conv2d3x3_out_buffer_out);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_b <= STD_LOGIC_VECTOR("0" & redist20_i_arrayidx47_126_conv2d3x3_conv2d3x387_trunc_sel_x_b_1_q);
    i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_a) + UNSIGNED(i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_b));
    i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_o(64 downto 0);

    -- i_arrayidx47_126_conv2d3x3_conv2d3x387_dupName_0_trunc_sel_x(BITSELECT,20)@94
    i_arrayidx47_126_conv2d3x3_conv2d3x387_dupName_0_trunc_sel_x_b <= i_arrayidx47_126_conv2d3x3_conv2d3x387_add_x_q(63 downto 0);

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_notEnable(LOGICAL,295)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_nor(LOGICAL,296)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_nor_q <= not (redist12_sync_in_aunroll_x_in_c0_eni5_2_4_notEnable_q or redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_q);

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_cmpReg(REG,294)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena(REG,297)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist12_sync_in_aunroll_x_in_c0_eni5_2_4_nor_q = "1") THEN
                redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c0_eni5_2_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_enaAnd(LOGICAL,298)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_enaAnd_q <= redist12_sync_in_aunroll_x_in_c0_eni5_2_4_sticky_ena_q and VCC_q;

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt(COUNTER,292)
    -- low=0, high=1, step=1, init=0
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_i <= redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_i, 1)));

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_wraddr(REG,293)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c0_eni5_2_4_wraddr_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem(DUALMEM,291)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni5_2);
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_aa <= redist12_sync_in_aunroll_x_in_c0_eni5_2_4_wraddr_q;
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_ab <= redist12_sync_in_aunroll_x_in_c0_eni5_2_4_rdcnt_q;
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_reset0 <= not (resetn);
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_dmem : altera_syncram
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
        clocken1 => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_reset0,
        clock1 => clock,
        address_a => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_aa,
        data_a => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_ab,
        q_b => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_iq
    );
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_q <= redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_iq(31 downto 0);

    -- redist12_sync_in_aunroll_x_in_c0_eni5_2_4_outputreg(DELAY,290)
    redist12_sync_in_aunroll_x_in_c0_eni5_2_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_mem_q, xout => redist12_sync_in_aunroll_x_in_c0_eni5_2_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul425_conv2d3x3(ADD,84)@87
    i_mul425_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist12_sync_in_aunroll_x_in_c0_eni5_2_4_outputreg_q);
    i_mul425_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist24_bgTrunc_i_mul41_conv2d3x3_sel_x_b_1_q);
    i_mul425_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul425_conv2d3x3_a) + UNSIGNED(i_mul425_conv2d3x3_b));
    i_mul425_conv2d3x3_q <= i_mul425_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul425_conv2d3x3_sel_x(BITSELECT,11)@87
    bgTrunc_i_mul425_conv2d3x3_sel_x_b <= i_mul425_conv2d3x3_q(31 downto 0);

    -- redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1(DELAY,280)
    redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul425_conv2d3x3_sel_x_b, xout => redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add44_conv2d3x3_bs4(BITSELECT,195)@88
    i_add44_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1_q(17 downto 0));
    i_add44_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_add44_conv2d3x3_bs4_in(17 downto 0));

    -- i_add44_conv2d3x3_bjA5(BITJOIN,196)@88
    i_add44_conv2d3x3_bjA5_q <= GND_q & i_add44_conv2d3x3_bs4_b;

    -- i_syncbuf_input_size_sync_buffer135_conv2d3x3(BLACKBOX,89)@0
    -- in in_i_dependence@88
    -- in in_valid_in@88
    -- out out_buffer_out@88
    -- out out_valid_out@88
    thei_syncbuf_input_size_sync_buffer135_conv2d3x3 : i_syncbuf_input_size_sync_buffer135_conv2d3x378
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist16_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer135_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_add44_conv2d3x3_bs2_merged_bit_select(BITSELECT,256)@88
    i_add44_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer135_conv2d3x3_out_buffer_out(17 downto 0);
    i_add44_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer135_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_add44_conv2d3x3_bjB9(BITJOIN,200)@88
    i_add44_conv2d3x3_bjB9_q <= GND_q & i_add44_conv2d3x3_bs2_merged_bit_select_b;

    -- i_add44_conv2d3x3_bs7(BITSELECT,198)@88
    i_add44_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1_q(31 downto 18));

    -- i_add44_conv2d3x3_ma3_cma(CHAINMULTADD,250)@88 + 2
    i_add44_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_add44_conv2d3x3_ma3_cma_ena0 <= '1';
    i_add44_conv2d3x3_ma3_cma_ena1 <= i_add44_conv2d3x3_ma3_cma_ena0;
    i_add44_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_add44_conv2d3x3_ma3_cma_a0(0),15));
    i_add44_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_add44_conv2d3x3_ma3_cma_a0(1),15));
    i_add44_conv2d3x3_ma3_cma_p(0) <= i_add44_conv2d3x3_ma3_cma_l(0) * i_add44_conv2d3x3_ma3_cma_c0(0);
    i_add44_conv2d3x3_ma3_cma_p(1) <= i_add44_conv2d3x3_ma3_cma_l(1) * i_add44_conv2d3x3_ma3_cma_c0(1);
    i_add44_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_add44_conv2d3x3_ma3_cma_p(0),35);
    i_add44_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_add44_conv2d3x3_ma3_cma_p(1),35);
    i_add44_conv2d3x3_ma3_cma_w(0) <= i_add44_conv2d3x3_ma3_cma_u(0) + i_add44_conv2d3x3_ma3_cma_u(1);
    i_add44_conv2d3x3_ma3_cma_x(0) <= i_add44_conv2d3x3_ma3_cma_w(0);
    i_add44_conv2d3x3_ma3_cma_y(0) <= i_add44_conv2d3x3_ma3_cma_x(0);
    i_add44_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_add44_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_add44_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_conv2d3x3_bs7_b),14);
                i_add44_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_add44_conv2d3x3_bs2_merged_bit_select_c),14);
                i_add44_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_add44_conv2d3x3_bjB9_q),19);
                i_add44_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_add44_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_add44_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_add44_conv2d3x3_ma3_cma_s(0) <= i_add44_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_add44_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_add44_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_add44_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist1_i_add44_conv2d3x3_ma3_cma_q_1(DELAY,260)
    redist1_i_add44_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_conv2d3x3_ma3_cma_q, xout => redist1_i_add44_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_conv2d3x3_align_14(BITSHIFT,205)@91
    i_add44_conv2d3x3_align_14_qint <= redist1_i_add44_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_add44_conv2d3x3_align_14_q <= i_add44_conv2d3x3_align_14_qint(51 downto 0);

    -- i_add44_conv2d3x3_bs11(BITSELECT,202)@88
    i_add44_conv2d3x3_bs11_b <= redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1_q(31 downto 18);

    -- i_add44_conv2d3x3_im10_cma(CHAINMULTADD,245)@88 + 2
    i_add44_conv2d3x3_im10_cma_reset <= not (resetn);
    i_add44_conv2d3x3_im10_cma_ena0 <= '1';
    i_add44_conv2d3x3_im10_cma_ena1 <= i_add44_conv2d3x3_im10_cma_ena0;
    i_add44_conv2d3x3_im10_cma_p(0) <= i_add44_conv2d3x3_im10_cma_a0(0) * i_add44_conv2d3x3_im10_cma_c0(0);
    i_add44_conv2d3x3_im10_cma_u(0) <= RESIZE(i_add44_conv2d3x3_im10_cma_p(0),28);
    i_add44_conv2d3x3_im10_cma_w(0) <= i_add44_conv2d3x3_im10_cma_u(0);
    i_add44_conv2d3x3_im10_cma_x(0) <= i_add44_conv2d3x3_im10_cma_w(0);
    i_add44_conv2d3x3_im10_cma_y(0) <= i_add44_conv2d3x3_im10_cma_x(0);
    i_add44_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_add44_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_add44_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_conv2d3x3_bs11_b),14);
                i_add44_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_add44_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_add44_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_add44_conv2d3x3_im10_cma_s(0) <= i_add44_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_add44_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_add44_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_add44_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist6_i_add44_conv2d3x3_im10_cma_q_1(DELAY,265)
    redist6_i_add44_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_conv2d3x3_im10_cma_q, xout => redist6_i_add44_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_conv2d3x3_bs1(BITSELECT,192)@88
    i_add44_conv2d3x3_bs1_in <= redist21_bgTrunc_i_mul425_conv2d3x3_sel_x_b_1_q(17 downto 0);
    i_add44_conv2d3x3_bs1_b <= i_add44_conv2d3x3_bs1_in(17 downto 0);

    -- i_add44_conv2d3x3_im0_cma(CHAINMULTADD,244)@88 + 2
    i_add44_conv2d3x3_im0_cma_reset <= not (resetn);
    i_add44_conv2d3x3_im0_cma_ena0 <= '1';
    i_add44_conv2d3x3_im0_cma_ena1 <= i_add44_conv2d3x3_im0_cma_ena0;
    i_add44_conv2d3x3_im0_cma_p(0) <= i_add44_conv2d3x3_im0_cma_a0(0) * i_add44_conv2d3x3_im0_cma_c0(0);
    i_add44_conv2d3x3_im0_cma_u(0) <= RESIZE(i_add44_conv2d3x3_im0_cma_p(0),36);
    i_add44_conv2d3x3_im0_cma_w(0) <= i_add44_conv2d3x3_im0_cma_u(0);
    i_add44_conv2d3x3_im0_cma_x(0) <= i_add44_conv2d3x3_im0_cma_w(0);
    i_add44_conv2d3x3_im0_cma_y(0) <= i_add44_conv2d3x3_im0_cma_x(0);
    i_add44_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_add44_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_add44_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_add44_conv2d3x3_bs1_b),18);
                i_add44_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_add44_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_add44_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add44_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add44_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_add44_conv2d3x3_im0_cma_s(0) <= i_add44_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add44_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add44_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_add44_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_add44_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_add44_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist7_i_add44_conv2d3x3_im0_cma_q_1(DELAY,266)
    redist7_i_add44_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add44_conv2d3x3_im0_cma_q, xout => redist7_i_add44_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add44_conv2d3x3_join_13(BITJOIN,204)@91
    i_add44_conv2d3x3_join_13_q <= redist6_i_add44_conv2d3x3_im10_cma_q_1_q & redist7_i_add44_conv2d3x3_im0_cma_q_1_q;

    -- i_add44_conv2d3x3_result_add_0_0(ADD,207)@91
    i_add44_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_add44_conv2d3x3_join_13_q));
    i_add44_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_add44_conv2d3x3_align_14_q(51)) & i_add44_conv2d3x3_align_14_q));
    i_add44_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_add44_conv2d3x3_result_add_0_0_a) + SIGNED(i_add44_conv2d3x3_result_add_0_0_b));
    i_add44_conv2d3x3_result_add_0_0_q <= i_add44_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_add44_conv2d3x3_rnd_sel(BITSELECT,149)@91
    bgTrunc_i_add44_conv2d3x3_rnd_sel_in <= i_add44_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_add44_conv2d3x3_rnd_sel_b <= bgTrunc_i_add44_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_add44_conv2d3x3_sel_x(BITSELECT,4)@91
    bgTrunc_i_add44_conv2d3x3_sel_x_b <= bgTrunc_i_add44_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist28_bgTrunc_i_add44_conv2d3x3_sel_x_b_1(DELAY,287)
    redist28_bgTrunc_i_add44_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add44_conv2d3x3_sel_x_b, xout => redist28_bgTrunc_i_add44_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add45_conv2d3x3(ADD,71)@92
    i_add45_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist13_sync_in_aunroll_x_in_c0_eni5_3_9_outputreg_q);
    i_add45_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist28_bgTrunc_i_add44_conv2d3x3_sel_x_b_1_q);
    i_add45_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add45_conv2d3x3_a) + UNSIGNED(i_add45_conv2d3x3_b));
    i_add45_conv2d3x3_q <= i_add45_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add45_conv2d3x3_sel_x(BITSELECT,7)@92
    bgTrunc_i_add45_conv2d3x3_sel_x_b <= i_add45_conv2d3x3_q(31 downto 0);

    -- redist25_bgTrunc_i_add45_conv2d3x3_sel_x_b_1(DELAY,284)
    redist25_bgTrunc_i_add45_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add45_conv2d3x3_sel_x_b, xout => redist25_bgTrunc_i_add45_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom46_conv2d3x3_sel_x(BITSELECT,52)@93
    i_idxprom46_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist25_bgTrunc_i_add45_conv2d3x3_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select(BITSELECT,254)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_b <= i_idxprom46_conv2d3x3_sel_x_b(17 downto 0);
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_c <= i_idxprom46_conv2d3x3_sel_x_b(63 downto 54);
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_d <= i_idxprom46_conv2d3x3_sel_x_b(35 downto 18);
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_e <= i_idxprom46_conv2d3x3_sel_x_b(53 downto 36);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0(BITSHIFT,237)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0_qint <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15(BITSHIFT,144)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0(BITSHIFT,238)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0_qint <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14(BITSHIFT,143)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_16(BITJOIN,145)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_16_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_15_q & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_14_q;

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0(BITSHIFT,239)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0_qint <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12(BITSHIFT,141)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0(BITSHIFT,236)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0_qint <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_13(BITJOIN,142)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_13_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_im0_shift0_q);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0(ADD,146)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_13_q);
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_join_16_q);
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_b));
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_q <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_mult_extender_x(BITJOIN,43)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_mult_extender_x_q <= i_arrayidx47_126_conv2d3x3_conv2d3x387_mult_multconst_x_q & i_arrayidx47_conv2d3x3_conv2d3x382_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x(BITSELECT,45)@93
    i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b <= i_arrayidx47_conv2d3x3_conv2d3x382_mult_extender_x_q(63 downto 0);

    -- redist18_i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b_1(DELAY,277)
    redist18_i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b, xout => redist18_i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer_conv2d3x3(BLACKBOX,87)@0
    -- in in_i_dependence@94
    -- in in_valid_in@94
    -- out out_buffer_out@94
    -- out out_valid_out@94
    thei_syncbuf_input_im_sync_buffer_conv2d3x3 : i_syncbuf_input_im_sync_buffer_conv2d3x380
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx47_conv2d3x3_conv2d3x382_add_x(ADD,46)@94
    i_arrayidx47_conv2d3x3_conv2d3x382_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer_conv2d3x3_out_buffer_out);
    i_arrayidx47_conv2d3x3_conv2d3x382_add_x_b <= STD_LOGIC_VECTOR("0" & redist18_i_arrayidx47_conv2d3x3_conv2d3x382_trunc_sel_x_b_1_q);
    i_arrayidx47_conv2d3x3_conv2d3x382_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx47_conv2d3x3_conv2d3x382_add_x_a) + UNSIGNED(i_arrayidx47_conv2d3x3_conv2d3x382_add_x_b));
    i_arrayidx47_conv2d3x3_conv2d3x382_add_x_q <= i_arrayidx47_conv2d3x3_conv2d3x382_add_x_o(64 downto 0);

    -- i_arrayidx47_conv2d3x3_conv2d3x382_dupName_0_trunc_sel_x(BITSELECT,40)@94
    i_arrayidx47_conv2d3x3_conv2d3x382_dupName_0_trunc_sel_x_b <= i_arrayidx47_conv2d3x3_conv2d3x382_add_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,54)@94
    out_c0_exi3166_0 <= GND_q;
    out_c0_exi3166_1 <= i_arrayidx47_conv2d3x3_conv2d3x382_dupName_0_trunc_sel_x_b;
    out_c0_exi3166_2 <= i_arrayidx47_126_conv2d3x3_conv2d3x387_dupName_0_trunc_sel_x_b;
    out_c0_exi3166_3 <= i_arrayidx47_241_conv2d3x3_conv2d3x392_dupName_0_trunc_sel_x_b;
    out_o_valid <= redist17_sync_in_aunroll_x_in_i_valid_11_q;

END normal;
