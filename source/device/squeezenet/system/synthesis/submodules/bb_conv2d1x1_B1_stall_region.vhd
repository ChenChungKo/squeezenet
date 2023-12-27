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

-- VHDL created from bb_conv2d1x1_B1_stall_region
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

entity bb_conv2d1x1_B1_stall_region is
    port (
        in_c0_exe12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe29 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe110 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_010 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d1x11 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_add : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe29 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe110 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_010 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B1_stall_region;

architecture normal of bb_conv2d1x1_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d1x1_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bgTrunc_i_add_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_bgTrunc_i_add_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,42)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d1x1_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,35)
    bubble_join_stall_entry_q <= in_unnamed_conv2d1x11 & in_j_010 & in_c2_exe110 & in_c1_exe29 & in_c1_exe15 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,36)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 224));

    -- conv2d1x1_B1_merge_reg_aunroll_x(BLACKBOX,3)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d1x1_B1_merge_reg_aunroll_x : conv2d1x1_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_f,
        in_data_in_1 => bubble_select_stall_entry_b,
        in_data_in_2 => bubble_select_stall_entry_c,
        in_data_in_3 => bubble_select_stall_entry_d,
        in_data_in_4 => bubble_select_stall_entry_e,
        in_data_in_5 => bubble_select_stall_entry_g,
        in_stall_in => SE_out_conv2d1x1_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5,
        out_stall_out => conv2d1x1_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d1x1_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d1x1_B1_merge_reg_aunroll_x(STALLENABLE,40)
    -- Valid signal propagation
    SE_out_conv2d1x1_B1_merge_reg_aunroll_x_V0 <= SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_conv2d1x1_B1_merge_reg_aunroll_x_backStall <= SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backStall or not (SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid <= conv2d1x1_B1_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0(STALLENABLE,44)
    -- Valid signal propagation
    SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V0 <= SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0 <= in_stall_in and SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN <= not (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0 <= SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN and SE_out_conv2d1x1_B1_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backStall <= not (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0);
    SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "0") THEN
                SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 and SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_s_tv_0;
            ELSE
                SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_R_v_0 <= SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_conv2d1x1_B1_merge_reg_aunroll_x(BITJOIN,32)
    bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q <= conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d1x1_B1_merge_reg_aunroll_x(BITSELECT,33)
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(95 downto 32));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(127 downto 96));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(191 downto 128));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(223 downto 192));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(255 downto 224));

    -- redist5_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5_1_0(REG,29)
    redist5_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist5_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5_1_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0(REG,24)
    redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4_1_0(REG,28)
    redist4_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist4_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3_1_0(REG,27)
    redist3_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist3_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3_1_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2_1_0(REG,26)
    redist2_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist2_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1_1_0(REG,25)
    redist1_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist1_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- i_add_conv2d1x1(ADD,9)@1
    i_add_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b);
    i_add_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f);
    i_add_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_conv2d1x1_a) + UNSIGNED(i_add_conv2d1x1_b));
    i_add_conv2d1x1_q <= i_add_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add_conv2d1x1_sel_x(BITSELECT,2)@1
    bgTrunc_i_add_conv2d1x1_sel_x_b <= i_add_conv2d1x1_q(31 downto 0);

    -- redist6_bgTrunc_i_add_conv2d1x1_sel_x_b_1_0(REG,30)
    redist6_bgTrunc_i_add_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_bgTrunc_i_add_conv2d1x1_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_backEN = "1") THEN
                redist6_bgTrunc_i_add_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_add_conv2d1x1_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,5)@2
    out_add <= redist6_bgTrunc_i_add_conv2d1x1_sel_x_b_1_0_q;
    out_c0_exe12 <= redist1_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q;
    out_c1_exe15 <= redist2_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2_1_0_q;
    out_c1_exe29 <= redist3_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3_1_0_q;
    out_c2_exe110 <= redist4_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4_1_0_q;
    out_j_010 <= redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_q;
    out_unnamed_conv2d1x11 <= redist5_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5_1_0_q;
    out_valid_out <= SE_redist0_conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0_1_0_V0;

    -- sync_out(GPOUT,15)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
