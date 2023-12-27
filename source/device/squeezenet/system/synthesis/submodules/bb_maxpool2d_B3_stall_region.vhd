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

-- VHDL created from bb_maxpool2d_B3_stall_region
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

entity bb_maxpool2d_B3_stall_region is
    port (
        out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11412 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe12616 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe14 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp7_phi_decision16_xor_RM15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_087 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_169 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe14 : out std_logic_vector(63 downto 0);  -- ufix64
        out_for_end41_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_08_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B3_stall_region;

architecture normal of bb_maxpool2d_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_unnamed_maxpool2d1_maxpool2d40 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_im_sync_buffer_maxpool2d37 is
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


    component i_syncbuf_output_size_sync_buffer3_maxpool2d42 is
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


    component i_syncbuf_output_size_sync_buffer4_maxpool2d46 is
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
    signal bgTrunc_i_add33_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_inc37_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc40_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom34_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add33_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add33_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add33_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add33_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_ptr5_sum_maxpool2d_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr5_sum_maxpool2d_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr5_sum_maxpool2d_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr5_sum_maxpool2d_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_exitcond11_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond11_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond12_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond12_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end41_loopexit_loopexit_lc_cond_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_08_lc_outerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_08_lc_outerphi_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc37_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc37_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc37_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc37_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc40_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc40_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc40_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc40_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_j_16_lc_innerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_j_16_lc_innerphi_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_lsu_unnamed_maxpool2d1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_output_im_sync_buffer_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_output_im_sync_buffer_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer3_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer3_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer3_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer4_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer4_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer4_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d45_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d49_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_o4_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_o5_6_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_6_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_6_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_6_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_6_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_6_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_o6_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_o6_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_o6_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_o6_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_o7_2_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o7_2_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o7_6_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o7_6_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o7_6_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o7_6_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_stall_entry_o8_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_4_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_4_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_4_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o8_5_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o8_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o9_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_stall_entry_o9_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_stall_entry_o9_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_stall_entry_o9_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_stall_entry_o9_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_stall_entry_o10_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_stall_entry_o10_3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_stall_entry_o10_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_unnamed_maxpool2d45_q_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist18_bgTrunc_i_add33_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_im_sync_buffer_maxpool2d_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_output_im_sync_buffer_maxpool2d_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (256 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_i_exitcond11_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_08_lc_outerphi_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_08_lc_outerphi_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_08_lc_outerphi_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_08_lc_outerphi_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_08_lc_outerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_08_lc_outerphi_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d45_V1 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SE_stall_entry_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_3_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_4_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_o5_6_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_maxpool2d45_q_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_maxpool2d45_q_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_maxpool2d45_q_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_maxpool2d45_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_maxpool2d45_q_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_3_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_3_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_3_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_3_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_3_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_3_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_3_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_3_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_r_data6 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_1_D6 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_r_data6 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_3_D6 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_data1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_r_data5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_D1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_D4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_4_D5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_maxpool2d_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_maxpool2d_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_r_data1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_D1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_o5_6_5_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_08_lc_outerphi_maxpool2d_D4 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- bubble_join_stall_entry(BITJOIN,166)
    bubble_join_stall_entry_q <= in_j_169 & in_i_087 & in_cmp7_phi_decision16_xor_RM15 & in_c1_exe14 & in_c1_exe12616 & in_c0_exe13 & in_c0_exe11412;

    -- bubble_select_stall_entry(BITSELECT,167)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(192 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(224 downto 193));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(256 downto 225));

    -- redist0_stall_entry_o4_1_0(REG,115)
    redist0_stall_entry_o4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist0_stall_entry_o4_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_add33_maxpool2d(ADD,39)@1
    i_add33_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist10_stall_entry_o10_1_0_q);
    i_add33_maxpool2d_b <= STD_LOGIC_VECTOR("0" & redist0_stall_entry_o4_1_0_q);
    i_add33_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add33_maxpool2d_a) + UNSIGNED(i_add33_maxpool2d_b));
    i_add33_maxpool2d_q <= i_add33_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_add33_maxpool2d_sel_x(BITSELECT,2)@1
    bgTrunc_i_add33_maxpool2d_sel_x_b <= i_add33_maxpool2d_q(31 downto 0);

    -- redist10_stall_entry_o10_1_0(REG,143)
    redist10_stall_entry_o10_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_stall_entry_o10_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist10_stall_entry_o10_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_o9_4_0(REG,138)
    redist8_stall_entry_o9_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_o9_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist8_stall_entry_o9_4_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_o8_4_0(REG,132)
    redist5_stall_entry_o8_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_o8_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist5_stall_entry_o8_4_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o7_2_0(REG,126)
    redist3_stall_entry_o7_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o7_2_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist3_stall_entry_o7_2_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_o6_4_0(REG,122)
    redist2_stall_entry_o6_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_o6_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist2_stall_entry_o6_4_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o5_6_0(REG,116)
    redist1_stall_entry_o5_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o5_6_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist1_stall_entry_o5_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_c);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_o5_6_2(STALLENABLE,215)
    -- Valid signal propagation
    SE_redist1_stall_entry_o5_6_2_V0 <= SE_redist1_stall_entry_o5_6_2_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_o5_6_2_s_tv_0 <= SR_SE_redist1_stall_entry_o5_6_3_backStall and SE_redist1_stall_entry_o5_6_2_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_o5_6_2_backEN <= not (SE_redist1_stall_entry_o5_6_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_o5_6_2_v_s_0 <= SE_redist1_stall_entry_o5_6_2_backEN and SE_redist1_stall_entry_o5_6_1_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_o5_6_2_backStall <= not (SE_redist1_stall_entry_o5_6_2_v_s_0);
    SE_redist1_stall_entry_o5_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_o5_6_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_2_R_v_0 <= SE_redist1_stall_entry_o5_6_2_R_v_0 and SE_redist1_stall_entry_o5_6_2_s_tv_0;
            ELSE
                SE_redist1_stall_entry_o5_6_2_R_v_0 <= SE_redist1_stall_entry_o5_6_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_o5_6_1(STALLENABLE,214)
    -- Valid signal propagation
    SE_redist1_stall_entry_o5_6_1_V0 <= SE_redist1_stall_entry_o5_6_1_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_o5_6_1_s_tv_0 <= SE_redist1_stall_entry_o5_6_2_backStall and SE_redist1_stall_entry_o5_6_1_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_o5_6_1_backEN <= not (SE_redist1_stall_entry_o5_6_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_o5_6_1_v_s_0 <= SE_redist1_stall_entry_o5_6_1_backEN and SR_SE_redist1_stall_entry_o5_6_1_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_o5_6_1_backStall <= not (SE_redist1_stall_entry_o5_6_1_backEN);
    SE_redist1_stall_entry_o5_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_o5_6_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_1_R_v_0 <= SE_redist1_stall_entry_o5_6_1_R_v_0 and SE_redist1_stall_entry_o5_6_1_s_tv_0;
            ELSE
                SE_redist1_stall_entry_o5_6_1_R_v_0 <= SE_redist1_stall_entry_o5_6_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_o5_6_1(STALLREG,284)
    SR_SE_redist1_stall_entry_o5_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_o5_6_1_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_o5_6_1_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_1_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_1_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_1_r_data3 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_1_r_data4 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_1_r_data5 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_1_r_data6 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_o5_6_1_r_valid <= SE_redist1_stall_entry_o5_6_1_backStall and (SR_SE_redist1_stall_entry_o5_6_1_r_valid or SR_SE_redist1_stall_entry_o5_6_1_i_valid);

            IF (SR_SE_redist1_stall_entry_o5_6_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_o5_6_1_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_o5_6_0_q);
                SR_SE_redist1_stall_entry_o5_6_1_r_data1 <= STD_LOGIC_VECTOR(redist2_stall_entry_o6_4_0_q);
                SR_SE_redist1_stall_entry_o5_6_1_r_data2 <= STD_LOGIC_VECTOR(redist3_stall_entry_o7_2_0_q);
                SR_SE_redist1_stall_entry_o5_6_1_r_data3 <= STD_LOGIC_VECTOR(redist5_stall_entry_o8_4_0_q);
                SR_SE_redist1_stall_entry_o5_6_1_r_data4 <= STD_LOGIC_VECTOR(redist8_stall_entry_o9_4_0_q);
                SR_SE_redist1_stall_entry_o5_6_1_r_data5 <= STD_LOGIC_VECTOR(redist10_stall_entry_o10_1_0_q);
                SR_SE_redist1_stall_entry_o5_6_1_r_data6 <= STD_LOGIC_VECTOR(bgTrunc_i_add33_maxpool2d_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_o5_6_1_i_valid <= SE_redist0_stall_entry_o4_1_0_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_o5_6_1_backStall <= SR_SE_redist1_stall_entry_o5_6_1_r_valid or not (SR_SE_redist1_stall_entry_o5_6_1_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_o5_6_1_V <= SR_SE_redist1_stall_entry_o5_6_1_r_valid WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE SR_SE_redist1_stall_entry_o5_6_1_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_o5_6_1_D0 <= SR_SE_redist1_stall_entry_o5_6_1_r_data0 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE redist1_stall_entry_o5_6_0_q;
    -- Data1
    SR_SE_redist1_stall_entry_o5_6_1_D1 <= SR_SE_redist1_stall_entry_o5_6_1_r_data1 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE redist2_stall_entry_o6_4_0_q;
    -- Data2
    SR_SE_redist1_stall_entry_o5_6_1_D2 <= SR_SE_redist1_stall_entry_o5_6_1_r_data2 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE redist3_stall_entry_o7_2_0_q;
    -- Data3
    SR_SE_redist1_stall_entry_o5_6_1_D3 <= SR_SE_redist1_stall_entry_o5_6_1_r_data3 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE redist5_stall_entry_o8_4_0_q;
    -- Data4
    SR_SE_redist1_stall_entry_o5_6_1_D4 <= SR_SE_redist1_stall_entry_o5_6_1_r_data4 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE redist8_stall_entry_o9_4_0_q;
    -- Data5
    SR_SE_redist1_stall_entry_o5_6_1_D5 <= SR_SE_redist1_stall_entry_o5_6_1_r_data5 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE redist10_stall_entry_o10_1_0_q;
    -- Data6
    SR_SE_redist1_stall_entry_o5_6_1_D6 <= SR_SE_redist1_stall_entry_o5_6_1_r_data6 WHEN SR_SE_redist1_stall_entry_o5_6_1_r_valid = "1" ELSE bgTrunc_i_add33_maxpool2d_sel_x_b;

    -- SE_redist0_stall_entry_o4_1_0(STALLENABLE,212)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_1_0_V0 <= SE_redist0_stall_entry_o4_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_1_0_s_tv_0 <= SR_SE_redist1_stall_entry_o5_6_1_backStall and SE_redist0_stall_entry_o4_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_1_0_backEN <= not (SE_redist0_stall_entry_o4_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_1_0_v_s_0 <= SE_redist0_stall_entry_o4_1_0_backEN and SE_stall_entry_V3;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_1_0_backStall <= not (SE_redist0_stall_entry_o4_1_0_v_s_0);
    SE_redist0_stall_entry_o4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "0") THEN
                SE_redist0_stall_entry_o4_1_0_R_v_0 <= SE_redist0_stall_entry_o4_1_0_R_v_0 and SE_redist0_stall_entry_o4_1_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_1_0_R_v_0 <= SE_redist0_stall_entry_o4_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d(BITJOIN,162)
    bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d_q <= i_syncbuf_output_size_sync_buffer4_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d(BITSELECT,163)
    bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d_q(31 downto 0));

    -- redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0(REG,148)
    redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "1") THEN
                redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_4_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0(REG,150)
    redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "1") THEN
                redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_4_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_stall_entry_o9_5_0(REG,142)
    redist9_stall_entry_o9_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_o9_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "1") THEN
                redist9_stall_entry_o9_5_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_4_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o8_5_0(REG,136)
    redist6_stall_entry_o8_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o8_5_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "1") THEN
                redist6_stall_entry_o8_5_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_4_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_exitcond11_maxpool2d(LOGICAL,41)@4 + 1
    i_exitcond11_maxpool2d_qi <= "1" WHEN SR_SE_i_exitcond11_maxpool2d_D0 = SR_SE_i_exitcond11_maxpool2d_D1 ELSE "0";
    i_exitcond11_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond11_maxpool2d_qi, xout => i_exitcond11_maxpool2d_q, ena => SE_i_exitcond11_maxpool2d_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_maxpool2d45(LOGICAL,54)@5
    i_unnamed_maxpool2d45_q <= i_exitcond11_maxpool2d_q or redist6_stall_entry_o8_5_0_q;

    -- SE_i_i_08_lc_outerphi_maxpool2d(STALLENABLE,185)
    -- Valid signal propagation
    SE_i_i_08_lc_outerphi_maxpool2d_V0 <= SE_i_i_08_lc_outerphi_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_i_08_lc_outerphi_maxpool2d_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall and SE_i_i_08_lc_outerphi_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_i_08_lc_outerphi_maxpool2d_backEN <= not (SE_i_i_08_lc_outerphi_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_i_08_lc_outerphi_maxpool2d_v_s_0 <= SE_i_i_08_lc_outerphi_maxpool2d_backEN and SR_SE_i_i_08_lc_outerphi_maxpool2d_V;
    -- Backward Stall generation
    SE_i_i_08_lc_outerphi_maxpool2d_backStall <= not (SE_i_i_08_lc_outerphi_maxpool2d_backEN);
    SE_i_i_08_lc_outerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_i_08_lc_outerphi_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_08_lc_outerphi_maxpool2d_backEN = "0") THEN
                SE_i_i_08_lc_outerphi_maxpool2d_R_v_0 <= SE_i_i_08_lc_outerphi_maxpool2d_R_v_0 and SE_i_i_08_lc_outerphi_maxpool2d_s_tv_0;
            ELSE
                SE_i_i_08_lc_outerphi_maxpool2d_R_v_0 <= SE_i_i_08_lc_outerphi_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_i_08_lc_outerphi_maxpool2d(STALLREG,291)
    SR_SE_i_i_08_lc_outerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data1 <= (others => '-');
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data2 <= (others => '-');
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data3 <= (others => '-');
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data4 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid <= SE_i_i_08_lc_outerphi_maxpool2d_backStall and (SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid or SR_SE_i_i_08_lc_outerphi_maxpool2d_i_valid);

            IF (SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data0 <= i_unnamed_maxpool2d45_q;
                SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data1 <= i_unnamed_maxpool2d45_q;
                SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data2 <= redist9_stall_entry_o9_5_0_q;
                SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data3 <= redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q;
                SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data4 <= redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_i_08_lc_outerphi_maxpool2d_and0 <= SE_i_unnamed_maxpool2d45_V0;
    SR_SE_i_i_08_lc_outerphi_maxpool2d_i_valid <= SE_redist1_stall_entry_o5_6_4_V2 and SR_SE_i_i_08_lc_outerphi_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_i_08_lc_outerphi_maxpool2d_backStall <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid or not (SR_SE_i_i_08_lc_outerphi_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_i_08_lc_outerphi_maxpool2d_V <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid WHEN SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "1" ELSE SR_SE_i_i_08_lc_outerphi_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_i_08_lc_outerphi_maxpool2d_D0 <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data0 WHEN SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d45_q;
    -- Data1
    SR_SE_i_i_08_lc_outerphi_maxpool2d_D1 <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data1 WHEN SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d45_q;
    -- Data2
    SR_SE_i_i_08_lc_outerphi_maxpool2d_D2 <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data2 WHEN SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "1" ELSE redist9_stall_entry_o9_5_0_q;
    -- Data3
    SR_SE_i_i_08_lc_outerphi_maxpool2d_D3 <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data3 WHEN SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "1" ELSE redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q;
    -- Data4
    SR_SE_i_i_08_lc_outerphi_maxpool2d_D4 <= SR_SE_i_i_08_lc_outerphi_maxpool2d_r_data4 WHEN SR_SE_i_i_08_lc_outerphi_maxpool2d_r_valid = "1" ELSE redist16_bgTrunc_i_inc37_maxpool2d_sel_x_b_2_0_q;

    -- SE_redist12_i_unnamed_maxpool2d45_q_1_0(STALLENABLE,243)
    -- Valid signal propagation
    SE_redist12_i_unnamed_maxpool2d45_q_1_0_V0 <= SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_unnamed_maxpool2d45_q_1_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall and SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_unnamed_maxpool2d45_q_1_0_backEN <= not (SE_redist12_i_unnamed_maxpool2d45_q_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_unnamed_maxpool2d45_q_1_0_v_s_0 <= SE_redist12_i_unnamed_maxpool2d45_q_1_0_backEN and SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_V;
    -- Backward Stall generation
    SE_redist12_i_unnamed_maxpool2d45_q_1_0_backStall <= not (SE_redist12_i_unnamed_maxpool2d45_q_1_0_backEN);
    SE_redist12_i_unnamed_maxpool2d45_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_unnamed_maxpool2d45_q_1_0_backEN = "0") THEN
                SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0 <= SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0 and SE_redist12_i_unnamed_maxpool2d45_q_1_0_s_tv_0;
            ELSE
                SE_redist12_i_unnamed_maxpool2d45_q_1_0_R_v_0 <= SE_redist12_i_unnamed_maxpool2d45_q_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0(STALLREG,289)
    SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid <= (others => '0');
            SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid <= SE_redist12_i_unnamed_maxpool2d45_q_1_0_backStall and (SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid or SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_i_valid);

            IF (SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_data0 <= STD_LOGIC_VECTOR(i_unnamed_maxpool2d45_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_i_valid <= SE_i_unnamed_maxpool2d45_V1;
    -- Stall signal propagation
    SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_backStall <= SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid or not (SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_i_valid);

    -- Valid
    SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_V <= SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid WHEN SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid = "1" ELSE SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_i_valid;

    SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_D0 <= SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_data0 WHEN SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_r_valid = "1" ELSE i_unnamed_maxpool2d45_q;

    -- SE_i_unnamed_maxpool2d45(STALLENABLE,197)
    SE_i_unnamed_maxpool2d45_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_maxpool2d45_fromReg0 <= (others => '0');
            SE_i_unnamed_maxpool2d45_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_unnamed_maxpool2d45_fromReg0 <= SE_i_unnamed_maxpool2d45_toReg0;
            -- Succesor 1
            SE_i_unnamed_maxpool2d45_fromReg1 <= SE_i_unnamed_maxpool2d45_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_unnamed_maxpool2d45_consumed0 <= (not (SR_SE_i_i_08_lc_outerphi_maxpool2d_backStall) and SE_i_unnamed_maxpool2d45_wireValid) or SE_i_unnamed_maxpool2d45_fromReg0;
    SE_i_unnamed_maxpool2d45_consumed1 <= (not (SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_backStall) and SE_i_unnamed_maxpool2d45_wireValid) or SE_i_unnamed_maxpool2d45_fromReg1;
    -- Consuming
    SE_i_unnamed_maxpool2d45_StallValid <= SE_i_unnamed_maxpool2d45_backStall and SE_i_unnamed_maxpool2d45_wireValid;
    SE_i_unnamed_maxpool2d45_toReg0 <= SE_i_unnamed_maxpool2d45_StallValid and SE_i_unnamed_maxpool2d45_consumed0;
    SE_i_unnamed_maxpool2d45_toReg1 <= SE_i_unnamed_maxpool2d45_StallValid and SE_i_unnamed_maxpool2d45_consumed1;
    -- Backward Stall generation
    SE_i_unnamed_maxpool2d45_or0 <= SE_i_unnamed_maxpool2d45_consumed0;
    SE_i_unnamed_maxpool2d45_wireStall <= not (SE_i_unnamed_maxpool2d45_consumed1 and SE_i_unnamed_maxpool2d45_or0);
    SE_i_unnamed_maxpool2d45_backStall <= SE_i_unnamed_maxpool2d45_wireStall;
    -- Valid signal propagation
    SE_i_unnamed_maxpool2d45_V0 <= SE_i_unnamed_maxpool2d45_wireValid and not (SE_i_unnamed_maxpool2d45_fromReg0);
    SE_i_unnamed_maxpool2d45_V1 <= SE_i_unnamed_maxpool2d45_wireValid and not (SE_i_unnamed_maxpool2d45_fromReg1);
    -- Computing multiple Valid(s)
    SE_i_unnamed_maxpool2d45_and0 <= SE_i_exitcond11_maxpool2d_V0;
    SE_i_unnamed_maxpool2d45_wireValid <= SE_redist1_stall_entry_o5_6_4_V1 and SE_i_unnamed_maxpool2d45_and0;

    -- redist4_stall_entry_o7_6_2(REG,130)
    redist4_stall_entry_o7_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o7_6_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "1") THEN
                redist4_stall_entry_o7_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_4_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o5_6_4(REG,120)
    redist1_stall_entry_o5_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o5_6_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "1") THEN
                redist1_stall_entry_o5_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_o5_6_5(STALLENABLE,218)
    -- Valid signal propagation
    SE_redist1_stall_entry_o5_6_5_V0 <= SE_redist1_stall_entry_o5_6_5_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_o5_6_5_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall and SE_redist1_stall_entry_o5_6_5_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_o5_6_5_backEN <= not (SE_redist1_stall_entry_o5_6_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_o5_6_5_v_s_0 <= SE_redist1_stall_entry_o5_6_5_backEN and SR_SE_redist1_stall_entry_o5_6_5_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_o5_6_5_backStall <= not (SE_redist1_stall_entry_o5_6_5_backEN);
    SE_redist1_stall_entry_o5_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_o5_6_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_5_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_5_R_v_0 <= SE_redist1_stall_entry_o5_6_5_R_v_0 and SE_redist1_stall_entry_o5_6_5_s_tv_0;
            ELSE
                SE_redist1_stall_entry_o5_6_5_R_v_0 <= SE_redist1_stall_entry_o5_6_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_o5_6_5(STALLREG,290)
    SR_SE_redist1_stall_entry_o5_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_o5_6_5_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_o5_6_5_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_5_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_5_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_o5_6_5_r_valid <= SE_redist1_stall_entry_o5_6_5_backStall and (SR_SE_redist1_stall_entry_o5_6_5_r_valid or SR_SE_redist1_stall_entry_o5_6_5_i_valid);

            IF (SR_SE_redist1_stall_entry_o5_6_5_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_o5_6_5_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_o5_6_4_q);
                SR_SE_redist1_stall_entry_o5_6_5_r_data1 <= STD_LOGIC_VECTOR(redist4_stall_entry_o7_6_2_q);
                SR_SE_redist1_stall_entry_o5_6_5_r_data2 <= STD_LOGIC_VECTOR(redist6_stall_entry_o8_5_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_o5_6_5_i_valid <= SE_redist1_stall_entry_o5_6_4_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_o5_6_5_backStall <= SR_SE_redist1_stall_entry_o5_6_5_r_valid or not (SR_SE_redist1_stall_entry_o5_6_5_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_o5_6_5_V <= SR_SE_redist1_stall_entry_o5_6_5_r_valid WHEN SR_SE_redist1_stall_entry_o5_6_5_r_valid = "1" ELSE SR_SE_redist1_stall_entry_o5_6_5_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_o5_6_5_D0 <= SR_SE_redist1_stall_entry_o5_6_5_r_data0 WHEN SR_SE_redist1_stall_entry_o5_6_5_r_valid = "1" ELSE redist1_stall_entry_o5_6_4_q;
    -- Data1
    SR_SE_redist1_stall_entry_o5_6_5_D1 <= SR_SE_redist1_stall_entry_o5_6_5_r_data1 WHEN SR_SE_redist1_stall_entry_o5_6_5_r_valid = "1" ELSE redist4_stall_entry_o7_6_2_q;
    -- Data2
    SR_SE_redist1_stall_entry_o5_6_5_D2 <= SR_SE_redist1_stall_entry_o5_6_5_r_data2 WHEN SR_SE_redist1_stall_entry_o5_6_5_r_valid = "1" ELSE redist6_stall_entry_o8_5_0_q;

    -- SE_redist1_stall_entry_o5_6_4(STALLENABLE,217)
    -- Valid signal propagation
    SE_redist1_stall_entry_o5_6_4_V0 <= SE_redist1_stall_entry_o5_6_4_R_v_0;
    SE_redist1_stall_entry_o5_6_4_V1 <= SE_redist1_stall_entry_o5_6_4_R_v_1;
    SE_redist1_stall_entry_o5_6_4_V2 <= SE_redist1_stall_entry_o5_6_4_R_v_2;
    SE_redist1_stall_entry_o5_6_4_V3 <= SE_redist1_stall_entry_o5_6_4_R_v_3;
    -- Stall signal propagation
    SE_redist1_stall_entry_o5_6_4_s_tv_0 <= SR_SE_redist1_stall_entry_o5_6_5_backStall and SE_redist1_stall_entry_o5_6_4_R_v_0;
    SE_redist1_stall_entry_o5_6_4_s_tv_1 <= SE_i_unnamed_maxpool2d45_backStall and SE_redist1_stall_entry_o5_6_4_R_v_1;
    SE_redist1_stall_entry_o5_6_4_s_tv_2 <= SR_SE_i_i_08_lc_outerphi_maxpool2d_backStall and SE_redist1_stall_entry_o5_6_4_R_v_2;
    SE_redist1_stall_entry_o5_6_4_s_tv_3 <= SR_SE_i_exitcond12_maxpool2d_backStall and SE_redist1_stall_entry_o5_6_4_R_v_3;
    -- Backward Enable generation
    SE_redist1_stall_entry_o5_6_4_or0 <= SE_redist1_stall_entry_o5_6_4_s_tv_0;
    SE_redist1_stall_entry_o5_6_4_or1 <= SE_redist1_stall_entry_o5_6_4_s_tv_1 or SE_redist1_stall_entry_o5_6_4_or0;
    SE_redist1_stall_entry_o5_6_4_or2 <= SE_redist1_stall_entry_o5_6_4_s_tv_2 or SE_redist1_stall_entry_o5_6_4_or1;
    SE_redist1_stall_entry_o5_6_4_backEN <= not (SE_redist1_stall_entry_o5_6_4_s_tv_3 or SE_redist1_stall_entry_o5_6_4_or2);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_o5_6_4_v_s_0 <= SE_redist1_stall_entry_o5_6_4_backEN and SR_SE_redist1_stall_entry_o5_6_4_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_o5_6_4_backStall <= not (SE_redist1_stall_entry_o5_6_4_backEN);
    SE_redist1_stall_entry_o5_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_o5_6_4_R_v_0 <= (others => '0');
            SE_redist1_stall_entry_o5_6_4_R_v_1 <= (others => '0');
            SE_redist1_stall_entry_o5_6_4_R_v_2 <= (others => '0');
            SE_redist1_stall_entry_o5_6_4_R_v_3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_4_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_4_R_v_0 <= SE_redist1_stall_entry_o5_6_4_R_v_0 and SE_redist1_stall_entry_o5_6_4_s_tv_0;
            ELSE
                SE_redist1_stall_entry_o5_6_4_R_v_0 <= SE_redist1_stall_entry_o5_6_4_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_o5_6_4_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_4_R_v_1 <= SE_redist1_stall_entry_o5_6_4_R_v_1 and SE_redist1_stall_entry_o5_6_4_s_tv_1;
            ELSE
                SE_redist1_stall_entry_o5_6_4_R_v_1 <= SE_redist1_stall_entry_o5_6_4_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_o5_6_4_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_4_R_v_2 <= SE_redist1_stall_entry_o5_6_4_R_v_2 and SE_redist1_stall_entry_o5_6_4_s_tv_2;
            ELSE
                SE_redist1_stall_entry_o5_6_4_R_v_2 <= SE_redist1_stall_entry_o5_6_4_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_o5_6_4_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_4_R_v_3 <= SE_redist1_stall_entry_o5_6_4_R_v_3 and SE_redist1_stall_entry_o5_6_4_s_tv_3;
            ELSE
                SE_redist1_stall_entry_o5_6_4_R_v_3 <= SE_redist1_stall_entry_o5_6_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_exitcond12_maxpool2d(STALLENABLE,183)
    -- Valid signal propagation
    SE_i_exitcond12_maxpool2d_V0 <= SE_i_exitcond12_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond12_maxpool2d_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall and SE_i_exitcond12_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond12_maxpool2d_backEN <= not (SE_i_exitcond12_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond12_maxpool2d_v_s_0 <= SE_i_exitcond12_maxpool2d_backEN and SR_SE_i_exitcond12_maxpool2d_V;
    -- Backward Stall generation
    SE_i_exitcond12_maxpool2d_backStall <= not (SE_i_exitcond12_maxpool2d_backEN);
    SE_i_exitcond12_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond12_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond12_maxpool2d_backEN = "0") THEN
                SE_i_exitcond12_maxpool2d_R_v_0 <= SE_i_exitcond12_maxpool2d_R_v_0 and SE_i_exitcond12_maxpool2d_s_tv_0;
            ELSE
                SE_i_exitcond12_maxpool2d_R_v_0 <= SE_i_exitcond12_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond12_maxpool2d(STALLREG,287)
    SR_SE_i_exitcond12_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond12_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_exitcond12_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_exitcond12_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond12_maxpool2d_r_valid <= SE_i_exitcond12_maxpool2d_backStall and (SR_SE_i_exitcond12_maxpool2d_r_valid or SR_SE_i_exitcond12_maxpool2d_i_valid);

            IF (SR_SE_i_exitcond12_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond12_maxpool2d_r_data0 <= STD_LOGIC_VECTOR(redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q);
                SR_SE_i_exitcond12_maxpool2d_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond12_maxpool2d_and0 <= SE_redist1_stall_entry_o5_6_4_V3;
    SR_SE_i_exitcond12_maxpool2d_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V1 and SR_SE_i_exitcond12_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond12_maxpool2d_backStall <= SR_SE_i_exitcond12_maxpool2d_r_valid or not (SR_SE_i_exitcond12_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_exitcond12_maxpool2d_V <= SR_SE_i_exitcond12_maxpool2d_r_valid WHEN SR_SE_i_exitcond12_maxpool2d_r_valid = "1" ELSE SR_SE_i_exitcond12_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_exitcond12_maxpool2d_D0 <= SR_SE_i_exitcond12_maxpool2d_r_data0 WHEN SR_SE_i_exitcond12_maxpool2d_r_valid = "1" ELSE redist14_bgTrunc_i_inc40_maxpool2d_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond12_maxpool2d_D1 <= SR_SE_i_exitcond12_maxpool2d_r_data1 WHEN SR_SE_i_exitcond12_maxpool2d_r_valid = "1" ELSE bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b;

    -- bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg(STALLENABLE,279)
    -- Valid signal propagation
    bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_V0 <= bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall and bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backEN <= not (bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_v_s_0 <= bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backEN and SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backStall <= not (bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backEN);
    bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0 <= bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0 and bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_R_v_0 <= bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg(STALLREG,283)
    SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid <= bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backStall and (SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid or SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backStall <= SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_V <= SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_i_valid;


    -- SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d(STALLENABLE,196)
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg0 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg1 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed0 <= (not (SR_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_backStall) and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg0;
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed1 <= (not (SR_SE_i_exitcond12_maxpool2d_backStall) and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_StallValid <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid;
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_toReg0 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_toReg1 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_or0 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireStall <= not (SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_consumed1 and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_or0);
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg0);
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V1 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer4_maxpool2d_out_valid_out;

    -- i_syncbuf_output_size_sync_buffer4_maxpool2d(BLACKBOX,53)@5
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer4_maxpool2d : i_syncbuf_output_size_sync_buffer4_maxpool2d46
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_3_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer4_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer4_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer4_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_3(STALLENABLE,277)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_3_V0 <= SE_out_bubble_out_stall_entry_3_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_3_backStall <= i_syncbuf_output_size_sync_buffer4_maxpool2d_out_stall_out or not (SE_out_bubble_out_stall_entry_3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_3_wireValid <= bubble_out_stall_entry_3_reg_valid_out;

    -- bubble_out_stall_entry_3_reg(STALLFIFO,282)
    bubble_out_stall_entry_3_reg_valid_in <= SE_stall_entry_V2;
    bubble_out_stall_entry_3_reg_stall_in <= SE_out_bubble_out_stall_entry_3_backStall;
    bubble_out_stall_entry_3_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_3_reg_valid_in(0);
    bubble_out_stall_entry_3_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_3_reg_stall_in(0);
    bubble_out_stall_entry_3_reg_valid_out(0) <= bubble_out_stall_entry_3_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_3_reg_stall_out(0) <= bubble_out_stall_entry_3_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_3_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 6,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_3_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_3_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_3_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_3_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_output_im_sync_buffer_maxpool2d(BLACKBOX,51)@4
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_im_sync_buffer_maxpool2d : i_syncbuf_output_im_sync_buffer_maxpool2d37
    PORT MAP (
        in_buffer_in => in_output_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_1_V0,
        out_buffer_out => i_syncbuf_output_im_sync_buffer_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_im_sync_buffer_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_im_sync_buffer_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_1(STALLENABLE,273)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_1_V0 <= SE_out_bubble_out_stall_entry_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_1_backStall <= i_syncbuf_output_im_sync_buffer_maxpool2d_out_stall_out or not (SE_out_bubble_out_stall_entry_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_1_wireValid <= bubble_out_stall_entry_1_reg_valid_out;

    -- bubble_out_stall_entry_1_reg(STALLFIFO,280)
    bubble_out_stall_entry_1_reg_valid_in <= SE_stall_entry_V0;
    bubble_out_stall_entry_1_reg_stall_in <= SE_out_bubble_out_stall_entry_1_backStall;
    bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_valid_in(0);
    bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_stall_in(0);
    bubble_out_stall_entry_1_reg_valid_out(0) <= bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_1_reg_stall_out(0) <= bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 5,
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

    -- SE_stall_entry(STALLENABLE,199)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (bubble_out_stall_entry_1_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (bubble_out_stall_entry_2_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (bubble_out_stall_entry_3_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (SE_redist0_stall_entry_o4_1_0_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed3 and SE_stall_entry_or2);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_out_stall_entry_2_reg(STALLFIFO,281)
    bubble_out_stall_entry_2_reg_valid_in <= SE_stall_entry_V1;
    bubble_out_stall_entry_2_reg_stall_in <= SE_out_bubble_out_stall_entry_2_backStall;
    bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_2_reg_valid_in(0);
    bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_2_reg_stall_in(0);
    bubble_out_stall_entry_2_reg_valid_out(0) <= bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_2_reg_stall_out(0) <= bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 5,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_2(STALLENABLE,275)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_2_V0 <= SE_out_bubble_out_stall_entry_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_2_backStall <= i_syncbuf_output_size_sync_buffer3_maxpool2d_out_stall_out or not (SE_out_bubble_out_stall_entry_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_2_wireValid <= bubble_out_stall_entry_2_reg_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_output_size_sync_buffer3_maxpool2d(BLACKBOX,52)@4
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer3_maxpool2d : i_syncbuf_output_size_sync_buffer3_maxpool2d42
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_2_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer3_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer3_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer3_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d(BITJOIN,158)
    bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d_q <= i_syncbuf_output_size_sync_buffer3_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d(BITSELECT,159)
    bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d_q(31 downto 0));

    -- redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0(REG,149)
    redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D5);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg(STALLFIFO,278)
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_in <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V0;
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall;
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_in(0);
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_in(0);
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_out(0) <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_out(0) <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d(STALLENABLE,194)
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0 <= (not (bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_stall_out) and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1 <= (not (SR_SE_i_exitcond11_maxpool2d_backStall) and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg1 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_or0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireStall <= not (SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1 and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_or0);
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0);
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V1 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer3_maxpool2d_out_valid_out;

    -- SE_i_exitcond11_maxpool2d(STALLENABLE,182)
    -- Valid signal propagation
    SE_i_exitcond11_maxpool2d_V0 <= SE_i_exitcond11_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond11_maxpool2d_s_tv_0 <= SE_i_unnamed_maxpool2d45_backStall and SE_i_exitcond11_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond11_maxpool2d_backEN <= not (SE_i_exitcond11_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond11_maxpool2d_v_s_0 <= SE_i_exitcond11_maxpool2d_backEN and SR_SE_i_exitcond11_maxpool2d_V;
    -- Backward Stall generation
    SE_i_exitcond11_maxpool2d_backStall <= not (SE_i_exitcond11_maxpool2d_backEN);
    SE_i_exitcond11_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond11_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond11_maxpool2d_backEN = "0") THEN
                SE_i_exitcond11_maxpool2d_R_v_0 <= SE_i_exitcond11_maxpool2d_R_v_0 and SE_i_exitcond11_maxpool2d_s_tv_0;
            ELSE
                SE_i_exitcond11_maxpool2d_R_v_0 <= SE_i_exitcond11_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond11_maxpool2d(STALLREG,288)
    SR_SE_i_exitcond11_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond11_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_exitcond11_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_exitcond11_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond11_maxpool2d_r_valid <= SE_i_exitcond11_maxpool2d_backStall and (SR_SE_i_exitcond11_maxpool2d_r_valid or SR_SE_i_exitcond11_maxpool2d_i_valid);

            IF (SR_SE_i_exitcond11_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond11_maxpool2d_r_data0 <= STD_LOGIC_VECTOR(redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q);
                SR_SE_i_exitcond11_maxpool2d_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond11_maxpool2d_and0 <= SE_redist1_stall_entry_o5_6_3_V2;
    SR_SE_i_exitcond11_maxpool2d_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V1 and SR_SE_i_exitcond11_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond11_maxpool2d_backStall <= SR_SE_i_exitcond11_maxpool2d_r_valid or not (SR_SE_i_exitcond11_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_exitcond11_maxpool2d_V <= SR_SE_i_exitcond11_maxpool2d_r_valid WHEN SR_SE_i_exitcond11_maxpool2d_r_valid = "1" ELSE SR_SE_i_exitcond11_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_exitcond11_maxpool2d_D0 <= SR_SE_i_exitcond11_maxpool2d_r_data0 WHEN SR_SE_i_exitcond11_maxpool2d_r_valid = "1" ELSE redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond11_maxpool2d_D1 <= SR_SE_i_exitcond11_maxpool2d_r_data1 WHEN SR_SE_i_exitcond11_maxpool2d_r_valid = "1" ELSE bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b;

    -- c_i32_1gr(CONSTANT,34)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc40_maxpool2d(ADD,48)@4
    i_inc40_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist8_stall_entry_o9_4_3_q);
    i_inc40_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc40_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc40_maxpool2d_a) + UNSIGNED(i_inc40_maxpool2d_b));
    i_inc40_maxpool2d_q <= i_inc40_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_inc40_maxpool2d_sel_x(BITSELECT,5)@4
    bgTrunc_i_inc40_maxpool2d_sel_x_b <= i_inc40_maxpool2d_q(31 downto 0);

    -- redist8_stall_entry_o9_4_3(REG,141)
    redist8_stall_entry_o9_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_o9_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist8_stall_entry_o9_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_o7_6_1(REG,129)
    redist4_stall_entry_o7_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o7_6_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist4_stall_entry_o7_6_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o5_6_3(REG,119)
    redist1_stall_entry_o5_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o5_6_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist1_stall_entry_o5_6_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_o5_6_4(STALLREG,286)
    SR_SE_redist1_stall_entry_o5_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_o5_6_4_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_o5_6_4_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_4_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_4_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_4_r_data3 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_4_r_data4 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_4_r_data5 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_o5_6_4_r_valid <= SE_redist1_stall_entry_o5_6_4_backStall and (SR_SE_redist1_stall_entry_o5_6_4_r_valid or SR_SE_redist1_stall_entry_o5_6_4_i_valid);

            IF (SR_SE_redist1_stall_entry_o5_6_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_o5_6_4_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_o5_6_3_q);
                SR_SE_redist1_stall_entry_o5_6_4_r_data1 <= STD_LOGIC_VECTOR(redist4_stall_entry_o7_6_1_q);
                SR_SE_redist1_stall_entry_o5_6_4_r_data2 <= STD_LOGIC_VECTOR(redist5_stall_entry_o8_4_3_q);
                SR_SE_redist1_stall_entry_o5_6_4_r_data3 <= STD_LOGIC_VECTOR(redist8_stall_entry_o9_4_3_q);
                SR_SE_redist1_stall_entry_o5_6_4_r_data4 <= STD_LOGIC_VECTOR(bgTrunc_i_inc40_maxpool2d_sel_x_b);
                SR_SE_redist1_stall_entry_o5_6_4_r_data5 <= STD_LOGIC_VECTOR(redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_o5_6_4_i_valid <= SE_redist1_stall_entry_o5_6_3_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_o5_6_4_backStall <= SR_SE_redist1_stall_entry_o5_6_4_r_valid or not (SR_SE_redist1_stall_entry_o5_6_4_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_o5_6_4_V <= SR_SE_redist1_stall_entry_o5_6_4_r_valid WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE SR_SE_redist1_stall_entry_o5_6_4_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_o5_6_4_D0 <= SR_SE_redist1_stall_entry_o5_6_4_r_data0 WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE redist1_stall_entry_o5_6_3_q;
    -- Data1
    SR_SE_redist1_stall_entry_o5_6_4_D1 <= SR_SE_redist1_stall_entry_o5_6_4_r_data1 WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE redist4_stall_entry_o7_6_1_q;
    -- Data2
    SR_SE_redist1_stall_entry_o5_6_4_D2 <= SR_SE_redist1_stall_entry_o5_6_4_r_data2 WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE redist5_stall_entry_o8_4_3_q;
    -- Data3
    SR_SE_redist1_stall_entry_o5_6_4_D3 <= SR_SE_redist1_stall_entry_o5_6_4_r_data3 WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE redist8_stall_entry_o9_4_3_q;
    -- Data4
    SR_SE_redist1_stall_entry_o5_6_4_D4 <= SR_SE_redist1_stall_entry_o5_6_4_r_data4 WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE bgTrunc_i_inc40_maxpool2d_sel_x_b;
    -- Data5
    SR_SE_redist1_stall_entry_o5_6_4_D5 <= SR_SE_redist1_stall_entry_o5_6_4_r_data5 WHEN SR_SE_redist1_stall_entry_o5_6_4_r_valid = "1" ELSE redist15_bgTrunc_i_inc37_maxpool2d_sel_x_b_1_0_q;

    -- SE_redist1_stall_entry_o5_6_3(STALLENABLE,216)
    -- Valid signal propagation
    SE_redist1_stall_entry_o5_6_3_V0 <= SE_redist1_stall_entry_o5_6_3_R_v_0;
    SE_redist1_stall_entry_o5_6_3_V1 <= SE_redist1_stall_entry_o5_6_3_R_v_1;
    SE_redist1_stall_entry_o5_6_3_V2 <= SE_redist1_stall_entry_o5_6_3_R_v_2;
    -- Stall signal propagation
    SE_redist1_stall_entry_o5_6_3_s_tv_0 <= SR_SE_redist1_stall_entry_o5_6_4_backStall and SE_redist1_stall_entry_o5_6_3_R_v_0;
    SE_redist1_stall_entry_o5_6_3_s_tv_1 <= SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_backStall and SE_redist1_stall_entry_o5_6_3_R_v_1;
    SE_redist1_stall_entry_o5_6_3_s_tv_2 <= SR_SE_i_exitcond11_maxpool2d_backStall and SE_redist1_stall_entry_o5_6_3_R_v_2;
    -- Backward Enable generation
    SE_redist1_stall_entry_o5_6_3_or0 <= SE_redist1_stall_entry_o5_6_3_s_tv_0;
    SE_redist1_stall_entry_o5_6_3_or1 <= SE_redist1_stall_entry_o5_6_3_s_tv_1 or SE_redist1_stall_entry_o5_6_3_or0;
    SE_redist1_stall_entry_o5_6_3_backEN <= not (SE_redist1_stall_entry_o5_6_3_s_tv_2 or SE_redist1_stall_entry_o5_6_3_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_o5_6_3_v_s_0 <= SE_redist1_stall_entry_o5_6_3_backEN and SR_SE_redist1_stall_entry_o5_6_3_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_o5_6_3_backStall <= not (SE_redist1_stall_entry_o5_6_3_backEN);
    SE_redist1_stall_entry_o5_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_o5_6_3_R_v_0 <= (others => '0');
            SE_redist1_stall_entry_o5_6_3_R_v_1 <= (others => '0');
            SE_redist1_stall_entry_o5_6_3_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_3_R_v_0 <= SE_redist1_stall_entry_o5_6_3_R_v_0 and SE_redist1_stall_entry_o5_6_3_s_tv_0;
            ELSE
                SE_redist1_stall_entry_o5_6_3_R_v_0 <= SE_redist1_stall_entry_o5_6_3_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_o5_6_3_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_3_R_v_1 <= SE_redist1_stall_entry_o5_6_3_R_v_1 and SE_redist1_stall_entry_o5_6_3_s_tv_1;
            ELSE
                SE_redist1_stall_entry_o5_6_3_R_v_1 <= SE_redist1_stall_entry_o5_6_3_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_o5_6_3_backEN = "0") THEN
                SE_redist1_stall_entry_o5_6_3_R_v_2 <= SE_redist1_stall_entry_o5_6_3_R_v_2 and SE_redist1_stall_entry_o5_6_3_s_tv_2;
            ELSE
                SE_redist1_stall_entry_o5_6_3_R_v_2 <= SE_redist1_stall_entry_o5_6_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_multconst_x(CONSTANT,21)
    i_arrayidx35_maxpool2d_maxpool2d39_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist3_stall_entry_o7_2_1(REG,127)
    redist3_stall_entry_o7_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o7_2_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist3_stall_entry_o7_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_bgTrunc_i_add33_maxpool2d_sel_x_b_1_0(REG,152)
    redist18_bgTrunc_i_add33_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_bgTrunc_i_add33_maxpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist18_bgTrunc_i_add33_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D6);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom34_maxpool2d_sel_x(BITSELECT,27)@2
    i_idxprom34_maxpool2d_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist18_bgTrunc_i_add33_maxpool2d_sel_x_b_1_0_q(31 downto 0)), 64)));

    -- i_add_ptr5_sum_maxpool2d(ADD,40)@2
    i_add_ptr5_sum_maxpool2d_a <= STD_LOGIC_VECTOR("0" & i_idxprom34_maxpool2d_sel_x_b);
    i_add_ptr5_sum_maxpool2d_b <= STD_LOGIC_VECTOR("0" & redist3_stall_entry_o7_2_1_q);
    i_add_ptr5_sum_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr5_sum_maxpool2d_a) + UNSIGNED(i_add_ptr5_sum_maxpool2d_b));
    i_add_ptr5_sum_maxpool2d_q <= i_add_ptr5_sum_maxpool2d_o(64 downto 0);

    -- bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x(BITSELECT,3)@2
    bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b <= i_add_ptr5_sum_maxpool2d_q(63 downto 0);

    -- redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0(REG,151)
    redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select(BITSELECT,95)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_b <= redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_c <= redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_d <= redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_e <= redist17_bgTrunc_i_add_ptr5_sum_maxpool2d_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0(BITSHIFT,92)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0_qint <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15(BITSHIFT,83)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0(BITSHIFT,93)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0_qint <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14(BITSHIFT,82)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_16(BITJOIN,84)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_16_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_15_q & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_14_q;

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0(BITSHIFT,94)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0_qint <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12(BITSHIFT,80)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0(BITSHIFT,91)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0_qint <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_13(BITJOIN,81)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_13_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_im0_shift0_q);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0(ADD,85)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_13_q);
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_join_16_q);
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_b));
    i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_mult_extender_x(BITJOIN,20)@3
    i_arrayidx35_maxpool2d_maxpool2d39_mult_extender_x_q <= i_arrayidx35_maxpool2d_maxpool2d39_mult_multconst_x_q & i_arrayidx35_maxpool2d_maxpool2d39_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x(BITSELECT,22)@3
    i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b <= i_arrayidx35_maxpool2d_maxpool2d39_mult_extender_x_q(63 downto 0);

    -- redist11_stall_entry_o10_3_0(REG,144)
    redist11_stall_entry_o10_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_stall_entry_o10_3_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist11_stall_entry_o10_3_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_stall_entry_o10_3_1(REG,145)
    redist11_stall_entry_o10_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_stall_entry_o10_3_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist11_stall_entry_o10_3_1_q <= STD_LOGIC_VECTOR(redist11_stall_entry_o10_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_inc37_maxpool2d(ADD,47)@3
    i_inc37_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist11_stall_entry_o10_3_1_q);
    i_inc37_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc37_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc37_maxpool2d_a) + UNSIGNED(i_inc37_maxpool2d_b));
    i_inc37_maxpool2d_q <= i_inc37_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_inc37_maxpool2d_sel_x(BITSELECT,4)@3
    bgTrunc_i_inc37_maxpool2d_sel_x_b <= i_inc37_maxpool2d_q(31 downto 0);

    -- redist8_stall_entry_o9_4_1(REG,139)
    redist8_stall_entry_o9_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_o9_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist8_stall_entry_o9_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_o9_4_2(REG,140)
    redist8_stall_entry_o9_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_o9_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist8_stall_entry_o9_4_2_q <= STD_LOGIC_VECTOR(redist8_stall_entry_o9_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_o8_4_1(REG,133)
    redist5_stall_entry_o8_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_o8_4_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist5_stall_entry_o8_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_o8_4_2(REG,134)
    redist5_stall_entry_o8_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_o8_4_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist5_stall_entry_o8_4_2_q <= STD_LOGIC_VECTOR(redist5_stall_entry_o8_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_o7_6_0(REG,128)
    redist4_stall_entry_o7_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o7_6_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist4_stall_entry_o7_6_0_q <= STD_LOGIC_VECTOR(redist3_stall_entry_o7_2_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_o6_4_1(REG,123)
    redist2_stall_entry_o6_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_o6_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist2_stall_entry_o6_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_o6_4_2(REG,124)
    redist2_stall_entry_o6_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_o6_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist2_stall_entry_o6_4_2_q <= STD_LOGIC_VECTOR(redist2_stall_entry_o6_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o5_6_1(REG,117)
    redist1_stall_entry_o5_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o5_6_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_1_backEN = "1") THEN
                redist1_stall_entry_o5_6_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o5_6_2(REG,118)
    redist1_stall_entry_o5_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o5_6_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_2_backEN = "1") THEN
                redist1_stall_entry_o5_6_2_q <= STD_LOGIC_VECTOR(redist1_stall_entry_o5_6_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_o5_6_3(STALLREG,285)
    SR_SE_redist1_stall_entry_o5_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_o5_6_3_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_o5_6_3_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_3_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_3_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_3_r_data3 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_3_r_data4 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_3_r_data5 <= (others => '-');
            SR_SE_redist1_stall_entry_o5_6_3_r_data6 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_o5_6_3_r_valid <= SE_redist1_stall_entry_o5_6_3_backStall and (SR_SE_redist1_stall_entry_o5_6_3_r_valid or SR_SE_redist1_stall_entry_o5_6_3_i_valid);

            IF (SR_SE_redist1_stall_entry_o5_6_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_o5_6_3_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_o5_6_2_q);
                SR_SE_redist1_stall_entry_o5_6_3_r_data1 <= STD_LOGIC_VECTOR(redist2_stall_entry_o6_4_2_q);
                SR_SE_redist1_stall_entry_o5_6_3_r_data2 <= STD_LOGIC_VECTOR(redist4_stall_entry_o7_6_0_q);
                SR_SE_redist1_stall_entry_o5_6_3_r_data3 <= STD_LOGIC_VECTOR(redist5_stall_entry_o8_4_2_q);
                SR_SE_redist1_stall_entry_o5_6_3_r_data4 <= STD_LOGIC_VECTOR(redist8_stall_entry_o9_4_2_q);
                SR_SE_redist1_stall_entry_o5_6_3_r_data5 <= STD_LOGIC_VECTOR(bgTrunc_i_inc37_maxpool2d_sel_x_b);
                SR_SE_redist1_stall_entry_o5_6_3_r_data6 <= STD_LOGIC_VECTOR(i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_o5_6_3_i_valid <= SE_redist1_stall_entry_o5_6_2_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_o5_6_3_backStall <= SR_SE_redist1_stall_entry_o5_6_3_r_valid or not (SR_SE_redist1_stall_entry_o5_6_3_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_o5_6_3_V <= SR_SE_redist1_stall_entry_o5_6_3_r_valid WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE SR_SE_redist1_stall_entry_o5_6_3_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_o5_6_3_D0 <= SR_SE_redist1_stall_entry_o5_6_3_r_data0 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE redist1_stall_entry_o5_6_2_q;
    -- Data1
    SR_SE_redist1_stall_entry_o5_6_3_D1 <= SR_SE_redist1_stall_entry_o5_6_3_r_data1 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE redist2_stall_entry_o6_4_2_q;
    -- Data2
    SR_SE_redist1_stall_entry_o5_6_3_D2 <= SR_SE_redist1_stall_entry_o5_6_3_r_data2 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE redist4_stall_entry_o7_6_0_q;
    -- Data3
    SR_SE_redist1_stall_entry_o5_6_3_D3 <= SR_SE_redist1_stall_entry_o5_6_3_r_data3 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE redist5_stall_entry_o8_4_2_q;
    -- Data4
    SR_SE_redist1_stall_entry_o5_6_3_D4 <= SR_SE_redist1_stall_entry_o5_6_3_r_data4 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE redist8_stall_entry_o9_4_2_q;
    -- Data5
    SR_SE_redist1_stall_entry_o5_6_3_D5 <= SR_SE_redist1_stall_entry_o5_6_3_r_data5 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE bgTrunc_i_inc37_maxpool2d_sel_x_b;
    -- Data6
    SR_SE_redist1_stall_entry_o5_6_3_D6 <= SR_SE_redist1_stall_entry_o5_6_3_r_data6 WHEN SR_SE_redist1_stall_entry_o5_6_3_r_valid = "1" ELSE i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b;

    -- redist2_stall_entry_o6_4_3(REG,125)
    redist2_stall_entry_o6_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_o6_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist2_stall_entry_o6_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d(STALLENABLE,192)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_V0 <= SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_backStall <= i_store_unnamed_maxpool2d1_maxpool2d_out_o_stall or not (SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_and0 <= i_syncbuf_output_im_sync_buffer_maxpool2d_out_valid_out;
    SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_wireValid <= SE_redist1_stall_entry_o5_6_3_V1 and SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_and0;

    -- SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1(STALLENABLE,267)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_V0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and0 <= bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_reg_V0;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and1 <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_valid_out and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and0;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and2 <= SE_i_exitcond12_maxpool2d_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and1;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and3 <= i_store_unnamed_maxpool2d1_maxpool2d_out_o_valid and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and2;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and4 <= SE_redist12_i_unnamed_maxpool2d45_q_1_0_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and3;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and5 <= SE_redist1_stall_entry_o5_6_5_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and4;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_wireValid <= SE_i_i_08_lc_outerphi_maxpool2d_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_and5;

    -- redist5_stall_entry_o8_4_3(REG,135)
    redist5_stall_entry_o8_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_o8_4_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist5_stall_entry_o8_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b_1_0(REG,147)
    redist13_i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_3_backEN = "1") THEN
                redist13_i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_3_D6);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_output_im_sync_buffer_maxpool2d(BITJOIN,155)
    bubble_join_i_syncbuf_output_im_sync_buffer_maxpool2d_q <= i_syncbuf_output_im_sync_buffer_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_im_sync_buffer_maxpool2d(BITSELECT,156)
    bubble_select_i_syncbuf_output_im_sync_buffer_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_im_sync_buffer_maxpool2d_q(63 downto 0));

    -- i_arrayidx35_maxpool2d_maxpool2d39_add_x(ADD,23)@4
    i_arrayidx35_maxpool2d_maxpool2d39_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_output_im_sync_buffer_maxpool2d_b);
    i_arrayidx35_maxpool2d_maxpool2d39_add_x_b <= STD_LOGIC_VECTOR("0" & redist13_i_arrayidx35_maxpool2d_maxpool2d39_trunc_sel_x_b_1_0_q);
    i_arrayidx35_maxpool2d_maxpool2d39_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx35_maxpool2d_maxpool2d39_add_x_a) + UNSIGNED(i_arrayidx35_maxpool2d_maxpool2d39_add_x_b));
    i_arrayidx35_maxpool2d_maxpool2d39_add_x_q <= i_arrayidx35_maxpool2d_maxpool2d39_add_x_o(64 downto 0);

    -- i_arrayidx35_maxpool2d_maxpool2d39_dupName_0_trunc_sel_x(BITSELECT,17)@4
    i_arrayidx35_maxpool2d_maxpool2d39_dupName_0_trunc_sel_x_b <= i_arrayidx35_maxpool2d_maxpool2d39_add_x_q(63 downto 0);

    -- i_store_unnamed_maxpool2d1_maxpool2d(BLACKBOX,50)@4
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_maxpool2d1_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@6
    -- out out_unnamed_maxpool2d1_avm_address@20000000
    -- out out_unnamed_maxpool2d1_avm_burstcount@20000000
    -- out out_unnamed_maxpool2d1_avm_byteenable@20000000
    -- out out_unnamed_maxpool2d1_avm_enable@20000000
    -- out out_unnamed_maxpool2d1_avm_read@20000000
    -- out out_unnamed_maxpool2d1_avm_write@20000000
    -- out out_unnamed_maxpool2d1_avm_writedata@20000000
    thei_store_unnamed_maxpool2d1_maxpool2d : i_store_unnamed_maxpool2d1_maxpool2d40
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx35_maxpool2d_maxpool2d39_dupName_0_trunc_sel_x_b,
        in_i_predicate => redist5_stall_entry_o8_4_3_q,
        in_i_stall => SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_backStall,
        in_i_valid => SE_out_i_syncbuf_output_im_sync_buffer_maxpool2d_V0,
        in_i_writedata => redist2_stall_entry_o6_4_3_q,
        in_unnamed_maxpool2d1_avm_readdata => in_unnamed_maxpool2d1_avm_readdata,
        in_unnamed_maxpool2d1_avm_readdatavalid => in_unnamed_maxpool2d1_avm_readdatavalid,
        in_unnamed_maxpool2d1_avm_waitrequest => in_unnamed_maxpool2d1_avm_waitrequest,
        in_unnamed_maxpool2d1_avm_writeack => in_unnamed_maxpool2d1_avm_writeack,
        out_lsu_unnamed_maxpool2d1_o_active => i_store_unnamed_maxpool2d1_maxpool2d_out_lsu_unnamed_maxpool2d1_o_active,
        out_o_stall => i_store_unnamed_maxpool2d1_maxpool2d_out_o_stall,
        out_o_valid => i_store_unnamed_maxpool2d1_maxpool2d_out_o_valid,
        out_unnamed_maxpool2d1_avm_address => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_address,
        out_unnamed_maxpool2d1_avm_burstcount => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_burstcount,
        out_unnamed_maxpool2d1_avm_byteenable => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_byteenable,
        out_unnamed_maxpool2d1_avm_enable => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_enable,
        out_unnamed_maxpool2d1_avm_read => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_read,
        out_unnamed_maxpool2d1_avm_write => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_write,
        out_unnamed_maxpool2d1_avm_writedata => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,6)
    out_lsu_unnamed_maxpool2d1_o_active <= i_store_unnamed_maxpool2d1_maxpool2d_out_lsu_unnamed_maxpool2d1_o_active;

    -- c_i32_0gr(CONSTANT,33)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_j_16_lc_innerphi_maxpool2d(MUX,49)@5 + 1
    i_j_16_lc_innerphi_maxpool2d_s <= SR_SE_i_i_08_lc_outerphi_maxpool2d_D1;
    i_j_16_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_j_16_lc_innerphi_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_08_lc_outerphi_maxpool2d_backEN = "1") THEN
                CASE (i_j_16_lc_innerphi_maxpool2d_s) IS
                    WHEN "0" => i_j_16_lc_innerphi_maxpool2d_q <= SR_SE_i_i_08_lc_outerphi_maxpool2d_D4;
                    WHEN "1" => i_j_16_lc_innerphi_maxpool2d_q <= c_i32_0gr_q;
                    WHEN OTHERS => i_j_16_lc_innerphi_maxpool2d_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- i_i_08_lc_outerphi_maxpool2d(MUX,44)@5 + 1
    i_i_08_lc_outerphi_maxpool2d_s <= SR_SE_i_i_08_lc_outerphi_maxpool2d_D0;
    i_i_08_lc_outerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_i_08_lc_outerphi_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_08_lc_outerphi_maxpool2d_backEN = "1") THEN
                CASE (i_i_08_lc_outerphi_maxpool2d_s) IS
                    WHEN "0" => i_i_08_lc_outerphi_maxpool2d_q <= SR_SE_i_i_08_lc_outerphi_maxpool2d_D2;
                    WHEN "1" => i_i_08_lc_outerphi_maxpool2d_q <= SR_SE_i_i_08_lc_outerphi_maxpool2d_D3;
                    WHEN OTHERS => i_i_08_lc_outerphi_maxpool2d_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_o8_6_0(REG,137)
    redist7_stall_entry_o8_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o8_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_5_backEN = "1") THEN
                redist7_stall_entry_o8_6_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_5_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_exitcond12_maxpool2d(LOGICAL,42)@5 + 1
    i_exitcond12_maxpool2d_qi <= "1" WHEN SR_SE_i_exitcond12_maxpool2d_D0 = SR_SE_i_exitcond12_maxpool2d_D1 ELSE "0";
    i_exitcond12_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond12_maxpool2d_qi, xout => i_exitcond12_maxpool2d_q, ena => SE_i_exitcond12_maxpool2d_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_maxpool2d49(LOGICAL,55)@6
    i_unnamed_maxpool2d49_q <= i_exitcond12_maxpool2d_q or redist7_stall_entry_o8_6_0_q;

    -- redist12_i_unnamed_maxpool2d45_q_1_0(REG,146)
    redist12_i_unnamed_maxpool2d45_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_unnamed_maxpool2d45_q_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_unnamed_maxpool2d45_q_1_0_backEN = "1") THEN
                redist12_i_unnamed_maxpool2d45_q_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist12_i_unnamed_maxpool2d45_q_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_for_end41_loopexit_loopexit_lc_cond_maxpool2d(LOGICAL,43)@6
    i_for_end41_loopexit_loopexit_lc_cond_maxpool2d_q <= redist12_i_unnamed_maxpool2d45_q_1_0_q and i_unnamed_maxpool2d49_q;

    -- redist4_stall_entry_o7_6_3(REG,131)
    redist4_stall_entry_o7_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o7_6_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_5_backEN = "1") THEN
                redist4_stall_entry_o7_6_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_5_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o5_6_5(REG,121)
    redist1_stall_entry_o5_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o5_6_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_o5_6_5_backEN = "1") THEN
                redist1_stall_entry_o5_6_5_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_o5_6_5_D0);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,11)@6
    out_c0_exe13 <= redist1_stall_entry_o5_6_5_q;
    out_c1_exe14 <= redist4_stall_entry_o7_6_3_q;
    out_for_end41_loopexit_loopexit_LC_COND <= i_for_end41_loopexit_loopexit_lc_cond_maxpool2d_q;
    out_i_08_LC_OuterPHI <= i_i_08_lc_outerphi_maxpool2d_q;
    out_j_16_LC_InnerPHI <= i_j_16_lc_innerphi_maxpool2d_q;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_1_V0;

    -- ext_sig_sync_out(GPOUT,38)
    out_unnamed_maxpool2d1_avm_address <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_address;
    out_unnamed_maxpool2d1_avm_enable <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_enable;
    out_unnamed_maxpool2d1_avm_read <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_read;
    out_unnamed_maxpool2d1_avm_write <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_write;
    out_unnamed_maxpool2d1_avm_writedata <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_writedata;
    out_unnamed_maxpool2d1_avm_byteenable <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_byteenable;
    out_unnamed_maxpool2d1_avm_burstcount <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_burstcount;

    -- sync_out(GPOUT,67)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
