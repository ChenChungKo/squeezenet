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

-- VHDL created from bb_conv2d1x1_B0_stall_region
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

entity bb_conv2d1x1_B0_stall_region is
    port (
        in_lsu_unnamed_conv2d1x10_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x10 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_conv2d1x10_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x10_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B0_stall_region;

architecture normal of bb_conv2d1x1_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d1x1_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1 is
        port (
            in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1 is
        port (
            in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1 is
        port (
            in_c2_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_eni1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x10_conv2d1x118 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d1x10_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d1x10_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_bias_sync_buffer_conv2d1x15 is
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


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;



    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_conv2d1x1_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (95 downto 0);
    signal bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x10_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x10_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_D0 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_multconst_x(CONSTANT,24)
    i_arrayidx_conv2d1x1_conv2d1x117_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1(STALLENABLE,165)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_backStall <= i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_stall_out or not (SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_wireValid <= bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_out;

    -- bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg(STALLFIFO,200)
    bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V0;
    bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_backStall;
    bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 6,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,135)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d1x1_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,115)
    bubble_join_stall_entry_q <= in_global_id_1 & in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,116)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));

    -- conv2d1x1_B0_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d1x1_B0_merge_reg_aunroll_x : conv2d1x1_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_data_in_1 => bubble_select_stall_entry_c,
        in_stall_in => SE_out_conv2d1x1_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1,
        out_stall_out => conv2d1x1_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d1x1_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d1x1_B0_merge_reg_aunroll_x(STALLENABLE,119)
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed1 <= (not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backStall) and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed2 <= (not (i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_o_stall) and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg2;
    -- Consuming
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_StallValid <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_backStall and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_or0 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_or1 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed1 and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_or0;
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d1x1_B0_merge_reg_aunroll_x_consumed2 and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_or1);
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_backStall <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V0 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V1 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V2 <= SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B0_merge_reg_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_conv2d1x1_B0_merge_reg_aunroll_x_wireValid <= conv2d1x1_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0(STALLENABLE,152)
    -- Valid signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_V0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backStall and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backEN <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backEN and SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backStall <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0);
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "0") THEN
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_s_tv_0;
            ELSE
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_conv2d1x1_B0_merge_reg_aunroll_x(BITJOIN,92)
    bubble_join_conv2d1x1_B0_merge_reg_aunroll_x_q <= conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1 & conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d1x1_B0_merge_reg_aunroll_x(BITSELECT,93)
    bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B0_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B0_merge_reg_aunroll_x_q(63 downto 32));

    -- redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_0(REG,87)
    redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "1") THEN
                redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1(REG,88)
    redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "1") THEN
                redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1_q <= STD_LOGIC_VECTOR(redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0(REG,83)
    redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_backEN = "1") THEN
                redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1(REG,84)
    redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "1") THEN
                redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_q <= STD_LOGIC_VECTOR(redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1(STALLENABLE,153)
    -- Valid signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_V0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0 <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backStall and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backEN <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backEN and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_0_V0;
    -- Backward Stall generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backStall <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0);
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_backEN = "0") THEN
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_s_tv_0;
            ELSE
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2(STALLREG,202)
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid <= (others => '0');
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data0 <= (others => '-');
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backStall and (SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid or SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_i_valid);

            IF (SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data0 <= STD_LOGIC_VECTOR(redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_q);
                SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data1 <= STD_LOGIC_VECTOR(redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_i_valid <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_V0;
    -- Stall signal propagation
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backStall <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid or not (SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_i_valid);

    -- Valid
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_V <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid WHEN SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid = "1" ELSE SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_i_valid;

    -- Data0
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_D0 <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data0 WHEN SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid = "1" ELSE redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_1_q;
    -- Data1
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_D1 <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_data1 WHEN SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_r_valid = "1" ELSE redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_1_q;

    -- redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2(REG,89)
    redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "1") THEN
                redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2_q <= STD_LOGIC_VECTOR(SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2(REG,85)
    redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "1") THEN
                redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_q <= STD_LOGIC_VECTOR(SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2(STALLENABLE,154)
    -- Valid signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_V0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0 <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backStall and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN and SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_V;
    -- Backward Stall generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backStall <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN);
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_backEN = "0") THEN
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_s_tv_0;
            ELSE
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3(STALLREG,203)
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid <= (others => '0');
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data0 <= (others => '-');
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backStall and (SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid or SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_i_valid);

            IF (SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data0 <= STD_LOGIC_VECTOR(redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_q);
                SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data1 <= STD_LOGIC_VECTOR(redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_i_valid <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_V0;
    -- Stall signal propagation
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backStall <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid or not (SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_i_valid);

    -- Valid
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid WHEN SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid = "1" ELSE SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_i_valid;

    -- Data0
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_D0 <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data0 WHEN SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid = "1" ELSE redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_2_q;
    -- Data1
    SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_D1 <= SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_data1 WHEN SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_r_valid = "1" ELSE redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_2_q;

    -- redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3(REG,86)
    redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "1") THEN
                redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom_conv2d1x1_sel_x(BITSELECT,30)@5
    i_idxprom_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_q(31 downto 0)), 64)));

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select(BITSELECT,74)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_b <= i_idxprom_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_c <= i_idxprom_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_d <= i_idxprom_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_e <= i_idxprom_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0(BITSHIFT,71)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0_qint <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15(BITSHIFT,66)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0(BITSHIFT,72)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0_qint <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14(BITSHIFT,65)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_16(BITJOIN,67)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_16_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_15_q & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_14_q;

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0(BITSHIFT,73)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0_qint <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12(BITSHIFT,63)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0(BITSHIFT,70)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0_qint <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_13(BITJOIN,64)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_13_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_im0_shift0_q);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0(ADD,68)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_13_q);
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_join_16_q);
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_b));
    i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_mult_extender_x(BITJOIN,23)@5
    i_arrayidx_conv2d1x1_conv2d1x117_mult_extender_x_q <= i_arrayidx_conv2d1x1_conv2d1x117_mult_multconst_x_q & i_arrayidx_conv2d1x1_conv2d1x117_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x(BITSELECT,25)@5
    i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b <= i_arrayidx_conv2d1x1_conv2d1x117_mult_extender_x_q(63 downto 0);

    -- SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3(STALLENABLE,155)
    -- Valid signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0;
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V1 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1;
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V2 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2;
    -- Stall signal propagation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0 <= i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_stall and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0;
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_1 <= i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_o_stall and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1;
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_2 <= SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backStall and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2;
    -- Backward Enable generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_or0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0;
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_or1 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_1 or SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_or0;
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_2 or SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN and SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V;
    -- Backward Stall generation
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backStall <= not (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN);
    SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 <= (others => '0');
            SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1 <= (others => '0');
            SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "0") THEN
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_0;
            ELSE
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_0 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0;
            END IF;

            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "0") THEN
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1 and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_1;
            ELSE
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_1 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0;
            END IF;

            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "0") THEN
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2 and SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_s_tv_2;
            ELSE
                SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_R_v_2 <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0(STALLREG,204)
    SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid <= SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backStall and (SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid or SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_i_valid <= SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V2;
    -- Stall signal propagation
    SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backStall <= SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_V <= SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_i_valid;

    SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_D0 <= SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b;

    -- SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0(STALLENABLE,151)
    -- Valid signal propagation
    SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_V0 <= SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_backStall and SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backEN <= not (SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_v_s_0 <= SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backEN and SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backStall <= not (SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backEN);
    SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0 and SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_filter_bias_sync_buffer_conv2d1x1(BLACKBOX,42)@6
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_bias_sync_buffer_conv2d1x1 : i_syncbuf_filter_bias_sync_buffer_conv2d1x15
    PORT MAP (
        in_buffer_in => in_filter_bias,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_conv2d1x1_B0_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1(STALLENABLE,134)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_V0 <= SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_backStall <= i_load_unnamed_conv2d1x10_conv2d1x1_out_o_stall or not (SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_and0 <= i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_valid_out;
    SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_wireValid <= SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0(REG,82)
    redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_bias_sync_buffer_conv2d1x1(BITJOIN,112)
    bubble_join_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_q <= i_syncbuf_filter_bias_sync_buffer_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_bias_sync_buffer_conv2d1x1(BITSELECT,113)
    bubble_select_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_q(63 downto 0));

    -- i_arrayidx_conv2d1x1_conv2d1x117_add_x(ADD,26)@6
    i_arrayidx_conv2d1x1_conv2d1x117_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_b);
    i_arrayidx_conv2d1x1_conv2d1x117_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx_conv2d1x1_conv2d1x117_trunc_sel_x_b_1_0_q);
    i_arrayidx_conv2d1x1_conv2d1x117_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_conv2d1x1_conv2d1x117_add_x_a) + UNSIGNED(i_arrayidx_conv2d1x1_conv2d1x117_add_x_b));
    i_arrayidx_conv2d1x1_conv2d1x117_add_x_q <= i_arrayidx_conv2d1x1_conv2d1x117_add_x_o(64 downto 0);

    -- i_arrayidx_conv2d1x1_conv2d1x117_dupName_0_trunc_sel_x(BITSELECT,20)@6
    i_arrayidx_conv2d1x1_conv2d1x117_dupName_0_trunc_sel_x_b <= i_arrayidx_conv2d1x1_conv2d1x117_add_x_q(63 downto 0);

    -- i_load_unnamed_conv2d1x10_conv2d1x1(BLACKBOX,41)@6
    -- in in_i_stall@20000000
    -- out out_o_readdata@8
    -- out out_o_stall@20000000
    -- out out_o_valid@8
    -- out out_unnamed_conv2d1x10_avm_address@20000000
    -- out out_unnamed_conv2d1x10_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x10_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x10_avm_enable@20000000
    -- out out_unnamed_conv2d1x10_avm_read@20000000
    -- out out_unnamed_conv2d1x10_avm_write@20000000
    -- out out_unnamed_conv2d1x10_avm_writedata@20000000
    thei_load_unnamed_conv2d1x10_conv2d1x1 : i_load_unnamed_conv2d1x10_conv2d1x118
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_conv2d1x1_conv2d1x117_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_bias_sync_buffer_conv2d1x1_V0,
        in_lsu_unnamed_conv2d1x10_streset_stream_reset => in_lsu_unnamed_conv2d1x10_streset_stream_reset,
        in_lsu_unnamed_conv2d1x10_sts_stream_size => in_lsu_unnamed_conv2d1x10_sts_stream_size,
        in_stream_base_addr => i_arrayidx_conv2d1x1_conv2d1x117_dupName_0_trunc_sel_x_b,
        in_unnamed_conv2d1x10_avm_readdata => in_unnamed_conv2d1x10_avm_readdata,
        in_unnamed_conv2d1x10_avm_readdatavalid => in_unnamed_conv2d1x10_avm_readdatavalid,
        in_unnamed_conv2d1x10_avm_waitrequest => in_unnamed_conv2d1x10_avm_waitrequest,
        in_unnamed_conv2d1x10_avm_writeack => in_unnamed_conv2d1x10_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x10_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x10_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x10_avm_address => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_address,
        out_unnamed_conv2d1x10_avm_burstcount => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_burstcount,
        out_unnamed_conv2d1x10_avm_byteenable => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_byteenable,
        out_unnamed_conv2d1x10_avm_enable => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_enable,
        out_unnamed_conv2d1x10_avm_read => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_read,
        out_unnamed_conv2d1x10_avm_write => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_write,
        out_unnamed_conv2d1x10_avm_writedata => i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_unnamed_conv2d1x10_conv2d1x1(STALLENABLE,132)
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg0 <= (others => '0');
            SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg0 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_toReg0;
            -- Succesor 1
            SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg1 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed0 <= (not (bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_out) and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid) or SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg0;
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed1 <= (not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backStall) and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid) or SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg1;
    -- Consuming
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_StallValid <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_backStall and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid;
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_toReg0 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_StallValid and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed0;
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_toReg1 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_StallValid and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_or0 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed0;
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireStall <= not (SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_consumed1 and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_or0);
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_backStall <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_V0 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid and not (SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg0);
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_V1 <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid and not (SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_wireValid <= i_load_unnamed_conv2d1x10_conv2d1x1_out_o_valid;

    -- SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0(STALLENABLE,148)
    -- Valid signal propagation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_V0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_s_tv_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backStall and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backEN <= not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_v_s_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backEN and SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_V1;
    -- Backward Stall generation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backStall <= not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_v_s_0);
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backEN = "0") THEN
                SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0 and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_s_tv_0;
            ELSE
                SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_R_v_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_i_load_unnamed_conv2d1x10_conv2d1x1(BITJOIN,108)
    bubble_join_i_load_unnamed_conv2d1x10_conv2d1x1_q <= i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x10_conv2d1x1(BITSELECT,109)
    bubble_select_i_load_unnamed_conv2d1x10_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x10_conv2d1x1_q(31 downto 0));

    -- redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0(REG,79)
    redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_backEN = "1") THEN
                redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_q <= STD_LOGIC_VECTOR(bubble_select_i_load_unnamed_conv2d1x10_conv2d1x1_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1(REG,80)
    redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backEN = "1") THEN
                redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_q <= STD_LOGIC_VECTOR(redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1(STALLENABLE,149)
    -- Valid signal propagation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_V0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_s_tv_0 <= SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backStall and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backEN <= not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_v_s_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backEN and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_0_V0;
    -- Backward Stall generation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backStall <= not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_v_s_0);
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_backEN = "0") THEN
                SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0 and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_s_tv_0;
            ELSE
                SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_R_v_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2(STALLREG,205)
    SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid <= (others => '0');
            SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backStall and (SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid or SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_i_valid);

            IF (SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_data0 <= STD_LOGIC_VECTOR(redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_i_valid <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backStall <= SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid or not (SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_i_valid);

    -- Valid
    SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_V <= SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid WHEN SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid = "1" ELSE SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_i_valid;

    SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_D0 <= SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_data0 WHEN SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_r_valid = "1" ELSE redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_1_q;

    -- SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2(STALLENABLE,150)
    -- Valid signal propagation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_V0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_s_tv_0 <= SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backEN <= not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_v_s_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backEN and SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_V;
    -- Backward Stall generation
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backStall <= not (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backEN);
    SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backEN = "0") THEN
                SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0 and SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_s_tv_0;
            ELSE
                SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_R_v_0 <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x(BLACKBOX,31)@5
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@11
    -- out out_c0_exit_1@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x : i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1
    PORT MAP (
        in_c0_eni1_0 => GND_q,
        in_c0_eni1_1 => redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_q,
        in_i_stall => SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall,
        in_i_valid => SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V1,
        in_input_channels => in_input_channels,
        out_c0_exit_1 => i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_c0_exit_1,
        out_o_stall => i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x(BLACKBOX,32)@1
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@11
    -- out out_c1_exit_1@11
    -- out out_c1_exit_2@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x : i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1
    PORT MAP (
        in_c1_eni1_0 => GND_q,
        in_c1_eni1_1 => bubble_select_conv2d1x1_B0_merge_reg_aunroll_x_b,
        in_i_stall => SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall,
        in_i_valid => SE_out_conv2d1x1_B0_merge_reg_aunroll_x_V2,
        in_input_size => in_input_size,
        out_c1_exit_1 => i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_c1_exit_2,
        out_o_stall => i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_3(REG,90)
    redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_backEN = "1") THEN
                redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x(BLACKBOX,33)@5
    -- in in_i_stall@20000000
    -- out out_c2_exit_0@11
    -- out out_c2_exit_1@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x : i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1
    PORT MAP (
        in_c2_eni1_0 => GND_q,
        in_c2_eni1_1 => redist3_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_1_4_3_q,
        in_i_stall => SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall,
        in_i_valid => SE_redist2_conv2d1x1_B0_merge_reg_aunroll_x_out_data_out_0_4_3_V0,
        in_input_size => in_input_size,
        out_c2_exit_1 => i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_1,
        out_o_stall => i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg(STALLFIFO,201)
    bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_in <= SE_out_i_load_unnamed_conv2d1x10_conv2d1x1_V0;
    bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_in <= SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall;
    bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_in_bitsignaltemp <= bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_in(0);
    bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_in_bitsignaltemp <= bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_in(0);
    bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_out(0) <= bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_out(0) <= bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 4,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1(STALLENABLE,189)
    -- Valid signal propagation
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_V0 <= SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and0 <= bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_reg_valid_out;
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and1 <= i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_valid and SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and0;
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and2 <= i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_o_valid and SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and1;
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and3 <= i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_o_valid and SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and2;
    SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_wireValid <= SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_V0 and SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_and3;

    -- redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2(REG,81)
    redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_backEN = "1") THEN
                redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x(BITJOIN,104)
    bubble_join_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q <= i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_1;

    -- bubble_select_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x(BITSELECT,105)
    bubble_select_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q(31 downto 0));

    -- bubble_join_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x(BITJOIN,100)
    bubble_join_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_q <= i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_c1_exit_2 & i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_out_c1_exit_1;

    -- bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x(BITSELECT,101)
    bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_q(95 downto 32));

    -- bubble_join_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x(BITJOIN,96)
    bubble_join_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_q <= i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x(BITSELECT,97)
    bubble_select_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,8)@11
    out_c0_exe1 <= bubble_select_i_sfc_c0_entry_conv2d1x1_c0_enter_conv2d1x1_aunroll_x_b;
    out_c1_exe1 <= bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_b;
    out_c1_exe2 <= bubble_select_i_sfc_c1_entry_conv2d1x1_c1_enter_conv2d1x1_aunroll_x_c;
    out_c2_exe1 <= bubble_select_i_sfc_c2_entry_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_b;
    out_unnamed_conv2d1x10 <= redist0_i_load_unnamed_conv2d1x10_conv2d1x1_out_o_readdata_3_2_q;
    out_valid_out <= SE_out_bubble_out_i_load_unnamed_conv2d1x10_conv2d1x1_1_V0;

    -- ext_sig_sync_out(GPOUT,38)
    out_unnamed_conv2d1x10_avm_address <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_address;
    out_unnamed_conv2d1x10_avm_enable <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_enable;
    out_unnamed_conv2d1x10_avm_read <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_read;
    out_unnamed_conv2d1x10_avm_write <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_write;
    out_unnamed_conv2d1x10_avm_writedata <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_writedata;
    out_unnamed_conv2d1x10_avm_byteenable <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_byteenable;
    out_unnamed_conv2d1x10_avm_burstcount <= i_load_unnamed_conv2d1x10_conv2d1x1_out_unnamed_conv2d1x10_avm_burstcount;

    -- sync_out(GPOUT,50)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
