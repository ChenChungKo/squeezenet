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

-- VHDL created from bb_avgpool2d_B2_stall_region
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

entity bb_avgpool2d_B2_stall_region is
    port (
        in_lsu_unnamed_avgpool2d1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_avgpool2d1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_global_id_03 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_avgpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_avgpool2d1_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_avgpool2d1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_avgpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_avgpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_avgpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_avgpool2d_B2_stall_region;

architecture normal of bb_avgpool2d_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d is
        port (
            in_c0_eni12_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit6_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit6_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_avgpool2d1_avgpool2d15 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_lsu_unnamed_avgpool2d1_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_avgpool2d1_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_avgpool2d1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_im_sync_buffer_avgpool2d12 is
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


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
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
    signal i_arrayidx6_avgpool2d_avgpool2d14_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom5_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_c0_exit6_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_lsu_unnamed_avgpool2d1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_output_im_sync_buffer_avgpool2d_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_output_im_sync_buffer_avgpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_avgpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_o5_23_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o5_23_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o5_23_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o5_23_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o5_23_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_o5_23_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o5_23_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o5_23_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o5_23_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o5_23_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_im_sync_buffer_avgpool2d_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_output_im_sync_buffer_avgpool2d_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_stall_entry_o5_23_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist0_stall_entry_o5_23_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_store_unnamed_avgpool2d1_avgpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_avgpool2d1_avgpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_avgpool2d1_avgpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o5_23_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o5_23_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o5_23_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0(STALLENABLE,110)
    -- Valid signal propagation
    SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_V0 <= SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_backStall and SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backEN <= not (SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_v_s_0 <= SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backEN and SE_out_redist0_stall_entry_o5_23_fifo_V0;
    -- Backward Stall generation
    SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backStall <= not (SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_v_s_0);
    SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0 and SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_redist0_stall_entry_o5_23_fifo(STALLENABLE,109)
    -- Valid signal propagation
    SE_out_redist0_stall_entry_o5_23_fifo_V0 <= SE_out_redist0_stall_entry_o5_23_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist0_stall_entry_o5_23_fifo_backStall <= SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backStall or not (SE_out_redist0_stall_entry_o5_23_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist0_stall_entry_o5_23_fifo_wireValid <= redist0_stall_entry_o5_23_fifo_valid_out;

    -- redist0_stall_entry_o5_23_fifo(STALLFIFO,67)
    redist0_stall_entry_o5_23_fifo_valid_in <= SE_stall_entry_V2;
    redist0_stall_entry_o5_23_fifo_stall_in <= SE_out_redist0_stall_entry_o5_23_fifo_backStall;
    redist0_stall_entry_o5_23_fifo_data_in <= bubble_select_stall_entry_c;
    redist0_stall_entry_o5_23_fifo_valid_in_bitsignaltemp <= redist0_stall_entry_o5_23_fifo_valid_in(0);
    redist0_stall_entry_o5_23_fifo_stall_in_bitsignaltemp <= redist0_stall_entry_o5_23_fifo_stall_in(0);
    redist0_stall_entry_o5_23_fifo_valid_out(0) <= redist0_stall_entry_o5_23_fifo_valid_out_bitsignaltemp;
    redist0_stall_entry_o5_23_fifo_stall_out(0) <= redist0_stall_entry_o5_23_fifo_stall_out_bitsignaltemp;
    theredist0_stall_entry_o5_23_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 24,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_stall_entry_o5_23_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_stall_entry_o5_23_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_c,
        valid_out => redist0_stall_entry_o5_23_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_stall_entry_o5_23_fifo_stall_out_bitsignaltemp,
        data_out => redist0_stall_entry_o5_23_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_output_im_sync_buffer_avgpool2d(BLACKBOX,32)@24
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_im_sync_buffer_avgpool2d : i_syncbuf_output_im_sync_buffer_avgpool2d12
    PORT MAP (
        in_buffer_in => in_output_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_1_V0,
        out_buffer_out => i_syncbuf_output_im_sync_buffer_avgpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_im_sync_buffer_avgpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_im_sync_buffer_avgpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_1(STALLENABLE,126)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_1_V0 <= SE_out_bubble_out_stall_entry_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_1_backStall <= i_syncbuf_output_im_sync_buffer_avgpool2d_out_stall_out or not (SE_out_bubble_out_stall_entry_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_1_wireValid <= bubble_out_stall_entry_1_reg_valid_out;

    -- bubble_out_stall_entry_1_reg(STALLFIFO,133)
    bubble_out_stall_entry_1_reg_valid_in <= SE_stall_entry_V0;
    bubble_out_stall_entry_1_reg_stall_in <= SE_out_bubble_out_stall_entry_1_backStall;
    bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_valid_in(0);
    bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_stall_in(0);
    bubble_out_stall_entry_1_reg_valid_out(0) <= bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_1_reg_stall_out(0) <= bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 25,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,95)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (bubble_out_stall_entry_1_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_stall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (redist0_stall_entry_o5_23_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed2 and SE_stall_entry_or1);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,77)
    bubble_join_stall_entry_q <= in_global_id_03 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,78)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));

    -- i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x(BLACKBOX,23)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit6_0@24
    -- out out_c0_exit6_1@24
    -- out out_o_stall@20000000
    -- out out_o_valid@24
    thei_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x : i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d
    PORT MAP (
        in_c0_eni12_0 => GND_q,
        in_c0_eni12_1 => bubble_select_stall_entry_b,
        in_i_stall => SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_backStall,
        in_i_valid => SE_stall_entry_V1,
        out_c0_exit6_1 => i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_c0_exit6_1,
        out_o_stall => i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x(BITJOIN,70)
    bubble_join_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_q <= i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_c0_exit6_1;

    -- bubble_select_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x(BITSELECT,71)
    bubble_select_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_q(31 downto 0));

    -- SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d(STALLENABLE,94)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_V0 <= SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_backStall <= i_store_unnamed_avgpool2d1_avgpool2d_out_o_stall or not (SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_and0 <= i_syncbuf_output_im_sync_buffer_avgpool2d_out_valid_out;
    SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_and1 <= SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_and0;
    SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_wireValid <= i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_valid and SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_and1;

    -- SE_out_i_store_unnamed_avgpool2d1_avgpool2d(STALLENABLE,92)
    -- Valid signal propagation
    SE_out_i_store_unnamed_avgpool2d1_avgpool2d_V0 <= SE_out_i_store_unnamed_avgpool2d1_avgpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_avgpool2d1_avgpool2d_backStall <= in_stall_in or not (SE_out_i_store_unnamed_avgpool2d1_avgpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_avgpool2d1_avgpool2d_wireValid <= i_store_unnamed_avgpool2d1_avgpool2d_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_multconst_x(CONSTANT,16)
    i_arrayidx6_avgpool2d_avgpool2d14_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bubble_join_redist0_stall_entry_o5_23_fifo(BITJOIN,82)
    bubble_join_redist0_stall_entry_o5_23_fifo_q <= redist0_stall_entry_o5_23_fifo_data_out;

    -- bubble_select_redist0_stall_entry_o5_23_fifo(BITSELECT,83)
    bubble_select_redist0_stall_entry_o5_23_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_o5_23_fifo_q(31 downto 0));

    -- i_idxprom5_avgpool2d_sel_x(BITSELECT,22)@23
    i_idxprom5_avgpool2d_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_redist0_stall_entry_o5_23_fifo_b(31 downto 0)), 64)));

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select(BITSELECT,64)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_b <= i_idxprom5_avgpool2d_sel_x_b(17 downto 0);
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_c <= i_idxprom5_avgpool2d_sel_x_b(63 downto 54);
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_d <= i_idxprom5_avgpool2d_sel_x_b(35 downto 18);
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_e <= i_idxprom5_avgpool2d_sel_x_b(53 downto 36);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0(BITSHIFT,61)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0_qint <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15(BITSHIFT,56)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0(BITSHIFT,62)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0_qint <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14(BITSHIFT,55)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_16(BITJOIN,57)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_16_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_15_q & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_14_q;

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0(BITSHIFT,63)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0_qint <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12(BITSHIFT,53)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0(BITSHIFT,60)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0_qint <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_13(BITJOIN,54)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_13_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_im0_shift0_q);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0(ADD,58)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_13_q);
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_join_16_q);
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_b));
    i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_mult_extender_x(BITJOIN,15)@23
    i_arrayidx6_avgpool2d_avgpool2d14_mult_extender_x_q <= i_arrayidx6_avgpool2d_avgpool2d14_mult_multconst_x_q & i_arrayidx6_avgpool2d_avgpool2d14_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x(BITSELECT,17)@23
    i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b <= i_arrayidx6_avgpool2d_avgpool2d14_mult_extender_x_q(63 downto 0);

    -- redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0(REG,68)
    redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_output_im_sync_buffer_avgpool2d(BITJOIN,74)
    bubble_join_i_syncbuf_output_im_sync_buffer_avgpool2d_q <= i_syncbuf_output_im_sync_buffer_avgpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_im_sync_buffer_avgpool2d(BITSELECT,75)
    bubble_select_i_syncbuf_output_im_sync_buffer_avgpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_im_sync_buffer_avgpool2d_q(63 downto 0));

    -- i_arrayidx6_avgpool2d_avgpool2d14_add_x(ADD,18)@24
    i_arrayidx6_avgpool2d_avgpool2d14_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_output_im_sync_buffer_avgpool2d_b);
    i_arrayidx6_avgpool2d_avgpool2d14_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx6_avgpool2d_avgpool2d14_trunc_sel_x_b_1_0_q);
    i_arrayidx6_avgpool2d_avgpool2d14_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx6_avgpool2d_avgpool2d14_add_x_a) + UNSIGNED(i_arrayidx6_avgpool2d_avgpool2d14_add_x_b));
    i_arrayidx6_avgpool2d_avgpool2d14_add_x_q <= i_arrayidx6_avgpool2d_avgpool2d14_add_x_o(64 downto 0);

    -- i_arrayidx6_avgpool2d_avgpool2d14_dupName_0_trunc_sel_x(BITSELECT,12)@24
    i_arrayidx6_avgpool2d_avgpool2d14_dupName_0_trunc_sel_x_b <= i_arrayidx6_avgpool2d_avgpool2d14_add_x_q(63 downto 0);

    -- i_store_unnamed_avgpool2d1_avgpool2d(BLACKBOX,31)@24
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_avgpool2d1_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@25
    -- out out_unnamed_avgpool2d1_avm_address@20000000
    -- out out_unnamed_avgpool2d1_avm_burstcount@20000000
    -- out out_unnamed_avgpool2d1_avm_byteenable@20000000
    -- out out_unnamed_avgpool2d1_avm_enable@20000000
    -- out out_unnamed_avgpool2d1_avm_read@20000000
    -- out out_unnamed_avgpool2d1_avm_write@20000000
    -- out out_unnamed_avgpool2d1_avm_writedata@20000000
    thei_store_unnamed_avgpool2d1_avgpool2d : i_store_unnamed_avgpool2d1_avgpool2d15
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx6_avgpool2d_avgpool2d14_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_unnamed_avgpool2d1_avgpool2d_backStall,
        in_i_valid => SE_out_i_syncbuf_output_im_sync_buffer_avgpool2d_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_end_avgpool2d_c0_enter3_avgpool2d_aunroll_x_b,
        in_lsu_unnamed_avgpool2d1_streset_stream_reset => in_lsu_unnamed_avgpool2d1_streset_stream_reset,
        in_lsu_unnamed_avgpool2d1_sts_stream_size => in_lsu_unnamed_avgpool2d1_sts_stream_size,
        in_stream_base_addr => i_arrayidx6_avgpool2d_avgpool2d14_dupName_0_trunc_sel_x_b,
        in_unnamed_avgpool2d1_avm_readdata => in_unnamed_avgpool2d1_avm_readdata,
        in_unnamed_avgpool2d1_avm_readdatavalid => in_unnamed_avgpool2d1_avm_readdatavalid,
        in_unnamed_avgpool2d1_avm_waitrequest => in_unnamed_avgpool2d1_avm_waitrequest,
        in_unnamed_avgpool2d1_avm_writeack => in_unnamed_avgpool2d1_avm_writeack,
        out_lsu_unnamed_avgpool2d1_o_active => i_store_unnamed_avgpool2d1_avgpool2d_out_lsu_unnamed_avgpool2d1_o_active,
        out_o_stall => i_store_unnamed_avgpool2d1_avgpool2d_out_o_stall,
        out_o_valid => i_store_unnamed_avgpool2d1_avgpool2d_out_o_valid,
        out_unnamed_avgpool2d1_avm_address => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_address,
        out_unnamed_avgpool2d1_avm_burstcount => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_burstcount,
        out_unnamed_avgpool2d1_avm_byteenable => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_byteenable,
        out_unnamed_avgpool2d1_avm_enable => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_enable,
        out_unnamed_avgpool2d1_avm_read => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_read,
        out_unnamed_avgpool2d1_avm_write => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_write,
        out_unnamed_avgpool2d1_avm_writedata => i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_lsu_unnamed_avgpool2d1_o_active <= i_store_unnamed_avgpool2d1_avgpool2d_out_lsu_unnamed_avgpool2d1_o_active;

    -- dupName_0_sync_out_x(GPOUT,8)@25
    out_valid_out <= SE_out_i_store_unnamed_avgpool2d1_avgpool2d_V0;

    -- ext_sig_sync_out(GPOUT,28)
    out_unnamed_avgpool2d1_avm_address <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_address;
    out_unnamed_avgpool2d1_avm_enable <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_enable;
    out_unnamed_avgpool2d1_avm_read <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_read;
    out_unnamed_avgpool2d1_avm_write <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_write;
    out_unnamed_avgpool2d1_avm_writedata <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_writedata;
    out_unnamed_avgpool2d1_avm_byteenable <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_byteenable;
    out_unnamed_avgpool2d1_avm_burstcount <= i_store_unnamed_avgpool2d1_avgpool2d_out_unnamed_avgpool2d1_avm_burstcount;

    -- sync_out(GPOUT,40)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
