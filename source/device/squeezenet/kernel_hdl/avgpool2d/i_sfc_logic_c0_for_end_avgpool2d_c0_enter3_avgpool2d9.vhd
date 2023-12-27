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

-- VHDL created from i_sfc_logic_c0_for_end_avgpool2d_c0_enter3_avgpool2d9
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

entity i_sfc_logic_c0_for_end_avgpool2d_c0_enter3_avgpool2d9 is
    port (
        in_c0_eni12_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end_avgpool2d_c0_enter3_avgpool2d9;

architecture normal of i_sfc_logic_c0_for_end_avgpool2d_c0_enter3_avgpool2d9 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c0_for_end_avgpool2d_c0_enter3_avgpool2d9_divideBlockA0Zp06o303d06o00rf01pzc is
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
    signal c_float_1_690000e_02_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv4_avgpool2d_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_sync_in_aunroll_x_in_i_valid_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_reset0 : std_logic;
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i : signal is true;
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_eq : std_logic;
    attribute preserve of redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_eq : signal is true;
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_q : signal is true;
    signal redist0_sync_in_aunroll_x_in_c0_eni12_1_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist1_sync_in_aunroll_x_in_i_valid_21(DELAY,8)
    redist1_sync_in_aunroll_x_in_i_valid_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist1_sync_in_aunroll_x_in_i_valid_21_q, clk => clock, aclr => resetn );

    -- c_float_1_690000e_02(FLOATCONSTANT,4)
    c_float_1_690000e_02_q <= "01000011001010010000000000000000";

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_notEnable(LOGICAL,16)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_nor(LOGICAL,17)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_nor_q <= not (redist0_sync_in_aunroll_x_in_c0_eni12_1_9_notEnable_q or redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_q);

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_last(CONSTANT,13)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_last_q <= "0101";

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp(LOGICAL,14)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_q);
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp_q <= "1" WHEN redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_last_q = redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp_b ELSE "0";

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmpReg(REG,15)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmpReg_q <= STD_LOGIC_VECTOR(redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena(REG,18)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_sync_in_aunroll_x_in_c0_eni12_1_9_nor_q = "1") THEN
                redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_sync_in_aunroll_x_in_c0_eni12_1_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_enaAnd(LOGICAL,19)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_enaAnd_q <= redist0_sync_in_aunroll_x_in_c0_eni12_1_9_sticky_ena_q and VCC_q;

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt(COUNTER,11)
    -- low=0, high=6, step=1, init=0
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_eq <= '1';
            ELSE
                redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_eq <= '0';
            END IF;
            IF (redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_eq = '1') THEN
                redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i <= redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i + 2;
            ELSE
                redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i <= redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_i, 3)));

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_wraddr(REG,12)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_sync_in_aunroll_x_in_c0_eni12_1_9_wraddr_q <= STD_LOGIC_VECTOR(redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem(DUALMEM,10)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni12_1);
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_aa <= redist0_sync_in_aunroll_x_in_c0_eni12_1_9_wraddr_q;
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_ab <= redist0_sync_in_aunroll_x_in_c0_eni12_1_9_rdcnt_q;
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_reset0 <= not (resetn);
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_reset0,
        clock1 => clock,
        address_a => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_aa,
        data_a => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_ab,
        q_b => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_iq
    );
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_q <= redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_iq(31 downto 0);

    -- redist0_sync_in_aunroll_x_in_c0_eni12_1_9_outputreg(DELAY,9)
    redist0_sync_in_aunroll_x_in_c0_eni12_1_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_mem_q, xout => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_outputreg_q, clk => clock, aclr => resetn );

    -- i_conv4_avgpool2d(BLACKBOX,6)@9
    -- out out_primWireOut@21
    thei_conv4_avgpool2d : floatComponent_i_sfc_logic_c0_for_end_avgpool2d_c0_enter3_avgpool2d9_divideBlockA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => redist0_sync_in_aunroll_x_in_c0_eni12_1_9_outputreg_q,
        in_1 => c_float_1_690000e_02_q,
        out_primWireOut => i_conv4_avgpool2d_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@21
    out_c0_exi15_0 <= GND_q;
    out_c0_exi15_1 <= i_conv4_avgpool2d_out_primWireOut;
    out_o_valid <= redist1_sync_in_aunroll_x_in_i_valid_21_q;

END normal;
