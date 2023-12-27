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

-- VHDL created from i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3
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

entity i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3 is
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
        out_c1_exit175_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit175_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3;

architecture normal of i_sfc_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3109 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107 is
        port (
            in_c1_eni14_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_9 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_13 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_15 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni14_16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni14_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni14_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_19 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_22 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_23 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_24 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_29 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_30 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_31 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni14_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni14_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni14_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exi1174_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exi1174_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_c1_exi1174_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_c1_exi1174_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,7)
    not_stall_out_q <= not (i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,6)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x(BLACKBOX,5)@252
    -- out out_c1_exi1174_0@395
    -- out out_c1_exi1174_1@395
    -- out out_o_valid@395
    thei_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x : i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107
    PORT MAP (
        in_c1_eni14_0 => in_c1_eni14_0,
        in_c1_eni14_1 => in_c1_eni14_1,
        in_c1_eni14_2 => in_c1_eni14_2,
        in_c1_eni14_3 => in_c1_eni14_3,
        in_c1_eni14_4 => in_c1_eni14_4,
        in_c1_eni14_5 => in_c1_eni14_5,
        in_c1_eni14_6 => in_c1_eni14_6,
        in_c1_eni14_7 => in_c1_eni14_7,
        in_c1_eni14_8 => in_c1_eni14_8,
        in_c1_eni14_9 => in_c1_eni14_9,
        in_c1_eni14_10 => in_c1_eni14_10,
        in_c1_eni14_11 => in_c1_eni14_11,
        in_c1_eni14_12 => in_c1_eni14_12,
        in_c1_eni14_13 => in_c1_eni14_13,
        in_c1_eni14_14 => in_c1_eni14_14,
        in_c1_eni14_15 => in_c1_eni14_15,
        in_c1_eni14_16 => in_c1_eni14_16,
        in_c1_eni14_17 => in_c1_eni14_17,
        in_c1_eni14_18 => in_c1_eni14_18,
        in_c1_eni14_19 => in_c1_eni14_19,
        in_c1_eni14_20 => in_c1_eni14_20,
        in_c1_eni14_21 => in_c1_eni14_21,
        in_c1_eni14_22 => in_c1_eni14_22,
        in_c1_eni14_23 => in_c1_eni14_23,
        in_c1_eni14_24 => in_c1_eni14_24,
        in_c1_eni14_25 => in_c1_eni14_25,
        in_c1_eni14_26 => in_c1_eni14_26,
        in_c1_eni14_27 => in_c1_eni14_27,
        in_c1_eni14_28 => in_c1_eni14_28,
        in_c1_eni14_29 => in_c1_eni14_29,
        in_c1_eni14_30 => in_c1_eni14_30,
        in_c1_eni14_31 => in_c1_eni14_31,
        in_c1_eni14_32 => in_c1_eni14_32,
        in_c1_eni14_33 => in_c1_eni14_33,
        in_c1_eni14_34 => in_c1_eni14_34,
        in_c1_eni14_35 => in_c1_eni14_35,
        in_i_valid => input_accepted_and_q,
        out_c1_exi1174_0 => i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_c1_exi1174_0,
        out_c1_exi1174_1 => i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_c1_exi1174_1,
        out_o_valid => i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x(BLACKBOX,4)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x : i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3109
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_c1_exi1174_0,
        in_data_in_1 => i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_c1_exi1174_1,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c1_for_cond15_preheader_conv2d3x3_c1_enter172_conv2d3x3107_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_data_out_1,
        out_stall_entry => i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@398
    out_c1_exit175_0 <= i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_data_out_0;
    out_c1_exit175_1 <= i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_data_out_1;
    out_o_valid <= i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,9)@20000000
    out_o_stall <= i_acl_sfc_exit_c1_for_cond15_preheader_conv2d3x3_c1_exit175_conv2d3x3_aunroll_x_out_stall_entry;

END normal;
