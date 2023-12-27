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

-- VHDL created from bb_conv2d1x1_B3_stall_region
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

entity bb_conv2d1x1_B3_stall_region is
    port (
        out_lsu_unnamed_conv2d1x111_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_add15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe12118 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe27 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe111 : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp9_phi_decision20_xor_RM17 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_01013 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d1x19 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe27 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc68 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x110 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_conv2d1x111_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x111_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x111_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x111_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x111_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B3_stall_region;

architecture normal of bb_conv2d1x1_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1 is
        port (
            in_c0_eni223_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni223_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni223_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit28_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit28_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_conv2d1x111_conv2d1x175 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x111_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d1x111_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_sync_buffer5_conv2d1x170 is
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


    component i_syncbuf_output_im_sync_buffer_conv2d1x168 is
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
    signal bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_inc68_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom65_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_c0_exit28_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_ptr6_sum_conv2d1x1_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr6_sum_conv2d1x1_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr6_sum_conv2d1x1_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr6_sum_conv2d1x1_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_exitcond11_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond11_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc68_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_lsu_unnamed_conv2d1x111_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_output_im_sync_buffer_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x174_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x174_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_o4_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_o4_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_o4_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_o4_5_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_o4_5_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_o5_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_9_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_9_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_o7_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o7_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o7_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o7_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o7_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_o7_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o7_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o7_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o7_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o7_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_o8_5_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o8_5_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o8_5_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o8_5_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o8_5_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o8_9_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o8_9_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o8_9_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o8_9_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_stall_entry_o9_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o9_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o9_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o9_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o9_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_stall_entry_o9_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o9_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o9_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o9_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o9_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_stall_entry_o10_7_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o10_7_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o10_7_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o10_7_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o10_7_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o10_7_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o10_7_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o11_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_stall_entry_o11_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_stall_entry_o11_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_stall_entry_o11_5_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_stall_entry_o11_5_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_stall_entry_o12_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o12_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o12_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o12_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o12_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_stall_entry_o12_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o12_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o12_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o12_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o12_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_i_unnamed_conv2d1x174_q_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_sync_buffer5_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_sync_buffer5_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_im_sync_buffer_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_output_im_sync_buffer_conv2d1x1_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (320 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist1_stall_entry_o5_9_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist1_stall_entry_o5_9_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist2_stall_entry_o7_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_stall_entry_o7_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_stall_entry_o9_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_stall_entry_o9_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist8_stall_entry_o12_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_stall_entry_o12_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_i_exitcond11_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond11_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x174_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x174_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x174_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x174_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x174_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x174_V0 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SE_stall_entry_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_5_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_1_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_stall_entry_o8_9_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o12_9_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_conv2d1x174_q_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_conv2d1x174_q_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_conv2d1x174_q_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_conv2d1x174_q_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_conv2d1x174_q_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_out_bitsignaltemp : std_logic;
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
    signal SR_SE_redist0_stall_entry_o4_5_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_r_data1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_D1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_1_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_r_data1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_D1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_5_3_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_0_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_1_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist4_stall_entry_o8_9_2_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond11_conv2d1x1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_conv2d1x174_D1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- redist8_stall_entry_o12_9_fifo(STALLFIFO,124)
    redist8_stall_entry_o12_9_fifo_valid_in <= SE_stall_entry_V7;
    redist8_stall_entry_o12_9_fifo_stall_in <= SE_out_redist8_stall_entry_o12_9_fifo_backStall;
    redist8_stall_entry_o12_9_fifo_data_in <= bubble_select_stall_entry_j;
    redist8_stall_entry_o12_9_fifo_valid_in_bitsignaltemp <= redist8_stall_entry_o12_9_fifo_valid_in(0);
    redist8_stall_entry_o12_9_fifo_stall_in_bitsignaltemp <= redist8_stall_entry_o12_9_fifo_stall_in(0);
    redist8_stall_entry_o12_9_fifo_valid_out(0) <= redist8_stall_entry_o12_9_fifo_valid_out_bitsignaltemp;
    redist8_stall_entry_o12_9_fifo_stall_out(0) <= redist8_stall_entry_o12_9_fifo_stall_out_bitsignaltemp;
    theredist8_stall_entry_o12_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_stall_entry_o12_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_stall_entry_o12_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_j,
        valid_out => redist8_stall_entry_o12_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_stall_entry_o12_9_fifo_stall_out_bitsignaltemp,
        data_out => redist8_stall_entry_o12_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_stall_entry_o9_9_fifo(STALLFIFO,111)
    redist5_stall_entry_o9_9_fifo_valid_in <= SE_stall_entry_V6;
    redist5_stall_entry_o9_9_fifo_stall_in <= SE_out_redist8_stall_entry_o12_9_fifo_backStall;
    redist5_stall_entry_o9_9_fifo_data_in <= bubble_select_stall_entry_g;
    redist5_stall_entry_o9_9_fifo_valid_in_bitsignaltemp <= redist5_stall_entry_o9_9_fifo_valid_in(0);
    redist5_stall_entry_o9_9_fifo_stall_in_bitsignaltemp <= redist5_stall_entry_o9_9_fifo_stall_in(0);
    redist5_stall_entry_o9_9_fifo_valid_out(0) <= redist5_stall_entry_o9_9_fifo_valid_out_bitsignaltemp;
    redist5_stall_entry_o9_9_fifo_stall_out(0) <= redist5_stall_entry_o9_9_fifo_stall_out_bitsignaltemp;
    theredist5_stall_entry_o9_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_stall_entry_o9_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_stall_entry_o9_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_g,
        valid_out => redist5_stall_entry_o9_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_stall_entry_o9_9_fifo_stall_out_bitsignaltemp,
        data_out => redist5_stall_entry_o9_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_stall_entry_o7_9_fifo(STALLFIFO,101)
    redist2_stall_entry_o7_9_fifo_valid_in <= SE_stall_entry_V5;
    redist2_stall_entry_o7_9_fifo_stall_in <= SE_out_redist8_stall_entry_o12_9_fifo_backStall;
    redist2_stall_entry_o7_9_fifo_data_in <= bubble_select_stall_entry_e;
    redist2_stall_entry_o7_9_fifo_valid_in_bitsignaltemp <= redist2_stall_entry_o7_9_fifo_valid_in(0);
    redist2_stall_entry_o7_9_fifo_stall_in_bitsignaltemp <= redist2_stall_entry_o7_9_fifo_stall_in(0);
    redist2_stall_entry_o7_9_fifo_valid_out(0) <= redist2_stall_entry_o7_9_fifo_valid_out_bitsignaltemp;
    redist2_stall_entry_o7_9_fifo_stall_out(0) <= redist2_stall_entry_o7_9_fifo_stall_out_bitsignaltemp;
    theredist2_stall_entry_o7_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_stall_entry_o7_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_stall_entry_o7_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_e,
        valid_out => redist2_stall_entry_o7_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_stall_entry_o7_9_fifo_stall_out_bitsignaltemp,
        data_out => redist2_stall_entry_o7_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_stall_entry_o5_9_fifo(STALLFIFO,100)
    redist1_stall_entry_o5_9_fifo_valid_in <= SE_stall_entry_V4;
    redist1_stall_entry_o5_9_fifo_stall_in <= SE_out_redist8_stall_entry_o12_9_fifo_backStall;
    redist1_stall_entry_o5_9_fifo_data_in <= bubble_select_stall_entry_c;
    redist1_stall_entry_o5_9_fifo_valid_in_bitsignaltemp <= redist1_stall_entry_o5_9_fifo_valid_in(0);
    redist1_stall_entry_o5_9_fifo_stall_in_bitsignaltemp <= redist1_stall_entry_o5_9_fifo_stall_in(0);
    redist1_stall_entry_o5_9_fifo_valid_out(0) <= redist1_stall_entry_o5_9_fifo_valid_out_bitsignaltemp;
    redist1_stall_entry_o5_9_fifo_stall_out(0) <= redist1_stall_entry_o5_9_fifo_stall_out_bitsignaltemp;
    theredist1_stall_entry_o5_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_stall_entry_o5_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_stall_entry_o5_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_c,
        valid_out => redist1_stall_entry_o5_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_stall_entry_o5_9_fifo_stall_out_bitsignaltemp,
        data_out => redist1_stall_entry_o5_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_stall_entry_o11_5_0(REG,119)
    redist7_stall_entry_o11_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o11_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_0_backEN = "1") THEN
                redist7_stall_entry_o11_5_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_i);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o10_7_0(REG,112)
    redist6_stall_entry_o10_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_0_backEN = "1") THEN
                redist6_stall_entry_o10_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o8_5_0(REG,102)
    redist3_stall_entry_o8_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o8_5_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_0_backEN = "1") THEN
                redist3_stall_entry_o8_5_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_5_0(REG,95)
    redist0_stall_entry_o4_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_0_backEN = "1") THEN
                redist0_stall_entry_o4_5_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_o11_5_1(REG,120)
    redist7_stall_entry_o11_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o11_5_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_1_backEN = "1") THEN
                redist7_stall_entry_o11_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_1_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_o11_5_2(REG,121)
    redist7_stall_entry_o11_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o11_5_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_2_backEN = "1") THEN
                redist7_stall_entry_o11_5_2_q <= STD_LOGIC_VECTOR(redist7_stall_entry_o11_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o10_7_1(REG,113)
    redist6_stall_entry_o10_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_1_backEN = "1") THEN
                redist6_stall_entry_o10_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o10_7_2(REG,114)
    redist6_stall_entry_o10_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_2_backEN = "1") THEN
                redist6_stall_entry_o10_7_2_q <= STD_LOGIC_VECTOR(redist6_stall_entry_o10_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o8_5_1(REG,103)
    redist3_stall_entry_o8_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o8_5_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_1_backEN = "1") THEN
                redist3_stall_entry_o8_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o8_5_2(REG,104)
    redist3_stall_entry_o8_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o8_5_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_2_backEN = "1") THEN
                redist3_stall_entry_o8_5_2_q <= STD_LOGIC_VECTOR(redist3_stall_entry_o8_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_5_1(REG,96)
    redist0_stall_entry_o4_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_5_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_1_backEN = "1") THEN
                redist0_stall_entry_o4_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_5_2(REG,97)
    redist0_stall_entry_o4_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_5_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_2_backEN = "1") THEN
                redist0_stall_entry_o4_5_2_q <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_5_3(REG,98)
    redist0_stall_entry_o4_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_5_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_3_backEN = "1") THEN
                redist0_stall_entry_o4_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_5_4(REG,99)
    redist0_stall_entry_o4_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_5_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_4_backEN = "1") THEN
                redist0_stall_entry_o4_5_4_q <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_5_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom65_conv2d1x1_sel_x(BITSELECT,26)@5
    i_idxprom65_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist0_stall_entry_o4_5_4_q(31 downto 0)), 64)));

    -- i_add_ptr6_sum_conv2d1x1(ADD,36)@5
    i_add_ptr6_sum_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & i_idxprom65_conv2d1x1_sel_x_b);
    i_add_ptr6_sum_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist3_stall_entry_o8_5_4_q);
    i_add_ptr6_sum_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr6_sum_conv2d1x1_a) + UNSIGNED(i_add_ptr6_sum_conv2d1x1_b));
    i_add_ptr6_sum_conv2d1x1_q <= i_add_ptr6_sum_conv2d1x1_o(64 downto 0);

    -- bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x(BITSELECT,2)@5
    bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b <= i_add_ptr6_sum_conv2d1x1_q(63 downto 0);

    -- c_i32_1gr(CONSTANT,31)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist7_stall_entry_o11_5_3(REG,122)
    redist7_stall_entry_o11_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o11_5_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_3_backEN = "1") THEN
                redist7_stall_entry_o11_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_3_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_o11_5_4(REG,123)
    redist7_stall_entry_o11_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o11_5_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_4_backEN = "1") THEN
                redist7_stall_entry_o11_5_4_q <= STD_LOGIC_VECTOR(redist7_stall_entry_o11_5_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_inc68_conv2d1x1(ADD,40)@5
    i_inc68_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist7_stall_entry_o11_5_4_q);
    i_inc68_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc68_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc68_conv2d1x1_a) + UNSIGNED(i_inc68_conv2d1x1_b));
    i_inc68_conv2d1x1_q <= i_inc68_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc68_conv2d1x1_sel_x(BITSELECT,3)@5
    bgTrunc_i_inc68_conv2d1x1_sel_x_b <= i_inc68_conv2d1x1_q(31 downto 0);

    -- redist6_stall_entry_o10_7_3(REG,115)
    redist6_stall_entry_o10_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_3_backEN = "1") THEN
                redist6_stall_entry_o10_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_3_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o10_7_4(REG,116)
    redist6_stall_entry_o10_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_4_backEN = "1") THEN
                redist6_stall_entry_o10_7_4_q <= STD_LOGIC_VECTOR(redist6_stall_entry_o10_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o8_5_3(REG,105)
    redist3_stall_entry_o8_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o8_5_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_3_backEN = "1") THEN
                redist3_stall_entry_o8_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_5_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o8_5_4(REG,106)
    redist3_stall_entry_o8_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o8_5_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_4_backEN = "1") THEN
                redist3_stall_entry_o8_5_4_q <= STD_LOGIC_VECTOR(redist3_stall_entry_o8_5_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_out_bubble_out_stall_entry_2(STALLENABLE,257)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_2_V0 <= SE_out_bubble_out_stall_entry_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_2_backStall <= i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_2_wireValid <= bubble_out_stall_entry_2_reg_valid_out;

    -- i_syncbuf_input_size_sync_buffer5_conv2d1x1(BLACKBOX,42)@6
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_sync_buffer5_conv2d1x1 : i_syncbuf_input_size_sync_buffer5_conv2d1x170
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_2_V0,
        out_buffer_out => i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_size_sync_buffer5_conv2d1x1(BITJOIN,137)
    bubble_join_i_syncbuf_input_size_sync_buffer5_conv2d1x1_q <= i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_sync_buffer5_conv2d1x1(BITSELECT,138)
    bubble_select_i_syncbuf_input_size_sync_buffer5_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_sync_buffer5_conv2d1x1_q(31 downto 0));

    -- redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0(REG,127)
    redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_0_backEN = "1") THEN
                redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_0_D2);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg(STALLFIFO,276)
    bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_in <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_V0;
    bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_in <= SE_out_redist8_stall_entry_o12_9_fifo_backStall;
    bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_in(0);
    bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_in(0);
    bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_out(0) <= bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_out(0) <= bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 4,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1(STALLENABLE,176)
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg0 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg1 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed0 <= (not (bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_stall_out) and SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg0;
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed1 <= (not (SR_SE_i_exitcond11_conv2d1x1_backStall) and SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_StallValid <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_backStall and SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid;
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_toReg0 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_toReg1 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_or0 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireStall <= not (SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_consumed1 and SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_or0);
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_backStall <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg0);
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_V1 <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_wireValid <= i_syncbuf_input_size_sync_buffer5_conv2d1x1_out_valid_out;

    -- i_exitcond11_conv2d1x1(LOGICAL,37)@6 + 1
    i_exitcond11_conv2d1x1_qi <= "1" WHEN SR_SE_i_exitcond11_conv2d1x1_D0 = SR_SE_i_exitcond11_conv2d1x1_D1 ELSE "0";
    i_exitcond11_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond11_conv2d1x1_qi, xout => i_exitcond11_conv2d1x1_q, ena => SE_i_exitcond11_conv2d1x1_backEN(0), clk => clock, aclr => resetn );

    -- redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0(REG,128)
    redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_1_backEN = "1") THEN
                redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_o8_9_1(REG,108)
    redist4_stall_entry_o8_9_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o8_9_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_1_backEN = "1") THEN
                redist4_stall_entry_o8_9_1_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist4_stall_entry_o8_9_3(STALLENABLE,210)
    -- Valid signal propagation
    SE_redist4_stall_entry_o8_9_3_V0 <= SE_redist4_stall_entry_o8_9_3_R_v_0;
    -- Stall signal propagation
    SE_redist4_stall_entry_o8_9_3_s_tv_0 <= SE_out_redist8_stall_entry_o12_9_fifo_backStall and SE_redist4_stall_entry_o8_9_3_R_v_0;
    -- Backward Enable generation
    SE_redist4_stall_entry_o8_9_3_backEN <= not (SE_redist4_stall_entry_o8_9_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_stall_entry_o8_9_3_v_s_0 <= SE_redist4_stall_entry_o8_9_3_backEN and SE_redist4_stall_entry_o8_9_2_V0;
    -- Backward Stall generation
    SE_redist4_stall_entry_o8_9_3_backStall <= not (SE_redist4_stall_entry_o8_9_3_v_s_0);
    SE_redist4_stall_entry_o8_9_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_stall_entry_o8_9_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_3_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_3_R_v_0 <= SE_redist4_stall_entry_o8_9_3_R_v_0 and SE_redist4_stall_entry_o8_9_3_s_tv_0;
            ELSE
                SE_redist4_stall_entry_o8_9_3_R_v_0 <= SE_redist4_stall_entry_o8_9_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist4_stall_entry_o8_9_2(STALLENABLE,209)
    -- Valid signal propagation
    SE_redist4_stall_entry_o8_9_2_V0 <= SE_redist4_stall_entry_o8_9_2_R_v_0;
    -- Stall signal propagation
    SE_redist4_stall_entry_o8_9_2_s_tv_0 <= SE_redist4_stall_entry_o8_9_3_backStall and SE_redist4_stall_entry_o8_9_2_R_v_0;
    -- Backward Enable generation
    SE_redist4_stall_entry_o8_9_2_backEN <= not (SE_redist4_stall_entry_o8_9_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_stall_entry_o8_9_2_v_s_0 <= SE_redist4_stall_entry_o8_9_2_backEN and SR_SE_redist4_stall_entry_o8_9_2_V;
    -- Backward Stall generation
    SE_redist4_stall_entry_o8_9_2_backStall <= not (SE_redist4_stall_entry_o8_9_2_backEN);
    SE_redist4_stall_entry_o8_9_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_stall_entry_o8_9_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_2_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_2_R_v_0 <= SE_redist4_stall_entry_o8_9_2_R_v_0 and SE_redist4_stall_entry_o8_9_2_s_tv_0;
            ELSE
                SE_redist4_stall_entry_o8_9_2_R_v_0 <= SE_redist4_stall_entry_o8_9_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist4_stall_entry_o8_9_2(STALLREG,283)
    SR_SE_redist4_stall_entry_o8_9_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_stall_entry_o8_9_2_r_valid <= (others => '0');
            SR_SE_redist4_stall_entry_o8_9_2_r_data0 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_2_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_stall_entry_o8_9_2_r_valid <= SE_redist4_stall_entry_o8_9_2_backStall and (SR_SE_redist4_stall_entry_o8_9_2_r_valid or SR_SE_redist4_stall_entry_o8_9_2_i_valid);

            IF (SR_SE_redist4_stall_entry_o8_9_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_stall_entry_o8_9_2_r_data0 <= STD_LOGIC_VECTOR(redist4_stall_entry_o8_9_1_q);
                SR_SE_redist4_stall_entry_o8_9_2_r_data1 <= STD_LOGIC_VECTOR(redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_stall_entry_o8_9_2_i_valid <= SE_redist4_stall_entry_o8_9_1_V0;
    -- Stall signal propagation
    SR_SE_redist4_stall_entry_o8_9_2_backStall <= SR_SE_redist4_stall_entry_o8_9_2_r_valid or not (SR_SE_redist4_stall_entry_o8_9_2_i_valid);

    -- Valid
    SR_SE_redist4_stall_entry_o8_9_2_V <= SR_SE_redist4_stall_entry_o8_9_2_r_valid WHEN SR_SE_redist4_stall_entry_o8_9_2_r_valid = "1" ELSE SR_SE_redist4_stall_entry_o8_9_2_i_valid;

    -- Data0
    SR_SE_redist4_stall_entry_o8_9_2_D0 <= SR_SE_redist4_stall_entry_o8_9_2_r_data0 WHEN SR_SE_redist4_stall_entry_o8_9_2_r_valid = "1" ELSE redist4_stall_entry_o8_9_1_q;
    -- Data1
    SR_SE_redist4_stall_entry_o8_9_2_D1 <= SR_SE_redist4_stall_entry_o8_9_2_r_data1 WHEN SR_SE_redist4_stall_entry_o8_9_2_r_valid = "1" ELSE redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_0_q;

    -- SE_redist4_stall_entry_o8_9_1(STALLENABLE,208)
    -- Valid signal propagation
    SE_redist4_stall_entry_o8_9_1_V0 <= SE_redist4_stall_entry_o8_9_1_R_v_0;
    SE_redist4_stall_entry_o8_9_1_V1 <= SE_redist4_stall_entry_o8_9_1_R_v_1;
    SE_redist4_stall_entry_o8_9_1_V2 <= SE_redist4_stall_entry_o8_9_1_R_v_2;
    -- Stall signal propagation
    SE_redist4_stall_entry_o8_9_1_s_tv_0 <= SR_SE_redist4_stall_entry_o8_9_2_backStall and SE_redist4_stall_entry_o8_9_1_R_v_0;
    SE_redist4_stall_entry_o8_9_1_s_tv_1 <= SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_backStall and SE_redist4_stall_entry_o8_9_1_R_v_1;
    SE_redist4_stall_entry_o8_9_1_s_tv_2 <= SR_SE_i_unnamed_conv2d1x174_backStall and SE_redist4_stall_entry_o8_9_1_R_v_2;
    -- Backward Enable generation
    SE_redist4_stall_entry_o8_9_1_or0 <= SE_redist4_stall_entry_o8_9_1_s_tv_0;
    SE_redist4_stall_entry_o8_9_1_or1 <= SE_redist4_stall_entry_o8_9_1_s_tv_1 or SE_redist4_stall_entry_o8_9_1_or0;
    SE_redist4_stall_entry_o8_9_1_backEN <= not (SE_redist4_stall_entry_o8_9_1_s_tv_2 or SE_redist4_stall_entry_o8_9_1_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_stall_entry_o8_9_1_v_s_0 <= SE_redist4_stall_entry_o8_9_1_backEN and SR_SE_redist4_stall_entry_o8_9_1_V;
    -- Backward Stall generation
    SE_redist4_stall_entry_o8_9_1_backStall <= not (SE_redist4_stall_entry_o8_9_1_backEN);
    SE_redist4_stall_entry_o8_9_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_stall_entry_o8_9_1_R_v_0 <= (others => '0');
            SE_redist4_stall_entry_o8_9_1_R_v_1 <= (others => '0');
            SE_redist4_stall_entry_o8_9_1_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_1_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_1_R_v_0 <= SE_redist4_stall_entry_o8_9_1_R_v_0 and SE_redist4_stall_entry_o8_9_1_s_tv_0;
            ELSE
                SE_redist4_stall_entry_o8_9_1_R_v_0 <= SE_redist4_stall_entry_o8_9_1_v_s_0;
            END IF;

            IF (SE_redist4_stall_entry_o8_9_1_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_1_R_v_1 <= SE_redist4_stall_entry_o8_9_1_R_v_1 and SE_redist4_stall_entry_o8_9_1_s_tv_1;
            ELSE
                SE_redist4_stall_entry_o8_9_1_R_v_1 <= SE_redist4_stall_entry_o8_9_1_v_s_0;
            END IF;

            IF (SE_redist4_stall_entry_o8_9_1_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_1_R_v_2 <= SE_redist4_stall_entry_o8_9_1_R_v_2 and SE_redist4_stall_entry_o8_9_1_s_tv_2;
            ELSE
                SE_redist4_stall_entry_o8_9_1_R_v_2 <= SE_redist4_stall_entry_o8_9_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist9_i_unnamed_conv2d1x174_q_2_0(STALLENABLE,227)
    -- Valid signal propagation
    SE_redist9_i_unnamed_conv2d1x174_q_2_0_V0 <= SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_unnamed_conv2d1x174_q_2_0_s_tv_0 <= SE_out_redist8_stall_entry_o12_9_fifo_backStall and SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_unnamed_conv2d1x174_q_2_0_backEN <= not (SE_redist9_i_unnamed_conv2d1x174_q_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_unnamed_conv2d1x174_q_2_0_v_s_0 <= SE_redist9_i_unnamed_conv2d1x174_q_2_0_backEN and SE_i_unnamed_conv2d1x174_V0;
    -- Backward Stall generation
    SE_redist9_i_unnamed_conv2d1x174_q_2_0_backStall <= not (SE_redist9_i_unnamed_conv2d1x174_q_2_0_v_s_0);
    SE_redist9_i_unnamed_conv2d1x174_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_unnamed_conv2d1x174_q_2_0_backEN = "0") THEN
                SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0 <= SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0 and SE_redist9_i_unnamed_conv2d1x174_q_2_0_s_tv_0;
            ELSE
                SE_redist9_i_unnamed_conv2d1x174_q_2_0_R_v_0 <= SE_redist9_i_unnamed_conv2d1x174_q_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_unnamed_conv2d1x174(STALLENABLE,179)
    -- Valid signal propagation
    SE_i_unnamed_conv2d1x174_V0 <= SE_i_unnamed_conv2d1x174_R_v_0;
    -- Stall signal propagation
    SE_i_unnamed_conv2d1x174_s_tv_0 <= SE_redist9_i_unnamed_conv2d1x174_q_2_0_backStall and SE_i_unnamed_conv2d1x174_R_v_0;
    -- Backward Enable generation
    SE_i_unnamed_conv2d1x174_backEN <= not (SE_i_unnamed_conv2d1x174_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_unnamed_conv2d1x174_v_s_0 <= SE_i_unnamed_conv2d1x174_backEN and SR_SE_i_unnamed_conv2d1x174_V;
    -- Backward Stall generation
    SE_i_unnamed_conv2d1x174_backStall <= not (SE_i_unnamed_conv2d1x174_backEN);
    SE_i_unnamed_conv2d1x174_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_conv2d1x174_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_conv2d1x174_backEN = "0") THEN
                SE_i_unnamed_conv2d1x174_R_v_0 <= SE_i_unnamed_conv2d1x174_R_v_0 and SE_i_unnamed_conv2d1x174_s_tv_0;
            ELSE
                SE_i_unnamed_conv2d1x174_R_v_0 <= SE_i_unnamed_conv2d1x174_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_unnamed_conv2d1x174(STALLREG,285)
    SR_SE_i_unnamed_conv2d1x174_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_unnamed_conv2d1x174_r_valid <= (others => '0');
            SR_SE_i_unnamed_conv2d1x174_r_data0 <= (others => '-');
            SR_SE_i_unnamed_conv2d1x174_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_unnamed_conv2d1x174_r_valid <= SE_i_unnamed_conv2d1x174_backStall and (SR_SE_i_unnamed_conv2d1x174_r_valid or SR_SE_i_unnamed_conv2d1x174_i_valid);

            IF (SR_SE_i_unnamed_conv2d1x174_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_unnamed_conv2d1x174_r_data0 <= i_exitcond11_conv2d1x1_q;
                SR_SE_i_unnamed_conv2d1x174_r_data1 <= redist6_stall_entry_o10_7_6_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_unnamed_conv2d1x174_and0 <= SE_i_exitcond11_conv2d1x1_V0;
    SR_SE_i_unnamed_conv2d1x174_i_valid <= SE_redist4_stall_entry_o8_9_1_V2 and SR_SE_i_unnamed_conv2d1x174_and0;
    -- Stall signal propagation
    SR_SE_i_unnamed_conv2d1x174_backStall <= SR_SE_i_unnamed_conv2d1x174_r_valid or not (SR_SE_i_unnamed_conv2d1x174_i_valid);

    -- Valid
    SR_SE_i_unnamed_conv2d1x174_V <= SR_SE_i_unnamed_conv2d1x174_r_valid WHEN SR_SE_i_unnamed_conv2d1x174_r_valid = "1" ELSE SR_SE_i_unnamed_conv2d1x174_i_valid;

    -- Data0
    SR_SE_i_unnamed_conv2d1x174_D0 <= SR_SE_i_unnamed_conv2d1x174_r_data0 WHEN SR_SE_i_unnamed_conv2d1x174_r_valid = "1" ELSE i_exitcond11_conv2d1x1_q;
    -- Data1
    SR_SE_i_unnamed_conv2d1x174_D1 <= SR_SE_i_unnamed_conv2d1x174_r_data1 WHEN SR_SE_i_unnamed_conv2d1x174_r_valid = "1" ELSE redist6_stall_entry_o10_7_6_q;

    -- SE_i_exitcond11_conv2d1x1(STALLENABLE,171)
    -- Valid signal propagation
    SE_i_exitcond11_conv2d1x1_V0 <= SE_i_exitcond11_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond11_conv2d1x1_s_tv_0 <= SR_SE_i_unnamed_conv2d1x174_backStall and SE_i_exitcond11_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond11_conv2d1x1_backEN <= not (SE_i_exitcond11_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond11_conv2d1x1_v_s_0 <= SE_i_exitcond11_conv2d1x1_backEN and SR_SE_i_exitcond11_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_exitcond11_conv2d1x1_backStall <= not (SE_i_exitcond11_conv2d1x1_backEN);
    SE_i_exitcond11_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond11_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond11_conv2d1x1_backEN = "0") THEN
                SE_i_exitcond11_conv2d1x1_R_v_0 <= SE_i_exitcond11_conv2d1x1_R_v_0 and SE_i_exitcond11_conv2d1x1_s_tv_0;
            ELSE
                SE_i_exitcond11_conv2d1x1_R_v_0 <= SE_i_exitcond11_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond11_conv2d1x1(STALLREG,284)
    SR_SE_i_exitcond11_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond11_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_exitcond11_conv2d1x1_r_data0 <= (others => '-');
            SR_SE_i_exitcond11_conv2d1x1_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond11_conv2d1x1_r_valid <= SE_i_exitcond11_conv2d1x1_backStall and (SR_SE_i_exitcond11_conv2d1x1_r_valid or SR_SE_i_exitcond11_conv2d1x1_i_valid);

            IF (SR_SE_i_exitcond11_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond11_conv2d1x1_r_data0 <= STD_LOGIC_VECTOR(redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q);
                SR_SE_i_exitcond11_conv2d1x1_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_size_sync_buffer5_conv2d1x1_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond11_conv2d1x1_and0 <= SE_redist4_stall_entry_o8_9_0_V1;
    SR_SE_i_exitcond11_conv2d1x1_i_valid <= SE_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_V1 and SR_SE_i_exitcond11_conv2d1x1_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond11_conv2d1x1_backStall <= SR_SE_i_exitcond11_conv2d1x1_r_valid or not (SR_SE_i_exitcond11_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_exitcond11_conv2d1x1_V <= SR_SE_i_exitcond11_conv2d1x1_r_valid WHEN SR_SE_i_exitcond11_conv2d1x1_r_valid = "1" ELSE SR_SE_i_exitcond11_conv2d1x1_i_valid;

    -- Data0
    SR_SE_i_exitcond11_conv2d1x1_D0 <= SR_SE_i_exitcond11_conv2d1x1_r_data0 WHEN SR_SE_i_exitcond11_conv2d1x1_r_valid = "1" ELSE redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond11_conv2d1x1_D1 <= SR_SE_i_exitcond11_conv2d1x1_r_data1 WHEN SR_SE_i_exitcond11_conv2d1x1_r_valid = "1" ELSE bubble_select_i_syncbuf_input_size_sync_buffer5_conv2d1x1_b;

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_multconst_x(CONSTANT,20)
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0(REG,131)
    redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_0_backEN = "1") THEN
                redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_0_D3);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select(BITSELECT,80)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_b <= redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_c <= redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_d <= redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_e <= redist13_bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0(BITSHIFT,77)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0_qint <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15(BITSHIFT,70)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0(BITSHIFT,78)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0_qint <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14(BITSHIFT,69)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_16(BITJOIN,71)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_16_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_15_q & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_14_q;

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0(BITSHIFT,79)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0_qint <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12(BITSHIFT,67)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0(BITSHIFT,76)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0_qint <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_13(BITJOIN,68)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_13_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_im0_shift0_q);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0(ADD,72)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_13_q);
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_join_16_q);
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_b));
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_mult_extender_x(BITJOIN,19)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_mult_extender_x_q <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_multconst_x_q & i_arrayidx66_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x(BITSELECT,21)@6
    i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b <= i_arrayidx66_conv2d1x1_conv2d1x173_mult_extender_x_q(63 downto 0);

    -- redist6_stall_entry_o10_7_5(REG,117)
    redist6_stall_entry_o10_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_0_backEN = "1") THEN
                redist6_stall_entry_o10_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_o8_9_0(REG,107)
    redist4_stall_entry_o8_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o8_9_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_0_backEN = "1") THEN
                redist4_stall_entry_o8_9_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist4_stall_entry_o8_9_1(STALLREG,282)
    SR_SE_redist4_stall_entry_o8_9_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_stall_entry_o8_9_1_r_valid <= (others => '0');
            SR_SE_redist4_stall_entry_o8_9_1_r_data0 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_1_r_data1 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_1_r_data2 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_1_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_stall_entry_o8_9_1_r_valid <= SE_redist4_stall_entry_o8_9_1_backStall and (SR_SE_redist4_stall_entry_o8_9_1_r_valid or SR_SE_redist4_stall_entry_o8_9_1_i_valid);

            IF (SR_SE_redist4_stall_entry_o8_9_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_stall_entry_o8_9_1_r_data0 <= STD_LOGIC_VECTOR(redist4_stall_entry_o8_9_0_q);
                SR_SE_redist4_stall_entry_o8_9_1_r_data1 <= STD_LOGIC_VECTOR(redist6_stall_entry_o10_7_5_q);
                SR_SE_redist4_stall_entry_o8_9_1_r_data2 <= STD_LOGIC_VECTOR(redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q);
                SR_SE_redist4_stall_entry_o8_9_1_r_data3 <= STD_LOGIC_VECTOR(i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_stall_entry_o8_9_1_i_valid <= SE_redist4_stall_entry_o8_9_0_V0;
    -- Stall signal propagation
    SR_SE_redist4_stall_entry_o8_9_1_backStall <= SR_SE_redist4_stall_entry_o8_9_1_r_valid or not (SR_SE_redist4_stall_entry_o8_9_1_i_valid);

    -- Valid
    SR_SE_redist4_stall_entry_o8_9_1_V <= SR_SE_redist4_stall_entry_o8_9_1_r_valid WHEN SR_SE_redist4_stall_entry_o8_9_1_r_valid = "1" ELSE SR_SE_redist4_stall_entry_o8_9_1_i_valid;

    -- Data0
    SR_SE_redist4_stall_entry_o8_9_1_D0 <= SR_SE_redist4_stall_entry_o8_9_1_r_data0 WHEN SR_SE_redist4_stall_entry_o8_9_1_r_valid = "1" ELSE redist4_stall_entry_o8_9_0_q;
    -- Data1
    SR_SE_redist4_stall_entry_o8_9_1_D1 <= SR_SE_redist4_stall_entry_o8_9_1_r_data1 WHEN SR_SE_redist4_stall_entry_o8_9_1_r_valid = "1" ELSE redist6_stall_entry_o10_7_5_q;
    -- Data2
    SR_SE_redist4_stall_entry_o8_9_1_D2 <= SR_SE_redist4_stall_entry_o8_9_1_r_data2 WHEN SR_SE_redist4_stall_entry_o8_9_1_r_valid = "1" ELSE redist11_bgTrunc_i_inc68_conv2d1x1_sel_x_b_1_0_q;
    -- Data3
    SR_SE_redist4_stall_entry_o8_9_1_D3 <= SR_SE_redist4_stall_entry_o8_9_1_r_data3 WHEN SR_SE_redist4_stall_entry_o8_9_1_r_valid = "1" ELSE i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b;

    -- SE_redist4_stall_entry_o8_9_0(STALLENABLE,207)
    -- Valid signal propagation
    SE_redist4_stall_entry_o8_9_0_V0 <= SE_redist4_stall_entry_o8_9_0_R_v_0;
    SE_redist4_stall_entry_o8_9_0_V1 <= SE_redist4_stall_entry_o8_9_0_R_v_1;
    -- Stall signal propagation
    SE_redist4_stall_entry_o8_9_0_s_tv_0 <= SR_SE_redist4_stall_entry_o8_9_1_backStall and SE_redist4_stall_entry_o8_9_0_R_v_0;
    SE_redist4_stall_entry_o8_9_0_s_tv_1 <= SR_SE_i_exitcond11_conv2d1x1_backStall and SE_redist4_stall_entry_o8_9_0_R_v_1;
    -- Backward Enable generation
    SE_redist4_stall_entry_o8_9_0_or0 <= SE_redist4_stall_entry_o8_9_0_s_tv_0;
    SE_redist4_stall_entry_o8_9_0_backEN <= not (SE_redist4_stall_entry_o8_9_0_s_tv_1 or SE_redist4_stall_entry_o8_9_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_stall_entry_o8_9_0_v_s_0 <= SE_redist4_stall_entry_o8_9_0_backEN and SR_SE_redist4_stall_entry_o8_9_0_V;
    -- Backward Stall generation
    SE_redist4_stall_entry_o8_9_0_backStall <= not (SE_redist4_stall_entry_o8_9_0_backEN);
    SE_redist4_stall_entry_o8_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_stall_entry_o8_9_0_R_v_0 <= (others => '0');
            SE_redist4_stall_entry_o8_9_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_0_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_0_R_v_0 <= SE_redist4_stall_entry_o8_9_0_R_v_0 and SE_redist4_stall_entry_o8_9_0_s_tv_0;
            ELSE
                SE_redist4_stall_entry_o8_9_0_R_v_0 <= SE_redist4_stall_entry_o8_9_0_v_s_0;
            END IF;

            IF (SE_redist4_stall_entry_o8_9_0_backEN = "0") THEN
                SE_redist4_stall_entry_o8_9_0_R_v_1 <= SE_redist4_stall_entry_o8_9_0_R_v_1 and SE_redist4_stall_entry_o8_9_0_s_tv_1;
            ELSE
                SE_redist4_stall_entry_o8_9_0_R_v_1 <= SE_redist4_stall_entry_o8_9_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist4_stall_entry_o8_9_0(STALLREG,281)
    SR_SE_redist4_stall_entry_o8_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_stall_entry_o8_9_0_r_valid <= (others => '0');
            SR_SE_redist4_stall_entry_o8_9_0_r_data0 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_0_r_data1 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_0_r_data2 <= (others => '-');
            SR_SE_redist4_stall_entry_o8_9_0_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_stall_entry_o8_9_0_r_valid <= SE_redist4_stall_entry_o8_9_0_backStall and (SR_SE_redist4_stall_entry_o8_9_0_r_valid or SR_SE_redist4_stall_entry_o8_9_0_i_valid);

            IF (SR_SE_redist4_stall_entry_o8_9_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_stall_entry_o8_9_0_r_data0 <= STD_LOGIC_VECTOR(redist3_stall_entry_o8_5_4_q);
                SR_SE_redist4_stall_entry_o8_9_0_r_data1 <= STD_LOGIC_VECTOR(redist6_stall_entry_o10_7_4_q);
                SR_SE_redist4_stall_entry_o8_9_0_r_data2 <= STD_LOGIC_VECTOR(bgTrunc_i_inc68_conv2d1x1_sel_x_b);
                SR_SE_redist4_stall_entry_o8_9_0_r_data3 <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_stall_entry_o8_9_0_i_valid <= SE_redist0_stall_entry_o4_5_4_V0;
    -- Stall signal propagation
    SR_SE_redist4_stall_entry_o8_9_0_backStall <= SR_SE_redist4_stall_entry_o8_9_0_r_valid or not (SR_SE_redist4_stall_entry_o8_9_0_i_valid);

    -- Valid
    SR_SE_redist4_stall_entry_o8_9_0_V <= SR_SE_redist4_stall_entry_o8_9_0_r_valid WHEN SR_SE_redist4_stall_entry_o8_9_0_r_valid = "1" ELSE SR_SE_redist4_stall_entry_o8_9_0_i_valid;

    -- Data0
    SR_SE_redist4_stall_entry_o8_9_0_D0 <= SR_SE_redist4_stall_entry_o8_9_0_r_data0 WHEN SR_SE_redist4_stall_entry_o8_9_0_r_valid = "1" ELSE redist3_stall_entry_o8_5_4_q;
    -- Data1
    SR_SE_redist4_stall_entry_o8_9_0_D1 <= SR_SE_redist4_stall_entry_o8_9_0_r_data1 WHEN SR_SE_redist4_stall_entry_o8_9_0_r_valid = "1" ELSE redist6_stall_entry_o10_7_4_q;
    -- Data2
    SR_SE_redist4_stall_entry_o8_9_0_D2 <= SR_SE_redist4_stall_entry_o8_9_0_r_data2 WHEN SR_SE_redist4_stall_entry_o8_9_0_r_valid = "1" ELSE bgTrunc_i_inc68_conv2d1x1_sel_x_b;
    -- Data3
    SR_SE_redist4_stall_entry_o8_9_0_D3 <= SR_SE_redist4_stall_entry_o8_9_0_r_data3 WHEN SR_SE_redist4_stall_entry_o8_9_0_r_valid = "1" ELSE bgTrunc_i_add_ptr6_sum_conv2d1x1_sel_x_b;

    -- SE_redist0_stall_entry_o4_5_4(STALLENABLE,197)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_5_4_V0 <= SE_redist0_stall_entry_o4_5_4_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_5_4_s_tv_0 <= SR_SE_redist4_stall_entry_o8_9_0_backStall and SE_redist0_stall_entry_o4_5_4_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_5_4_backEN <= not (SE_redist0_stall_entry_o4_5_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_5_4_v_s_0 <= SE_redist0_stall_entry_o4_5_4_backEN and SE_redist0_stall_entry_o4_5_3_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_5_4_backStall <= not (SE_redist0_stall_entry_o4_5_4_v_s_0);
    SE_redist0_stall_entry_o4_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_5_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_4_backEN = "0") THEN
                SE_redist0_stall_entry_o4_5_4_R_v_0 <= SE_redist0_stall_entry_o4_5_4_R_v_0 and SE_redist0_stall_entry_o4_5_4_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_5_4_R_v_0 <= SE_redist0_stall_entry_o4_5_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_o4_5_3(STALLENABLE,196)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_5_3_V0 <= SE_redist0_stall_entry_o4_5_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_5_3_s_tv_0 <= SE_redist0_stall_entry_o4_5_4_backStall and SE_redist0_stall_entry_o4_5_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_5_3_backEN <= not (SE_redist0_stall_entry_o4_5_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_5_3_v_s_0 <= SE_redist0_stall_entry_o4_5_3_backEN and SR_SE_redist0_stall_entry_o4_5_3_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_5_3_backStall <= not (SE_redist0_stall_entry_o4_5_3_backEN);
    SE_redist0_stall_entry_o4_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_5_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_3_backEN = "0") THEN
                SE_redist0_stall_entry_o4_5_3_R_v_0 <= SE_redist0_stall_entry_o4_5_3_R_v_0 and SE_redist0_stall_entry_o4_5_3_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_5_3_R_v_0 <= SE_redist0_stall_entry_o4_5_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_o4_5_3(STALLREG,280)
    SR_SE_redist0_stall_entry_o4_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_o4_5_3_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_o4_5_3_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_5_3_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_5_3_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_5_3_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_o4_5_3_r_valid <= SE_redist0_stall_entry_o4_5_3_backStall and (SR_SE_redist0_stall_entry_o4_5_3_r_valid or SR_SE_redist0_stall_entry_o4_5_3_i_valid);

            IF (SR_SE_redist0_stall_entry_o4_5_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_o4_5_3_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_5_2_q);
                SR_SE_redist0_stall_entry_o4_5_3_r_data1 <= STD_LOGIC_VECTOR(redist3_stall_entry_o8_5_2_q);
                SR_SE_redist0_stall_entry_o4_5_3_r_data2 <= STD_LOGIC_VECTOR(redist6_stall_entry_o10_7_2_q);
                SR_SE_redist0_stall_entry_o4_5_3_r_data3 <= STD_LOGIC_VECTOR(redist7_stall_entry_o11_5_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_o4_5_3_i_valid <= SE_redist0_stall_entry_o4_5_2_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_o4_5_3_backStall <= SR_SE_redist0_stall_entry_o4_5_3_r_valid or not (SR_SE_redist0_stall_entry_o4_5_3_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_o4_5_3_V <= SR_SE_redist0_stall_entry_o4_5_3_r_valid WHEN SR_SE_redist0_stall_entry_o4_5_3_r_valid = "1" ELSE SR_SE_redist0_stall_entry_o4_5_3_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_o4_5_3_D0 <= SR_SE_redist0_stall_entry_o4_5_3_r_data0 WHEN SR_SE_redist0_stall_entry_o4_5_3_r_valid = "1" ELSE redist0_stall_entry_o4_5_2_q;
    -- Data1
    SR_SE_redist0_stall_entry_o4_5_3_D1 <= SR_SE_redist0_stall_entry_o4_5_3_r_data1 WHEN SR_SE_redist0_stall_entry_o4_5_3_r_valid = "1" ELSE redist3_stall_entry_o8_5_2_q;
    -- Data2
    SR_SE_redist0_stall_entry_o4_5_3_D2 <= SR_SE_redist0_stall_entry_o4_5_3_r_data2 WHEN SR_SE_redist0_stall_entry_o4_5_3_r_valid = "1" ELSE redist6_stall_entry_o10_7_2_q;
    -- Data3
    SR_SE_redist0_stall_entry_o4_5_3_D3 <= SR_SE_redist0_stall_entry_o4_5_3_r_data3 WHEN SR_SE_redist0_stall_entry_o4_5_3_r_valid = "1" ELSE redist7_stall_entry_o11_5_2_q;

    -- SE_redist0_stall_entry_o4_5_2(STALLENABLE,195)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_5_2_V0 <= SE_redist0_stall_entry_o4_5_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_5_2_s_tv_0 <= SR_SE_redist0_stall_entry_o4_5_3_backStall and SE_redist0_stall_entry_o4_5_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_5_2_backEN <= not (SE_redist0_stall_entry_o4_5_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_5_2_v_s_0 <= SE_redist0_stall_entry_o4_5_2_backEN and SE_redist0_stall_entry_o4_5_1_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_5_2_backStall <= not (SE_redist0_stall_entry_o4_5_2_v_s_0);
    SE_redist0_stall_entry_o4_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_5_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_2_backEN = "0") THEN
                SE_redist0_stall_entry_o4_5_2_R_v_0 <= SE_redist0_stall_entry_o4_5_2_R_v_0 and SE_redist0_stall_entry_o4_5_2_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_5_2_R_v_0 <= SE_redist0_stall_entry_o4_5_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_o4_5_1(STALLENABLE,194)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_5_1_V0 <= SE_redist0_stall_entry_o4_5_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_5_1_s_tv_0 <= SE_redist0_stall_entry_o4_5_2_backStall and SE_redist0_stall_entry_o4_5_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_5_1_backEN <= not (SE_redist0_stall_entry_o4_5_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_5_1_v_s_0 <= SE_redist0_stall_entry_o4_5_1_backEN and SR_SE_redist0_stall_entry_o4_5_1_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_5_1_backStall <= not (SE_redist0_stall_entry_o4_5_1_backEN);
    SE_redist0_stall_entry_o4_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_5_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_1_backEN = "0") THEN
                SE_redist0_stall_entry_o4_5_1_R_v_0 <= SE_redist0_stall_entry_o4_5_1_R_v_0 and SE_redist0_stall_entry_o4_5_1_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_5_1_R_v_0 <= SE_redist0_stall_entry_o4_5_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_o4_5_1(STALLREG,279)
    SR_SE_redist0_stall_entry_o4_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_o4_5_1_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_o4_5_1_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_5_1_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_5_1_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_5_1_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_o4_5_1_r_valid <= SE_redist0_stall_entry_o4_5_1_backStall and (SR_SE_redist0_stall_entry_o4_5_1_r_valid or SR_SE_redist0_stall_entry_o4_5_1_i_valid);

            IF (SR_SE_redist0_stall_entry_o4_5_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_o4_5_1_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_5_0_q);
                SR_SE_redist0_stall_entry_o4_5_1_r_data1 <= STD_LOGIC_VECTOR(redist3_stall_entry_o8_5_0_q);
                SR_SE_redist0_stall_entry_o4_5_1_r_data2 <= STD_LOGIC_VECTOR(redist6_stall_entry_o10_7_0_q);
                SR_SE_redist0_stall_entry_o4_5_1_r_data3 <= STD_LOGIC_VECTOR(redist7_stall_entry_o11_5_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_o4_5_1_i_valid <= SE_redist0_stall_entry_o4_5_0_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_o4_5_1_backStall <= SR_SE_redist0_stall_entry_o4_5_1_r_valid or not (SR_SE_redist0_stall_entry_o4_5_1_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_o4_5_1_V <= SR_SE_redist0_stall_entry_o4_5_1_r_valid WHEN SR_SE_redist0_stall_entry_o4_5_1_r_valid = "1" ELSE SR_SE_redist0_stall_entry_o4_5_1_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_o4_5_1_D0 <= SR_SE_redist0_stall_entry_o4_5_1_r_data0 WHEN SR_SE_redist0_stall_entry_o4_5_1_r_valid = "1" ELSE redist0_stall_entry_o4_5_0_q;
    -- Data1
    SR_SE_redist0_stall_entry_o4_5_1_D1 <= SR_SE_redist0_stall_entry_o4_5_1_r_data1 WHEN SR_SE_redist0_stall_entry_o4_5_1_r_valid = "1" ELSE redist3_stall_entry_o8_5_0_q;
    -- Data2
    SR_SE_redist0_stall_entry_o4_5_1_D2 <= SR_SE_redist0_stall_entry_o4_5_1_r_data2 WHEN SR_SE_redist0_stall_entry_o4_5_1_r_valid = "1" ELSE redist6_stall_entry_o10_7_0_q;
    -- Data3
    SR_SE_redist0_stall_entry_o4_5_1_D3 <= SR_SE_redist0_stall_entry_o4_5_1_r_data3 WHEN SR_SE_redist0_stall_entry_o4_5_1_r_valid = "1" ELSE redist7_stall_entry_o11_5_0_q;

    -- SE_redist0_stall_entry_o4_5_0(STALLENABLE,193)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_5_0_V0 <= SE_redist0_stall_entry_o4_5_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_5_0_s_tv_0 <= SR_SE_redist0_stall_entry_o4_5_1_backStall and SE_redist0_stall_entry_o4_5_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_5_0_backEN <= not (SE_redist0_stall_entry_o4_5_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_5_0_v_s_0 <= SE_redist0_stall_entry_o4_5_0_backEN and SE_stall_entry_V2;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_5_0_backStall <= not (SE_redist0_stall_entry_o4_5_0_v_s_0);
    SE_redist0_stall_entry_o4_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_5_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_5_0_backEN = "0") THEN
                SE_redist0_stall_entry_o4_5_0_R_v_0 <= SE_redist0_stall_entry_o4_5_0_R_v_0 and SE_redist0_stall_entry_o4_5_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_5_0_R_v_0 <= SE_redist0_stall_entry_o4_5_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_stall_entry_2_reg(STALLFIFO,278)
    bubble_out_stall_entry_2_reg_valid_in <= SE_stall_entry_V1;
    bubble_out_stall_entry_2_reg_stall_in <= SE_out_bubble_out_stall_entry_2_backStall;
    bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_2_reg_valid_in(0);
    bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_2_reg_stall_in(0);
    bubble_out_stall_entry_2_reg_valid_out(0) <= bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_2_reg_stall_out(0) <= bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 7,
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

    -- i_syncbuf_output_im_sync_buffer_conv2d1x1(BLACKBOX,43)@7
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_im_sync_buffer_conv2d1x1 : i_syncbuf_output_im_sync_buffer_conv2d1x168
    PORT MAP (
        in_buffer_in => in_output_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_1_V0,
        out_buffer_out => i_syncbuf_output_im_sync_buffer_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_output_im_sync_buffer_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_output_im_sync_buffer_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_1(STALLENABLE,255)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_1_V0 <= SE_out_bubble_out_stall_entry_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_1_backStall <= i_syncbuf_output_im_sync_buffer_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_1_wireValid <= bubble_out_stall_entry_1_reg_valid_out;

    -- bubble_out_stall_entry_1_reg(STALLFIFO,277)
    bubble_out_stall_entry_1_reg_valid_in <= SE_stall_entry_V0;
    bubble_out_stall_entry_1_reg_stall_in <= SE_out_bubble_out_stall_entry_1_backStall;
    bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_valid_in(0);
    bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_stall_in(0);
    bubble_out_stall_entry_1_reg_valid_out(0) <= bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_1_reg_stall_out(0) <= bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 8,
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

    -- SE_stall_entry(STALLENABLE,180)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
            SE_stall_entry_fromReg4 <= (others => '0');
            SE_stall_entry_fromReg5 <= (others => '0');
            SE_stall_entry_fromReg6 <= (others => '0');
            SE_stall_entry_fromReg7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
            -- Succesor 4
            SE_stall_entry_fromReg4 <= SE_stall_entry_toReg4;
            -- Succesor 5
            SE_stall_entry_fromReg5 <= SE_stall_entry_toReg5;
            -- Succesor 6
            SE_stall_entry_fromReg6 <= SE_stall_entry_toReg6;
            -- Succesor 7
            SE_stall_entry_fromReg7 <= SE_stall_entry_toReg7;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (bubble_out_stall_entry_1_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (bubble_out_stall_entry_2_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (SE_redist0_stall_entry_o4_5_0_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_stall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    SE_stall_entry_consumed4 <= (not (redist1_stall_entry_o5_9_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg4;
    SE_stall_entry_consumed5 <= (not (redist2_stall_entry_o7_9_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg5;
    SE_stall_entry_consumed6 <= (not (redist5_stall_entry_o9_9_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg6;
    SE_stall_entry_consumed7 <= (not (redist8_stall_entry_o12_9_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg7;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    SE_stall_entry_toReg4 <= SE_stall_entry_StallValid and SE_stall_entry_consumed4;
    SE_stall_entry_toReg5 <= SE_stall_entry_StallValid and SE_stall_entry_consumed5;
    SE_stall_entry_toReg6 <= SE_stall_entry_StallValid and SE_stall_entry_consumed6;
    SE_stall_entry_toReg7 <= SE_stall_entry_StallValid and SE_stall_entry_consumed7;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_or3 <= SE_stall_entry_consumed3 and SE_stall_entry_or2;
    SE_stall_entry_or4 <= SE_stall_entry_consumed4 and SE_stall_entry_or3;
    SE_stall_entry_or5 <= SE_stall_entry_consumed5 and SE_stall_entry_or4;
    SE_stall_entry_or6 <= SE_stall_entry_consumed6 and SE_stall_entry_or5;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed7 and SE_stall_entry_or6);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    SE_stall_entry_V4 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg4);
    SE_stall_entry_V5 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg5);
    SE_stall_entry_V6 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg6);
    SE_stall_entry_V7 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg7);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,144)
    bubble_join_stall_entry_q <= in_unnamed_conv2d1x19 & in_j_01013 & in_cmp9_phi_decision20_xor_RM17 & in_c2_exe111 & in_c1_exe27 & in_c1_exe16 & in_c1_exe12118 & in_c0_exe13 & in_add15;

    -- bubble_select_stall_entry(BITSELECT,145)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 160));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 224));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(256 downto 256));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(288 downto 257));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(320 downto 289));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(BLACKBOX,27)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit28_0@7
    -- out out_c0_exit28_1@7
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    thei_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x : i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1
    PORT MAP (
        in_c0_eni223_0 => GND_q,
        in_c0_eni223_1 => bubble_select_stall_entry_d,
        in_c0_eni223_2 => bubble_select_stall_entry_j,
        in_i_stall => SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_backStall,
        in_i_valid => SE_stall_entry_V3,
        in_input_channels => in_input_channels,
        out_c0_exit28_1 => i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_c0_exit28_1,
        out_o_stall => i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(BITJOIN,133)
    bubble_join_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_q <= i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_c0_exit28_1;

    -- bubble_select_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(BITSELECT,134)
    bubble_select_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_q(31 downto 0));

    -- SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1(STALLENABLE,178)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_V0 <= SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_backStall <= i_store_unnamed_conv2d1x111_conv2d1x1_out_o_stall or not (SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_and0 <= i_syncbuf_output_im_sync_buffer_conv2d1x1_out_valid_out;
    SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_and1 <= i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_valid and SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_and0;
    SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_wireValid <= SE_redist4_stall_entry_o8_9_1_V1 and SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_and1;

    -- SE_out_redist8_stall_entry_o12_9_fifo(STALLENABLE,226)
    -- Valid signal propagation
    SE_out_redist8_stall_entry_o12_9_fifo_V0 <= SE_out_redist8_stall_entry_o12_9_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist8_stall_entry_o12_9_fifo_backStall <= in_stall_in or not (SE_out_redist8_stall_entry_o12_9_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist8_stall_entry_o12_9_fifo_and0 <= redist8_stall_entry_o12_9_fifo_valid_out;
    SE_out_redist8_stall_entry_o12_9_fifo_and1 <= redist5_stall_entry_o9_9_fifo_valid_out and SE_out_redist8_stall_entry_o12_9_fifo_and0;
    SE_out_redist8_stall_entry_o12_9_fifo_and2 <= redist2_stall_entry_o7_9_fifo_valid_out and SE_out_redist8_stall_entry_o12_9_fifo_and1;
    SE_out_redist8_stall_entry_o12_9_fifo_and3 <= redist1_stall_entry_o5_9_fifo_valid_out and SE_out_redist8_stall_entry_o12_9_fifo_and2;
    SE_out_redist8_stall_entry_o12_9_fifo_and4 <= bubble_out_i_syncbuf_input_size_sync_buffer5_conv2d1x1_1_reg_valid_out and SE_out_redist8_stall_entry_o12_9_fifo_and3;
    SE_out_redist8_stall_entry_o12_9_fifo_and5 <= i_store_unnamed_conv2d1x111_conv2d1x1_out_o_valid and SE_out_redist8_stall_entry_o12_9_fifo_and4;
    SE_out_redist8_stall_entry_o12_9_fifo_and6 <= SE_redist4_stall_entry_o8_9_3_V0 and SE_out_redist8_stall_entry_o12_9_fifo_and5;
    SE_out_redist8_stall_entry_o12_9_fifo_wireValid <= SE_redist9_i_unnamed_conv2d1x174_q_2_0_V0 and SE_out_redist8_stall_entry_o12_9_fifo_and6;

    -- redist6_stall_entry_o10_7_6(REG,118)
    redist6_stall_entry_o10_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o10_7_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_1_backEN = "1") THEN
                redist6_stall_entry_o10_7_6_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0(REG,126)
    redist10_i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_1_backEN = "1") THEN
                redist10_i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_1_D3);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_output_im_sync_buffer_conv2d1x1(BITJOIN,141)
    bubble_join_i_syncbuf_output_im_sync_buffer_conv2d1x1_q <= i_syncbuf_output_im_sync_buffer_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_output_im_sync_buffer_conv2d1x1(BITSELECT,142)
    bubble_select_i_syncbuf_output_im_sync_buffer_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_im_sync_buffer_conv2d1x1_q(63 downto 0));

    -- i_arrayidx66_conv2d1x1_conv2d1x173_add_x(ADD,22)@7
    i_arrayidx66_conv2d1x1_conv2d1x173_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_output_im_sync_buffer_conv2d1x1_b);
    i_arrayidx66_conv2d1x1_conv2d1x173_add_x_b <= STD_LOGIC_VECTOR("0" & redist10_i_arrayidx66_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q);
    i_arrayidx66_conv2d1x1_conv2d1x173_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx66_conv2d1x1_conv2d1x173_add_x_a) + UNSIGNED(i_arrayidx66_conv2d1x1_conv2d1x173_add_x_b));
    i_arrayidx66_conv2d1x1_conv2d1x173_add_x_q <= i_arrayidx66_conv2d1x1_conv2d1x173_add_x_o(64 downto 0);

    -- i_arrayidx66_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x(BITSELECT,16)@7
    i_arrayidx66_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x_b <= i_arrayidx66_conv2d1x1_conv2d1x173_add_x_q(63 downto 0);

    -- i_store_unnamed_conv2d1x111_conv2d1x1(BLACKBOX,41)@7
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_conv2d1x111_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@9
    -- out out_unnamed_conv2d1x111_avm_address@20000000
    -- out out_unnamed_conv2d1x111_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x111_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x111_avm_enable@20000000
    -- out out_unnamed_conv2d1x111_avm_read@20000000
    -- out out_unnamed_conv2d1x111_avm_write@20000000
    -- out out_unnamed_conv2d1x111_avm_writedata@20000000
    thei_store_unnamed_conv2d1x111_conv2d1x1 : i_store_unnamed_conv2d1x111_conv2d1x175
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx66_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x_b,
        in_i_predicate => redist6_stall_entry_o10_7_6_q,
        in_i_stall => SE_out_redist8_stall_entry_o12_9_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_output_im_sync_buffer_conv2d1x1_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_b,
        in_unnamed_conv2d1x111_avm_readdata => in_unnamed_conv2d1x111_avm_readdata,
        in_unnamed_conv2d1x111_avm_readdatavalid => in_unnamed_conv2d1x111_avm_readdatavalid,
        in_unnamed_conv2d1x111_avm_waitrequest => in_unnamed_conv2d1x111_avm_waitrequest,
        in_unnamed_conv2d1x111_avm_writeack => in_unnamed_conv2d1x111_avm_writeack,
        out_lsu_unnamed_conv2d1x111_o_active => i_store_unnamed_conv2d1x111_conv2d1x1_out_lsu_unnamed_conv2d1x111_o_active,
        out_o_stall => i_store_unnamed_conv2d1x111_conv2d1x1_out_o_stall,
        out_o_valid => i_store_unnamed_conv2d1x111_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x111_avm_address => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_address,
        out_unnamed_conv2d1x111_avm_burstcount => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_burstcount,
        out_unnamed_conv2d1x111_avm_byteenable => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_byteenable,
        out_unnamed_conv2d1x111_avm_enable => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_enable,
        out_unnamed_conv2d1x111_avm_read => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_read,
        out_unnamed_conv2d1x111_avm_write => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_write,
        out_unnamed_conv2d1x111_avm_writedata => i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_lsu_unnamed_conv2d1x111_o_active <= i_store_unnamed_conv2d1x111_conv2d1x1_out_lsu_unnamed_conv2d1x111_o_active;

    -- bubble_join_redist8_stall_entry_o12_9_fifo(BITJOIN,159)
    bubble_join_redist8_stall_entry_o12_9_fifo_q <= redist8_stall_entry_o12_9_fifo_data_out;

    -- bubble_select_redist8_stall_entry_o12_9_fifo(BITSELECT,160)
    bubble_select_redist8_stall_entry_o12_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_stall_entry_o12_9_fifo_q(31 downto 0));

    -- i_unnamed_conv2d1x174(LOGICAL,44)@7 + 1
    i_unnamed_conv2d1x174_qi <= SR_SE_i_unnamed_conv2d1x174_D0 or SR_SE_i_unnamed_conv2d1x174_D1;
    i_unnamed_conv2d1x174_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_conv2d1x174_qi, xout => i_unnamed_conv2d1x174_q, ena => SE_i_unnamed_conv2d1x174_backEN(0), clk => clock, aclr => resetn );

    -- redist9_i_unnamed_conv2d1x174_q_2_0(REG,125)
    redist9_i_unnamed_conv2d1x174_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_unnamed_conv2d1x174_q_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_unnamed_conv2d1x174_q_2_0_backEN = "1") THEN
                redist9_i_unnamed_conv2d1x174_q_2_0_q <= STD_LOGIC_VECTOR(i_unnamed_conv2d1x174_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_1(REG,129)
    redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_2_backEN = "1") THEN
                redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_2(REG,130)
    redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_3_backEN = "1") THEN
                redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_2_q <= STD_LOGIC_VECTOR(redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist5_stall_entry_o9_9_fifo(BITJOIN,156)
    bubble_join_redist5_stall_entry_o9_9_fifo_q <= redist5_stall_entry_o9_9_fifo_data_out;

    -- bubble_select_redist5_stall_entry_o9_9_fifo(BITSELECT,157)
    bubble_select_redist5_stall_entry_o9_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_stall_entry_o9_9_fifo_q(31 downto 0));

    -- redist4_stall_entry_o8_9_2(REG,109)
    redist4_stall_entry_o8_9_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o8_9_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_2_backEN = "1") THEN
                redist4_stall_entry_o8_9_2_q <= STD_LOGIC_VECTOR(SR_SE_redist4_stall_entry_o8_9_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_o8_9_3(REG,110)
    redist4_stall_entry_o8_9_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o8_9_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_stall_entry_o8_9_3_backEN = "1") THEN
                redist4_stall_entry_o8_9_3_q <= STD_LOGIC_VECTOR(redist4_stall_entry_o8_9_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist2_stall_entry_o7_9_fifo(BITJOIN,153)
    bubble_join_redist2_stall_entry_o7_9_fifo_q <= redist2_stall_entry_o7_9_fifo_data_out;

    -- bubble_select_redist2_stall_entry_o7_9_fifo(BITSELECT,154)
    bubble_select_redist2_stall_entry_o7_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_stall_entry_o7_9_fifo_q(31 downto 0));

    -- bubble_join_redist1_stall_entry_o5_9_fifo(BITJOIN,150)
    bubble_join_redist1_stall_entry_o5_9_fifo_q <= redist1_stall_entry_o5_9_fifo_data_out;

    -- bubble_select_redist1_stall_entry_o5_9_fifo(BITSELECT,151)
    bubble_select_redist1_stall_entry_o5_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_stall_entry_o5_9_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,9)@9
    out_c0_exe13 <= bubble_select_redist1_stall_entry_o5_9_fifo_b;
    out_c1_exe16 <= bubble_select_redist2_stall_entry_o7_9_fifo_b;
    out_c1_exe27 <= redist4_stall_entry_o8_9_3_q;
    out_c2_exe111 <= bubble_select_redist5_stall_entry_o9_9_fifo_b;
    out_inc68 <= redist12_bgTrunc_i_inc68_conv2d1x1_sel_x_b_4_2_q;
    out_unnamed_conv2d1x110 <= redist9_i_unnamed_conv2d1x174_q_2_0_q;
    out_unnamed_conv2d1x19 <= bubble_select_redist8_stall_entry_o12_9_fifo_b;
    out_valid_out <= SE_out_redist8_stall_entry_o12_9_fifo_V0;

    -- ext_sig_sync_out(GPOUT,35)
    out_unnamed_conv2d1x111_avm_address <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_address;
    out_unnamed_conv2d1x111_avm_enable <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_enable;
    out_unnamed_conv2d1x111_avm_read <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_read;
    out_unnamed_conv2d1x111_avm_write <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_write;
    out_unnamed_conv2d1x111_avm_writedata <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_writedata;
    out_unnamed_conv2d1x111_avm_byteenable <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_byteenable;
    out_unnamed_conv2d1x111_avm_burstcount <= i_store_unnamed_conv2d1x111_conv2d1x1_out_unnamed_conv2d1x111_avm_burstcount;

    -- sync_out(GPOUT,54)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
