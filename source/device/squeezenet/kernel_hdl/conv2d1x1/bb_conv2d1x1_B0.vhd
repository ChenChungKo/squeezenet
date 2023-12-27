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

-- VHDL created from bb_conv2d1x1_B0
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

entity bb_conv2d1x1_B0 is
    port (
        in_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_conv2d1x10_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d1x10_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B0;

architecture normal of bb_conv2d1x1_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d1x1_B0_stall_region is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d1x10_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d1x10_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x10_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B0_branch is
        port (
            in_c0_exe1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B0_merge is
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


    signal bb_conv2d1x1_B0_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_c1_exe2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_c2_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B0_branch_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B0_branch_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_branch_out_c1_exe2 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B0_branch_out_c2_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B0_branch_out_unnamed_conv2d1x10 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_merge_out_global_id_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d1x1_B0_merge(BLACKBOX,4)
    theconv2d1x1_B0_merge : conv2d1x1_B0_merge
    PORT MAP (
        in_global_id_0_0 => in_global_id_0_0,
        in_global_id_1_0 => in_global_id_1_0,
        in_stall_in => bb_conv2d1x1_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_global_id_0 => conv2d1x1_B0_merge_out_global_id_0,
        out_global_id_1 => conv2d1x1_B0_merge_out_global_id_1,
        out_stall_out_0 => conv2d1x1_B0_merge_out_stall_out_0,
        out_valid_out => conv2d1x1_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B0_stall_region(BLACKBOX,2)
    thebb_conv2d1x1_B0_stall_region : bb_conv2d1x1_B0_stall_region
    PORT MAP (
        in_filter_bias => in_filter_bias,
        in_flush => in_flush,
        in_global_id_0 => conv2d1x1_B0_merge_out_global_id_0,
        in_global_id_1 => conv2d1x1_B0_merge_out_global_id_1,
        in_input_channels => in_input_channels,
        in_input_size => in_input_size,
        in_lsu_unnamed_conv2d1x10_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_conv2d1x10_sts_stream_size => in_lsu_unnamed_conv2d1x10_sts_stream_size,
        in_stall_in => conv2d1x1_B0_branch_out_stall_out,
        in_unnamed_conv2d1x10_avm_readdata => in_unnamed_conv2d1x10_avm_readdata,
        in_unnamed_conv2d1x10_avm_readdatavalid => in_unnamed_conv2d1x10_avm_readdatavalid,
        in_unnamed_conv2d1x10_avm_waitrequest => in_unnamed_conv2d1x10_avm_waitrequest,
        in_unnamed_conv2d1x10_avm_writeack => in_unnamed_conv2d1x10_avm_writeack,
        in_valid_in => conv2d1x1_B0_merge_out_valid_out,
        out_c0_exe1 => bb_conv2d1x1_B0_stall_region_out_c0_exe1,
        out_c1_exe1 => bb_conv2d1x1_B0_stall_region_out_c1_exe1,
        out_c1_exe2 => bb_conv2d1x1_B0_stall_region_out_c1_exe2,
        out_c2_exe1 => bb_conv2d1x1_B0_stall_region_out_c2_exe1,
        out_stall_out => bb_conv2d1x1_B0_stall_region_out_stall_out,
        out_unnamed_conv2d1x10 => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10,
        out_unnamed_conv2d1x10_avm_address => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_address,
        out_unnamed_conv2d1x10_avm_burstcount => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_burstcount,
        out_unnamed_conv2d1x10_avm_byteenable => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_byteenable,
        out_unnamed_conv2d1x10_avm_enable => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_enable,
        out_unnamed_conv2d1x10_avm_read => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_read,
        out_unnamed_conv2d1x10_avm_write => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_write,
        out_unnamed_conv2d1x10_avm_writedata => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_writedata,
        out_valid_out => bb_conv2d1x1_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d1x1_B0_branch(BLACKBOX,3)
    theconv2d1x1_B0_branch : conv2d1x1_B0_branch
    PORT MAP (
        in_c0_exe1 => bb_conv2d1x1_B0_stall_region_out_c0_exe1,
        in_c1_exe1 => bb_conv2d1x1_B0_stall_region_out_c1_exe1,
        in_c1_exe2 => bb_conv2d1x1_B0_stall_region_out_c1_exe2,
        in_c2_exe1 => bb_conv2d1x1_B0_stall_region_out_c2_exe1,
        in_stall_in_0 => in_stall_in_0,
        in_unnamed_conv2d1x10 => bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10,
        in_valid_in => bb_conv2d1x1_B0_stall_region_out_valid_out,
        out_c0_exe1 => conv2d1x1_B0_branch_out_c0_exe1,
        out_c1_exe1 => conv2d1x1_B0_branch_out_c1_exe1,
        out_c1_exe2 => conv2d1x1_B0_branch_out_c1_exe2,
        out_c2_exe1 => conv2d1x1_B0_branch_out_c2_exe1,
        out_stall_out => conv2d1x1_B0_branch_out_stall_out,
        out_unnamed_conv2d1x10 => conv2d1x1_B0_branch_out_unnamed_conv2d1x10,
        out_valid_out_0 => conv2d1x1_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe1(GPOUT,22)
    out_c0_exe1 <= conv2d1x1_B0_branch_out_c0_exe1;

    -- out_c1_exe1(GPOUT,23)
    out_c1_exe1 <= conv2d1x1_B0_branch_out_c1_exe1;

    -- out_c1_exe2(GPOUT,24)
    out_c1_exe2 <= conv2d1x1_B0_branch_out_c1_exe2;

    -- out_c2_exe1(GPOUT,25)
    out_c2_exe1 <= conv2d1x1_B0_branch_out_c2_exe1;

    -- out_stall_out_0(GPOUT,26)
    out_stall_out_0 <= conv2d1x1_B0_merge_out_stall_out_0;

    -- out_unnamed_conv2d1x10(GPOUT,27)
    out_unnamed_conv2d1x10 <= conv2d1x1_B0_branch_out_unnamed_conv2d1x10;

    -- out_unnamed_conv2d1x10_avm_address(GPOUT,28)
    out_unnamed_conv2d1x10_avm_address <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_address;

    -- out_unnamed_conv2d1x10_avm_burstcount(GPOUT,29)
    out_unnamed_conv2d1x10_avm_burstcount <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_burstcount;

    -- out_unnamed_conv2d1x10_avm_byteenable(GPOUT,30)
    out_unnamed_conv2d1x10_avm_byteenable <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_byteenable;

    -- out_unnamed_conv2d1x10_avm_enable(GPOUT,31)
    out_unnamed_conv2d1x10_avm_enable <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_enable;

    -- out_unnamed_conv2d1x10_avm_read(GPOUT,32)
    out_unnamed_conv2d1x10_avm_read <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_read;

    -- out_unnamed_conv2d1x10_avm_write(GPOUT,33)
    out_unnamed_conv2d1x10_avm_write <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_write;

    -- out_unnamed_conv2d1x10_avm_writedata(GPOUT,34)
    out_unnamed_conv2d1x10_avm_writedata <= bb_conv2d1x1_B0_stall_region_out_unnamed_conv2d1x10_avm_writedata;

    -- out_valid_out_0(GPOUT,35)
    out_valid_out_0 <= conv2d1x1_B0_branch_out_valid_out_0;

END normal;
