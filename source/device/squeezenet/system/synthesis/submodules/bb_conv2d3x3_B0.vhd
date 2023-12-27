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

-- VHDL created from bb_conv2d3x3_B0
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

entity bb_conv2d3x3_B0 is
    port (
        in_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_conv2d3x30_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_start_channel : in std_logic_vector(31 downto 0);  -- ufix32
        in_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c3_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d3x30_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B0;

architecture normal of bb_conv2d3x3_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d3x3_B0_stall_region is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d3x30_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d3x30_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_channel : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x30_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B0_branch is
        port (
            in_c0_exe1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c3_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c3_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B0_merge is
        port (
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d3x3_B0_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c2_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c2_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c2_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c2_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c2_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c2_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_c3_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_branch_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B0_branch_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B0_branch_out_c2_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_branch_out_c2_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_branch_out_c2_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_branch_out_c2_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_branch_out_c2_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_branch_out_c2_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_branch_out_c3_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_branch_out_unnamed_conv2d3x30 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_merge_out_global_id_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d3x3_B0_merge(BLACKBOX,4)
    theconv2d3x3_B0_merge : conv2d3x3_B0_merge
    PORT MAP (
        in_global_id_0_0 => in_global_id_0_0,
        in_global_id_1_0 => in_global_id_1_0,
        in_stall_in => bb_conv2d3x3_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_global_id_0 => conv2d3x3_B0_merge_out_global_id_0,
        out_global_id_1 => conv2d3x3_B0_merge_out_global_id_1,
        out_stall_out_0 => conv2d3x3_B0_merge_out_stall_out_0,
        out_valid_out => conv2d3x3_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B0_stall_region(BLACKBOX,2)
    thebb_conv2d3x3_B0_stall_region : bb_conv2d3x3_B0_stall_region
    PORT MAP (
        in_filter_bias => in_filter_bias,
        in_flush => in_flush,
        in_global_id_0 => conv2d3x3_B0_merge_out_global_id_0,
        in_global_id_1 => conv2d3x3_B0_merge_out_global_id_1,
        in_input_channels => in_input_channels,
        in_input_size => in_input_size,
        in_lsu_unnamed_conv2d3x30_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_conv2d3x30_sts_stream_size => in_lsu_unnamed_conv2d3x30_sts_stream_size,
        in_output_size => in_output_size,
        in_pad => in_pad,
        in_stall_in => conv2d3x3_B0_branch_out_stall_out,
        in_start_channel => in_start_channel,
        in_stride => in_stride,
        in_unnamed_conv2d3x30_avm_readdata => in_unnamed_conv2d3x30_avm_readdata,
        in_unnamed_conv2d3x30_avm_readdatavalid => in_unnamed_conv2d3x30_avm_readdatavalid,
        in_unnamed_conv2d3x30_avm_waitrequest => in_unnamed_conv2d3x30_avm_waitrequest,
        in_unnamed_conv2d3x30_avm_writeack => in_unnamed_conv2d3x30_avm_writeack,
        in_valid_in => conv2d3x3_B0_merge_out_valid_out,
        out_c0_exe1 => bb_conv2d3x3_B0_stall_region_out_c0_exe1,
        out_c1_exe1 => bb_conv2d3x3_B0_stall_region_out_c1_exe1,
        out_c2_exe1 => bb_conv2d3x3_B0_stall_region_out_c2_exe1,
        out_c2_exe2 => bb_conv2d3x3_B0_stall_region_out_c2_exe2,
        out_c2_exe3 => bb_conv2d3x3_B0_stall_region_out_c2_exe3,
        out_c2_exe4 => bb_conv2d3x3_B0_stall_region_out_c2_exe4,
        out_c2_exe5 => bb_conv2d3x3_B0_stall_region_out_c2_exe5,
        out_c2_exe6 => bb_conv2d3x3_B0_stall_region_out_c2_exe6,
        out_c3_exe1 => bb_conv2d3x3_B0_stall_region_out_c3_exe1,
        out_stall_out => bb_conv2d3x3_B0_stall_region_out_stall_out,
        out_unnamed_conv2d3x30 => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30,
        out_unnamed_conv2d3x30_avm_address => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_address,
        out_unnamed_conv2d3x30_avm_burstcount => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_burstcount,
        out_unnamed_conv2d3x30_avm_byteenable => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_byteenable,
        out_unnamed_conv2d3x30_avm_enable => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_enable,
        out_unnamed_conv2d3x30_avm_read => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_read,
        out_unnamed_conv2d3x30_avm_write => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_write,
        out_unnamed_conv2d3x30_avm_writedata => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_writedata,
        out_valid_out => bb_conv2d3x3_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d3x3_B0_branch(BLACKBOX,3)
    theconv2d3x3_B0_branch : conv2d3x3_B0_branch
    PORT MAP (
        in_c0_exe1 => bb_conv2d3x3_B0_stall_region_out_c0_exe1,
        in_c1_exe1 => bb_conv2d3x3_B0_stall_region_out_c1_exe1,
        in_c2_exe1 => bb_conv2d3x3_B0_stall_region_out_c2_exe1,
        in_c2_exe2 => bb_conv2d3x3_B0_stall_region_out_c2_exe2,
        in_c2_exe3 => bb_conv2d3x3_B0_stall_region_out_c2_exe3,
        in_c2_exe4 => bb_conv2d3x3_B0_stall_region_out_c2_exe4,
        in_c2_exe5 => bb_conv2d3x3_B0_stall_region_out_c2_exe5,
        in_c2_exe6 => bb_conv2d3x3_B0_stall_region_out_c2_exe6,
        in_c3_exe1 => bb_conv2d3x3_B0_stall_region_out_c3_exe1,
        in_stall_in_0 => in_stall_in_0,
        in_unnamed_conv2d3x30 => bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30,
        in_valid_in => bb_conv2d3x3_B0_stall_region_out_valid_out,
        out_c0_exe1 => conv2d3x3_B0_branch_out_c0_exe1,
        out_c1_exe1 => conv2d3x3_B0_branch_out_c1_exe1,
        out_c2_exe1 => conv2d3x3_B0_branch_out_c2_exe1,
        out_c2_exe2 => conv2d3x3_B0_branch_out_c2_exe2,
        out_c2_exe3 => conv2d3x3_B0_branch_out_c2_exe3,
        out_c2_exe4 => conv2d3x3_B0_branch_out_c2_exe4,
        out_c2_exe5 => conv2d3x3_B0_branch_out_c2_exe5,
        out_c2_exe6 => conv2d3x3_B0_branch_out_c2_exe6,
        out_c3_exe1 => conv2d3x3_B0_branch_out_c3_exe1,
        out_stall_out => conv2d3x3_B0_branch_out_stall_out,
        out_unnamed_conv2d3x30 => conv2d3x3_B0_branch_out_unnamed_conv2d3x30,
        out_valid_out_0 => conv2d3x3_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe1(GPOUT,26)
    out_c0_exe1 <= conv2d3x3_B0_branch_out_c0_exe1;

    -- out_c1_exe1(GPOUT,27)
    out_c1_exe1 <= conv2d3x3_B0_branch_out_c1_exe1;

    -- out_c2_exe1(GPOUT,28)
    out_c2_exe1 <= conv2d3x3_B0_branch_out_c2_exe1;

    -- out_c2_exe2(GPOUT,29)
    out_c2_exe2 <= conv2d3x3_B0_branch_out_c2_exe2;

    -- out_c2_exe3(GPOUT,30)
    out_c2_exe3 <= conv2d3x3_B0_branch_out_c2_exe3;

    -- out_c2_exe4(GPOUT,31)
    out_c2_exe4 <= conv2d3x3_B0_branch_out_c2_exe4;

    -- out_c2_exe5(GPOUT,32)
    out_c2_exe5 <= conv2d3x3_B0_branch_out_c2_exe5;

    -- out_c2_exe6(GPOUT,33)
    out_c2_exe6 <= conv2d3x3_B0_branch_out_c2_exe6;

    -- out_c3_exe1(GPOUT,34)
    out_c3_exe1 <= conv2d3x3_B0_branch_out_c3_exe1;

    -- out_stall_out_0(GPOUT,35)
    out_stall_out_0 <= conv2d3x3_B0_merge_out_stall_out_0;

    -- out_unnamed_conv2d3x30(GPOUT,36)
    out_unnamed_conv2d3x30 <= conv2d3x3_B0_branch_out_unnamed_conv2d3x30;

    -- out_unnamed_conv2d3x30_avm_address(GPOUT,37)
    out_unnamed_conv2d3x30_avm_address <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_address;

    -- out_unnamed_conv2d3x30_avm_burstcount(GPOUT,38)
    out_unnamed_conv2d3x30_avm_burstcount <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_burstcount;

    -- out_unnamed_conv2d3x30_avm_byteenable(GPOUT,39)
    out_unnamed_conv2d3x30_avm_byteenable <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_byteenable;

    -- out_unnamed_conv2d3x30_avm_enable(GPOUT,40)
    out_unnamed_conv2d3x30_avm_enable <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_enable;

    -- out_unnamed_conv2d3x30_avm_read(GPOUT,41)
    out_unnamed_conv2d3x30_avm_read <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_read;

    -- out_unnamed_conv2d3x30_avm_write(GPOUT,42)
    out_unnamed_conv2d3x30_avm_write <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_write;

    -- out_unnamed_conv2d3x30_avm_writedata(GPOUT,43)
    out_unnamed_conv2d3x30_avm_writedata <= bb_conv2d3x3_B0_stall_region_out_unnamed_conv2d3x30_avm_writedata;

    -- out_valid_out_0(GPOUT,44)
    out_valid_out_0 <= conv2d3x3_B0_branch_out_valid_out_0;

END normal;
