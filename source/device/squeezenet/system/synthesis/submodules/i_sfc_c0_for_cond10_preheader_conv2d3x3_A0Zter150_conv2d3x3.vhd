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

-- VHDL created from i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3
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

entity i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3 is
    port (
        in_c0_eni4_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni4_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit153_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit153_16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3;

architecture normal of i_sfc_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x369 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345 is
        port (
            in_c0_eni4_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni4_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi16_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi16_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi16_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,11)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,10)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x(BLACKBOX,9)@1
    -- out out_c0_exi16_0@10
    -- out out_c0_exi16_1@10
    -- out out_c0_exi16_2@10
    -- out out_c0_exi16_3@10
    -- out out_c0_exi16_4@10
    -- out out_c0_exi16_5@10
    -- out out_c0_exi16_6@10
    -- out out_c0_exi16_7@10
    -- out out_c0_exi16_8@10
    -- out out_c0_exi16_9@10
    -- out out_c0_exi16_10@10
    -- out out_c0_exi16_11@10
    -- out out_c0_exi16_12@10
    -- out out_c0_exi16_13@10
    -- out out_c0_exi16_14@10
    -- out out_c0_exi16_15@10
    -- out out_c0_exi16_16@10
    -- out out_o_valid@10
    thei_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x : i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345
    PORT MAP (
        in_c0_eni4_0 => in_c0_eni4_0,
        in_c0_eni4_1 => in_c0_eni4_1,
        in_c0_eni4_2 => in_c0_eni4_2,
        in_c0_eni4_3 => in_c0_eni4_3,
        in_c0_eni4_4 => in_c0_eni4_4,
        in_i_valid => input_accepted_and_q,
        in_input_channels => in_input_channels,
        in_input_size => in_input_size,
        in_output_size => in_output_size,
        in_pad => in_pad,
        in_stride => in_stride,
        out_c0_exi16_0 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_0,
        out_c0_exi16_1 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_1,
        out_c0_exi16_2 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_2,
        out_c0_exi16_3 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_3,
        out_c0_exi16_4 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_4,
        out_c0_exi16_5 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_5,
        out_c0_exi16_6 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_6,
        out_c0_exi16_7 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_7,
        out_c0_exi16_8 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_8,
        out_c0_exi16_9 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_9,
        out_c0_exi16_10 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_10,
        out_c0_exi16_11 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_11,
        out_c0_exi16_12 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_12,
        out_c0_exi16_13 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_13,
        out_c0_exi16_14 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_14,
        out_c0_exi16_15 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_15,
        out_c0_exi16_16 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_16,
        out_o_valid => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x(BLACKBOX,8)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_data_out_14@20000003
    -- out out_data_out_15@20000003
    -- out out_data_out_16@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x : i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x369
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_0,
        in_data_in_1 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_1,
        in_data_in_2 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_2,
        in_data_in_3 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_3,
        in_data_in_4 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_4,
        in_data_in_5 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_5,
        in_data_in_6 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_6,
        in_data_in_7 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_7,
        in_data_in_8 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_8,
        in_data_in_9 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_9,
        in_data_in_10 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_10,
        in_data_in_11 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_11,
        in_data_in_12 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_12,
        in_data_in_13 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_13,
        in_data_in_14 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_14,
        in_data_in_15 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_15,
        in_data_in_16 => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_c0_exi16_16,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_cond10_preheader_conv2d3x3_c0_enter150_conv2d3x345_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_16,
        out_stall_entry => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@13
    out_c0_exit153_0 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_0;
    out_c0_exit153_1 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_1;
    out_c0_exit153_2 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_2;
    out_c0_exit153_3 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_3;
    out_c0_exit153_4 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_4;
    out_c0_exit153_5 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_5;
    out_c0_exit153_6 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_6;
    out_c0_exit153_7 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_7;
    out_c0_exit153_8 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_8;
    out_c0_exit153_9 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_9;
    out_c0_exit153_10 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_10;
    out_c0_exit153_11 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_11;
    out_c0_exit153_12 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_12;
    out_c0_exit153_13 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_13;
    out_c0_exit153_14 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_14;
    out_c0_exit153_15 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_15;
    out_c0_exit153_16 <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_data_out_16;
    out_o_valid <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,14)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3_aunroll_x_out_stall_entry;

END normal;
