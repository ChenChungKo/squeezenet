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

-- VHDL created from bb_conv2d1x1_B3
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

entity bb_conv2d1x1_B3 is
    port (
        in_add15_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe12118_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe16_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe27_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c2_exe111_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp9_phi_decision20_xor_RM17_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_01013_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x111_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x111_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x19_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe27 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c2_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc68 : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_conv2d1x111_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_conv2d1x111_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x111_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x111_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x111_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B3;

architecture normal of bb_conv2d1x1_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d1x1_B3_stall_region is
        port (
            in_add15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe12118 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe111 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp9_phi_decision20_xor_RM17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_01013 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x111_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x19 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc68 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d1x111_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x110 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x111_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B3_branch is
        port (
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe111 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc68 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x110 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x19 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc68 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B3_merge is
        port (
            in_add15_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe12118_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe16_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe27_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c2_exe111_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp9_phi_decision20_xor_RM17_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_j_01013_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x19_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe12118 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c2_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_cmp9_phi_decision20_xor_RM17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_j_01013 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x19 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_conv2d1x1_B3_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_c1_exe27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_c2_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_inc68 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_lsu_unnamed_conv2d1x111_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x110 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_branch_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B3_branch_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_branch_out_c1_exe27 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B3_branch_out_c2_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_branch_out_inc68 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_branch_out_unnamed_conv2d1x19 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_merge_out_add15 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_merge_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B3_merge_out_c1_exe12118 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_merge_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_merge_out_c1_exe27 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B3_merge_out_c2_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_merge_out_cmp9_phi_decision20_xor_RM17 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_merge_out_j_01013 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B3_merge_out_unnamed_conv2d1x19 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d1x1_B3_merge(BLACKBOX,4)
    theconv2d1x1_B3_merge : conv2d1x1_B3_merge
    PORT MAP (
        in_add15_0 => in_add15_0,
        in_c0_exe13_0 => in_c0_exe13_0,
        in_c1_exe12118_0 => in_c1_exe12118_0,
        in_c1_exe16_0 => in_c1_exe16_0,
        in_c1_exe27_0 => in_c1_exe27_0,
        in_c2_exe111_0 => in_c2_exe111_0,
        in_cmp9_phi_decision20_xor_RM17_0 => in_cmp9_phi_decision20_xor_RM17_0,
        in_j_01013_0 => in_j_01013_0,
        in_stall_in => bb_conv2d1x1_B3_stall_region_out_stall_out,
        in_unnamed_conv2d1x19_0 => in_unnamed_conv2d1x19_0,
        in_valid_in_0 => in_valid_in_0,
        out_add15 => conv2d1x1_B3_merge_out_add15,
        out_c0_exe13 => conv2d1x1_B3_merge_out_c0_exe13,
        out_c1_exe12118 => conv2d1x1_B3_merge_out_c1_exe12118,
        out_c1_exe16 => conv2d1x1_B3_merge_out_c1_exe16,
        out_c1_exe27 => conv2d1x1_B3_merge_out_c1_exe27,
        out_c2_exe111 => conv2d1x1_B3_merge_out_c2_exe111,
        out_cmp9_phi_decision20_xor_RM17 => conv2d1x1_B3_merge_out_cmp9_phi_decision20_xor_RM17,
        out_j_01013 => conv2d1x1_B3_merge_out_j_01013,
        out_stall_out_0 => conv2d1x1_B3_merge_out_stall_out_0,
        out_unnamed_conv2d1x19 => conv2d1x1_B3_merge_out_unnamed_conv2d1x19,
        out_valid_out => conv2d1x1_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B3_stall_region(BLACKBOX,2)
    thebb_conv2d1x1_B3_stall_region : bb_conv2d1x1_B3_stall_region
    PORT MAP (
        in_add15 => conv2d1x1_B3_merge_out_add15,
        in_c0_exe13 => conv2d1x1_B3_merge_out_c0_exe13,
        in_c1_exe12118 => conv2d1x1_B3_merge_out_c1_exe12118,
        in_c1_exe16 => conv2d1x1_B3_merge_out_c1_exe16,
        in_c1_exe27 => conv2d1x1_B3_merge_out_c1_exe27,
        in_c2_exe111 => conv2d1x1_B3_merge_out_c2_exe111,
        in_cmp9_phi_decision20_xor_RM17 => conv2d1x1_B3_merge_out_cmp9_phi_decision20_xor_RM17,
        in_flush => in_flush,
        in_input_channels => in_input_channels,
        in_input_size => in_input_size,
        in_j_01013 => conv2d1x1_B3_merge_out_j_01013,
        in_output_im => in_output_im,
        in_stall_in => conv2d1x1_B3_branch_out_stall_out,
        in_unnamed_conv2d1x111_avm_readdata => in_unnamed_conv2d1x111_avm_readdata,
        in_unnamed_conv2d1x111_avm_readdatavalid => in_unnamed_conv2d1x111_avm_readdatavalid,
        in_unnamed_conv2d1x111_avm_waitrequest => in_unnamed_conv2d1x111_avm_waitrequest,
        in_unnamed_conv2d1x111_avm_writeack => in_unnamed_conv2d1x111_avm_writeack,
        in_unnamed_conv2d1x19 => conv2d1x1_B3_merge_out_unnamed_conv2d1x19,
        in_valid_in => conv2d1x1_B3_merge_out_valid_out,
        out_c0_exe13 => bb_conv2d1x1_B3_stall_region_out_c0_exe13,
        out_c1_exe16 => bb_conv2d1x1_B3_stall_region_out_c1_exe16,
        out_c1_exe27 => bb_conv2d1x1_B3_stall_region_out_c1_exe27,
        out_c2_exe111 => bb_conv2d1x1_B3_stall_region_out_c2_exe111,
        out_inc68 => bb_conv2d1x1_B3_stall_region_out_inc68,
        out_lsu_unnamed_conv2d1x111_o_active => bb_conv2d1x1_B3_stall_region_out_lsu_unnamed_conv2d1x111_o_active,
        out_stall_out => bb_conv2d1x1_B3_stall_region_out_stall_out,
        out_unnamed_conv2d1x110 => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x110,
        out_unnamed_conv2d1x111_avm_address => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_address,
        out_unnamed_conv2d1x111_avm_burstcount => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_burstcount,
        out_unnamed_conv2d1x111_avm_byteenable => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_byteenable,
        out_unnamed_conv2d1x111_avm_enable => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_enable,
        out_unnamed_conv2d1x111_avm_read => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_read,
        out_unnamed_conv2d1x111_avm_write => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_write,
        out_unnamed_conv2d1x111_avm_writedata => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_writedata,
        out_unnamed_conv2d1x19 => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x19,
        out_valid_out => bb_conv2d1x1_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d1x1_B3_branch(BLACKBOX,3)
    theconv2d1x1_B3_branch : conv2d1x1_B3_branch
    PORT MAP (
        in_c0_exe13 => bb_conv2d1x1_B3_stall_region_out_c0_exe13,
        in_c1_exe16 => bb_conv2d1x1_B3_stall_region_out_c1_exe16,
        in_c1_exe27 => bb_conv2d1x1_B3_stall_region_out_c1_exe27,
        in_c2_exe111 => bb_conv2d1x1_B3_stall_region_out_c2_exe111,
        in_inc68 => bb_conv2d1x1_B3_stall_region_out_inc68,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d1x110 => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x110,
        in_unnamed_conv2d1x19 => bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x19,
        in_valid_in => bb_conv2d1x1_B3_stall_region_out_valid_out,
        out_c0_exe13 => conv2d1x1_B3_branch_out_c0_exe13,
        out_c1_exe16 => conv2d1x1_B3_branch_out_c1_exe16,
        out_c1_exe27 => conv2d1x1_B3_branch_out_c1_exe27,
        out_c2_exe111 => conv2d1x1_B3_branch_out_c2_exe111,
        out_inc68 => conv2d1x1_B3_branch_out_inc68,
        out_stall_out => conv2d1x1_B3_branch_out_stall_out,
        out_unnamed_conv2d1x19 => conv2d1x1_B3_branch_out_unnamed_conv2d1x19,
        out_valid_out_0 => conv2d1x1_B3_branch_out_valid_out_0,
        out_valid_out_1 => conv2d1x1_B3_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe13(GPOUT,27)
    out_c0_exe13 <= conv2d1x1_B3_branch_out_c0_exe13;

    -- out_c1_exe16(GPOUT,28)
    out_c1_exe16 <= conv2d1x1_B3_branch_out_c1_exe16;

    -- out_c1_exe27(GPOUT,29)
    out_c1_exe27 <= conv2d1x1_B3_branch_out_c1_exe27;

    -- out_c2_exe111(GPOUT,30)
    out_c2_exe111 <= conv2d1x1_B3_branch_out_c2_exe111;

    -- out_inc68(GPOUT,31)
    out_inc68 <= conv2d1x1_B3_branch_out_inc68;

    -- out_lsu_unnamed_conv2d1x111_o_active(GPOUT,32)
    out_lsu_unnamed_conv2d1x111_o_active <= bb_conv2d1x1_B3_stall_region_out_lsu_unnamed_conv2d1x111_o_active;

    -- out_stall_out_0(GPOUT,33)
    out_stall_out_0 <= conv2d1x1_B3_merge_out_stall_out_0;

    -- out_unnamed_conv2d1x111_avm_address(GPOUT,34)
    out_unnamed_conv2d1x111_avm_address <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_address;

    -- out_unnamed_conv2d1x111_avm_burstcount(GPOUT,35)
    out_unnamed_conv2d1x111_avm_burstcount <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_burstcount;

    -- out_unnamed_conv2d1x111_avm_byteenable(GPOUT,36)
    out_unnamed_conv2d1x111_avm_byteenable <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_byteenable;

    -- out_unnamed_conv2d1x111_avm_enable(GPOUT,37)
    out_unnamed_conv2d1x111_avm_enable <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_enable;

    -- out_unnamed_conv2d1x111_avm_read(GPOUT,38)
    out_unnamed_conv2d1x111_avm_read <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_read;

    -- out_unnamed_conv2d1x111_avm_write(GPOUT,39)
    out_unnamed_conv2d1x111_avm_write <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_write;

    -- out_unnamed_conv2d1x111_avm_writedata(GPOUT,40)
    out_unnamed_conv2d1x111_avm_writedata <= bb_conv2d1x1_B3_stall_region_out_unnamed_conv2d1x111_avm_writedata;

    -- out_unnamed_conv2d1x19(GPOUT,41)
    out_unnamed_conv2d1x19 <= conv2d1x1_B3_branch_out_unnamed_conv2d1x19;

    -- out_valid_out_0(GPOUT,42)
    out_valid_out_0 <= conv2d1x1_B3_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,43)
    out_valid_out_1 <= conv2d1x1_B3_branch_out_valid_out_1;

END normal;
