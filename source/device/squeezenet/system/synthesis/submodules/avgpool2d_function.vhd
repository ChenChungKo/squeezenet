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

-- VHDL created from avgpool2d_function
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

entity avgpool2d_function is
    port (
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_avgpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_avgpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_avgpool2d1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_avgpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_avgpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_avgpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_avgpool2d1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_avgpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_avgpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_avgpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end avgpool2d_function;

architecture normal of avgpool2d_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_avgpool2d_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_avgpool2d_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_avgpool2d_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_avgpool2d_B0 is
        port (
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idx_ext : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_avgpool2d_B1 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_global_id_04_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_04_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idx_ext1_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_idx_ext1_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_01_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_01_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_avgpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_fpgaindvars_iv_next : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_global_id_04 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idx_ext1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_avgpool2d_B2 is
        port (
            in_c0_exe12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_03_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_avgpool2d1_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_avgpool2d1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_avgpool2d0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B0_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B0_out_idx_ext : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_avgpool2d_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_avgpool2d_B1_out_global_id_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_out_idx_ext1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_avgpool2d_B1_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_avgpool2d_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_out_lsu_unnamed_avgpool2d1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_avgpool2d_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i9_167_q : STD_LOGIC_VECTOR (8 downto 0);
    signal loop_limiter_avgpool2d0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_avgpool2d0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_avgpool2d0(BLACKBOX,31)
    theloop_limiter_avgpool2d0 : loop_limiter_avgpool2d0
    PORT MAP (
        in_i_stall => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_avgpool2d_B0_out_valid_out_0,
        in_i_valid_exit => bb_avgpool2d_B1_out_valid_out_0,
        out_o_stall => loop_limiter_avgpool2d0_out_o_stall,
        out_o_valid => loop_limiter_avgpool2d0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_avgpool2d_B0(BLACKBOX,5)
    thebb_avgpool2d_B0 : bb_avgpool2d_B0
    PORT MAP (
        in_global_id_0_0 => in_arg_global_id_0,
        in_input_im => in_arg_input_im,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => loop_limiter_avgpool2d0_out_o_stall,
        in_valid_in_0 => in_valid_in,
        out_global_id_0 => bb_avgpool2d_B0_out_global_id_0,
        out_idx_ext => bb_avgpool2d_B0_out_idx_ext,
        out_stall_out_0 => bb_avgpool2d_B0_out_stall_out_0,
        out_valid_out_0 => bb_avgpool2d_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- c_float_0_000000e_00(FLOATCONSTANT,8)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- c_i32_0gr(CONSTANT,9)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- c_i9_167(CONSTANT,10)
    c_i9_167_q <= "010100111";

    -- bb_avgpool2d_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_avgpool2d_B1_sr_1_aunroll_x : bb_avgpool2d_B1_sr_1
    PORT MAP (
        in_i_data_0 => c_i9_167_q,
        in_i_data_1 => c_i32_0gr_q,
        in_i_data_2 => c_float_0_000000e_00_q,
        in_i_data_3 => bb_avgpool2d_B0_out_idx_ext,
        in_i_data_4 => bb_avgpool2d_B0_out_global_id_0,
        in_i_stall => bb_avgpool2d_B1_out_stall_out_1,
        in_i_valid => loop_limiter_avgpool2d0_out_o_valid,
        out_o_data_0 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_stall => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_avgpool2d_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_avgpool2d_B1_sr_0_aunroll_x : bb_avgpool2d_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_avgpool2d_B1_out_fpgaindvars_iv_next,
        in_i_data_1 => bb_avgpool2d_B1_out_inc,
        in_i_data_2 => bb_avgpool2d_B1_out_c0_exe1,
        in_i_data_3 => bb_avgpool2d_B1_out_idx_ext1,
        in_i_data_4 => bb_avgpool2d_B1_out_global_id_04,
        in_i_stall => bb_avgpool2d_B1_out_stall_out_0,
        in_i_valid => bb_avgpool2d_B1_out_valid_out_1,
        out_o_data_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_stall => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_avgpool2d_B1(BLACKBOX,6)
    thebb_avgpool2d_B1 : bb_avgpool2d_B1
    PORT MAP (
        in_flush => in_start,
        in_fpgaindvars_iv_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_0,
        in_fpgaindvars_iv_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_0,
        in_global_id_04_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_4,
        in_global_id_04_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_4,
        in_i_02_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_1,
        in_i_02_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_1,
        in_idx_ext1_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_3,
        in_idx_ext1_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_3,
        in_input_im => in_arg_input_im,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_stall,
        in_tmp_01_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_data_2,
        in_tmp_01_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_data_2,
        in_unnamed_avgpool2d0_avm_readdata => in_unnamed_avgpool2d0_avm_readdata,
        in_unnamed_avgpool2d0_avm_readdatavalid => in_unnamed_avgpool2d0_avm_readdatavalid,
        in_unnamed_avgpool2d0_avm_waitrequest => in_unnamed_avgpool2d0_avm_waitrequest,
        in_unnamed_avgpool2d0_avm_writeack => in_unnamed_avgpool2d0_avm_writeack,
        in_valid_in_0 => bb_avgpool2d_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_avgpool2d_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe1 => bb_avgpool2d_B1_out_c0_exe1,
        out_fpgaindvars_iv_next => bb_avgpool2d_B1_out_fpgaindvars_iv_next,
        out_global_id_04 => bb_avgpool2d_B1_out_global_id_04,
        out_idx_ext1 => bb_avgpool2d_B1_out_idx_ext1,
        out_inc => bb_avgpool2d_B1_out_inc,
        out_stall_out_0 => bb_avgpool2d_B1_out_stall_out_0,
        out_stall_out_1 => bb_avgpool2d_B1_out_stall_out_1,
        out_unnamed_avgpool2d0_avm_address => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_address,
        out_unnamed_avgpool2d0_avm_burstcount => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_burstcount,
        out_unnamed_avgpool2d0_avm_byteenable => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_byteenable,
        out_unnamed_avgpool2d0_avm_enable => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_enable,
        out_unnamed_avgpool2d0_avm_read => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_read,
        out_unnamed_avgpool2d0_avm_write => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_write,
        out_unnamed_avgpool2d0_avm_writedata => bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_writedata,
        out_valid_out_0 => bb_avgpool2d_B1_out_valid_out_0,
        out_valid_out_1 => bb_avgpool2d_B1_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_avgpool2d_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_avgpool2d_B2_sr_0_aunroll_x : bb_avgpool2d_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_avgpool2d_B1_out_c0_exe1,
        in_i_data_1 => bb_avgpool2d_B1_out_global_id_04,
        in_i_stall => bb_avgpool2d_B2_out_stall_out_0,
        in_i_valid => bb_avgpool2d_B1_out_valid_out_0,
        out_o_data_0 => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_stall => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_avgpool2d_B2(BLACKBOX,7)
    thebb_avgpool2d_B2 : bb_avgpool2d_B2
    PORT MAP (
        in_c0_exe12_0 => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_data_0,
        in_flush => in_start,
        in_global_id_03_0 => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_data_1,
        in_lsu_unnamed_avgpool2d1_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => in_stall_in,
        in_stream_reset => bb_avgpool2d_B1_out_valid_out_0,
        in_unnamed_avgpool2d1_avm_readdata => in_unnamed_avgpool2d1_avm_readdata,
        in_unnamed_avgpool2d1_avm_readdatavalid => in_unnamed_avgpool2d1_avm_readdatavalid,
        in_unnamed_avgpool2d1_avm_waitrequest => in_unnamed_avgpool2d1_avm_waitrequest,
        in_unnamed_avgpool2d1_avm_writeack => in_unnamed_avgpool2d1_avm_writeack,
        in_valid_in_0 => bb_avgpool2d_B2_sr_0_aunroll_x_out_o_valid,
        out_lsu_unnamed_avgpool2d1_o_active => bb_avgpool2d_B2_out_lsu_unnamed_avgpool2d1_o_active,
        out_stall_out_0 => bb_avgpool2d_B2_out_stall_out_0,
        out_unnamed_avgpool2d1_avm_address => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_address,
        out_unnamed_avgpool2d1_avm_burstcount => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_burstcount,
        out_unnamed_avgpool2d1_avm_byteenable => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_byteenable,
        out_unnamed_avgpool2d1_avm_enable => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_enable,
        out_unnamed_avgpool2d1_avm_read => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_read,
        out_unnamed_avgpool2d1_avm_write => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_write,
        out_unnamed_avgpool2d1_avm_writedata => bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_writedata,
        out_valid_out_0 => bb_avgpool2d_B2_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_o_active_unnamed_avgpool2d1(GPOUT,32)
    out_o_active_unnamed_avgpool2d1 <= bb_avgpool2d_B2_out_lsu_unnamed_avgpool2d1_o_active;

    -- out_stall_out(GPOUT,33)
    out_stall_out <= bb_avgpool2d_B0_out_stall_out_0;

    -- out_unnamed_avgpool2d0_avm_address(GPOUT,34)
    out_unnamed_avgpool2d0_avm_address <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_address;

    -- out_unnamed_avgpool2d0_avm_burstcount(GPOUT,35)
    out_unnamed_avgpool2d0_avm_burstcount <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_burstcount;

    -- out_unnamed_avgpool2d0_avm_byteenable(GPOUT,36)
    out_unnamed_avgpool2d0_avm_byteenable <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_byteenable;

    -- out_unnamed_avgpool2d0_avm_enable(GPOUT,37)
    out_unnamed_avgpool2d0_avm_enable <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_enable;

    -- out_unnamed_avgpool2d0_avm_read(GPOUT,38)
    out_unnamed_avgpool2d0_avm_read <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_read;

    -- out_unnamed_avgpool2d0_avm_write(GPOUT,39)
    out_unnamed_avgpool2d0_avm_write <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_write;

    -- out_unnamed_avgpool2d0_avm_writedata(GPOUT,40)
    out_unnamed_avgpool2d0_avm_writedata <= bb_avgpool2d_B1_out_unnamed_avgpool2d0_avm_writedata;

    -- out_unnamed_avgpool2d1_avm_address(GPOUT,41)
    out_unnamed_avgpool2d1_avm_address <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_address;

    -- out_unnamed_avgpool2d1_avm_burstcount(GPOUT,42)
    out_unnamed_avgpool2d1_avm_burstcount <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_burstcount;

    -- out_unnamed_avgpool2d1_avm_byteenable(GPOUT,43)
    out_unnamed_avgpool2d1_avm_byteenable <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_byteenable;

    -- out_unnamed_avgpool2d1_avm_enable(GPOUT,44)
    out_unnamed_avgpool2d1_avm_enable <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_enable;

    -- out_unnamed_avgpool2d1_avm_read(GPOUT,45)
    out_unnamed_avgpool2d1_avm_read <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_read;

    -- out_unnamed_avgpool2d1_avm_write(GPOUT,46)
    out_unnamed_avgpool2d1_avm_write <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_write;

    -- out_unnamed_avgpool2d1_avm_writedata(GPOUT,47)
    out_unnamed_avgpool2d1_avm_writedata <= bb_avgpool2d_B2_out_unnamed_avgpool2d1_avm_writedata;

    -- out_valid_out(GPOUT,48)
    out_valid_out <= bb_avgpool2d_B2_out_valid_out_0;

END normal;
