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

-- VHDL created from conv2d3x3_function_wrapper
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

entity conv2d3x3_function_wrapper is
    port (
        avm_memcoalesce_filter_weight_load_0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_filter_weight_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0110_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_input_im_load_0110_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0110_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0110_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0115_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_input_im_load_0115_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0115_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0115_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_input_im_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x30_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d3x30_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x30_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x30_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x36_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d3x36_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x36_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x36_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(447 downto 0);  -- ufix448
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_filter_weight_load_0_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memcoalesce_filter_weight_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_filter_weight_load_0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_filter_weight_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_input_im_load_0110_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memcoalesce_input_im_load_0110_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_input_im_load_0110_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_input_im_load_0110_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0110_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0110_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0110_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_input_im_load_0115_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memcoalesce_input_im_load_0115_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_input_im_load_0115_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_input_im_load_0115_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0115_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0115_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0115_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_input_im_load_0_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memcoalesce_input_im_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_input_im_load_0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_input_im_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_input_im_load_0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d3x30_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_conv2d3x30_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d3x30_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d3x30_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x30_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x30_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x30_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d3x36_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_conv2d3x36_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d3x36_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d3x36_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x36_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x36_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d3x36_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_function_wrapper;

architecture normal of conv2d3x3_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_function is
        port (
            in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_id_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_start_channel : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0110_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0115_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x36_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0110_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0115_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_active_unnamed_conv2d3x36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x36_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_filter_bias_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_filter_weight_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_channels_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_input_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_size_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_output_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_output_size_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_pad_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_start_channel_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_stride_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d3x3_function_out_o_active_unnamed_conv2d3x36 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x30_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_function_out_unnamed_conv2d3x36_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d3x3_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_stride_select(BITSELECT,21)
    arg_stride_select_b <= kernel_arguments(127 downto 96);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_stride_select_b(31 downto 0);

    -- arg_start_channel_select(BITSELECT,20)
    arg_start_channel_select_b <= kernel_arguments(159 downto 128);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_start_channel_select_b(31 downto 0);

    -- arg_pad_select(BITSELECT,19)
    arg_pad_select_b <= kernel_arguments(95 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_pad_select_b(31 downto 0);

    -- arg_output_size_select(BITSELECT,18)
    arg_output_size_select_b <= kernel_arguments(191 downto 160);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_output_size_select_b(31 downto 0);

    -- arg_output_im_select(BITSELECT,17)
    arg_output_im_select_b <= kernel_arguments(447 downto 384);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,10)
    dupName_8_ip_dsdk_adapt_cast_x_b <= arg_output_im_select_b(63 downto 0);

    -- arg_input_size_select(BITSELECT,16)
    arg_input_size_select_b <= kernel_arguments(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_input_size_select_b(31 downto 0);

    -- arg_input_im_select(BITSELECT,15)
    arg_input_im_select_b <= kernel_arguments(255 downto 192);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_5_ip_dsdk_adapt_cast_x_b <= arg_input_im_select_b(63 downto 0);

    -- arg_input_channels_select(BITSELECT,14)
    arg_input_channels_select_b <= kernel_arguments(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,79)
    ip_dsdk_adapt_cast_b <= arg_input_channels_select_b(31 downto 0);

    -- arg_filter_weight_select(BITSELECT,13)
    arg_filter_weight_select_b <= kernel_arguments(319 downto 256);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,8)
    dupName_6_ip_dsdk_adapt_cast_x_b <= arg_filter_weight_select_b(63 downto 0);

    -- arg_filter_bias_select(BITSELECT,12)
    arg_filter_bias_select_b <= kernel_arguments(383 downto 320);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_7_ip_dsdk_adapt_cast_x_b <= arg_filter_bias_select_b(63 downto 0);

    -- conv2d3x3_function(BLACKBOX,23)
    theconv2d3x3_function : conv2d3x3_function
    PORT MAP (
        in_arg_filter_bias => dupName_7_ip_dsdk_adapt_cast_x_b,
        in_arg_filter_weight => dupName_6_ip_dsdk_adapt_cast_x_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_id_1 => global_id_1,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_input_channels => ip_dsdk_adapt_cast_b,
        in_arg_input_im => dupName_5_ip_dsdk_adapt_cast_x_b,
        in_arg_input_size => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_output_im => dupName_8_ip_dsdk_adapt_cast_x_b,
        in_arg_output_size => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_pad => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_start_channel => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_stride => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_memcoalesce_filter_weight_load_0_avm_readdata => avm_memcoalesce_filter_weight_load_0_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => avm_memcoalesce_filter_weight_load_0_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => avm_memcoalesce_filter_weight_load_0_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => avm_memcoalesce_filter_weight_load_0_writeack,
        in_memcoalesce_input_im_load_0110_avm_readdata => avm_memcoalesce_input_im_load_0110_readdata,
        in_memcoalesce_input_im_load_0110_avm_readdatavalid => avm_memcoalesce_input_im_load_0110_readdatavalid,
        in_memcoalesce_input_im_load_0110_avm_waitrequest => avm_memcoalesce_input_im_load_0110_waitrequest,
        in_memcoalesce_input_im_load_0110_avm_writeack => avm_memcoalesce_input_im_load_0110_writeack,
        in_memcoalesce_input_im_load_0115_avm_readdata => avm_memcoalesce_input_im_load_0115_readdata,
        in_memcoalesce_input_im_load_0115_avm_readdatavalid => avm_memcoalesce_input_im_load_0115_readdatavalid,
        in_memcoalesce_input_im_load_0115_avm_waitrequest => avm_memcoalesce_input_im_load_0115_waitrequest,
        in_memcoalesce_input_im_load_0115_avm_writeack => avm_memcoalesce_input_im_load_0115_writeack,
        in_memcoalesce_input_im_load_0_avm_readdata => avm_memcoalesce_input_im_load_0_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => avm_memcoalesce_input_im_load_0_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => avm_memcoalesce_input_im_load_0_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => avm_memcoalesce_input_im_load_0_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_conv2d3x30_avm_readdata => avm_unnamed_conv2d3x30_readdata,
        in_unnamed_conv2d3x30_avm_readdatavalid => avm_unnamed_conv2d3x30_readdatavalid,
        in_unnamed_conv2d3x30_avm_waitrequest => avm_unnamed_conv2d3x30_waitrequest,
        in_unnamed_conv2d3x30_avm_writeack => avm_unnamed_conv2d3x30_writeack,
        in_unnamed_conv2d3x36_avm_readdata => avm_unnamed_conv2d3x36_readdata,
        in_unnamed_conv2d3x36_avm_readdatavalid => avm_unnamed_conv2d3x36_readdatavalid,
        in_unnamed_conv2d3x36_avm_waitrequest => avm_unnamed_conv2d3x36_waitrequest,
        in_unnamed_conv2d3x36_avm_writeack => avm_unnamed_conv2d3x36_writeack,
        in_valid_in => kernel_valid_in,
        out_memcoalesce_filter_weight_load_0_avm_address => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_memcoalesce_input_im_load_0110_avm_address => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_address,
        out_memcoalesce_input_im_load_0110_avm_burstcount => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_burstcount,
        out_memcoalesce_input_im_load_0110_avm_byteenable => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_byteenable,
        out_memcoalesce_input_im_load_0110_avm_enable => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_enable,
        out_memcoalesce_input_im_load_0110_avm_read => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_read,
        out_memcoalesce_input_im_load_0110_avm_write => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_write,
        out_memcoalesce_input_im_load_0110_avm_writedata => conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_writedata,
        out_memcoalesce_input_im_load_0115_avm_address => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_address,
        out_memcoalesce_input_im_load_0115_avm_burstcount => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_burstcount,
        out_memcoalesce_input_im_load_0115_avm_byteenable => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_byteenable,
        out_memcoalesce_input_im_load_0115_avm_enable => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_enable,
        out_memcoalesce_input_im_load_0115_avm_read => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_read,
        out_memcoalesce_input_im_load_0115_avm_write => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_write,
        out_memcoalesce_input_im_load_0115_avm_writedata => conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_writedata,
        out_memcoalesce_input_im_load_0_avm_address => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_writedata,
        out_o_active_unnamed_conv2d3x36 => conv2d3x3_function_out_o_active_unnamed_conv2d3x36,
        out_stall_out => conv2d3x3_function_out_stall_out,
        out_unnamed_conv2d3x30_avm_address => conv2d3x3_function_out_unnamed_conv2d3x30_avm_address,
        out_unnamed_conv2d3x30_avm_burstcount => conv2d3x3_function_out_unnamed_conv2d3x30_avm_burstcount,
        out_unnamed_conv2d3x30_avm_byteenable => conv2d3x3_function_out_unnamed_conv2d3x30_avm_byteenable,
        out_unnamed_conv2d3x30_avm_enable => conv2d3x3_function_out_unnamed_conv2d3x30_avm_enable,
        out_unnamed_conv2d3x30_avm_read => conv2d3x3_function_out_unnamed_conv2d3x30_avm_read,
        out_unnamed_conv2d3x30_avm_write => conv2d3x3_function_out_unnamed_conv2d3x30_avm_write,
        out_unnamed_conv2d3x30_avm_writedata => conv2d3x3_function_out_unnamed_conv2d3x30_avm_writedata,
        out_unnamed_conv2d3x36_avm_address => conv2d3x3_function_out_unnamed_conv2d3x36_avm_address,
        out_unnamed_conv2d3x36_avm_burstcount => conv2d3x3_function_out_unnamed_conv2d3x36_avm_burstcount,
        out_unnamed_conv2d3x36_avm_byteenable => conv2d3x3_function_out_unnamed_conv2d3x36_avm_byteenable,
        out_unnamed_conv2d3x36_avm_enable => conv2d3x3_function_out_unnamed_conv2d3x36_avm_enable,
        out_unnamed_conv2d3x36_avm_read => conv2d3x3_function_out_unnamed_conv2d3x36_avm_read,
        out_unnamed_conv2d3x36_avm_write => conv2d3x3_function_out_unnamed_conv2d3x36_avm_write,
        out_unnamed_conv2d3x36_avm_writedata => conv2d3x3_function_out_unnamed_conv2d3x36_avm_writedata,
        out_valid_out => conv2d3x3_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_memcoalesce_filter_weight_load_0_address(GPOUT,80)
    avm_memcoalesce_filter_weight_load_0_address <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_address;

    -- avm_memcoalesce_filter_weight_load_0_burstcount(GPOUT,81)
    avm_memcoalesce_filter_weight_load_0_burstcount <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- avm_memcoalesce_filter_weight_load_0_byteenable(GPOUT,82)
    avm_memcoalesce_filter_weight_load_0_byteenable <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- avm_memcoalesce_filter_weight_load_0_enable(GPOUT,83)
    avm_memcoalesce_filter_weight_load_0_enable <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- avm_memcoalesce_filter_weight_load_0_read(GPOUT,84)
    avm_memcoalesce_filter_weight_load_0_read <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_read;

    -- avm_memcoalesce_filter_weight_load_0_write(GPOUT,85)
    avm_memcoalesce_filter_weight_load_0_write <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_write;

    -- avm_memcoalesce_filter_weight_load_0_writedata(GPOUT,86)
    avm_memcoalesce_filter_weight_load_0_writedata <= conv2d3x3_function_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- avm_memcoalesce_input_im_load_0110_address(GPOUT,87)
    avm_memcoalesce_input_im_load_0110_address <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_address;

    -- avm_memcoalesce_input_im_load_0110_burstcount(GPOUT,88)
    avm_memcoalesce_input_im_load_0110_burstcount <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_burstcount;

    -- avm_memcoalesce_input_im_load_0110_byteenable(GPOUT,89)
    avm_memcoalesce_input_im_load_0110_byteenable <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_byteenable;

    -- avm_memcoalesce_input_im_load_0110_enable(GPOUT,90)
    avm_memcoalesce_input_im_load_0110_enable <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_enable;

    -- avm_memcoalesce_input_im_load_0110_read(GPOUT,91)
    avm_memcoalesce_input_im_load_0110_read <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_read;

    -- avm_memcoalesce_input_im_load_0110_write(GPOUT,92)
    avm_memcoalesce_input_im_load_0110_write <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_write;

    -- avm_memcoalesce_input_im_load_0110_writedata(GPOUT,93)
    avm_memcoalesce_input_im_load_0110_writedata <= conv2d3x3_function_out_memcoalesce_input_im_load_0110_avm_writedata;

    -- avm_memcoalesce_input_im_load_0115_address(GPOUT,94)
    avm_memcoalesce_input_im_load_0115_address <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_address;

    -- avm_memcoalesce_input_im_load_0115_burstcount(GPOUT,95)
    avm_memcoalesce_input_im_load_0115_burstcount <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_burstcount;

    -- avm_memcoalesce_input_im_load_0115_byteenable(GPOUT,96)
    avm_memcoalesce_input_im_load_0115_byteenable <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_byteenable;

    -- avm_memcoalesce_input_im_load_0115_enable(GPOUT,97)
    avm_memcoalesce_input_im_load_0115_enable <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_enable;

    -- avm_memcoalesce_input_im_load_0115_read(GPOUT,98)
    avm_memcoalesce_input_im_load_0115_read <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_read;

    -- avm_memcoalesce_input_im_load_0115_write(GPOUT,99)
    avm_memcoalesce_input_im_load_0115_write <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_write;

    -- avm_memcoalesce_input_im_load_0115_writedata(GPOUT,100)
    avm_memcoalesce_input_im_load_0115_writedata <= conv2d3x3_function_out_memcoalesce_input_im_load_0115_avm_writedata;

    -- avm_memcoalesce_input_im_load_0_address(GPOUT,101)
    avm_memcoalesce_input_im_load_0_address <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_address;

    -- avm_memcoalesce_input_im_load_0_burstcount(GPOUT,102)
    avm_memcoalesce_input_im_load_0_burstcount <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- avm_memcoalesce_input_im_load_0_byteenable(GPOUT,103)
    avm_memcoalesce_input_im_load_0_byteenable <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- avm_memcoalesce_input_im_load_0_enable(GPOUT,104)
    avm_memcoalesce_input_im_load_0_enable <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_enable;

    -- avm_memcoalesce_input_im_load_0_read(GPOUT,105)
    avm_memcoalesce_input_im_load_0_read <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_read;

    -- avm_memcoalesce_input_im_load_0_write(GPOUT,106)
    avm_memcoalesce_input_im_load_0_write <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_write;

    -- avm_memcoalesce_input_im_load_0_writedata(GPOUT,107)
    avm_memcoalesce_input_im_load_0_writedata <= conv2d3x3_function_out_memcoalesce_input_im_load_0_avm_writedata;

    -- avm_unnamed_conv2d3x30_address(GPOUT,108)
    avm_unnamed_conv2d3x30_address <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_address;

    -- avm_unnamed_conv2d3x30_burstcount(GPOUT,109)
    avm_unnamed_conv2d3x30_burstcount <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_burstcount;

    -- avm_unnamed_conv2d3x30_byteenable(GPOUT,110)
    avm_unnamed_conv2d3x30_byteenable <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_byteenable;

    -- avm_unnamed_conv2d3x30_enable(GPOUT,111)
    avm_unnamed_conv2d3x30_enable <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_enable;

    -- avm_unnamed_conv2d3x30_read(GPOUT,112)
    avm_unnamed_conv2d3x30_read <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_read;

    -- avm_unnamed_conv2d3x30_write(GPOUT,113)
    avm_unnamed_conv2d3x30_write <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_write;

    -- avm_unnamed_conv2d3x30_writedata(GPOUT,114)
    avm_unnamed_conv2d3x30_writedata <= conv2d3x3_function_out_unnamed_conv2d3x30_avm_writedata;

    -- avm_unnamed_conv2d3x36_address(GPOUT,115)
    avm_unnamed_conv2d3x36_address <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_address;

    -- avm_unnamed_conv2d3x36_burstcount(GPOUT,116)
    avm_unnamed_conv2d3x36_burstcount <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_burstcount;

    -- avm_unnamed_conv2d3x36_byteenable(GPOUT,117)
    avm_unnamed_conv2d3x36_byteenable <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_byteenable;

    -- avm_unnamed_conv2d3x36_enable(GPOUT,118)
    avm_unnamed_conv2d3x36_enable <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_enable;

    -- avm_unnamed_conv2d3x36_read(GPOUT,119)
    avm_unnamed_conv2d3x36_read <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_read;

    -- avm_unnamed_conv2d3x36_write(GPOUT,120)
    avm_unnamed_conv2d3x36_write <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_write;

    -- avm_unnamed_conv2d3x36_writedata(GPOUT,121)
    avm_unnamed_conv2d3x36_writedata <= conv2d3x3_function_out_unnamed_conv2d3x36_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,11)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,122)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,123)
    has_a_lsu_active <= conv2d3x3_function_out_o_active_unnamed_conv2d3x36;

    -- has_a_write_pending(GPOUT,124)
    has_a_write_pending <= conv2d3x3_function_out_o_active_unnamed_conv2d3x36;

    -- kernel_stall_out(GPOUT,125)
    kernel_stall_out <= conv2d3x3_function_out_stall_out;

    -- kernel_valid_out(GPOUT,126)
    kernel_valid_out <= conv2d3x3_function_out_valid_out;

END normal;
