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

-- VHDL created from bb_maxpool2d_B1_stall_region
-- VHDL created on Sun Oct 01 23:33:46 2023


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

entity bb_maxpool2d_B1_stall_region is
    port (
        in_c0_exe12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe16 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_08 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe16 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_08 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B1_stall_region;

architecture normal of bb_maxpool2d_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d is
        port (
            in_c0_eni19_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni19_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit13_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit13_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_c0_exit13_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mul22_maxpool2d_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul22_maxpool2d_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_mul24_maxpool2d_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul24_maxpool2d_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid39_i_mul22_maxpool2d_maxpool2d10_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid48_i_mul24_maxpool2d_maxpool2d16_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (191 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (191 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D3 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2(STALLENABLE,108)
    -- Valid signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_V0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_s_tv_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backStall and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_v_s_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN and SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_V;
    -- Backward Stall generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backStall <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN);
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN = "0") THEN
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0 and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_s_tv_0;
            ELSE
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry(STALLENABLE,98)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= maxpool2d_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,87)
    bubble_join_stall_entry_q <= in_j_16 & in_i_08 & in_c1_exe16 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,88)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));

    -- maxpool2d_B1_merge_reg_aunroll_x(BLACKBOX,15)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    themaxpool2d_B1_merge_reg_aunroll_x : maxpool2d_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_d,
        in_data_in_1 => bubble_select_stall_entry_e,
        in_data_in_2 => bubble_select_stall_entry_b,
        in_data_in_3 => bubble_select_stall_entry_c,
        in_stall_in => SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3,
        out_stall_out => maxpool2d_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => maxpool2d_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_maxpool2d_B1_merge_reg_aunroll_x(STALLENABLE,93)
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed0 <= (not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backStall) and SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_o_stall) and SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_StallValid <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall and SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid;
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_toReg0 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_toReg1 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_or0 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_maxpool2d_B1_merge_reg_aunroll_x_consumed1 and SE_out_maxpool2d_B1_merge_reg_aunroll_x_or0);
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_V0 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_V1 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B1_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid <= maxpool2d_B1_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0(STALLENABLE,106)
    -- Valid signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_V0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_s_tv_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backStall and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_v_s_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN and SE_out_maxpool2d_B1_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backStall <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_v_s_0);
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN = "0") THEN
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0 and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_s_tv_0;
            ELSE
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_maxpool2d_B1_merge_reg_aunroll_x(BITJOIN,84)
    bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q <= maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_maxpool2d_B1_merge_reg_aunroll_x(BITSELECT,85)
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(191 downto 128));

    -- redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_0(REG,73)
    redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN = "1") THEN
                redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_0_q <= STD_LOGIC_VECTOR(bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1(REG,74)
    redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN = "1") THEN
                redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1_q <= STD_LOGIC_VECTOR(redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_0(REG,67)
    redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN = "1") THEN
                redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_0_q <= STD_LOGIC_VECTOR(bubble_select_maxpool2d_B1_merge_reg_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1(REG,68)
    redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN = "1") THEN
                redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1_q <= STD_LOGIC_VECTOR(redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_0(REG,61)
    redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN = "1") THEN
                redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_0_q <= STD_LOGIC_VECTOR(bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1(REG,62)
    redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN = "1") THEN
                redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1_q <= STD_LOGIC_VECTOR(redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0(REG,55)
    redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_backEN = "1") THEN
                redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_q <= STD_LOGIC_VECTOR(bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1(REG,56)
    redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN = "1") THEN
                redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_q <= STD_LOGIC_VECTOR(redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1(STALLENABLE,107)
    -- Valid signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_V0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_s_tv_0 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backStall and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_v_s_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_0_V0;
    -- Backward Stall generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backStall <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_v_s_0);
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_backEN = "0") THEN
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0 and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_s_tv_0;
            ELSE
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2(STALLREG,146)
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid <= (others => '0');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data0 <= (others => '-');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data1 <= (others => '-');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data2 <= (others => '-');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backStall and (SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid or SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_i_valid);

            IF (SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data0 <= STD_LOGIC_VECTOR(redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_q);
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data1 <= STD_LOGIC_VECTOR(redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1_q);
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data2 <= STD_LOGIC_VECTOR(redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1_q);
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data3 <= STD_LOGIC_VECTOR(redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_i_valid <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backStall <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid or not (SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_i_valid);

    -- Valid
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_V <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid = "1" ELSE SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_i_valid;

    -- Data0
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D0 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data0 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid = "1" ELSE redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_1_q;
    -- Data1
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D1 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data1 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid = "1" ELSE redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_1_q;
    -- Data2
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D2 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data2 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid = "1" ELSE redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_1_q;
    -- Data3
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D3 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_data3 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_r_valid = "1" ELSE redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_1_q;

    -- redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_2(REG,75)
    redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN = "1") THEN
                redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3(REG,76)
    redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN = "1") THEN
                redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3_q <= STD_LOGIC_VECTOR(redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_2(REG,69)
    redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN = "1") THEN
                redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3(REG,70)
    redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN = "1") THEN
                redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3_q <= STD_LOGIC_VECTOR(redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_2(REG,63)
    redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN = "1") THEN
                redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3(REG,64)
    redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN = "1") THEN
                redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3_q <= STD_LOGIC_VECTOR(redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2(REG,57)
    redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_backEN = "1") THEN
                redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3(REG,58)
    redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN = "1") THEN
                redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_q <= STD_LOGIC_VECTOR(redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3(STALLENABLE,109)
    -- Valid signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_V0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_s_tv_0 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backStall and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_v_s_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_2_V0;
    -- Backward Stall generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backStall <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_v_s_0);
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_backEN = "0") THEN
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0 and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_s_tv_0;
            ELSE
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4(STALLREG,147)
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid <= (others => '0');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data0 <= (others => '-');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data1 <= (others => '-');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data2 <= (others => '-');
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backStall and (SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid or SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_i_valid);

            IF (SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data0 <= STD_LOGIC_VECTOR(redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_q);
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data1 <= STD_LOGIC_VECTOR(redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3_q);
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data2 <= STD_LOGIC_VECTOR(redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3_q);
                SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data3 <= STD_LOGIC_VECTOR(redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_i_valid <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_V0;
    -- Stall signal propagation
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backStall <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid or not (SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_i_valid);

    -- Valid
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_V <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid = "1" ELSE SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_i_valid;

    -- Data0
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D0 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data0 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid = "1" ELSE redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_3_q;
    -- Data1
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D1 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data1 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid = "1" ELSE redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_3_q;
    -- Data2
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D2 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data2 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid = "1" ELSE redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_3_q;
    -- Data3
    SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D3 <= SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_data3 WHEN SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_r_valid = "1" ELSE redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_3_q;

    -- SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4(STALLENABLE,110)
    -- Valid signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_V0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0;
    -- Stall signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_s_tv_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backStall and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0;
    -- Backward Enable generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_v_s_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN and SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_V;
    -- Backward Stall generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backStall <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN);
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN = "0") THEN
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0 and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_s_tv_0;
            ELSE
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5(STALLENABLE,111)
    -- Valid signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_V0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0;
    -- Stall signal propagation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_s_tv_0 <= SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_backStall and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0;
    -- Backward Enable generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_v_s_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_V0;
    -- Backward Stall generation
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backStall <= not (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_v_s_0);
    SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN = "0") THEN
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0 and SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_s_tv_0;
            ELSE
                SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_R_v_0 <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x(BLACKBOX,14)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit13_0@7
    -- out out_c0_exit13_1@7
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    thei_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x : i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d
    PORT MAP (
        in_c0_eni19_0 => GND_q,
        in_c0_eni19_1 => bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b,
        in_i_stall => SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_backStall,
        in_i_valid => SE_out_maxpool2d_B1_merge_reg_aunroll_x_V1,
        in_output_size => in_output_size,
        out_c0_exit13_1 => i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_c0_exit13_1,
        out_o_stall => i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x(STALLENABLE,91)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_and0 <= i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_wireValid <= SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_V0 and SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_and0;

    -- leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x(BITSELECT,46)@7
    leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x_in <= redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q(30 downto 0);
    leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x_b <= leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid48_i_mul24_maxpool2d_maxpool2d16_shift_x(BITJOIN,47)@7
    leftShiftStage0Idx1_uid48_i_mul24_maxpool2d_maxpool2d16_shift_x_q <= leftShiftStage0Idx1Rng1_uid47_i_mul24_maxpool2d_maxpool2d16_shift_x_b & GND_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x(MUX,49)@7
    leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_s <= VCC_q;
    leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_combproc: PROCESS (leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_s, redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q, leftShiftStage0Idx1_uid48_i_mul24_maxpool2d_maxpool2d16_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_q <= redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q;
            WHEN "1" => leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_q <= leftShiftStage0Idx1_uid48_i_mul24_maxpool2d_maxpool2d16_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul24_maxpool2d_vt_select_31(BITSELECT,25)@7
    i_mul24_maxpool2d_vt_select_31_b <= leftShiftStage0_uid50_i_mul24_maxpool2d_maxpool2d16_shift_x_q(31 downto 1);

    -- i_mul24_maxpool2d_vt_join(BITJOIN,24)@7
    i_mul24_maxpool2d_vt_join_q <= i_mul24_maxpool2d_vt_select_31_b & GND_q;

    -- leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x(BITSELECT,37)@7
    leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x_in <= redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q(30 downto 0);
    leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x_b <= leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid39_i_mul22_maxpool2d_maxpool2d10_shift_x(BITJOIN,38)@7
    leftShiftStage0Idx1_uid39_i_mul22_maxpool2d_maxpool2d10_shift_x_q <= leftShiftStage0Idx1Rng1_uid38_i_mul22_maxpool2d_maxpool2d10_shift_x_b & GND_q;

    -- leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x(MUX,40)@7
    leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_s <= VCC_q;
    leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_combproc: PROCESS (leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_s, redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q, leftShiftStage0Idx1_uid39_i_mul22_maxpool2d_maxpool2d10_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_q <= redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q;
            WHEN "1" => leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_q <= leftShiftStage0Idx1_uid39_i_mul22_maxpool2d_maxpool2d10_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul22_maxpool2d_vt_select_31(BITSELECT,22)@7
    i_mul22_maxpool2d_vt_select_31_b <= leftShiftStage0_uid41_i_mul22_maxpool2d_maxpool2d10_shift_x_q(31 downto 1);

    -- i_mul22_maxpool2d_vt_join(BITJOIN,21)@7
    i_mul22_maxpool2d_vt_join_q <= i_mul22_maxpool2d_vt_select_31_b & GND_q;

    -- redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_4(REG,65)
    redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN = "1") THEN
                redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5(REG,66)
    redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN = "1") THEN
                redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q <= STD_LOGIC_VECTOR(redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4(REG,59)
    redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN = "1") THEN
                redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5(REG,60)
    redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN = "1") THEN
                redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q <= STD_LOGIC_VECTOR(redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_4(REG,77)
    redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN = "1") THEN
                redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_5(REG,78)
    redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN = "1") THEN
                redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_5_q <= STD_LOGIC_VECTOR(redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_4(REG,71)
    redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_backEN = "1") THEN
                redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_4_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_5(REG,72)
    redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_backEN = "1") THEN
                redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_5_q <= STD_LOGIC_VECTOR(redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x(BITJOIN,80)
    bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_q <= i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_out_c0_exit13_1;

    -- bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x(BITSELECT,81)
    bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_q(31 downto 0));

    -- dupName_0_sync_out_x(GPOUT,5)@7
    out_c0_exe114 <= bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_b;
    out_c0_exe12 <= redist2_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2_6_5_q;
    out_c1_exe16 <= redist3_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3_6_5_q;
    out_i_08 <= redist0_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0_6_5_q;
    out_j_16 <= redist1_maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1_6_5_q;
    out_mul22 <= i_mul22_maxpool2d_vt_join_q;
    out_mul24 <= i_mul24_maxpool2d_vt_join_q;
    out_valid_out <= SE_out_i_sfc_c0_for_cond12_preheader_lr_ph_maxpool2d_c0_enter10_maxpool2d_aunroll_x_V0;

    -- sync_out(GPOUT,32)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
