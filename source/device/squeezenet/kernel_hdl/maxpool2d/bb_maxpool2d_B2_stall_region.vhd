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

-- VHDL created from bb_maxpool2d_B2_stall_region
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

entity bb_maxpool2d_B2_stall_region is
    port (
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11413 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe15 : in std_logic_vector(63 downto 0);  -- ufix64
        in_fpgaindvars_iv : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv7 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_088 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1610 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2211 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2414 : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_31 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe11413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe126 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe15 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp7_phi_decision16_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_for_end31_LC_COND : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv7_LC_OuterPHI : out std_logic_vector(2 downto 0);  -- ufix3
        out_fpgaindvars_iv_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_088 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1610 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_24_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_32_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2211 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2414 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_maxpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_maxpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_maxpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_maxpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_maxpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B2_stall_region;

architecture normal of bb_maxpool2d_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d is
        port (
            in_c0_eni5_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni5_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni5_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit19_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit19_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d is
        port (
            in_c1_eni2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni2_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni2_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit25_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit25_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_maxpool2d0_maxpool2d30 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_size_sync_buffer5_maxpool2d17 is
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















    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bgTrunc_i_inc_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i3_1gr_x_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv_next8_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_inc30_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_c0_exit19_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_c1_exit25_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_1gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_cmp7_phi_decision16_xor_rm_maxpool2d_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp7_phi_decision16_xor_rm_maxpool2d_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp7_phi_decision16_xor_rm_maxpool2d_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp7_phi_decision16_xor_rm_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end31_lc_cond_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end31_lc_cond_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv7_lc_outerphi_maxpool2d_a : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv7_lc_outerphi_maxpool2d_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv7_lc_outerphi_maxpool2d_o : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv7_lc_outerphi_maxpool2d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_lc_innerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_lc_innerphi_maxpool2d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_a : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_o : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_inc30_maxpool2d_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_inc30_maxpool2d_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc30_maxpool2d_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_k_24_lc_outerphi_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_k_24_lc_outerphi_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_k_24_lc_outerphi_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_k_24_lc_outerphi_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_l_32_lc_innerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_l_32_lc_innerphi_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_output_size_sync_buffer5_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer5_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer5_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d32_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d32_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d33_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond6_maxpool2d_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_maxpool2d_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_data_in : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_data_out : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_data_in : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_data_out : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (389 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_maxpool2d0_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_maxpool2d0_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (389 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end31_lc_cond_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end31_lc_cond_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end31_lc_cond_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end31_lc_cond_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end31_lc_cond_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end31_lc_cond_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_l_32_lc_innerphi_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_l_32_lc_innerphi_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_l_32_lc_innerphi_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_l_32_lc_innerphi_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_l_32_lc_innerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_l_32_lc_innerphi_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d32_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_maxpool2d_cmp_sign_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_maxpool2d_cmp_sign_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_maxpool2d_cmp_sign_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_maxpool2d_cmp_sign_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_maxpool2d32_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end31_lc_cond_maxpool2d_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (2 downto 0);
    signal SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (2 downto 0);
    signal SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_data0 : STD_LOGIC_VECTOR (2 downto 0);
    signal SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_D0 : STD_LOGIC_VECTOR (2 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data1 : STD_LOGIC_VECTOR (2 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_D1 : STD_LOGIC_VECTOR (2 downto 0);
    signal SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_l_32_lc_innerphi_maxpool2d_D1 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i32_1gr(CONSTANT,31)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- SE_stall_entry(STALLENABLE,211)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= maxpool2d_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,138)
    bubble_join_stall_entry_q <= in_tmp_31 & in_mul2414 & in_mul2211 & in_l_32 & in_k_24 & in_j_1610 & in_i_088 & in_fpgaindvars_iv7 & in_fpgaindvars_iv & in_c1_exe15 & in_c0_exe11413 & in_c0_exe11;

    -- bubble_select_stall_entry(BITSELECT,139)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(162 downto 160));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(165 downto 163));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(197 downto 166));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(229 downto 198));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(261 downto 230));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(293 downto 262));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(325 downto 294));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(357 downto 326));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(389 downto 358));

    -- maxpool2d_B2_merge_reg_aunroll_x(BLACKBOX,24)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    themaxpool2d_B2_merge_reg_aunroll_x : maxpool2d_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_f,
        in_data_in_1 => bubble_select_stall_entry_i,
        in_data_in_2 => bubble_select_stall_entry_e,
        in_data_in_3 => bubble_select_stall_entry_j,
        in_data_in_4 => bubble_select_stall_entry_m,
        in_data_in_5 => bubble_select_stall_entry_b,
        in_data_in_6 => bubble_select_stall_entry_d,
        in_data_in_7 => bubble_select_stall_entry_g,
        in_data_in_8 => bubble_select_stall_entry_h,
        in_data_in_9 => bubble_select_stall_entry_k,
        in_data_in_10 => bubble_select_stall_entry_c,
        in_data_in_11 => bubble_select_stall_entry_l,
        in_stall_in => SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11,
        out_stall_out => maxpool2d_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => maxpool2d_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_maxpool2d_B2_merge_reg_aunroll_x(BITJOIN,128)
    bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q <= maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_maxpool2d_B2_merge_reg_aunroll_x(BITSELECT,129)
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(2 downto 0));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(34 downto 3));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(37 downto 35));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(69 downto 38));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(101 downto 70));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(165 downto 102));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(229 downto 166));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(261 downto 230));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(293 downto 262));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(325 downto 294));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(357 downto 326));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(389 downto 358));

    -- i_inc_maxpool2d(ADD,51)@1
    i_inc_maxpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e);
    i_inc_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_maxpool2d_a) + UNSIGNED(i_inc_maxpool2d_b));
    i_inc_maxpool2d_q <= i_inc_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_inc_maxpool2d_sel_x(BITSELECT,4)@1
    bgTrunc_i_inc_maxpool2d_sel_x_b <= i_inc_maxpool2d_q(31 downto 0);

    -- SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x(STALLENABLE,190)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall <= i_load_unnamed_maxpool2d0_maxpool2d_out_o_stall or not (SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_wireValid <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_V;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d(BITJOIN,135)
    bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d_q <= i_syncbuf_output_size_sync_buffer5_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d(BITSELECT,136)
    bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d_q(31 downto 0));

    -- i_cmp7_phi_decision16_xor_rm_maxpool2d(COMPARE,38)@1 + 1
    i_cmp7_phi_decision16_xor_rm_maxpool2d_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b(31)) & bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b));
    i_cmp7_phi_decision16_xor_rm_maxpool2d_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp7_phi_decision16_xor_rm_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp7_phi_decision16_xor_rm_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backEN = "1") THEN
                i_cmp7_phi_decision16_xor_rm_maxpool2d_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp7_phi_decision16_xor_rm_maxpool2d_a) - SIGNED(i_cmp7_phi_decision16_xor_rm_maxpool2d_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp7_phi_decision16_xor_rm_maxpool2d_c(0) <= i_cmp7_phi_decision16_xor_rm_maxpool2d_o(33);

    -- SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d(STALLENABLE,208)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall <= SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backStall or not (SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer5_maxpool2d_out_valid_out;

    -- SE_i_cmp7_phi_decision16_xor_rm_maxpool2d(STALLENABLE,195)
    -- Valid signal propagation
    SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_V0 <= SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_s_tv_0 <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_out and SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backEN <= not (SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_v_s_0 <= SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backEN and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V0;
    -- Backward Stall generation
    SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backStall <= not (SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_v_s_0);
    SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_backEN = "0") THEN
                SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0 <= SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0 and SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_s_tv_0;
            ELSE
                SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_R_v_0 <= SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo(STALLFIFO,101)
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_in <= SE_i_cmp7_phi_decision16_xor_rm_maxpool2d_V0;
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_in <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_backStall;
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_data_in <= i_cmp7_phi_decision16_xor_rm_maxpool2d_c;
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_in_bitsignaltemp <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_in(0);
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_in_bitsignaltemp <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_in(0);
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_out(0) <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_out_bitsignaltemp;
    redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_out(0) <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_out_bitsignaltemp;
    theredist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 12,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp7_phi_decision16_xor_rm_maxpool2d_c,
        valid_out => redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo(BITJOIN,142)
    bubble_join_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_q <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_data_out;

    -- bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo(BITSELECT,143)
    bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x(BITJOIN,121)
    bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_q <= i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_c0_exit19_1;

    -- bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x(BITSELECT,122)
    bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_q(63 downto 0));

    -- bubble_join_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo(BITJOIN,145)
    bubble_join_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_q <= redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_data_out;

    -- bubble_select_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo(BITSELECT,146)
    bubble_select_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_q(0 downto 0));

    -- redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0(REG,103)
    redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backEN = "1") THEN
                redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_q <= STD_LOGIC_VECTOR(bubble_select_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_b);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0(STALLREG,335)
    SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid <= (others => '0');
            SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid <= SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backStall and (SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid or SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_i_valid);

            IF (SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_data0 <= STD_LOGIC_VECTOR(redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_i_valid <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_V1;
    -- Stall signal propagation
    SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backStall <= SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid or not (SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_i_valid);

    -- Valid
    SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_V <= SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid WHEN SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid = "1" ELSE SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_i_valid;

    SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_D0 <= SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_data0 WHEN SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_r_valid = "1" ELSE redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_q;

    -- bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo(BITJOIN,148)
    bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_q <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_data_out;

    -- bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo(BITSELECT,149)
    bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_q(2 downto 0));

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_exitcond_maxpool2d_cmp_sign(LOGICAL,80)@153
    i_exitcond_maxpool2d_cmp_sign_q <= STD_LOGIC_VECTOR(bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_b(2 downto 2));

    -- i_unnamed_maxpool2d33(LOGICAL,57)@153
    i_unnamed_maxpool2d33_q <= i_exitcond_maxpool2d_cmp_sign_q or redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_q;

    -- SR_SE_i_for_end31_lc_cond_maxpool2d(STALLREG,337)
    SR_SE_i_for_end31_lc_cond_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_for_end31_lc_cond_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_for_end31_lc_cond_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid <= SE_i_for_end31_lc_cond_maxpool2d_backStall and (SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid or SR_SE_i_for_end31_lc_cond_maxpool2d_i_valid);

            IF (SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_for_end31_lc_cond_maxpool2d_r_data0 <= i_unnamed_maxpool2d32_q;
                SR_SE_i_for_end31_lc_cond_maxpool2d_r_data1 <= i_unnamed_maxpool2d33_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_for_end31_lc_cond_maxpool2d_and0 <= SE_i_unnamed_maxpool2d32_V0;
    SR_SE_i_for_end31_lc_cond_maxpool2d_i_valid <= SE_i_exitcond_maxpool2d_cmp_sign_V0 and SR_SE_i_for_end31_lc_cond_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_for_end31_lc_cond_maxpool2d_backStall <= SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid or not (SR_SE_i_for_end31_lc_cond_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_for_end31_lc_cond_maxpool2d_V <= SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid WHEN SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid = "1" ELSE SR_SE_i_for_end31_lc_cond_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_for_end31_lc_cond_maxpool2d_D0 <= SR_SE_i_for_end31_lc_cond_maxpool2d_r_data0 WHEN SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d32_q;
    -- Data1
    SR_SE_i_for_end31_lc_cond_maxpool2d_D1 <= SR_SE_i_for_end31_lc_cond_maxpool2d_r_data1 WHEN SR_SE_i_for_end31_lc_cond_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d33_q;

    -- i_fpgaindvars_iv_next8_maxpool2d_sel_x(BITSELECT,20)@153
    i_fpgaindvars_iv_next8_maxpool2d_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(i_unnamed_maxpool2d32_q(0 downto 0)), 3)));

    -- i_fpgaindvars_iv7_lc_outerphi_maxpool2d(ADD,42)@153
    i_fpgaindvars_iv7_lc_outerphi_maxpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_b);
    i_fpgaindvars_iv7_lc_outerphi_maxpool2d_b <= STD_LOGIC_VECTOR("0" & i_fpgaindvars_iv_next8_maxpool2d_sel_x_b);
    i_fpgaindvars_iv7_lc_outerphi_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv7_lc_outerphi_maxpool2d_a) + UNSIGNED(i_fpgaindvars_iv7_lc_outerphi_maxpool2d_b));
    i_fpgaindvars_iv7_lc_outerphi_maxpool2d_q <= i_fpgaindvars_iv7_lc_outerphi_maxpool2d_o(3 downto 0);

    -- bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x(BITSELECT,2)@153
    bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b <= i_fpgaindvars_iv7_lc_outerphi_maxpool2d_q(2 downto 0);

    -- SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0(STALLREG,338)
    SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid <= SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall and (SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid or SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid <= SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_V0;
    -- Stall signal propagation
    SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall <= SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid or not (SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_V <= SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid WHEN SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid;

    SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_D0 <= SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 WHEN SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b;

    -- SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d(STALLENABLE,197)
    -- Valid signal propagation
    SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_V0 <= SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_wireValid;
    -- Backward Stall generation
    SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_backStall <= SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall or not (SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_and0 <= SE_i_unnamed_maxpool2d32_V3;
    SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_wireValid <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_V0 and SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_and0;

    -- SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo(STALLENABLE,222)
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg0 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg1 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed0 <= (not (SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_backStall) and SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid) or SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg0;
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed1 <= (not (SE_i_exitcond_maxpool2d_cmp_sign_backStall) and SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid) or SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_StallValid <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_backStall and SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid;
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_toReg0 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_StallValid and SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed0;
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_toReg1 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_StallValid and SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_or0 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed0;
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireStall <= not (SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_consumed1 and SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_or0);
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_backStall <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_V0 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid and not (SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg0);
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_V1 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid and not (SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_wireValid <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_out;

    -- SE_i_exitcond_maxpool2d_cmp_sign(STALLENABLE,214)
    -- Valid signal propagation
    SE_i_exitcond_maxpool2d_cmp_sign_V0 <= SE_i_exitcond_maxpool2d_cmp_sign_wireValid;
    -- Backward Stall generation
    SE_i_exitcond_maxpool2d_cmp_sign_backStall <= SR_SE_i_for_end31_lc_cond_maxpool2d_backStall or not (SE_i_exitcond_maxpool2d_cmp_sign_wireValid);
    -- Computing multiple Valid(s)
    SE_i_exitcond_maxpool2d_cmp_sign_and0 <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_V1;
    SE_i_exitcond_maxpool2d_cmp_sign_wireValid <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_V0 and SE_i_exitcond_maxpool2d_cmp_sign_and0;

    -- SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0(STALLENABLE,219)
    -- Valid signal propagation
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_V0 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0;
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_V1 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1;
    -- Stall signal propagation
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_0 <= SE_i_exitcond_maxpool2d_cmp_sign_backStall and SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0;
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_1 <= SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backStall and SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1;
    -- Backward Enable generation
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_or0 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_0;
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backEN <= not (SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_1 or SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_v_s_0 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backEN and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_V1;
    -- Backward Stall generation
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backStall <= not (SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_v_s_0);
    SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0 <= (others => '0');
            SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backEN = "0") THEN
                SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0 and SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_0;
            ELSE
                SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_0 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_v_s_0;
            END IF;

            IF (SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backEN = "0") THEN
                SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1 and SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_s_tv_1;
            ELSE
                SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_R_v_1 <= SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo(BITJOIN,154)
    bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_q <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_data_out;

    -- bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo(BITSELECT,155)
    bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_q(2 downto 0));

    -- i_exitcond6_maxpool2d_cmp_sign(LOGICAL,78)@152
    i_exitcond6_maxpool2d_cmp_sign_q <= STD_LOGIC_VECTOR(bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_b(2 downto 2));

    -- c_i3_1gr(CONSTANT,33)
    c_i3_1gr_q <= "111";

    -- redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0(REG,108)
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backEN = "1") THEN
                redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_q <= STD_LOGIC_VECTOR(SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_fpgaindvars_iv_next_maxpool2d(ADD,46)@153
    i_fpgaindvars_iv_next_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_q);
    i_fpgaindvars_iv_next_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i3_1gr_q);
    i_fpgaindvars_iv_next_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next_maxpool2d_a) + UNSIGNED(i_fpgaindvars_iv_next_maxpool2d_b));
    i_fpgaindvars_iv_next_maxpool2d_q <= i_fpgaindvars_iv_next_maxpool2d_o(3 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x(BITSELECT,3)@153
    bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b <= i_fpgaindvars_iv_next_maxpool2d_q(2 downto 0);

    -- SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d(STALLREG,340)
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid <= SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall and (SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid or SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_i_valid);

            IF (SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data0 <= i_unnamed_maxpool2d32_q;
                SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data1 <= bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_and0 <= SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_V0;
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_i_valid <= SE_i_unnamed_maxpool2d32_V1 and SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid or not (SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_V <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid WHEN SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid = "1" ELSE SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_D0 <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data0 WHEN SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d32_q;
    -- Data1
    SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_D1 <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_data1 WHEN SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_r_valid = "1" ELSE bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b;

    -- SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0(STALLENABLE,227)
    -- Valid signal propagation
    SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_V0 <= SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0;
    -- Stall signal propagation
    SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_s_tv_0 <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall and SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0;
    -- Backward Enable generation
    SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backEN <= not (SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_v_s_0 <= SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backEN and SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_V;
    -- Backward Stall generation
    SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backStall <= not (SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backEN);
    SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backEN = "0") THEN
                SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0 <= SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0 and SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_s_tv_0;
            ELSE
                SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_R_v_0 <= SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0(STALLREG,339)
    SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid <= (others => '0');
            SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid <= SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backStall and (SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid or SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_i_valid);

            IF (SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_i_valid <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backStall <= SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid or not (SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_i_valid);

    -- Valid
    SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_V <= SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid WHEN SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid = "1" ELSE SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_i_valid;

    SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_D0 <= SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_data0 WHEN SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_r_valid = "1" ELSE bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_b;

    -- SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo(STALLENABLE,226)
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg0 <= (others => '0');
            SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg0 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_toReg0;
            -- Succesor 1
            SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg1 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed0 <= (not (SR_SE_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_152_0_backStall) and SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid) or SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg0;
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed1 <= (not (SR_SE_i_unnamed_maxpool2d32_backStall) and SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid) or SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg1;
    -- Consuming
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_StallValid <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_backStall and SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid;
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_toReg0 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_StallValid and SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed0;
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_toReg1 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_StallValid and SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_or0 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed0;
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireStall <= not (SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_consumed1 and SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_or0);
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_backStall <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_V0 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid and not (SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg0);
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_V1 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid and not (SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_wireValid <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_out;

    -- SR_SE_i_unnamed_maxpool2d32(STALLREG,336)
    SR_SE_i_unnamed_maxpool2d32_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_unnamed_maxpool2d32_r_valid <= (others => '0');
            SR_SE_i_unnamed_maxpool2d32_r_data0 <= (others => '-');
            SR_SE_i_unnamed_maxpool2d32_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_unnamed_maxpool2d32_r_valid <= SE_i_unnamed_maxpool2d32_backStall and (SR_SE_i_unnamed_maxpool2d32_r_valid or SR_SE_i_unnamed_maxpool2d32_i_valid);

            IF (SR_SE_i_unnamed_maxpool2d32_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_unnamed_maxpool2d32_r_data0 <= i_exitcond6_maxpool2d_cmp_sign_q;
                SR_SE_i_unnamed_maxpool2d32_r_data1 <= bubble_select_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_unnamed_maxpool2d32_and0 <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_V1;
    SR_SE_i_unnamed_maxpool2d32_i_valid <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_V0 and SR_SE_i_unnamed_maxpool2d32_and0;
    -- Stall signal propagation
    SR_SE_i_unnamed_maxpool2d32_backStall <= SR_SE_i_unnamed_maxpool2d32_r_valid or not (SR_SE_i_unnamed_maxpool2d32_i_valid);

    -- Valid
    SR_SE_i_unnamed_maxpool2d32_V <= SR_SE_i_unnamed_maxpool2d32_r_valid WHEN SR_SE_i_unnamed_maxpool2d32_r_valid = "1" ELSE SR_SE_i_unnamed_maxpool2d32_i_valid;

    -- Data0
    SR_SE_i_unnamed_maxpool2d32_D0 <= SR_SE_i_unnamed_maxpool2d32_r_data0 WHEN SR_SE_i_unnamed_maxpool2d32_r_valid = "1" ELSE i_exitcond6_maxpool2d_cmp_sign_q;
    -- Data1
    SR_SE_i_unnamed_maxpool2d32_D1 <= SR_SE_i_unnamed_maxpool2d32_r_data1 WHEN SR_SE_i_unnamed_maxpool2d32_r_valid = "1" ELSE bubble_select_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_b;

    -- SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo(STALLENABLE,218)
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg0 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg1 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed0 <= (not (SR_SE_i_unnamed_maxpool2d32_backStall) and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid) or SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg0;
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed1 <= (not (SE_redist2_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_152_0_backStall) and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid) or SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_StallValid <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_backStall and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid;
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_toReg0 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_StallValid and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed0;
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_toReg1 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_StallValid and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_or0 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed0;
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireStall <= not (SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_consumed1 and SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_or0);
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_backStall <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_V0 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid and not (SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg0);
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_V1 <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid and not (SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_wireValid <= redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_out;

    -- redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo(STALLFIFO,102)
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_in <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_V1;
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_in <= SE_out_redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_backStall;
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_data_in <= bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_b;
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_in_bitsignaltemp <= redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_in(0);
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_in_bitsignaltemp <= redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_in(0);
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_out(0) <= redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_out_bitsignaltemp;
    redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_out(0) <= redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_out_bitsignaltemp;
    theredist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_b,
        valid_out => redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo(STALLENABLE,216)
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg0 <= (others => '0');
            SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg0 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_toReg0;
            -- Succesor 1
            SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg1 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed0 <= (not (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall) and SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid) or SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg0;
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed1 <= (not (redist1_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_151_fifo_stall_out) and SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid) or SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg1;
    -- Consuming
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_StallValid <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_backStall and SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid;
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_toReg0 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_StallValid and SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed0;
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_toReg1 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_StallValid and SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_or0 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed0;
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireStall <= not (SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_consumed1 and SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_or0);
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_backStall <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_V0 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid and not (SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg0);
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_V1 <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid and not (SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_wireValid <= redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_valid_out;

    -- SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x(STALLREG,334)
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid <= (others => '0');
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data0 <= (others => '-');
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid <= SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall and (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid or SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_i_valid);

            IF (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data0 <= bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_b;
                SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data1 <= bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_and0 <= i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_o_valid;
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_i_valid <= SE_out_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_V0 and SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_and0;
    -- Stall signal propagation
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid or not (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_i_valid);

    -- Valid
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_V <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid WHEN SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid = "1" ELSE SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_i_valid;

    -- Data0
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_D0 <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data0 WHEN SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_b;
    -- Data1
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_D1 <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_data1 WHEN SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_r_valid = "1" ELSE bubble_select_redist0_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_12_fifo_b;

    -- i_load_unnamed_maxpool2d0_maxpool2d(BLACKBOX,54)@13
    -- in in_i_stall@20000000
    -- out out_o_readdata@149
    -- out out_o_stall@20000000
    -- out out_o_valid@149
    -- out out_unnamed_maxpool2d0_avm_address@20000000
    -- out out_unnamed_maxpool2d0_avm_burstcount@20000000
    -- out out_unnamed_maxpool2d0_avm_byteenable@20000000
    -- out out_unnamed_maxpool2d0_avm_enable@20000000
    -- out out_unnamed_maxpool2d0_avm_read@20000000
    -- out out_unnamed_maxpool2d0_avm_write@20000000
    -- out out_unnamed_maxpool2d0_avm_writedata@20000000
    thei_load_unnamed_maxpool2d0_maxpool2d : i_load_unnamed_maxpool2d0_maxpool2d30
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_D0,
        in_i_predicate => SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_D1,
        in_i_stall => SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_V0,
        in_unnamed_maxpool2d0_avm_readdata => in_unnamed_maxpool2d0_avm_readdata,
        in_unnamed_maxpool2d0_avm_readdatavalid => in_unnamed_maxpool2d0_avm_readdatavalid,
        in_unnamed_maxpool2d0_avm_waitrequest => in_unnamed_maxpool2d0_avm_waitrequest,
        in_unnamed_maxpool2d0_avm_writeack => in_unnamed_maxpool2d0_avm_writeack,
        out_o_readdata => i_load_unnamed_maxpool2d0_maxpool2d_out_o_readdata,
        out_o_stall => i_load_unnamed_maxpool2d0_maxpool2d_out_o_stall,
        out_o_valid => i_load_unnamed_maxpool2d0_maxpool2d_out_o_valid,
        out_unnamed_maxpool2d0_avm_address => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_address,
        out_unnamed_maxpool2d0_avm_burstcount => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_burstcount,
        out_unnamed_maxpool2d0_avm_byteenable => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_byteenable,
        out_unnamed_maxpool2d0_avm_enable => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_enable,
        out_unnamed_maxpool2d0_avm_read => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_read,
        out_unnamed_maxpool2d0_avm_write => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_write,
        out_unnamed_maxpool2d0_avm_writedata => i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo(STALLENABLE,229)
    -- Valid signal propagation
    SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_V0 <= SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_backStall <= i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_o_stall or not (SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_and0 <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_out;
    SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_wireValid <= i_load_unnamed_maxpool2d0_maxpool2d_out_o_valid and SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_and0;

    -- redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo(STALLFIFO,109)
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V5;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_in <= SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_backStall;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_in_bitsignaltemp <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_in(0);
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_in_bitsignaltemp <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_in(0);
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_out(0) <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_out_bitsignaltemp;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_out(0) <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_out_bitsignaltemp;
    theredist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 149,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f,
        valid_out => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_out_bitsignaltemp,
        data_out => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo(STALLFIFO,107)
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V4;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_in <= SE_out_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_backStall;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_in_bitsignaltemp <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_in(0);
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_in_bitsignaltemp <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_in(0);
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_out(0) <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_out_bitsignaltemp;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_out(0) <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_out_bitsignaltemp;
    theredist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 152,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 3,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d,
        valid_out => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_out_bitsignaltemp,
        data_out => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_inc30_maxpool2d_vt_const_31(CONSTANT,48)
    i_inc30_maxpool2d_vt_const_31_q <= "0000000000000000000000000000000";

    -- i_inc30_maxpool2d_sel_x(BITSELECT,21)@153
    i_inc30_maxpool2d_sel_x_b <= std_logic_vector(resize(unsigned(i_unnamed_maxpool2d32_q(0 downto 0)), 32));

    -- i_inc30_maxpool2d_vt_select_0(BITSELECT,50)@153
    i_inc30_maxpool2d_vt_select_0_b <= i_inc30_maxpool2d_sel_x_b(0 downto 0);

    -- i_inc30_maxpool2d_vt_join(BITJOIN,49)@153
    i_inc30_maxpool2d_vt_join_q <= i_inc30_maxpool2d_vt_const_31_q & i_inc30_maxpool2d_vt_select_0_b;

    -- bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo(BITJOIN,151)
    bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_q <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_data_out;

    -- bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo(BITSELECT,152)
    bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_q(31 downto 0));

    -- i_k_24_lc_outerphi_maxpool2d(ADD,52)@153
    i_k_24_lc_outerphi_maxpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_b);
    i_k_24_lc_outerphi_maxpool2d_b <= STD_LOGIC_VECTOR("0" & i_inc30_maxpool2d_vt_join_q);
    i_k_24_lc_outerphi_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_k_24_lc_outerphi_maxpool2d_a) + UNSIGNED(i_k_24_lc_outerphi_maxpool2d_b));
    i_k_24_lc_outerphi_maxpool2d_q <= i_k_24_lc_outerphi_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x(BITSELECT,5)@153
    bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b <= i_k_24_lc_outerphi_maxpool2d_q(31 downto 0);

    -- SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0(STALLREG,341)
    SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid <= SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall and (SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid or SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid <= SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall <= SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid or not (SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_V <= SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid WHEN SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_i_valid;

    SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_D0 <= SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_data0 WHEN SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b;

    -- SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo(STALLENABLE,224)
    -- Valid signal propagation
    SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_V0 <= SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_backStall <= SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall or not (SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_and0 <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_out;
    SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_wireValid <= SE_i_unnamed_maxpool2d32_V4 and SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_and0;

    -- redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo(STALLFIFO,106)
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V3;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_in <= SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_backStall;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_in_bitsignaltemp <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_in(0);
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_in_bitsignaltemp <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_in(0);
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_out(0) <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_out_bitsignaltemp;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_out(0) <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_out_bitsignaltemp;
    theredist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c,
        valid_out => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_out_bitsignaltemp,
        data_out => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo(STALLFIFO,105)
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V2;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_in <= SE_out_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_backStall;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_in_bitsignaltemp <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_in(0);
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_in_bitsignaltemp <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_in(0);
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_out(0) <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_out_bitsignaltemp;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_out(0) <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_out_bitsignaltemp;
    theredist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 3,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b,
        valid_out => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_out_bitsignaltemp,
        data_out => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x(BLACKBOX,22)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit19_0@13
    -- out out_c0_exit19_1@13
    -- out out_o_stall@20000000
    -- out out_o_valid@13
    thei_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x : i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d
    PORT MAP (
        in_c0_eni5_0 => GND_q,
        in_c0_eni5_1 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c,
        in_c0_eni5_2 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k,
        in_c0_eni5_3 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_m,
        in_c0_eni5_4 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e,
        in_c0_eni5_5 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g,
        in_i_stall => SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_backStall,
        in_i_valid => SE_out_maxpool2d_B2_merge_reg_aunroll_x_V1,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        out_c0_exit19_1 => i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_c0_exit19_1,
        out_o_stall => i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_output_size_sync_buffer5_maxpool2d(BLACKBOX,55)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer5_maxpool2d : i_syncbuf_output_size_sync_buffer5_maxpool2d17
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall,
        in_valid_in => SE_out_maxpool2d_B2_merge_reg_aunroll_x_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer5_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer5_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer5_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_maxpool2d_B2_merge_reg_aunroll_x(STALLENABLE,194)
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg12 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg13 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg12 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg13 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg13;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0 <= (not (i_syncbuf_output_size_sync_buffer5_maxpool2d_out_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter16_maxpool2d_aunroll_x_out_o_stall) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2 <= (not (redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_152_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3 <= (not (redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4 <= (not (redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_151_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5 <= (not (redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6 <= (not (redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7 <= (not (redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8 <= (not (redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9 <= (not (redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10 <= (not (redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11 <= (not (redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed12 <= (not (redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg12;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed13 <= (not (redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg13;
    -- Consuming
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg12 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed12;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg13 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed13;
    -- Backward Stall generation
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or1;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or2;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or3;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or4;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or5;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or6;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or7;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or8;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or9;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or10;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or12 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed12 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or11;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed13 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or12);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V12 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg12);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V13 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg13);
    -- Computing multiple Valid(s)
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid <= maxpool2d_B2_merge_reg_aunroll_x_out_valid_out;

    -- redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo(STALLFIFO,118)
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V13;
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_in <= SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_backStall;
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_data_in <= bgTrunc_i_inc_maxpool2d_sel_x_b;
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_in_bitsignaltemp <= redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_in(0);
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_in_bitsignaltemp <= redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_in(0);
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_out(0) <= redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_out_bitsignaltemp;
    redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_out(0) <= redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_out_bitsignaltemp;
    theredist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_inc_maxpool2d_sel_x_b,
        valid_out => redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_stall_out_bitsignaltemp,
        data_out => redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo(BITJOIN,181)
    bubble_join_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_q <= redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_data_out;

    -- bubble_select_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo(BITSELECT,182)
    bubble_select_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_q(31 downto 0));

    -- i_unnamed_maxpool2d32(LOGICAL,56)@152 + 1
    i_unnamed_maxpool2d32_qi <= SR_SE_i_unnamed_maxpool2d32_D0 or SR_SE_i_unnamed_maxpool2d32_D1;
    i_unnamed_maxpool2d32_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_maxpool2d32_qi, xout => i_unnamed_maxpool2d32_q, ena => SE_i_unnamed_maxpool2d32_backEN(0), clk => clock, aclr => resetn );

    -- SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo(STALLENABLE,246)
    -- Valid signal propagation
    SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_V0 <= SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_backStall <= SR_SE_i_l_32_lc_innerphi_maxpool2d_backStall or not (SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_wireValid <= redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_valid_out;

    -- SE_i_unnamed_maxpool2d32(STALLENABLE,209)
    -- Valid signal propagation
    SE_i_unnamed_maxpool2d32_V0 <= SE_i_unnamed_maxpool2d32_R_v_0;
    SE_i_unnamed_maxpool2d32_V1 <= SE_i_unnamed_maxpool2d32_R_v_1;
    SE_i_unnamed_maxpool2d32_V2 <= SE_i_unnamed_maxpool2d32_R_v_2;
    SE_i_unnamed_maxpool2d32_V3 <= SE_i_unnamed_maxpool2d32_R_v_3;
    SE_i_unnamed_maxpool2d32_V4 <= SE_i_unnamed_maxpool2d32_R_v_4;
    -- Stall signal propagation
    SE_i_unnamed_maxpool2d32_s_tv_0 <= SR_SE_i_for_end31_lc_cond_maxpool2d_backStall and SE_i_unnamed_maxpool2d32_R_v_0;
    SE_i_unnamed_maxpool2d32_s_tv_1 <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall and SE_i_unnamed_maxpool2d32_R_v_1;
    SE_i_unnamed_maxpool2d32_s_tv_2 <= SR_SE_i_l_32_lc_innerphi_maxpool2d_backStall and SE_i_unnamed_maxpool2d32_R_v_2;
    SE_i_unnamed_maxpool2d32_s_tv_3 <= SE_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_backStall and SE_i_unnamed_maxpool2d32_R_v_3;
    SE_i_unnamed_maxpool2d32_s_tv_4 <= SE_out_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1_152_fifo_backStall and SE_i_unnamed_maxpool2d32_R_v_4;
    -- Backward Enable generation
    SE_i_unnamed_maxpool2d32_or0 <= SE_i_unnamed_maxpool2d32_s_tv_0;
    SE_i_unnamed_maxpool2d32_or1 <= SE_i_unnamed_maxpool2d32_s_tv_1 or SE_i_unnamed_maxpool2d32_or0;
    SE_i_unnamed_maxpool2d32_or2 <= SE_i_unnamed_maxpool2d32_s_tv_2 or SE_i_unnamed_maxpool2d32_or1;
    SE_i_unnamed_maxpool2d32_or3 <= SE_i_unnamed_maxpool2d32_s_tv_3 or SE_i_unnamed_maxpool2d32_or2;
    SE_i_unnamed_maxpool2d32_backEN <= not (SE_i_unnamed_maxpool2d32_s_tv_4 or SE_i_unnamed_maxpool2d32_or3);
    -- Determine whether to write valid data into the first register stage
    SE_i_unnamed_maxpool2d32_v_s_0 <= SE_i_unnamed_maxpool2d32_backEN and SR_SE_i_unnamed_maxpool2d32_V;
    -- Backward Stall generation
    SE_i_unnamed_maxpool2d32_backStall <= not (SE_i_unnamed_maxpool2d32_backEN);
    SE_i_unnamed_maxpool2d32_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_maxpool2d32_R_v_0 <= (others => '0');
            SE_i_unnamed_maxpool2d32_R_v_1 <= (others => '0');
            SE_i_unnamed_maxpool2d32_R_v_2 <= (others => '0');
            SE_i_unnamed_maxpool2d32_R_v_3 <= (others => '0');
            SE_i_unnamed_maxpool2d32_R_v_4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_maxpool2d32_backEN = "0") THEN
                SE_i_unnamed_maxpool2d32_R_v_0 <= SE_i_unnamed_maxpool2d32_R_v_0 and SE_i_unnamed_maxpool2d32_s_tv_0;
            ELSE
                SE_i_unnamed_maxpool2d32_R_v_0 <= SE_i_unnamed_maxpool2d32_v_s_0;
            END IF;

            IF (SE_i_unnamed_maxpool2d32_backEN = "0") THEN
                SE_i_unnamed_maxpool2d32_R_v_1 <= SE_i_unnamed_maxpool2d32_R_v_1 and SE_i_unnamed_maxpool2d32_s_tv_1;
            ELSE
                SE_i_unnamed_maxpool2d32_R_v_1 <= SE_i_unnamed_maxpool2d32_v_s_0;
            END IF;

            IF (SE_i_unnamed_maxpool2d32_backEN = "0") THEN
                SE_i_unnamed_maxpool2d32_R_v_2 <= SE_i_unnamed_maxpool2d32_R_v_2 and SE_i_unnamed_maxpool2d32_s_tv_2;
            ELSE
                SE_i_unnamed_maxpool2d32_R_v_2 <= SE_i_unnamed_maxpool2d32_v_s_0;
            END IF;

            IF (SE_i_unnamed_maxpool2d32_backEN = "0") THEN
                SE_i_unnamed_maxpool2d32_R_v_3 <= SE_i_unnamed_maxpool2d32_R_v_3 and SE_i_unnamed_maxpool2d32_s_tv_3;
            ELSE
                SE_i_unnamed_maxpool2d32_R_v_3 <= SE_i_unnamed_maxpool2d32_v_s_0;
            END IF;

            IF (SE_i_unnamed_maxpool2d32_backEN = "0") THEN
                SE_i_unnamed_maxpool2d32_R_v_4 <= SE_i_unnamed_maxpool2d32_R_v_4 and SE_i_unnamed_maxpool2d32_s_tv_4;
            ELSE
                SE_i_unnamed_maxpool2d32_R_v_4 <= SE_i_unnamed_maxpool2d32_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_l_32_lc_innerphi_maxpool2d(STALLREG,342)
    SR_SE_i_l_32_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid <= SE_i_l_32_lc_innerphi_maxpool2d_backStall and (SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid or SR_SE_i_l_32_lc_innerphi_maxpool2d_i_valid);

            IF (SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data0 <= i_unnamed_maxpool2d32_q;
                SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data1 <= bubble_select_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_l_32_lc_innerphi_maxpool2d_and0 <= SE_i_unnamed_maxpool2d32_V2;
    SR_SE_i_l_32_lc_innerphi_maxpool2d_i_valid <= SE_out_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_V0 and SR_SE_i_l_32_lc_innerphi_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_l_32_lc_innerphi_maxpool2d_backStall <= SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid or not (SR_SE_i_l_32_lc_innerphi_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_l_32_lc_innerphi_maxpool2d_V <= SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid WHEN SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid = "1" ELSE SR_SE_i_l_32_lc_innerphi_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_l_32_lc_innerphi_maxpool2d_D0 <= SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data0 WHEN SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d32_q;
    -- Data1
    SR_SE_i_l_32_lc_innerphi_maxpool2d_D1 <= SR_SE_i_l_32_lc_innerphi_maxpool2d_r_data1 WHEN SR_SE_i_l_32_lc_innerphi_maxpool2d_r_valid = "1" ELSE bubble_select_redist17_bgTrunc_i_inc_maxpool2d_sel_x_b_152_fifo_b;

    -- SE_i_l_32_lc_innerphi_maxpool2d(STALLENABLE,204)
    -- Valid signal propagation
    SE_i_l_32_lc_innerphi_maxpool2d_V0 <= SE_i_l_32_lc_innerphi_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_l_32_lc_innerphi_maxpool2d_s_tv_0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall and SE_i_l_32_lc_innerphi_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_l_32_lc_innerphi_maxpool2d_backEN <= not (SE_i_l_32_lc_innerphi_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_l_32_lc_innerphi_maxpool2d_v_s_0 <= SE_i_l_32_lc_innerphi_maxpool2d_backEN and SR_SE_i_l_32_lc_innerphi_maxpool2d_V;
    -- Backward Stall generation
    SE_i_l_32_lc_innerphi_maxpool2d_backStall <= not (SE_i_l_32_lc_innerphi_maxpool2d_backEN);
    SE_i_l_32_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_l_32_lc_innerphi_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_l_32_lc_innerphi_maxpool2d_backEN = "0") THEN
                SE_i_l_32_lc_innerphi_maxpool2d_R_v_0 <= SE_i_l_32_lc_innerphi_maxpool2d_R_v_0 and SE_i_l_32_lc_innerphi_maxpool2d_s_tv_0;
            ELSE
                SE_i_l_32_lc_innerphi_maxpool2d_R_v_0 <= SE_i_l_32_lc_innerphi_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0(STALLENABLE,244)
    -- Valid signal propagation
    SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_V0 <= SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall and SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN <= not (SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_v_s_0 <= SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN and SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall <= not (SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN);
    SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN = "0") THEN
                SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 <= SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 and SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 <= SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d(STALLENABLE,198)
    -- Valid signal propagation
    SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_V0 <= SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_s_tv_0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall and SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backEN <= not (SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_v_s_0 <= SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backEN and SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_V;
    -- Backward Stall generation
    SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backStall <= not (SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backEN);
    SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backEN = "0") THEN
                SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0 <= SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0 and SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_s_tv_0;
            ELSE
                SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_R_v_0 <= SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0(STALLENABLE,247)
    -- Valid signal propagation
    SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_V0 <= SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall and SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN <= not (SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_v_s_0 <= SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN and SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backStall <= not (SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN);
    SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN = "0") THEN
                SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 <= SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 and SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_R_v_0 <= SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_for_end31_lc_cond_maxpool2d(STALLENABLE,196)
    -- Valid signal propagation
    SE_i_for_end31_lc_cond_maxpool2d_V0 <= SE_i_for_end31_lc_cond_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_for_end31_lc_cond_maxpool2d_s_tv_0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall and SE_i_for_end31_lc_cond_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_for_end31_lc_cond_maxpool2d_backEN <= not (SE_i_for_end31_lc_cond_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_for_end31_lc_cond_maxpool2d_v_s_0 <= SE_i_for_end31_lc_cond_maxpool2d_backEN and SR_SE_i_for_end31_lc_cond_maxpool2d_V;
    -- Backward Stall generation
    SE_i_for_end31_lc_cond_maxpool2d_backStall <= not (SE_i_for_end31_lc_cond_maxpool2d_backEN);
    SE_i_for_end31_lc_cond_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_for_end31_lc_cond_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_for_end31_lc_cond_maxpool2d_backEN = "0") THEN
                SE_i_for_end31_lc_cond_maxpool2d_R_v_0 <= SE_i_for_end31_lc_cond_maxpool2d_R_v_0 and SE_i_for_end31_lc_cond_maxpool2d_s_tv_0;
            ELSE
                SE_i_for_end31_lc_cond_maxpool2d_R_v_0 <= SE_i_for_end31_lc_cond_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0(STALLENABLE,220)
    -- Valid signal propagation
    SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_V0 <= SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0;
    -- Stall signal propagation
    SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_s_tv_0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall and SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0;
    -- Backward Enable generation
    SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backEN <= not (SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_v_s_0 <= SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backEN and SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_V;
    -- Backward Stall generation
    SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backStall <= not (SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backEN);
    SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backEN = "0") THEN
                SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0 <= SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0 and SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_s_tv_0;
            ELSE
                SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_R_v_0 <= SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo(BITJOIN,157)
    bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_q <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_data_out;

    -- bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo(BITSELECT,158)
    bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_q(31 downto 0));

    -- bubble_join_i_load_unnamed_maxpool2d0_maxpool2d(BITJOIN,132)
    bubble_join_i_load_unnamed_maxpool2d0_maxpool2d_q <= i_load_unnamed_maxpool2d0_maxpool2d_out_o_readdata;

    -- bubble_select_i_load_unnamed_maxpool2d0_maxpool2d(BITSELECT,133)
    bubble_select_i_load_unnamed_maxpool2d0_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_maxpool2d0_maxpool2d_q(31 downto 0));

    -- i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x(BLACKBOX,23)@149
    -- in in_i_stall@20000000
    -- out out_c1_exit25_0@154
    -- out out_c1_exit25_1@154
    -- out out_o_stall@20000000
    -- out out_o_valid@154
    thei_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x : i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d
    PORT MAP (
        in_c1_eni2_0 => GND_q,
        in_c1_eni2_1 => bubble_select_i_load_unnamed_maxpool2d0_maxpool2d_b,
        in_c1_eni2_2 => bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_b,
        in_i_stall => SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall,
        in_i_valid => SE_out_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_148_fifo_V0,
        out_c1_exit25_1 => i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_c1_exit25_1,
        out_o_stall => i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo(STALLFIFO,110)
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V6;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_in_bitsignaltemp <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_in(0);
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_in_bitsignaltemp <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_in(0);
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_out(0) <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_out_bitsignaltemp;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_out(0) <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_out_bitsignaltemp;
    theredist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g,
        valid_out => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_stall_out_bitsignaltemp,
        data_out => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo(STALLFIFO,111)
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V7;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_in_bitsignaltemp <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_in(0);
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_in_bitsignaltemp <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_in(0);
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_out(0) <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_out_bitsignaltemp;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_out(0) <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_out_bitsignaltemp;
    theredist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h,
        valid_out => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_stall_out_bitsignaltemp,
        data_out => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo(STALLFIFO,112)
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V8;
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i;
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_in_bitsignaltemp <= redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_in(0);
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_in_bitsignaltemp <= redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_in(0);
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_out(0) <= redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_out_bitsignaltemp;
    redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_out(0) <= redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_out_bitsignaltemp;
    theredist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i,
        valid_out => redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_stall_out_bitsignaltemp,
        data_out => redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo(STALLFIFO,113)
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V9;
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j;
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_in_bitsignaltemp <= redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_in(0);
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_in_bitsignaltemp <= redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_in(0);
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_out(0) <= redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_out_bitsignaltemp;
    redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_out(0) <= redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_out_bitsignaltemp;
    theredist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j,
        valid_out => redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_stall_out_bitsignaltemp,
        data_out => redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo(STALLFIFO,114)
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V10;
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k;
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_in_bitsignaltemp <= redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_in(0);
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_in_bitsignaltemp <= redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_in(0);
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_out(0) <= redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_out_bitsignaltemp;
    redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_out(0) <= redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_out_bitsignaltemp;
    theredist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k,
        valid_out => redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_stall_out_bitsignaltemp,
        data_out => redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo(STALLFIFO,115)
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V11;
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_l;
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_in_bitsignaltemp <= redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_in(0);
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_in_bitsignaltemp <= redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_in(0);
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_out(0) <= redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_out_bitsignaltemp;
    redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_out(0) <= redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_out_bitsignaltemp;
    theredist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_l,
        valid_out => redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_stall_out_bitsignaltemp,
        data_out => redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo(STALLFIFO,116)
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V12;
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_in <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall;
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_m;
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_in_bitsignaltemp <= redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_in(0);
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_in_bitsignaltemp <= redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_in(0);
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_out(0) <= redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_out_bitsignaltemp;
    redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_out(0) <= redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_out_bitsignaltemp;
    theredist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_m,
        valid_out => redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_stall_out_bitsignaltemp,
        data_out => redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo(STALLENABLE,243)
    -- Valid signal propagation
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_V0 <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_backStall <= in_stall_in or not (SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and0 <= redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_valid_out;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and1 <= redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_valid_out and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and0;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and2 <= redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_valid_out and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and1;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and3 <= redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_valid_out and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and2;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and4 <= redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_valid_out and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and3;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and5 <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_valid_out and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and4;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and6 <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_valid_out and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and5;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and7 <= i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_o_valid and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and6;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and8 <= SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_V0 and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and7;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and9 <= SE_i_for_end31_lc_cond_maxpool2d_V0 and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and8;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and10 <= SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_V0 and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and9;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and11 <= SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_V0 and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and10;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and12 <= SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_V0 and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and11;
    SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_wireValid <= SE_i_l_32_lc_innerphi_maxpool2d_V0 and SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_and12;

    -- bubble_join_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo(BITJOIN,178)
    bubble_join_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_q <= redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_data_out;

    -- bubble_select_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo(BITSELECT,179)
    bubble_select_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_q(31 downto 0));

    -- bubble_join_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo(BITJOIN,172)
    bubble_join_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_q <= redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_data_out;

    -- bubble_select_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo(BITSELECT,173)
    bubble_select_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_q(31 downto 0));

    -- c_i32_0gr(CONSTANT,30)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_l_32_lc_innerphi_maxpool2d(MUX,53)@153 + 1
    i_l_32_lc_innerphi_maxpool2d_s <= SR_SE_i_l_32_lc_innerphi_maxpool2d_D0;
    i_l_32_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_l_32_lc_innerphi_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_l_32_lc_innerphi_maxpool2d_backEN = "1") THEN
                CASE (i_l_32_lc_innerphi_maxpool2d_s) IS
                    WHEN "0" => i_l_32_lc_innerphi_maxpool2d_q <= SR_SE_i_l_32_lc_innerphi_maxpool2d_D1;
                    WHEN "1" => i_l_32_lc_innerphi_maxpool2d_q <= c_i32_0gr_q;
                    WHEN OTHERS => i_l_32_lc_innerphi_maxpool2d_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0(REG,117)
    redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo(BITJOIN,169)
    bubble_join_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_q <= redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_data_out;

    -- bubble_select_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo(BITSELECT,170)
    bubble_select_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_q(31 downto 0));

    -- bubble_join_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo(BITJOIN,166)
    bubble_join_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_q <= redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_data_out;

    -- bubble_select_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo(BITSELECT,167)
    bubble_select_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_q(31 downto 0));

    -- dupName_0_c_i3_1gr_x(CONSTANT,6)
    dupName_0_c_i3_1gr_x_q <= "001";

    -- i_fpgaindvars_iv_lc_innerphi_maxpool2d(MUX,43)@153 + 1
    i_fpgaindvars_iv_lc_innerphi_maxpool2d_s <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_D0;
    i_fpgaindvars_iv_lc_innerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_fpgaindvars_iv_lc_innerphi_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_backEN = "1") THEN
                CASE (i_fpgaindvars_iv_lc_innerphi_maxpool2d_s) IS
                    WHEN "0" => i_fpgaindvars_iv_lc_innerphi_maxpool2d_q <= SR_SE_i_fpgaindvars_iv_lc_innerphi_maxpool2d_D1;
                    WHEN "1" => i_fpgaindvars_iv_lc_innerphi_maxpool2d_q <= dupName_0_c_i3_1gr_x_q;
                    WHEN OTHERS => i_fpgaindvars_iv_lc_innerphi_maxpool2d_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0(REG,119)
    redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_for_end31_lc_cond_maxpool2d(LOGICAL,41)@153 + 1
    i_for_end31_lc_cond_maxpool2d_qi <= SR_SE_i_for_end31_lc_cond_maxpool2d_D0 and SR_SE_i_for_end31_lc_cond_maxpool2d_D1;
    i_for_end31_lc_cond_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_for_end31_lc_cond_maxpool2d_qi, xout => i_for_end31_lc_cond_maxpool2d_q, ena => SE_i_for_end31_lc_cond_maxpool2d_backEN(0), clk => clock, aclr => resetn );

    -- redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0(REG,104)
    redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_backEN = "1") THEN
                redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo(BITJOIN,163)
    bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_q <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_data_out;

    -- bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo(BITSELECT,164)
    bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_q(63 downto 0));

    -- bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x(BITJOIN,124)
    bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_q <= i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_out_c1_exit25_1;

    -- bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x(BITSELECT,125)
    bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_q(31 downto 0));

    -- bubble_join_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo(BITJOIN,175)
    bubble_join_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_q <= redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_data_out;

    -- bubble_select_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo(BITSELECT,176)
    bubble_select_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_q(31 downto 0));

    -- bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo(BITJOIN,160)
    bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_q <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_data_out;

    -- bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo(BITSELECT,161)
    bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,11)@154
    out_c0_exe11 <= bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_153_fifo_b;
    out_c0_exe11413 <= bubble_select_redist14_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_10_153_fifo_b;
    out_c1_exe126 <= bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d_aunroll_x_b;
    out_c1_exe15 <= bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_153_fifo_b;
    out_cmp7_phi_decision16_xor_RM <= redist3_i_cmp7_phi_decision16_xor_rm_maxpool2d_c_153_0_q;
    out_for_end31_LC_COND <= i_for_end31_lc_cond_maxpool2d_q;
    out_fpgaindvars_iv7_LC_OuterPHI <= redist18_bgTrunc_i_fpgaindvars_iv7_lc_outerphi_maxpool2d_sel_x_b_1_0_q;
    out_fpgaindvars_iv_LC_InnerPHI <= i_fpgaindvars_iv_lc_innerphi_maxpool2d_q;
    out_i_088 <= bubble_select_redist11_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_153_fifo_b;
    out_j_1610 <= bubble_select_redist12_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_153_fifo_b;
    out_k_24_LC_OuterPHI <= redist16_bgTrunc_i_k_24_lc_outerphi_maxpool2d_sel_x_b_1_0_q;
    out_l_32_LC_InnerPHI <= i_l_32_lc_innerphi_maxpool2d_q;
    out_mul2211 <= bubble_select_redist13_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_153_fifo_b;
    out_mul2414 <= bubble_select_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_b;
    out_valid_out <= SE_out_redist15_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_11_153_fifo_V0;

    -- ext_sig_sync_out(GPOUT,37)
    out_unnamed_maxpool2d0_avm_address <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_address;
    out_unnamed_maxpool2d0_avm_enable <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_enable;
    out_unnamed_maxpool2d0_avm_read <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_read;
    out_unnamed_maxpool2d0_avm_write <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_write;
    out_unnamed_maxpool2d0_avm_writedata <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_writedata;
    out_unnamed_maxpool2d0_avm_byteenable <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_byteenable;
    out_unnamed_maxpool2d0_avm_burstcount <= i_load_unnamed_maxpool2d0_maxpool2d_out_unnamed_maxpool2d0_avm_burstcount;

    -- sync_out(GPOUT,71)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
