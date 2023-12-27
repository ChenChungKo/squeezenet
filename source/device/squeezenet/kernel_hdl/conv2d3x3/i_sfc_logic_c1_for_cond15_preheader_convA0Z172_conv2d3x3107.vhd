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

-- VHDL created from i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107
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

entity i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107 is
    port (
        in_c1_eni14_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni14_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_7 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_8 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_9 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_10 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_11 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_13 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni14_15 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_eni14_16 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_eni14_17 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_eni14_18 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_19 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_20 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_22 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_23 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_24 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni14_26 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_27 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_28 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_29 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_30 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_31 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni14_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni14_33 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_34 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni14_35 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1174_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1174_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107;

architecture normal of i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;










    component floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;










    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_131_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_1_1_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_1_2_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_1_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_246_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_2_1_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_2_2_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_2_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add55_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_130_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_1_1_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_1_2_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_1_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_245_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_2_1_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_2_2_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_2_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul54_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_123_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_123_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_1_1_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_1_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_1_2_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_2_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_1_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_1_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_238_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_238_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_2_1_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_1_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_2_2_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_2_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_2_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_2_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond4_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond4_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_i_mul54_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_i_mul54_2_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_mul54_2_2_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_mul54_2_1_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_mul54_245_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_mul54_1_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_i_mul54_1_2_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_i_mul54_1_1_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_i_mul54_130_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_i_add55_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_i_add55_2_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_i_add55_2_1_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_i_add55_246_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_i_add55_1_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_i_add55_1_2_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_i_add55_1_1_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_i_add55_131_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_sync_in_aunroll_x_in_c1_eni14_18_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_sync_in_aunroll_x_in_c1_eni14_20_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sync_in_aunroll_x_in_c1_eni14_21_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_sync_in_aunroll_x_in_c1_eni14_26_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_sync_in_aunroll_x_in_c1_eni14_27_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_sync_in_aunroll_x_in_c1_eni14_28_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_sync_in_aunroll_x_in_c1_eni14_33_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_sync_in_aunroll_x_in_c1_eni14_34_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_sync_in_aunroll_x_in_c1_eni14_35_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_sync_in_aunroll_x_in_i_valid_143_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_reset0 : std_logic;
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i : signal is true;
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_eq : signal is true;
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_q : signal is true;
    signal redist0_i_or_cond4_2_p_conv2d3x3_q_31_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_reset0 : std_logic;
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i : UNSIGNED (6 downto 0);
    attribute preserve of redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i : signal is true;
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_eq : std_logic;
    attribute preserve of redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_eq : signal is true;
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_wraddr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_last_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp_b : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_reset0 : std_logic;
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i : UNSIGNED (6 downto 0);
    attribute preserve of redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i : signal is true;
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_eq : std_logic;
    attribute preserve of redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_eq : signal is true;
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_wraddr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_last_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp_b : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_reset0 : std_logic;
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i : UNSIGNED (6 downto 0);
    attribute preserve of redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i : signal is true;
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_eq : std_logic;
    attribute preserve of redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_eq : signal is true;
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_wraddr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_last_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp_b : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_or_cond4_238_p_conv2d3x3_q_91_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_reset0 : std_logic;
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i : signal is true;
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_eq : std_logic;
    attribute preserve of redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_eq : signal is true;
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_q : signal is true;
    signal redist4_i_or_cond4_1_p_conv2d3x3_q_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_reset0 : std_logic;
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i : UNSIGNED (6 downto 0);
    attribute preserve of redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i : signal is true;
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_eq : std_logic;
    attribute preserve of redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_eq : signal is true;
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_wraddr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_last_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp_b : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_reset0 : std_logic;
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i : signal is true;
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_eq : std_logic;
    attribute preserve of redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_eq : signal is true;
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_reset0 : std_logic;
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i : signal is true;
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_eq : std_logic;
    attribute preserve of redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_eq : signal is true;
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_or_cond4_123_p_conv2d3x3_q_46_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_reset0 : std_logic;
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i : signal is true;
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_eq : std_logic;
    attribute preserve of redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_eq : signal is true;
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_q : signal is true;
    signal redist26_sync_in_aunroll_x_in_c1_eni14_19_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist35_sync_in_aunroll_x_in_i_valid_143(DELAY,68)
    redist35_sync_in_aunroll_x_in_i_valid_143 : dspba_delay
    GENERIC MAP ( width => 1, depth => 143, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist35_sync_in_aunroll_x_in_i_valid_143_q, clk => clock, aclr => resetn );

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_notEnable(LOGICAL,87)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_nor(LOGICAL,88)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_nor_q <= not (redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_notEnable_q or redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena_q);

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_last(CONSTANT,84)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_last_q <= "01110100";

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp(LOGICAL,85)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp_b <= STD_LOGIC_VECTOR("0" & redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_q);
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp_q <= "1" WHEN redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_last_q = redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp_b ELSE "0";

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmpReg(REG,86)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmpReg_q <= STD_LOGIC_VECTOR(redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmp_q);
        END IF;
    END PROCESS;

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena(REG,89)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_nor_q = "1") THEN
                redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_enaAnd(LOGICAL,90)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_enaAnd_q <= redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_sticky_ena_q and VCC_q;

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt(COUNTER,82)
    -- low=0, high=117, step=1, init=0
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i <= TO_UNSIGNED(0, 7);
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i = TO_UNSIGNED(116, 7)) THEN
                redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_eq <= '1';
            ELSE
                redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_eq <= '0';
            END IF;
            IF (redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_eq = '1') THEN
                redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i <= redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i + 11;
            ELSE
                redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i <= redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_i, 7)));

    -- i_mul54_2_2_conv2d3x3(BLACKBOX,21)@252
    -- out out_primWireOut@259
    thei_mul54_2_2_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_31,
        in_1 => in_c1_eni14_13,
        out_primWireOut => i_mul54_2_2_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_mul54_2_2_conv2d3x3_out_primWireOut_1(DELAY,43)
    redist10_i_mul54_2_2_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_2_2_conv2d3x3_out_primWireOut, xout => redist10_i_mul54_2_2_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- c_float_0_000000e_00(FLOATCONSTANT,4)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- redist34_sync_in_aunroll_x_in_c1_eni14_35_8(DELAY,67)
    redist34_sync_in_aunroll_x_in_c1_eni14_35_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_35, xout => redist34_sync_in_aunroll_x_in_c1_eni14_35_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_2_2_p_conv2d3x3(MUX,30)@260 + 1
    i_or_cond4_2_2_p_conv2d3x3_s <= redist34_sync_in_aunroll_x_in_c1_eni14_35_8_q;
    i_or_cond4_2_2_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_2_2_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_2_2_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_2_2_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_2_2_p_conv2d3x3_q <= redist10_i_mul54_2_2_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_2_2_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_wraddr(REG,83)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_wraddr_q <= "1110101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_wraddr_q <= STD_LOGIC_VECTOR(redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem(DUALMEM,81)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_2_2_p_conv2d3x3_q);
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_aa <= redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_wraddr_q;
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_ab <= redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_rdcnt_q;
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_reset0 <= not (resetn);
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 7,
        numwords_a => 118,
        width_b => 32,
        widthad_b => 7,
        numwords_b => 118,
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
        clocken1 => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_reset0,
        clock1 => clock,
        address_a => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_aa,
        data_a => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_ab,
        q_b => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_iq
    );
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_q <= redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_iq(31 downto 0);

    -- redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_outputreg(DELAY,80)
    redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_mem_q, xout => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_outputreg_q, clk => clock, aclr => resetn );

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_notEnable(LOGICAL,131)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_nor(LOGICAL,132)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_nor_q <= not (redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_notEnable_q or redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena_q);

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_last(CONSTANT,128)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_last_q <= "01100101";

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp(LOGICAL,129)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp_b <= STD_LOGIC_VECTOR("0" & redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_q);
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp_q <= "1" WHEN redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_last_q = redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp_b ELSE "0";

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmpReg(REG,130)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmpReg_q <= STD_LOGIC_VECTOR(redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmp_q);
        END IF;
    END PROCESS;

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena(REG,133)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_nor_q = "1") THEN
                redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_enaAnd(LOGICAL,134)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_enaAnd_q <= redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_sticky_ena_q and VCC_q;

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt(COUNTER,126)
    -- low=0, high=102, step=1, init=0
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i <= TO_UNSIGNED(0, 7);
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i = TO_UNSIGNED(101, 7)) THEN
                redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_eq <= '1';
            ELSE
                redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_eq <= '0';
            END IF;
            IF (redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_eq = '1') THEN
                redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i <= redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i + 26;
            ELSE
                redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i <= redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_i, 7)));

    -- i_mul54_1_2_conv2d3x3(BLACKBOX,17)@252
    -- out out_primWireOut@259
    thei_mul54_1_2_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_30,
        in_1 => in_c1_eni14_12,
        out_primWireOut => i_mul54_1_2_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_mul54_1_2_conv2d3x3_out_primWireOut_1(DELAY,47)
    redist14_i_mul54_1_2_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_1_2_conv2d3x3_out_primWireOut, xout => redist14_i_mul54_1_2_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist33_sync_in_aunroll_x_in_c1_eni14_34_8(DELAY,66)
    redist33_sync_in_aunroll_x_in_c1_eni14_34_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_34, xout => redist33_sync_in_aunroll_x_in_c1_eni14_34_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_1_2_p_conv2d3x3(MUX,26)@260 + 1
    i_or_cond4_1_2_p_conv2d3x3_s <= redist33_sync_in_aunroll_x_in_c1_eni14_34_8_q;
    i_or_cond4_1_2_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_1_2_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_1_2_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_1_2_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_1_2_p_conv2d3x3_q <= redist14_i_mul54_1_2_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_1_2_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_wraddr(REG,127)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_wraddr_q <= "1100110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_wraddr_q <= STD_LOGIC_VECTOR(redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem(DUALMEM,125)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_1_2_p_conv2d3x3_q);
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_aa <= redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_wraddr_q;
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_ab <= redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_rdcnt_q;
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_reset0 <= not (resetn);
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 7,
        numwords_a => 103,
        width_b => 32,
        widthad_b => 7,
        numwords_b => 103,
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
        clocken1 => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_reset0,
        clock1 => clock,
        address_a => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_aa,
        data_a => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_ab,
        q_b => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_iq
    );
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_q <= redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_iq(31 downto 0);

    -- redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_outputreg(DELAY,124)
    redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_mem_q, xout => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_outputreg_q, clk => clock, aclr => resetn );

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_notEnable(LOGICAL,109)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_nor(LOGICAL,110)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_nor_q <= not (redist3_i_or_cond4_238_p_conv2d3x3_q_91_notEnable_q or redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena_q);

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_last(CONSTANT,106)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_last_q <= "01010110";

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp(LOGICAL,107)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp_b <= STD_LOGIC_VECTOR("0" & redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_q);
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp_q <= "1" WHEN redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_last_q = redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp_b ELSE "0";

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmpReg(REG,108)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmpReg_q <= STD_LOGIC_VECTOR(redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmp_q);
        END IF;
    END PROCESS;

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena(REG,111)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_i_or_cond4_238_p_conv2d3x3_q_91_nor_q = "1") THEN
                redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_i_or_cond4_238_p_conv2d3x3_q_91_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_enaAnd(LOGICAL,112)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_enaAnd_q <= redist3_i_or_cond4_238_p_conv2d3x3_q_91_sticky_ena_q and VCC_q;

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt(COUNTER,104)
    -- low=0, high=87, step=1, init=0
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i <= TO_UNSIGNED(0, 7);
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i = TO_UNSIGNED(86, 7)) THEN
                redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_eq <= '1';
            ELSE
                redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_eq <= '0';
            END IF;
            IF (redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_eq = '1') THEN
                redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i <= redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i + 41;
            ELSE
                redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i <= redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_i, 7)));

    -- i_mul54_245_conv2d3x3(BLACKBOX,19)@252
    -- out out_primWireOut@259
    thei_mul54_245_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_29,
        in_1 => in_c1_eni14_11,
        out_primWireOut => i_mul54_245_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_mul54_245_conv2d3x3_out_primWireOut_1(DELAY,45)
    redist12_i_mul54_245_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_245_conv2d3x3_out_primWireOut, xout => redist12_i_mul54_245_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist32_sync_in_aunroll_x_in_c1_eni14_33_8(DELAY,65)
    redist32_sync_in_aunroll_x_in_c1_eni14_33_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_33, xout => redist32_sync_in_aunroll_x_in_c1_eni14_33_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_238_p_conv2d3x3(MUX,28)@260 + 1
    i_or_cond4_238_p_conv2d3x3_s <= redist32_sync_in_aunroll_x_in_c1_eni14_33_8_q;
    i_or_cond4_238_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_238_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_238_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_238_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_238_p_conv2d3x3_q <= redist12_i_mul54_245_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_238_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_wraddr(REG,105)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_wraddr_q <= "1010111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_i_or_cond4_238_p_conv2d3x3_q_91_wraddr_q <= STD_LOGIC_VECTOR(redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem(DUALMEM,103)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_238_p_conv2d3x3_q);
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_aa <= redist3_i_or_cond4_238_p_conv2d3x3_q_91_wraddr_q;
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_ab <= redist3_i_or_cond4_238_p_conv2d3x3_q_91_rdcnt_q;
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_reset0 <= not (resetn);
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 7,
        numwords_a => 88,
        width_b => 32,
        widthad_b => 7,
        numwords_b => 88,
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
        clocken1 => redist3_i_or_cond4_238_p_conv2d3x3_q_91_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_reset0,
        clock1 => clock,
        address_a => redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_aa,
        data_a => redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_ab,
        q_b => redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_iq
    );
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_q <= redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_iq(31 downto 0);

    -- redist3_i_or_cond4_238_p_conv2d3x3_q_91_outputreg(DELAY,102)
    redist3_i_or_cond4_238_p_conv2d3x3_q_91_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_or_cond4_238_p_conv2d3x3_q_91_mem_q, xout => redist3_i_or_cond4_238_p_conv2d3x3_q_91_outputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_notEnable(LOGICAL,98)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_nor(LOGICAL,99)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_nor_q <= not (redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_notEnable_q or redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena_q);

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_last(CONSTANT,95)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_last_q <= "01000111";

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp(LOGICAL,96)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_q);
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp_q <= "1" WHEN redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_last_q = redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp_b ELSE "0";

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmpReg(REG,97)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmpReg_q <= STD_LOGIC_VECTOR(redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena(REG,100)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_nor_q = "1") THEN
                redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_enaAnd(LOGICAL,101)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_enaAnd_q <= redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_sticky_ena_q and VCC_q;

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt(COUNTER,93)
    -- low=0, high=72, step=1, init=0
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i <= TO_UNSIGNED(0, 7);
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i = TO_UNSIGNED(71, 7)) THEN
                redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_eq <= '1';
            ELSE
                redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_eq <= '0';
            END IF;
            IF (redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_eq = '1') THEN
                redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i <= redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i + 56;
            ELSE
                redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i <= redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_i, 7)));

    -- i_mul54_2_1_conv2d3x3(BLACKBOX,20)@252
    -- out out_primWireOut@259
    thei_mul54_2_1_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_24,
        in_1 => in_c1_eni14_10,
        out_primWireOut => i_mul54_2_1_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_mul54_2_1_conv2d3x3_out_primWireOut_1(DELAY,44)
    redist11_i_mul54_2_1_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_2_1_conv2d3x3_out_primWireOut, xout => redist11_i_mul54_2_1_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist31_sync_in_aunroll_x_in_c1_eni14_28_8(DELAY,64)
    redist31_sync_in_aunroll_x_in_c1_eni14_28_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_28, xout => redist31_sync_in_aunroll_x_in_c1_eni14_28_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_2_1_p_conv2d3x3(MUX,29)@260 + 1
    i_or_cond4_2_1_p_conv2d3x3_s <= redist31_sync_in_aunroll_x_in_c1_eni14_28_8_q;
    i_or_cond4_2_1_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_2_1_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_2_1_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_2_1_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_2_1_p_conv2d3x3_q <= redist11_i_mul54_2_1_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_2_1_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_wraddr(REG,94)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_wraddr_q <= "1001000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_wraddr_q <= STD_LOGIC_VECTOR(redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem(DUALMEM,92)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_2_1_p_conv2d3x3_q);
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_aa <= redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_wraddr_q;
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_ab <= redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_rdcnt_q;
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_reset0 <= not (resetn);
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 7,
        numwords_a => 73,
        width_b => 32,
        widthad_b => 7,
        numwords_b => 73,
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
        clocken1 => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_reset0,
        clock1 => clock,
        address_a => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_aa,
        data_a => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_ab,
        q_b => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_iq
    );
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_q <= redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_iq(31 downto 0);

    -- redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_outputreg(DELAY,91)
    redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_mem_q, xout => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_outputreg_q, clk => clock, aclr => resetn );

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_notEnable(LOGICAL,142)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_nor(LOGICAL,143)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_nor_q <= not (redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_notEnable_q or redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena_q);

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_last(CONSTANT,139)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_last_q <= "0111000";

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp(LOGICAL,140)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp_b <= STD_LOGIC_VECTOR("0" & redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_q);
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp_q <= "1" WHEN redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_last_q = redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp_b ELSE "0";

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmpReg(REG,141)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmpReg_q <= STD_LOGIC_VECTOR(redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmp_q);
        END IF;
    END PROCESS;

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena(REG,144)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_nor_q = "1") THEN
                redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_enaAnd(LOGICAL,145)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_enaAnd_q <= redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_sticky_ena_q and VCC_q;

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt(COUNTER,137)
    -- low=0, high=57, step=1, init=0
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i = TO_UNSIGNED(56, 6)) THEN
                redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_eq <= '1';
            ELSE
                redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_eq <= '0';
            END IF;
            IF (redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_eq = '1') THEN
                redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i <= redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i + 7;
            ELSE
                redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i <= redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_i, 6)));

    -- i_mul54_1_1_conv2d3x3(BLACKBOX,16)@252
    -- out out_primWireOut@259
    thei_mul54_1_1_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_23,
        in_1 => in_c1_eni14_9,
        out_primWireOut => i_mul54_1_1_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist15_i_mul54_1_1_conv2d3x3_out_primWireOut_1(DELAY,48)
    redist15_i_mul54_1_1_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_1_1_conv2d3x3_out_primWireOut, xout => redist15_i_mul54_1_1_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist30_sync_in_aunroll_x_in_c1_eni14_27_8(DELAY,63)
    redist30_sync_in_aunroll_x_in_c1_eni14_27_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_27, xout => redist30_sync_in_aunroll_x_in_c1_eni14_27_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_1_1_p_conv2d3x3(MUX,25)@260 + 1
    i_or_cond4_1_1_p_conv2d3x3_s <= redist30_sync_in_aunroll_x_in_c1_eni14_27_8_q;
    i_or_cond4_1_1_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_1_1_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_1_1_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_1_1_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_1_1_p_conv2d3x3_q <= redist15_i_mul54_1_1_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_1_1_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_wraddr(REG,138)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_wraddr_q <= "111001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_wraddr_q <= STD_LOGIC_VECTOR(redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem(DUALMEM,136)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_1_1_p_conv2d3x3_q);
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_aa <= redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_wraddr_q;
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_ab <= redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_rdcnt_q;
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_reset0 <= not (resetn);
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 6,
        numwords_a => 58,
        width_b => 32,
        widthad_b => 6,
        numwords_b => 58,
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
        clocken1 => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_reset0,
        clock1 => clock,
        address_a => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_aa,
        data_a => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_ab,
        q_b => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_iq
    );
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_q <= redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_iq(31 downto 0);

    -- redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_outputreg(DELAY,135)
    redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_mem_q, xout => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_outputreg_q, clk => clock, aclr => resetn );

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_notEnable(LOGICAL,153)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_nor(LOGICAL,154)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_nor_q <= not (redist7_i_or_cond4_123_p_conv2d3x3_q_46_notEnable_q or redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena_q);

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_last(CONSTANT,150)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_last_q <= "0101001";

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp(LOGICAL,151)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp_b <= STD_LOGIC_VECTOR("0" & redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_q);
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp_q <= "1" WHEN redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_last_q = redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp_b ELSE "0";

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmpReg(REG,152)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmpReg_q <= STD_LOGIC_VECTOR(redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmp_q);
        END IF;
    END PROCESS;

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena(REG,155)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_i_or_cond4_123_p_conv2d3x3_q_46_nor_q = "1") THEN
                redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_i_or_cond4_123_p_conv2d3x3_q_46_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_enaAnd(LOGICAL,156)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_enaAnd_q <= redist7_i_or_cond4_123_p_conv2d3x3_q_46_sticky_ena_q and VCC_q;

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt(COUNTER,148)
    -- low=0, high=42, step=1, init=0
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i = TO_UNSIGNED(41, 6)) THEN
                redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_eq <= '1';
            ELSE
                redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_eq <= '0';
            END IF;
            IF (redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_eq = '1') THEN
                redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i <= redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i + 22;
            ELSE
                redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i <= redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_i, 6)));

    -- i_mul54_130_conv2d3x3(BLACKBOX,15)@252
    -- out out_primWireOut@259
    thei_mul54_130_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_22,
        in_1 => in_c1_eni14_8,
        out_primWireOut => i_mul54_130_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_mul54_130_conv2d3x3_out_primWireOut_1(DELAY,49)
    redist16_i_mul54_130_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_130_conv2d3x3_out_primWireOut, xout => redist16_i_mul54_130_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist29_sync_in_aunroll_x_in_c1_eni14_26_8(DELAY,62)
    redist29_sync_in_aunroll_x_in_c1_eni14_26_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_26, xout => redist29_sync_in_aunroll_x_in_c1_eni14_26_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_123_p_conv2d3x3(MUX,24)@260 + 1
    i_or_cond4_123_p_conv2d3x3_s <= redist29_sync_in_aunroll_x_in_c1_eni14_26_8_q;
    i_or_cond4_123_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_123_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_123_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_123_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_123_p_conv2d3x3_q <= redist16_i_mul54_130_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_123_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_wraddr(REG,149)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_wraddr_q <= "101010";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_i_or_cond4_123_p_conv2d3x3_q_46_wraddr_q <= STD_LOGIC_VECTOR(redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem(DUALMEM,147)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_123_p_conv2d3x3_q);
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_aa <= redist7_i_or_cond4_123_p_conv2d3x3_q_46_wraddr_q;
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_ab <= redist7_i_or_cond4_123_p_conv2d3x3_q_46_rdcnt_q;
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_reset0 <= not (resetn);
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 6,
        numwords_a => 43,
        width_b => 32,
        widthad_b => 6,
        numwords_b => 43,
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
        clocken1 => redist7_i_or_cond4_123_p_conv2d3x3_q_46_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_reset0,
        clock1 => clock,
        address_a => redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_aa,
        data_a => redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_ab,
        q_b => redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_iq
    );
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_q <= redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_iq(31 downto 0);

    -- redist7_i_or_cond4_123_p_conv2d3x3_q_46_outputreg(DELAY,146)
    redist7_i_or_cond4_123_p_conv2d3x3_q_46_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_i_or_cond4_123_p_conv2d3x3_q_46_mem_q, xout => redist7_i_or_cond4_123_p_conv2d3x3_q_46_outputreg_q, clk => clock, aclr => resetn );

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_notEnable(LOGICAL,76)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_nor(LOGICAL,77)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_nor_q <= not (redist0_i_or_cond4_2_p_conv2d3x3_q_31_notEnable_q or redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_q);

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_last(CONSTANT,73)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_last_q <= "011010";

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp(LOGICAL,74)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_q);
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp_q <= "1" WHEN redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_last_q = redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp_b ELSE "0";

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmpReg(REG,75)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena(REG,78)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_or_cond4_2_p_conv2d3x3_q_31_nor_q = "1") THEN
                redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_or_cond4_2_p_conv2d3x3_q_31_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_enaAnd(LOGICAL,79)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_enaAnd_q <= redist0_i_or_cond4_2_p_conv2d3x3_q_31_sticky_ena_q and VCC_q;

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt(COUNTER,71)
    -- low=0, high=27, step=1, init=0
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_eq <= '1';
            ELSE
                redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_eq = '1') THEN
                redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i <= redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i + 5;
            ELSE
                redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i <= redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_i, 5)));

    -- i_mul54_2_conv2d3x3(BLACKBOX,22)@252
    -- out out_primWireOut@259
    thei_mul54_2_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_3,
        in_1 => in_c1_eni14_7,
        out_primWireOut => i_mul54_2_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_mul54_2_conv2d3x3_out_primWireOut_1(DELAY,42)
    redist9_i_mul54_2_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_2_conv2d3x3_out_primWireOut, xout => redist9_i_mul54_2_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist28_sync_in_aunroll_x_in_c1_eni14_21_8(DELAY,61)
    redist28_sync_in_aunroll_x_in_c1_eni14_21_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_21, xout => redist28_sync_in_aunroll_x_in_c1_eni14_21_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_2_p_conv2d3x3(MUX,31)@260 + 1
    i_or_cond4_2_p_conv2d3x3_s <= redist28_sync_in_aunroll_x_in_c1_eni14_21_8_q;
    i_or_cond4_2_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_2_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_2_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_2_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_2_p_conv2d3x3_q <= redist9_i_mul54_2_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_2_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_wraddr(REG,72)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_or_cond4_2_p_conv2d3x3_q_31_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem(DUALMEM,70)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_2_p_conv2d3x3_q);
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_aa <= redist0_i_or_cond4_2_p_conv2d3x3_q_31_wraddr_q;
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_ab <= redist0_i_or_cond4_2_p_conv2d3x3_q_31_rdcnt_q;
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_reset0 <= not (resetn);
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 28,
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
        clocken1 => redist0_i_or_cond4_2_p_conv2d3x3_q_31_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_aa,
        data_a => redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_ab,
        q_b => redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_iq
    );
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_q <= redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_iq(31 downto 0);

    -- redist0_i_or_cond4_2_p_conv2d3x3_q_31_outputreg(DELAY,69)
    redist0_i_or_cond4_2_p_conv2d3x3_q_31_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_or_cond4_2_p_conv2d3x3_q_31_mem_q, xout => redist0_i_or_cond4_2_p_conv2d3x3_q_31_outputreg_q, clk => clock, aclr => resetn );

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_notEnable(LOGICAL,120)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_nor(LOGICAL,121)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_nor_q <= not (redist4_i_or_cond4_1_p_conv2d3x3_q_16_notEnable_q or redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_q);

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_last(CONSTANT,117)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_last_q <= "01011";

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp(LOGICAL,118)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_q);
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp_q <= "1" WHEN redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_last_q = redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp_b ELSE "0";

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmpReg(REG,119)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmpReg_q <= STD_LOGIC_VECTOR(redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena(REG,122)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_i_or_cond4_1_p_conv2d3x3_q_16_nor_q = "1") THEN
                redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_i_or_cond4_1_p_conv2d3x3_q_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_enaAnd(LOGICAL,123)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_enaAnd_q <= redist4_i_or_cond4_1_p_conv2d3x3_q_16_sticky_ena_q and VCC_q;

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt(COUNTER,115)
    -- low=0, high=12, step=1, init=0
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_eq <= '1';
            ELSE
                redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_eq <= '0';
            END IF;
            IF (redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_eq = '1') THEN
                redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i <= redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i + 4;
            ELSE
                redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i <= redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_i, 4)));

    -- i_mul54_1_conv2d3x3(BLACKBOX,18)@252
    -- out out_primWireOut@259
    thei_mul54_1_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_2,
        in_1 => in_c1_eni14_6,
        out_primWireOut => i_mul54_1_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_mul54_1_conv2d3x3_out_primWireOut_1(DELAY,46)
    redist13_i_mul54_1_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_1_conv2d3x3_out_primWireOut, xout => redist13_i_mul54_1_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist27_sync_in_aunroll_x_in_c1_eni14_20_8(DELAY,60)
    redist27_sync_in_aunroll_x_in_c1_eni14_20_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_20, xout => redist27_sync_in_aunroll_x_in_c1_eni14_20_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_1_p_conv2d3x3(MUX,27)@260 + 1
    i_or_cond4_1_p_conv2d3x3_s <= redist27_sync_in_aunroll_x_in_c1_eni14_20_8_q;
    i_or_cond4_1_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_1_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_1_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_1_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_1_p_conv2d3x3_q <= redist13_i_mul54_1_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_1_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_wraddr(REG,116)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_wraddr_q <= "1100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_i_or_cond4_1_p_conv2d3x3_q_16_wraddr_q <= STD_LOGIC_VECTOR(redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem(DUALMEM,114)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_ia <= STD_LOGIC_VECTOR(i_or_cond4_1_p_conv2d3x3_q);
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_aa <= redist4_i_or_cond4_1_p_conv2d3x3_q_16_wraddr_q;
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_ab <= redist4_i_or_cond4_1_p_conv2d3x3_q_16_rdcnt_q;
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_reset0 <= not (resetn);
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 13,
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
        clocken1 => redist4_i_or_cond4_1_p_conv2d3x3_q_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_reset0,
        clock1 => clock,
        address_a => redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_aa,
        data_a => redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_ab,
        q_b => redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_iq
    );
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_q <= redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_iq(31 downto 0);

    -- redist4_i_or_cond4_1_p_conv2d3x3_q_16_outputreg(DELAY,113)
    redist4_i_or_cond4_1_p_conv2d3x3_q_16_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_or_cond4_1_p_conv2d3x3_q_16_mem_q, xout => redist4_i_or_cond4_1_p_conv2d3x3_q_16_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul54_conv2d3x3(BLACKBOX,23)@252
    -- out out_primWireOut@259
    thei_mul54_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni14_1,
        in_1 => in_c1_eni14_5,
        out_primWireOut => i_mul54_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_mul54_conv2d3x3_out_primWireOut_1(DELAY,41)
    redist8_i_mul54_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul54_conv2d3x3_out_primWireOut, xout => redist8_i_mul54_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist25_sync_in_aunroll_x_in_c1_eni14_18_8(DELAY,58)
    redist25_sync_in_aunroll_x_in_c1_eni14_18_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni14_18, xout => redist25_sync_in_aunroll_x_in_c1_eni14_18_8_q, clk => clock, aclr => resetn );

    -- i_or_cond4_p_conv2d3x3(MUX,32)@260 + 1
    i_or_cond4_p_conv2d3x3_s <= redist25_sync_in_aunroll_x_in_c1_eni14_18_8_q;
    i_or_cond4_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond4_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond4_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond4_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond4_p_conv2d3x3_q <= redist8_i_mul54_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond4_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_notEnable(LOGICAL,164)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_nor(LOGICAL,165)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_nor_q <= not (redist26_sync_in_aunroll_x_in_c1_eni14_19_9_notEnable_q or redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_q);

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_last(CONSTANT,161)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_last_q <= "0101";

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp(LOGICAL,162)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_q);
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp_q <= "1" WHEN redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_last_q = redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp_b ELSE "0";

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmpReg(REG,163)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmpReg_q <= STD_LOGIC_VECTOR(redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena(REG,166)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist26_sync_in_aunroll_x_in_c1_eni14_19_9_nor_q = "1") THEN
                redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist26_sync_in_aunroll_x_in_c1_eni14_19_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_enaAnd(LOGICAL,167)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_enaAnd_q <= redist26_sync_in_aunroll_x_in_c1_eni14_19_9_sticky_ena_q and VCC_q;

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt(COUNTER,159)
    -- low=0, high=6, step=1, init=0
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_eq <= '1';
            ELSE
                redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_eq <= '0';
            END IF;
            IF (redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_eq = '1') THEN
                redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i <= redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i + 2;
            ELSE
                redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i <= redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_i, 3)));

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_wraddr(REG,160)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist26_sync_in_aunroll_x_in_c1_eni14_19_9_wraddr_q <= STD_LOGIC_VECTOR(redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem(DUALMEM,158)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni14_19);
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_aa <= redist26_sync_in_aunroll_x_in_c1_eni14_19_9_wraddr_q;
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_ab <= redist26_sync_in_aunroll_x_in_c1_eni14_19_9_rdcnt_q;
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_reset0 <= not (resetn);
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_dmem : altera_syncram
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
        clocken1 => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_reset0,
        clock1 => clock,
        address_a => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_aa,
        data_a => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_ab,
        q_b => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_iq
    );
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_q <= redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_iq(31 downto 0);

    -- redist26_sync_in_aunroll_x_in_c1_eni14_19_9_outputreg(DELAY,157)
    redist26_sync_in_aunroll_x_in_c1_eni14_19_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_mem_q, xout => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_outputreg_q, clk => clock, aclr => resetn );

    -- i_add55_a_conv2d3x3(BLACKBOX,14)@261
    -- out out_primWireOut@275
    thei_add55_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist26_sync_in_aunroll_x_in_c1_eni14_19_9_outputreg_q,
        in_1 => i_or_cond4_p_conv2d3x3_q,
        out_primWireOut => i_add55_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist17_i_add55_a_conv2d3x3_out_primWireOut_1(DELAY,50)
    redist17_i_add55_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_a_conv2d3x3_out_primWireOut, xout => redist17_i_add55_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_1_a_conv2d3x3(BLACKBOX,9)@276
    -- out out_primWireOut@290
    thei_add55_1_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist17_i_add55_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist4_i_or_cond4_1_p_conv2d3x3_q_16_outputreg_q,
        out_primWireOut => i_add55_1_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist21_i_add55_1_a_conv2d3x3_out_primWireOut_1(DELAY,54)
    redist21_i_add55_1_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_1_a_conv2d3x3_out_primWireOut, xout => redist21_i_add55_1_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_2_a_conv2d3x3(BLACKBOX,13)@291
    -- out out_primWireOut@305
    thei_add55_2_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist21_i_add55_1_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist0_i_or_cond4_2_p_conv2d3x3_q_31_outputreg_q,
        out_primWireOut => i_add55_2_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_add55_2_a_conv2d3x3_out_primWireOut_1(DELAY,51)
    redist18_i_add55_2_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_2_a_conv2d3x3_out_primWireOut, xout => redist18_i_add55_2_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_131_a_conv2d3x3(BLACKBOX,6)@306
    -- out out_primWireOut@320
    thei_add55_131_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist18_i_add55_2_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist7_i_or_cond4_123_p_conv2d3x3_q_46_outputreg_q,
        out_primWireOut => i_add55_131_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist24_i_add55_131_a_conv2d3x3_out_primWireOut_1(DELAY,57)
    redist24_i_add55_131_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_131_a_conv2d3x3_out_primWireOut, xout => redist24_i_add55_131_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_1_1_a_conv2d3x3(BLACKBOX,7)@321
    -- out out_primWireOut@335
    thei_add55_1_1_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist24_i_add55_131_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist6_i_or_cond4_1_1_p_conv2d3x3_q_61_outputreg_q,
        out_primWireOut => i_add55_1_1_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist23_i_add55_1_1_a_conv2d3x3_out_primWireOut_1(DELAY,56)
    redist23_i_add55_1_1_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_1_1_a_conv2d3x3_out_primWireOut, xout => redist23_i_add55_1_1_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_2_1_a_conv2d3x3(BLACKBOX,11)@336
    -- out out_primWireOut@350
    thei_add55_2_1_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist23_i_add55_1_1_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist2_i_or_cond4_2_1_p_conv2d3x3_q_76_outputreg_q,
        out_primWireOut => i_add55_2_1_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist19_i_add55_2_1_a_conv2d3x3_out_primWireOut_1(DELAY,52)
    redist19_i_add55_2_1_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_2_1_a_conv2d3x3_out_primWireOut, xout => redist19_i_add55_2_1_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_246_a_conv2d3x3(BLACKBOX,10)@351
    -- out out_primWireOut@365
    thei_add55_246_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist19_i_add55_2_1_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist3_i_or_cond4_238_p_conv2d3x3_q_91_outputreg_q,
        out_primWireOut => i_add55_246_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist20_i_add55_246_a_conv2d3x3_out_primWireOut_1(DELAY,53)
    redist20_i_add55_246_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_246_a_conv2d3x3_out_primWireOut, xout => redist20_i_add55_246_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_1_2_a_conv2d3x3(BLACKBOX,8)@366
    -- out out_primWireOut@380
    thei_add55_1_2_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist20_i_add55_246_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist5_i_or_cond4_1_2_p_conv2d3x3_q_106_outputreg_q,
        out_primWireOut => i_add55_1_2_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist22_i_add55_1_2_a_conv2d3x3_out_primWireOut_1(DELAY,55)
    redist22_i_add55_1_2_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add55_1_2_a_conv2d3x3_out_primWireOut, xout => redist22_i_add55_1_2_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add55_2_2_a_conv2d3x3(BLACKBOX,12)@381
    -- out out_primWireOut@395
    thei_add55_2_2_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist22_i_add55_1_2_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist1_i_or_cond4_2_2_p_conv2d3x3_q_121_outputreg_q,
        out_primWireOut => i_add55_2_2_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@395
    out_c1_exi1174_0 <= GND_q;
    out_c1_exi1174_1 <= i_add55_2_2_a_conv2d3x3_out_primWireOut;
    out_o_valid <= redist35_sync_in_aunroll_x_in_i_valid_143_q;

END normal;
