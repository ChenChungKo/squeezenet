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

-- VHDL created from i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159
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

entity i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159 is
    port (
        in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_0_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_1_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_2_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_3_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_4 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi119_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi119_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159;

architecture normal of i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_addBloA0Z3d06o00rf00d06of5q0u is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;





    component floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_multBlA0Zp06o303d06o00rf01pzc is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;





    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add34_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add45_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add56_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add57_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul23_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul33_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul44_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul55_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul33_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_mul23_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add56_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_add45_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add34_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_vunroll_x_in_i_valid_67_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_reset0 : std_logic;
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i : signal is true;
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_eq : signal is true;
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_q : signal is true;
    signal redist0_i_mul55_conv2d1x1_out_primWireOut_31_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_reset0 : std_logic;
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i : signal is true;
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_eq : std_logic;
    attribute preserve of redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_eq : signal is true;
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_q : signal is true;
    signal redist1_i_mul44_conv2d1x1_out_primWireOut_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_reset0 : std_logic;
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i : UNSIGNED (5 downto 0);
    attribute preserve of redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i : signal is true;
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_eq : std_logic;
    attribute preserve of redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_eq : signal is true;
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_wraddr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_last_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp_b : STD_LOGIC_VECTOR (6 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist8_sync_in_aunroll_vunroll_x_in_i_valid_67(DELAY,21)
    redist8_sync_in_aunroll_vunroll_x_in_i_valid_67 : dspba_delay
    GENERIC MAP ( width => 1, depth => 67, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist8_sync_in_aunroll_vunroll_x_in_i_valid_67_q, clk => clock, aclr => resetn );

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_notEnable(LOGICAL,30)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_nor(LOGICAL,31)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_nor_q <= not (redist0_i_mul55_conv2d1x1_out_primWireOut_31_notEnable_q or redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_q);

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_last(CONSTANT,27)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_last_q <= "011010";

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp(LOGICAL,28)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_q);
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp_q <= "1" WHEN redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_last_q = redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp_b ELSE "0";

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmpReg(REG,29)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena(REG,32)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_mul55_conv2d1x1_out_primWireOut_31_nor_q = "1") THEN
                redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_mul55_conv2d1x1_out_primWireOut_31_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_enaAnd(LOGICAL,33)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_enaAnd_q <= redist0_i_mul55_conv2d1x1_out_primWireOut_31_sticky_ena_q and VCC_q;

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt(COUNTER,25)
    -- low=0, high=27, step=1, init=0
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_eq <= '1';
            ELSE
                redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_eq = '1') THEN
                redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i <= redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i + 5;
            ELSE
                redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i <= redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_i, 5)));

    -- i_mul55_conv2d1x1(BLACKBOX,12)@134
    -- out out_primWireOut@141
    thei_mul55_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_multBlA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c1_eni6_5,
        in_1 => in_c1_eni6_3_1,
        out_primWireOut => i_mul55_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_inputreg(DELAY,22)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul55_conv2d1x1_out_primWireOut, xout => redist0_i_mul55_conv2d1x1_out_primWireOut_31_inputreg_q, clk => clock, aclr => resetn );

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_wraddr(REG,26)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_mul55_conv2d1x1_out_primWireOut_31_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem(DUALMEM,24)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_ia <= STD_LOGIC_VECTOR(redist0_i_mul55_conv2d1x1_out_primWireOut_31_inputreg_q);
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_aa <= redist0_i_mul55_conv2d1x1_out_primWireOut_31_wraddr_q;
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_ab <= redist0_i_mul55_conv2d1x1_out_primWireOut_31_rdcnt_q;
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_reset0 <= not (resetn);
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 28,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist0_i_mul55_conv2d1x1_out_primWireOut_31_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_aa,
        data_a => redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_ab,
        q_b => redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_iq
    );
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_q <= redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_iq(31 downto 0);

    -- redist0_i_mul55_conv2d1x1_out_primWireOut_31_outputreg(DELAY,23)
    redist0_i_mul55_conv2d1x1_out_primWireOut_31_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_mul55_conv2d1x1_out_primWireOut_31_mem_q, xout => redist0_i_mul55_conv2d1x1_out_primWireOut_31_outputreg_q, clk => clock, aclr => resetn );

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_notEnable(LOGICAL,42)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_nor(LOGICAL,43)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_nor_q <= not (redist1_i_mul44_conv2d1x1_out_primWireOut_16_notEnable_q or redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_q);

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_last(CONSTANT,39)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_last_q <= "01011";

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp(LOGICAL,40)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_q);
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp_q <= "1" WHEN redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_last_q = redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp_b ELSE "0";

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmpReg(REG,41)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmpReg_q <= STD_LOGIC_VECTOR(redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena(REG,44)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_mul44_conv2d1x1_out_primWireOut_16_nor_q = "1") THEN
                redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_i_mul44_conv2d1x1_out_primWireOut_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_enaAnd(LOGICAL,45)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_enaAnd_q <= redist1_i_mul44_conv2d1x1_out_primWireOut_16_sticky_ena_q and VCC_q;

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt(COUNTER,37)
    -- low=0, high=12, step=1, init=0
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_eq <= '1';
            ELSE
                redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_eq <= '0';
            END IF;
            IF (redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_eq = '1') THEN
                redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i <= redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i + 4;
            ELSE
                redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i <= redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_i, 4)));

    -- i_mul44_conv2d1x1(BLACKBOX,11)@134
    -- out out_primWireOut@141
    thei_mul44_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_multBlA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c1_eni6_4,
        in_1 => in_c1_eni6_2_1,
        out_primWireOut => i_mul44_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_inputreg(DELAY,34)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul44_conv2d1x1_out_primWireOut, xout => redist1_i_mul44_conv2d1x1_out_primWireOut_16_inputreg_q, clk => clock, aclr => resetn );

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_wraddr(REG,38)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_wraddr_q <= "1100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_mul44_conv2d1x1_out_primWireOut_16_wraddr_q <= STD_LOGIC_VECTOR(redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem(DUALMEM,36)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_ia <= STD_LOGIC_VECTOR(redist1_i_mul44_conv2d1x1_out_primWireOut_16_inputreg_q);
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_aa <= redist1_i_mul44_conv2d1x1_out_primWireOut_16_wraddr_q;
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_ab <= redist1_i_mul44_conv2d1x1_out_primWireOut_16_rdcnt_q;
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_reset0 <= not (resetn);
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 13,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist1_i_mul44_conv2d1x1_out_primWireOut_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_reset0,
        clock1 => clock,
        address_a => redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_aa,
        data_a => redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_ab,
        q_b => redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_iq
    );
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_q <= redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_iq(31 downto 0);

    -- redist1_i_mul44_conv2d1x1_out_primWireOut_16_outputreg(DELAY,35)
    redist1_i_mul44_conv2d1x1_out_primWireOut_16_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_mul44_conv2d1x1_out_primWireOut_16_mem_q, xout => redist1_i_mul44_conv2d1x1_out_primWireOut_16_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul33_conv2d1x1(BLACKBOX,10)@134
    -- out out_primWireOut@141
    thei_mul33_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_multBlA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c1_eni6_3,
        in_1 => in_c1_eni6_1_1,
        out_primWireOut => i_mul33_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_mul33_conv2d1x1_out_primWireOut_1(DELAY,15)
    redist2_i_mul33_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul33_conv2d1x1_out_primWireOut, xout => redist2_i_mul33_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_mul23_conv2d1x1(BLACKBOX,9)@134
    -- out out_primWireOut@141
    thei_mul23_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_multBlA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c1_eni6_2,
        in_1 => in_c1_eni6_0_1,
        out_primWireOut => i_mul23_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_mul23_conv2d1x1_out_primWireOut_1(DELAY,16)
    redist3_i_mul23_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_conv2d1x1_out_primWireOut, xout => redist3_i_mul23_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add34_conv2d1x1(BLACKBOX,5)@142
    -- out out_primWireOut@156
    thei_add34_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_addBloA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist3_i_mul23_conv2d1x1_out_primWireOut_1_q,
        in_1 => redist2_i_mul33_conv2d1x1_out_primWireOut_1_q,
        out_primWireOut => i_add34_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_add34_conv2d1x1_out_primWireOut_1(DELAY,19)
    redist6_i_add34_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add34_conv2d1x1_out_primWireOut, xout => redist6_i_add34_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add45_conv2d1x1(BLACKBOX,6)@157
    -- out out_primWireOut@171
    thei_add45_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_addBloA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist6_i_add34_conv2d1x1_out_primWireOut_1_q,
        in_1 => redist1_i_mul44_conv2d1x1_out_primWireOut_16_outputreg_q,
        out_primWireOut => i_add45_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_add45_conv2d1x1_out_primWireOut_1(DELAY,18)
    redist5_i_add45_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add45_conv2d1x1_out_primWireOut, xout => redist5_i_add45_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add56_conv2d1x1(BLACKBOX,7)@172
    -- out out_primWireOut@186
    thei_add56_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_addBloA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist5_i_add45_conv2d1x1_out_primWireOut_1_q,
        in_1 => redist0_i_mul55_conv2d1x1_out_primWireOut_31_outputreg_q,
        out_primWireOut => i_add56_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_add56_conv2d1x1_out_primWireOut_1(DELAY,17)
    redist4_i_add56_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add56_conv2d1x1_out_primWireOut, xout => redist4_i_add56_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_notEnable(LOGICAL,53)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_nor(LOGICAL,54)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_nor_q <= not (redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_notEnable_q or redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena_q);

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_last(CONSTANT,50)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_last_q <= "0110001";

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp(LOGICAL,51)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp_b <= STD_LOGIC_VECTOR("0" & redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_q);
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp_q <= "1" WHEN redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_last_q = redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp_b ELSE "0";

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmpReg(REG,52)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmpReg_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmp_q);
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena(REG,55)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_nor_q = "1") THEN
                redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_enaAnd(LOGICAL,56)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_enaAnd_q <= redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_sticky_ena_q and VCC_q;

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt(COUNTER,48)
    -- low=0, high=50, step=1, init=0
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i <= TO_UNSIGNED(0, 6);
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i = TO_UNSIGNED(49, 6)) THEN
                redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_eq <= '1';
            ELSE
                redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_eq <= '0';
            END IF;
            IF (redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_eq = '1') THEN
                redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i <= redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i + 14;
            ELSE
                redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i <= redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_i, 6)));

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_wraddr(REG,49)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_wraddr_q <= "110010";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_wraddr_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem(DUALMEM,47)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni6_6);
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_aa <= redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_wraddr_q;
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_ab <= redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_rdcnt_q;
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_reset0 <= not (resetn);
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 6,
        numwords_a => 51,
        width_b => 32,
        widthad_b => 6,
        numwords_b => 51,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_reset0,
        clock1 => clock,
        address_a => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_aa,
        data_a => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_ab,
        q_b => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_iq
    );
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_q <= redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_iq(31 downto 0);

    -- redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_outputreg(DELAY,46)
    redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_mem_q, xout => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_outputreg_q, clk => clock, aclr => resetn );

    -- i_add57_conv2d1x1(BLACKBOX,8)@187
    -- out out_primWireOut@201
    thei_add57_conv2d1x1 : floatComponent_i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter17_conv2d1x159_addBloA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist7_sync_in_aunroll_vunroll_x_in_c1_eni6_6_53_outputreg_q,
        in_1 => redist4_i_add56_conv2d1x1_out_primWireOut_1_q,
        out_primWireOut => i_add57_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@201
    out_c1_exi119_0 <= GND_q;
    out_c1_exi119_1 <= i_add57_conv2d1x1_out_primWireOut;
    out_o_valid <= redist8_sync_in_aunroll_vunroll_x_in_i_valid_67_q;

END normal;
