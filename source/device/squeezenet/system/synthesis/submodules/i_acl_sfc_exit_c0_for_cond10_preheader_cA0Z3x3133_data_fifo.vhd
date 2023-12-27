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

-- VHDL created from i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3133_data_fifo
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

entity i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3133_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3133_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3133_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 192;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(191 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(191 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_8_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_8_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_8_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_11_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_11_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_11_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_12_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_12_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_12_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_13_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_13_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_13_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_14_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_14_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_14_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i24_0gr_q : STD_LOGIC_VECTOR (23 downto 0);
    signal c_i8_0gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (191 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_in : STD_LOGIC_VECTOR (191 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out : STD_LOGIC_VECTOR (191 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i8_0gr(CONSTANT,68)
    c_i8_0gr_q <= "00000000";

    -- dupName_0_c_i7_0gr_x(CONSTANT,5)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_14_element_extension_x(BITJOIN,62)
    dupName_14_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_16;

    -- dupName_13_element_extension_x(BITJOIN,58)
    dupName_13_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_15;

    -- dupName_12_element_extension_x(BITJOIN,54)
    dupName_12_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_14;

    -- dupName_11_element_extension_x(BITJOIN,50)
    dupName_11_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_13;

    -- dupName_10_element_extension_x(BITJOIN,46)
    dupName_10_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_12;

    -- dupName_9_element_extension_x(BITJOIN,42)
    dupName_9_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_11;

    -- dupName_8_element_extension_x(BITJOIN,38)
    dupName_8_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_10;

    -- dupName_7_element_extension_x(BITJOIN,34)
    dupName_7_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_9;

    -- dupName_6_element_extension_x(BITJOIN,30)
    dupName_6_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_8;

    -- dupName_5_element_extension_x(BITJOIN,26)
    dupName_5_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_7;

    -- dupName_4_element_extension_x(BITJOIN,22)
    dupName_4_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_6;

    -- dupName_3_element_extension_x(BITJOIN,18)
    dupName_3_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_5;

    -- dupName_2_element_extension_x(BITJOIN,14)
    dupName_2_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_4;

    -- dupName_1_element_extension_x(BITJOIN,10)
    dupName_1_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_3;

    -- dupName_0_element_extension_x(BITJOIN,6)
    dupName_0_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_2;

    -- c_i24_0gr(CONSTANT,66)
    c_i24_0gr_q <= "000000000000000000000000";

    -- element_extension(BITJOIN,70)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,69)
    dsdk_ip_adapt_bitjoin_q <= c_i8_0gr_q & dupName_14_element_extension_x_q & dupName_13_element_extension_x_q & dupName_12_element_extension_x_q & dupName_11_element_extension_x_q & dupName_10_element_extension_x_q & dupName_9_element_extension_x_q & dupName_8_element_extension_x_q & dupName_7_element_extension_x_q & dupName_6_element_extension_x_q & dupName_5_element_extension_x_q & dupName_4_element_extension_x_q & dupName_3_element_extension_x_q & dupName_2_element_extension_x_q & dupName_1_element_extension_x_q & dupName_0_element_extension_x_q & in_data_in_1 & c_i24_0gr_q & element_extension_q;

    -- i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134(EXTIFACE,71)
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_in(0);
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_in(0);
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_out(0) <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_out(0) <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 16,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 192,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out,
        stall_out => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(176 downto 176);

    -- dupName_14_adapt_scalar_trunc_x(ROUND,60)
    dupName_14_adapt_scalar_trunc_x_in <= dupName_15_ip_dsdk_adapt_bitselect_x_b;
    dupName_14_adapt_scalar_trunc_x_q <= dupName_14_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,63)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(168 downto 168);

    -- dupName_13_adapt_scalar_trunc_x(ROUND,56)
    dupName_13_adapt_scalar_trunc_x_in <= dupName_14_ip_dsdk_adapt_bitselect_x_b;
    dupName_13_adapt_scalar_trunc_x_q <= dupName_13_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,59)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(160 downto 160);

    -- dupName_12_adapt_scalar_trunc_x(ROUND,52)
    dupName_12_adapt_scalar_trunc_x_in <= dupName_13_ip_dsdk_adapt_bitselect_x_b;
    dupName_12_adapt_scalar_trunc_x_q <= dupName_12_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,55)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(152 downto 152);

    -- dupName_11_adapt_scalar_trunc_x(ROUND,48)
    dupName_11_adapt_scalar_trunc_x_in <= dupName_12_ip_dsdk_adapt_bitselect_x_b;
    dupName_11_adapt_scalar_trunc_x_q <= dupName_11_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,51)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(144 downto 144);

    -- dupName_10_adapt_scalar_trunc_x(ROUND,44)
    dupName_10_adapt_scalar_trunc_x_in <= dupName_11_ip_dsdk_adapt_bitselect_x_b;
    dupName_10_adapt_scalar_trunc_x_q <= dupName_10_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,47)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(136 downto 136);

    -- dupName_9_adapt_scalar_trunc_x(ROUND,40)
    dupName_9_adapt_scalar_trunc_x_in <= dupName_10_ip_dsdk_adapt_bitselect_x_b;
    dupName_9_adapt_scalar_trunc_x_q <= dupName_9_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,43)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(128 downto 128);

    -- dupName_8_adapt_scalar_trunc_x(ROUND,36)
    dupName_8_adapt_scalar_trunc_x_in <= dupName_9_ip_dsdk_adapt_bitselect_x_b;
    dupName_8_adapt_scalar_trunc_x_q <= dupName_8_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(120 downto 120);

    -- dupName_7_adapt_scalar_trunc_x(ROUND,32)
    dupName_7_adapt_scalar_trunc_x_in <= dupName_8_ip_dsdk_adapt_bitselect_x_b;
    dupName_7_adapt_scalar_trunc_x_q <= dupName_7_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,35)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(112 downto 112);

    -- dupName_6_adapt_scalar_trunc_x(ROUND,28)
    dupName_6_adapt_scalar_trunc_x_in <= dupName_7_ip_dsdk_adapt_bitselect_x_b;
    dupName_6_adapt_scalar_trunc_x_q <= dupName_6_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,31)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(104 downto 104);

    -- dupName_5_adapt_scalar_trunc_x(ROUND,24)
    dupName_5_adapt_scalar_trunc_x_in <= dupName_6_ip_dsdk_adapt_bitselect_x_b;
    dupName_5_adapt_scalar_trunc_x_q <= dupName_5_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,27)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(96 downto 96);

    -- dupName_4_adapt_scalar_trunc_x(ROUND,20)
    dupName_4_adapt_scalar_trunc_x_in <= dupName_5_ip_dsdk_adapt_bitselect_x_b;
    dupName_4_adapt_scalar_trunc_x_q <= dupName_4_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,23)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(88 downto 88);

    -- dupName_3_adapt_scalar_trunc_x(ROUND,16)
    dupName_3_adapt_scalar_trunc_x_in <= dupName_4_ip_dsdk_adapt_bitselect_x_b;
    dupName_3_adapt_scalar_trunc_x_q <= dupName_3_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,19)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(80 downto 80);

    -- dupName_2_adapt_scalar_trunc_x(ROUND,12)
    dupName_2_adapt_scalar_trunc_x_in <= dupName_3_ip_dsdk_adapt_bitselect_x_b;
    dupName_2_adapt_scalar_trunc_x_q <= dupName_2_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,15)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(72 downto 72);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,8)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_2_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,11)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(64 downto 64);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_1_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,7)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(63 downto 32);

    -- ip_dsdk_adapt_cast(BITSELECT,73)
    ip_dsdk_adapt_cast_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,72)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,65)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= ip_dsdk_adapt_cast_b;
    out_data_out_2 <= dupName_0_adapt_scalar_trunc_x_q;
    out_data_out_3 <= dupName_1_adapt_scalar_trunc_x_q;
    out_data_out_4 <= dupName_2_adapt_scalar_trunc_x_q;
    out_data_out_5 <= dupName_3_adapt_scalar_trunc_x_q;
    out_data_out_6 <= dupName_4_adapt_scalar_trunc_x_q;
    out_data_out_7 <= dupName_5_adapt_scalar_trunc_x_q;
    out_data_out_8 <= dupName_6_adapt_scalar_trunc_x_q;
    out_data_out_9 <= dupName_7_adapt_scalar_trunc_x_q;
    out_data_out_10 <= dupName_8_adapt_scalar_trunc_x_q;
    out_data_out_11 <= dupName_9_adapt_scalar_trunc_x_q;
    out_data_out_12 <= dupName_10_adapt_scalar_trunc_x_q;
    out_data_out_13 <= dupName_11_adapt_scalar_trunc_x_q;
    out_data_out_14 <= dupName_12_adapt_scalar_trunc_x_q;
    out_data_out_15 <= dupName_13_adapt_scalar_trunc_x_q;
    out_data_out_16 <= dupName_14_adapt_scalar_trunc_x_q;
    out_valid_out <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_valid_out;

    -- sync_out(GPOUT,75)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_cond10_preheader_conv2d3x3_c0_exit153_conv2d3x3134_stall_out;

END normal;
