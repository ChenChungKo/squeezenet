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

-- VHDL created from bb_avgpool2d_B0_stall_region
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

entity bb_avgpool2d_B0_stall_region is
    port (
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_idx_ext : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_avgpool2d_B0_stall_region;

architecture normal of bb_avgpool2d_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component avgpool2d_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_mul_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_idx_ext_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_avgpool2d_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_avgpool2d_multconst_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_mul_avgpool2d_align_7_q : STD_LOGIC_VECTOR (39 downto 0);
    signal i_mul_avgpool2d_align_7_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal i_mul_avgpool2d_result_add_0_0_a : STD_LOGIC_VECTOR (40 downto 0);
    signal i_mul_avgpool2d_result_add_0_0_b : STD_LOGIC_VECTOR (40 downto 0);
    signal i_mul_avgpool2d_result_add_0_0_o : STD_LOGIC_VECTOR (40 downto 0);
    signal i_mul_avgpool2d_result_add_0_0_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_mul_avgpool2d_im0_shift0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul_avgpool2d_im0_shift0_qint : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul_avgpool2d_im0_add_1_a : STD_LOGIC_VECTOR (21 downto 0);
    signal i_mul_avgpool2d_im0_add_1_b : STD_LOGIC_VECTOR (21 downto 0);
    signal i_mul_avgpool2d_im0_add_1_o : STD_LOGIC_VECTOR (21 downto 0);
    signal i_mul_avgpool2d_im0_add_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_mul_avgpool2d_im0_shift2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_avgpool2d_im0_shift2_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_avgpool2d_im0_add_3_a : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul_avgpool2d_im0_add_3_b : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul_avgpool2d_im0_add_3_o : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul_avgpool2d_im0_add_3_q : STD_LOGIC_VECTOR (20 downto 0);
    signal i_mul_avgpool2d_im0_shift4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal i_mul_avgpool2d_im0_shift4_qint : STD_LOGIC_VECTOR (25 downto 0);
    signal i_mul_avgpool2d_im0_add_5_a : STD_LOGIC_VECTOR (26 downto 0);
    signal i_mul_avgpool2d_im0_add_5_b : STD_LOGIC_VECTOR (26 downto 0);
    signal i_mul_avgpool2d_im0_add_5_o : STD_LOGIC_VECTOR (26 downto 0);
    signal i_mul_avgpool2d_im0_add_5_q : STD_LOGIC_VECTOR (26 downto 0);
    signal i_mul_avgpool2d_im3_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul_avgpool2d_im3_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul_avgpool2d_im3_add_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_avgpool2d_im3_add_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_avgpool2d_im3_add_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_avgpool2d_im3_add_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_avgpool2d_im3_shift2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul_avgpool2d_im3_shift2_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_mul_avgpool2d_im3_add_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul_avgpool2d_im3_add_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul_avgpool2d_im3_add_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul_avgpool2d_im3_add_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_mul_avgpool2d_im3_shift4_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_mul_avgpool2d_im3_shift4_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_mul_avgpool2d_im3_add_5_a : STD_LOGIC_VECTOR (22 downto 0);
    signal i_mul_avgpool2d_im3_add_5_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_mul_avgpool2d_im3_add_5_o : STD_LOGIC_VECTOR (22 downto 0);
    signal i_mul_avgpool2d_im3_add_5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_mul_avgpool2d_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_avgpool2d_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_avgpool2d_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_avgpool2d_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_avgpool2d_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_mul_avgpool2d_im0_add_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,67)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= avgpool2d_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,59)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,60)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- avgpool2d_B0_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theavgpool2d_B0_merge_reg_aunroll_x : avgpool2d_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_avgpool2d_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => avgpool2d_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => avgpool2d_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_avgpool2d_B0_merge_reg_aunroll_x(STALLENABLE,63)
    -- Valid signal propagation
    SE_out_avgpool2d_B0_merge_reg_aunroll_x_V0 <= SE_out_avgpool2d_B0_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_avgpool2d_B0_merge_reg_aunroll_x_backStall <= SE_i_mul_avgpool2d_im0_add_1_backStall or not (SE_out_avgpool2d_B0_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_avgpool2d_B0_merge_reg_aunroll_x_wireValid <= avgpool2d_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_i_mul_avgpool2d_im0_add_1(STALLENABLE,72)
    -- Valid signal propagation
    SE_i_mul_avgpool2d_im0_add_1_V0 <= SE_i_mul_avgpool2d_im0_add_1_R_v_0;
    -- Stall signal propagation
    SE_i_mul_avgpool2d_im0_add_1_s_tv_0 <= SE_i_mul_avgpool2d_im0_add_5_backStall and SE_i_mul_avgpool2d_im0_add_1_R_v_0;
    -- Backward Enable generation
    SE_i_mul_avgpool2d_im0_add_1_backEN <= not (SE_i_mul_avgpool2d_im0_add_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_mul_avgpool2d_im0_add_1_v_s_0 <= SE_i_mul_avgpool2d_im0_add_1_backEN and SE_out_avgpool2d_B0_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_i_mul_avgpool2d_im0_add_1_backStall <= not (SE_i_mul_avgpool2d_im0_add_1_v_s_0);
    SE_i_mul_avgpool2d_im0_add_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_mul_avgpool2d_im0_add_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_1_backEN = "0") THEN
                SE_i_mul_avgpool2d_im0_add_1_R_v_0 <= SE_i_mul_avgpool2d_im0_add_1_R_v_0 and SE_i_mul_avgpool2d_im0_add_1_s_tv_0;
            ELSE
                SE_i_mul_avgpool2d_im0_add_1_R_v_0 <= SE_i_mul_avgpool2d_im0_add_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_mul_avgpool2d_im0_add_5(STALLENABLE,76)
    -- Valid signal propagation
    SE_i_mul_avgpool2d_im0_add_5_V0 <= SE_i_mul_avgpool2d_im0_add_5_R_v_0;
    -- Stall signal propagation
    SE_i_mul_avgpool2d_im0_add_5_s_tv_0 <= SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backStall and SE_i_mul_avgpool2d_im0_add_5_R_v_0;
    -- Backward Enable generation
    SE_i_mul_avgpool2d_im0_add_5_backEN <= not (SE_i_mul_avgpool2d_im0_add_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_mul_avgpool2d_im0_add_5_v_s_0 <= SE_i_mul_avgpool2d_im0_add_5_backEN and SE_i_mul_avgpool2d_im0_add_1_V0;
    -- Backward Stall generation
    SE_i_mul_avgpool2d_im0_add_5_backStall <= not (SE_i_mul_avgpool2d_im0_add_5_v_s_0);
    SE_i_mul_avgpool2d_im0_add_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_mul_avgpool2d_im0_add_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_5_backEN = "0") THEN
                SE_i_mul_avgpool2d_im0_add_5_R_v_0 <= SE_i_mul_avgpool2d_im0_add_5_R_v_0 and SE_i_mul_avgpool2d_im0_add_5_s_tv_0;
            ELSE
                SE_i_mul_avgpool2d_im0_add_5_R_v_0 <= SE_i_mul_avgpool2d_im0_add_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0(STALLENABLE,84)
    -- Valid signal propagation
    SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_V0 <= SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_s_tv_0 <= in_stall_in and SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backEN <= not (SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_v_s_0 <= SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backEN and SE_i_mul_avgpool2d_im0_add_5_V0;
    -- Backward Stall generation
    SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backStall <= not (SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_v_s_0);
    SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0 <= SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0 and SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_R_v_0 <= SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_mul_avgpool2d_multconst_x(CONSTANT,9)
    i_mul_avgpool2d_multconst_x_q <= "000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_mul_avgpool2d_im3_shift2(BITSHIFT,44)@1
    i_mul_avgpool2d_im3_shift2_qint <= i_mul_avgpool2d_bs1_merged_bit_select_c & "00";
    i_mul_avgpool2d_im3_shift2_q <= i_mul_avgpool2d_im3_shift2_qint(15 downto 0);

    -- bubble_join_avgpool2d_B0_merge_reg_aunroll_x(BITJOIN,56)
    bubble_join_avgpool2d_B0_merge_reg_aunroll_x_q <= avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_avgpool2d_B0_merge_reg_aunroll_x(BITSELECT,57)
    bubble_select_avgpool2d_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- i_mul_avgpool2d_bs1_merged_bit_select(BITSELECT,48)@1
    i_mul_avgpool2d_bs1_merged_bit_select_b <= bubble_select_avgpool2d_B0_merge_reg_aunroll_x_b(17 downto 0);
    i_mul_avgpool2d_bs1_merged_bit_select_c <= bubble_select_avgpool2d_B0_merge_reg_aunroll_x_b(31 downto 18);

    -- i_mul_avgpool2d_im3_add_3(ADD,45)@1 + 1
    i_mul_avgpool2d_im3_add_3_a <= STD_LOGIC_VECTOR("000" & i_mul_avgpool2d_bs1_merged_bit_select_c);
    i_mul_avgpool2d_im3_add_3_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_im3_shift2_q);
    i_mul_avgpool2d_im3_add_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_avgpool2d_im3_add_3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_1_backEN = "1") THEN
                i_mul_avgpool2d_im3_add_3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_im3_add_3_a) + UNSIGNED(i_mul_avgpool2d_im3_add_3_b));
            END IF;
        END IF;
    END PROCESS;
    i_mul_avgpool2d_im3_add_3_q <= i_mul_avgpool2d_im3_add_3_o(16 downto 0);

    -- i_mul_avgpool2d_im3_shift4(BITSHIFT,46)@2
    i_mul_avgpool2d_im3_shift4_qint <= i_mul_avgpool2d_im3_add_3_q & "00000";
    i_mul_avgpool2d_im3_shift4_q <= i_mul_avgpool2d_im3_shift4_qint(21 downto 0);

    -- i_mul_avgpool2d_im3_shift0(BITSHIFT,42)@1
    i_mul_avgpool2d_im3_shift0_qint <= i_mul_avgpool2d_bs1_merged_bit_select_c & "000";
    i_mul_avgpool2d_im3_shift0_q <= i_mul_avgpool2d_im3_shift0_qint(16 downto 0);

    -- i_mul_avgpool2d_im3_add_1(ADD,43)@1 + 1
    i_mul_avgpool2d_im3_add_1_a <= STD_LOGIC_VECTOR("0000" & i_mul_avgpool2d_bs1_merged_bit_select_c);
    i_mul_avgpool2d_im3_add_1_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_im3_shift0_q);
    i_mul_avgpool2d_im3_add_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_avgpool2d_im3_add_1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_1_backEN = "1") THEN
                i_mul_avgpool2d_im3_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_im3_add_1_a) + UNSIGNED(i_mul_avgpool2d_im3_add_1_b));
            END IF;
        END IF;
    END PROCESS;
    i_mul_avgpool2d_im3_add_1_q <= i_mul_avgpool2d_im3_add_1_o(17 downto 0);

    -- i_mul_avgpool2d_im3_add_5(ADD,47)@2 + 1
    i_mul_avgpool2d_im3_add_5_a <= STD_LOGIC_VECTOR("00000" & i_mul_avgpool2d_im3_add_1_q);
    i_mul_avgpool2d_im3_add_5_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_im3_shift4_q);
    i_mul_avgpool2d_im3_add_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_avgpool2d_im3_add_5_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_5_backEN = "1") THEN
                i_mul_avgpool2d_im3_add_5_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_im3_add_5_a) + UNSIGNED(i_mul_avgpool2d_im3_add_5_b));
            END IF;
        END IF;
    END PROCESS;
    i_mul_avgpool2d_im3_add_5_q <= i_mul_avgpool2d_im3_add_5_o(22 downto 0);

    -- i_mul_avgpool2d_align_7(BITSHIFT,33)@3
    i_mul_avgpool2d_align_7_qint <= i_mul_avgpool2d_im3_add_5_q(21 downto 0) & "000000000000000000";
    i_mul_avgpool2d_align_7_q <= i_mul_avgpool2d_align_7_qint(39 downto 0);

    -- i_mul_avgpool2d_im0_shift2(BITSHIFT,38)@1
    i_mul_avgpool2d_im0_shift2_qint <= i_mul_avgpool2d_bs1_merged_bit_select_b & "00";
    i_mul_avgpool2d_im0_shift2_q <= i_mul_avgpool2d_im0_shift2_qint(19 downto 0);

    -- i_mul_avgpool2d_im0_add_3(ADD,39)@1 + 1
    i_mul_avgpool2d_im0_add_3_a <= STD_LOGIC_VECTOR("000" & i_mul_avgpool2d_bs1_merged_bit_select_b);
    i_mul_avgpool2d_im0_add_3_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_im0_shift2_q);
    i_mul_avgpool2d_im0_add_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_avgpool2d_im0_add_3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_1_backEN = "1") THEN
                i_mul_avgpool2d_im0_add_3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_im0_add_3_a) + UNSIGNED(i_mul_avgpool2d_im0_add_3_b));
            END IF;
        END IF;
    END PROCESS;
    i_mul_avgpool2d_im0_add_3_q <= i_mul_avgpool2d_im0_add_3_o(20 downto 0);

    -- i_mul_avgpool2d_im0_shift4(BITSHIFT,40)@2
    i_mul_avgpool2d_im0_shift4_qint <= i_mul_avgpool2d_im0_add_3_q & "00000";
    i_mul_avgpool2d_im0_shift4_q <= i_mul_avgpool2d_im0_shift4_qint(25 downto 0);

    -- i_mul_avgpool2d_im0_shift0(BITSHIFT,36)@1
    i_mul_avgpool2d_im0_shift0_qint <= i_mul_avgpool2d_bs1_merged_bit_select_b & "000";
    i_mul_avgpool2d_im0_shift0_q <= i_mul_avgpool2d_im0_shift0_qint(20 downto 0);

    -- i_mul_avgpool2d_im0_add_1(ADD,37)@1 + 1
    i_mul_avgpool2d_im0_add_1_a <= STD_LOGIC_VECTOR("0000" & i_mul_avgpool2d_bs1_merged_bit_select_b);
    i_mul_avgpool2d_im0_add_1_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_im0_shift0_q);
    i_mul_avgpool2d_im0_add_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_avgpool2d_im0_add_1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_1_backEN = "1") THEN
                i_mul_avgpool2d_im0_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_im0_add_1_a) + UNSIGNED(i_mul_avgpool2d_im0_add_1_b));
            END IF;
        END IF;
    END PROCESS;
    i_mul_avgpool2d_im0_add_1_q <= i_mul_avgpool2d_im0_add_1_o(21 downto 0);

    -- i_mul_avgpool2d_im0_add_5(ADD,41)@2 + 1
    i_mul_avgpool2d_im0_add_5_a <= STD_LOGIC_VECTOR("00000" & i_mul_avgpool2d_im0_add_1_q);
    i_mul_avgpool2d_im0_add_5_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_im0_shift4_q);
    i_mul_avgpool2d_im0_add_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_avgpool2d_im0_add_5_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_5_backEN = "1") THEN
                i_mul_avgpool2d_im0_add_5_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_im0_add_5_a) + UNSIGNED(i_mul_avgpool2d_im0_add_5_b));
            END IF;
        END IF;
    END PROCESS;
    i_mul_avgpool2d_im0_add_5_q <= i_mul_avgpool2d_im0_add_5_o(26 downto 0);

    -- i_mul_avgpool2d_result_add_0_0(ADD,35)@3
    i_mul_avgpool2d_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000000" & i_mul_avgpool2d_im0_add_5_q);
    i_mul_avgpool2d_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_mul_avgpool2d_align_7_q);
    i_mul_avgpool2d_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul_avgpool2d_result_add_0_0_a) + UNSIGNED(i_mul_avgpool2d_result_add_0_0_b));
    i_mul_avgpool2d_result_add_0_0_q <= i_mul_avgpool2d_result_add_0_0_o(40 downto 0);

    -- i_mul_avgpool2d_extender_x(BITJOIN,8)@3
    i_mul_avgpool2d_extender_x_q <= i_mul_avgpool2d_multconst_x_q & i_mul_avgpool2d_result_add_0_0_q(39 downto 0);

    -- bgTrunc_i_mul_avgpool2d_sel_x(BITSELECT,3)@3
    bgTrunc_i_mul_avgpool2d_sel_x_b <= i_mul_avgpool2d_extender_x_q(31 downto 0);

    -- redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0(REG,51)
    redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_mul_avgpool2d_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_idx_ext_avgpool2d_sel_x(BITSELECT,7)@4
    i_idx_ext_avgpool2d_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_q(31 downto 0)), 64)));

    -- redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_0(REG,52)
    redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_1_backEN = "1") THEN
                redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_0_q <= STD_LOGIC_VECTOR(bubble_select_avgpool2d_B0_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_1(REG,53)
    redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_mul_avgpool2d_im0_add_5_backEN = "1") THEN
                redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_1_q <= STD_LOGIC_VECTOR(redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_2(REG,54)
    redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_2_q <= STD_LOGIC_VECTOR(redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,6)@4
    out_global_id_0 <= redist1_avgpool2d_B0_merge_reg_aunroll_x_out_data_out_0_3_2_q;
    out_idx_ext <= i_idx_ext_avgpool2d_sel_x_b;
    out_valid_out <= SE_redist0_bgTrunc_i_mul_avgpool2d_sel_x_b_1_0_V0;

    -- sync_out(GPOUT,23)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
