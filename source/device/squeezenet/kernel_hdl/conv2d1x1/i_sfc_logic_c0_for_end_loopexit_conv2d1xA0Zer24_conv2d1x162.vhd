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

-- VHDL created from i_sfc_logic_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x162
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

entity i_sfc_logic_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x162 is
    port (
        in_c0_eni223_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni223_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni223_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi127_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi127_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x162;

architecture normal of i_sfc_logic_c0_for_end_loopexit_conv2d1x1_c0_enter24_conv2d1x162 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer3_conv2d1x164 is
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_cmp126_rm28_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp126_rm28_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp126_rm28_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp126_rm28_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select12_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select12_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer3_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid15_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid16_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid17_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid18_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid19_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid20_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid21_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid22_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid23_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid24_i_cmp59_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid24_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_i_cmp59_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid35_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid36_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid37_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid41_i_cmp59_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid41_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid43_i_cmp59_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid43_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid49_i_cmp59_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid49_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid54_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid56_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid58_i_cmp59_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid58_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid58_i_cmp59_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid58_i_cmp59_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid59_i_cmp59_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid59_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid59_i_cmp59_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid59_i_cmp59_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid63_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid64_i_cmp59_conv2d1x1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid65_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid66_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid67_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid68_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid69_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid70_i_cmp59_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid70_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid71_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid72_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid73_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid74_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid75_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid76_i_cmp59_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid76_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid77_i_cmp59_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid77_i_cmp59_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_select12_conv2d1x1_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_select12_conv2d1x1_q_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c0_eni223_1_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni223_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist4_sync_in_aunroll_x_in_i_valid_4(DELAY,82)
    redist4_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist4_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist2_sync_in_aunroll_x_in_c0_eni223_1_1(DELAY,80)
    redist2_sync_in_aunroll_x_in_c0_eni223_1_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni223_1, xout => redist2_sync_in_aunroll_x_in_c0_eni223_1_1_q, clk => clock, aclr => resetn );

    -- redist3_sync_in_aunroll_x_in_c0_eni223_2_1(DELAY,81)
    redist3_sync_in_aunroll_x_in_c0_eni223_2_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni223_2, xout => redist3_sync_in_aunroll_x_in_c0_eni223_2_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer3_conv2d1x1(BLACKBOX,11)@0
    thei_syncbuf_input_channels_sync_buffer3_conv2d1x1 : i_syncbuf_input_channels_sync_buffer3_conv2d1x164
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer3_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,6)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_cmp126_rm28_conv2d1x1(COMPARE,7)@0 + 1
    i_cmp126_rm28_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp126_rm28_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_channels_sync_buffer3_conv2d1x1_out_buffer_out(31)) & i_syncbuf_input_channels_sync_buffer3_conv2d1x1_out_buffer_out));
    i_cmp126_rm28_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp126_rm28_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp126_rm28_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp126_rm28_conv2d1x1_a) - SIGNED(i_cmp126_rm28_conv2d1x1_b));
        END IF;
    END PROCESS;
    i_cmp126_rm28_conv2d1x1_c(0) <= i_cmp126_rm28_conv2d1x1_o(33);

    -- i_select12_conv2d1x1(MUX,10)@1 + 1
    i_select12_conv2d1x1_s <= i_cmp126_rm28_conv2d1x1_c;
    i_select12_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select12_conv2d1x1_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select12_conv2d1x1_s) IS
                WHEN "0" => i_select12_conv2d1x1_q <= redist3_sync_in_aunroll_x_in_c0_eni223_2_1_q;
                WHEN "1" => i_select12_conv2d1x1_q <= redist2_sync_in_aunroll_x_in_c0_eni223_1_1_q;
                WHEN OTHERS => i_select12_conv2d1x1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_i_select12_conv2d1x1_q_2(DELAY,78)
    redist0_i_select12_conv2d1x1_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_select12_conv2d1x1_q, xout => redist0_i_select12_conv2d1x1_q_2_q, clk => clock, aclr => resetn );

    -- redist1_i_select12_conv2d1x1_q_3(DELAY,79)
    redist1_i_select12_conv2d1x1_q_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_select12_conv2d1x1_q_2_q, xout => redist1_i_select12_conv2d1x1_q_3_q, clk => clock, aclr => resetn );

    -- c_float_0_000000e_00(FLOATCONSTANT,4)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- frac_y_uid36_i_cmp59_conv2d1x1(BITSELECT,35)@2
    frac_y_uid36_i_cmp59_conv2d1x1_b <= i_select12_conv2d1x1_q(22 downto 0);

    -- cstZeroWF_uid16_i_cmp59_conv2d1x1(CONSTANT,15)
    cstZeroWF_uid16_i_cmp59_conv2d1x1_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_i_cmp59_conv2d1x1(LOGICAL,38)@2
    fracXIsZero_uid39_i_cmp59_conv2d1x1_q <= "1" WHEN cstZeroWF_uid16_i_cmp59_conv2d1x1_q = frac_y_uid36_i_cmp59_conv2d1x1_b ELSE "0";

    -- cstAllZWE_uid17_i_cmp59_conv2d1x1(CONSTANT,16)
    cstAllZWE_uid17_i_cmp59_conv2d1x1_q <= "00000000";

    -- exp_y_uid35_i_cmp59_conv2d1x1(BITSELECT,34)@2
    exp_y_uid35_i_cmp59_conv2d1x1_b <= i_select12_conv2d1x1_q(30 downto 23);

    -- expXIsZero_uid37_i_cmp59_conv2d1x1(LOGICAL,36)@2
    expXIsZero_uid37_i_cmp59_conv2d1x1_q <= "1" WHEN exp_y_uid35_i_cmp59_conv2d1x1_b = cstAllZWE_uid17_i_cmp59_conv2d1x1_q ELSE "0";

    -- excZ_y_uid41_i_cmp59_conv2d1x1(LOGICAL,40)@2 + 1
    excZ_y_uid41_i_cmp59_conv2d1x1_qi <= expXIsZero_uid37_i_cmp59_conv2d1x1_q and fracXIsZero_uid39_i_cmp59_conv2d1x1_q;
    excZ_y_uid41_i_cmp59_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid41_i_cmp59_conv2d1x1_qi, xout => excZ_y_uid41_i_cmp59_conv2d1x1_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid71_i_cmp59_conv2d1x1(LOGICAL,70)@3
    invExcYZ_uid71_i_cmp59_conv2d1x1_q <= not (excZ_y_uid41_i_cmp59_conv2d1x1_q);

    -- frac_x_uid19_i_cmp59_conv2d1x1(BITSELECT,18)@2
    frac_x_uid19_i_cmp59_conv2d1x1_b <= c_float_0_000000e_00_q(22 downto 0);

    -- fracXIsZero_uid22_i_cmp59_conv2d1x1(LOGICAL,21)@2
    fracXIsZero_uid22_i_cmp59_conv2d1x1_q <= "1" WHEN cstZeroWF_uid16_i_cmp59_conv2d1x1_q = frac_x_uid19_i_cmp59_conv2d1x1_b ELSE "0";

    -- exp_x_uid18_i_cmp59_conv2d1x1(BITSELECT,17)@2
    exp_x_uid18_i_cmp59_conv2d1x1_b <= c_float_0_000000e_00_q(30 downto 23);

    -- expXIsZero_uid20_i_cmp59_conv2d1x1(LOGICAL,19)@2
    expXIsZero_uid20_i_cmp59_conv2d1x1_q <= "1" WHEN exp_x_uid18_i_cmp59_conv2d1x1_b = cstAllZWE_uid17_i_cmp59_conv2d1x1_q ELSE "0";

    -- excZ_x_uid24_i_cmp59_conv2d1x1(LOGICAL,23)@2 + 1
    excZ_x_uid24_i_cmp59_conv2d1x1_qi <= expXIsZero_uid20_i_cmp59_conv2d1x1_q and fracXIsZero_uid22_i_cmp59_conv2d1x1_q;
    excZ_x_uid24_i_cmp59_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid24_i_cmp59_conv2d1x1_qi, xout => excZ_x_uid24_i_cmp59_conv2d1x1_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid72_i_cmp59_conv2d1x1(LOGICAL,71)@3
    invExcXZ_uid72_i_cmp59_conv2d1x1_q <= not (excZ_x_uid24_i_cmp59_conv2d1x1_q);

    -- oneNonZero_uid73_i_cmp59_conv2d1x1(LOGICAL,72)@3
    oneNonZero_uid73_i_cmp59_conv2d1x1_q <= invExcXZ_uid72_i_cmp59_conv2d1x1_q or invExcYZ_uid71_i_cmp59_conv2d1x1_q;

    -- two_uid65_i_cmp59_conv2d1x1(CONSTANT,64)
    two_uid65_i_cmp59_conv2d1x1_q <= "10";

    -- signX_uid63_i_cmp59_conv2d1x1(BITSELECT,62)@3
    signX_uid63_i_cmp59_conv2d1x1_b <= STD_LOGIC_VECTOR(c_float_0_000000e_00_q(31 downto 31));

    -- signY_uid64_i_cmp59_conv2d1x1(BITSELECT,63)@3
    signY_uid64_i_cmp59_conv2d1x1_b <= STD_LOGIC_VECTOR(redist0_i_select12_conv2d1x1_q_2_q(31 downto 31));

    -- concSXSY_uid66_i_cmp59_conv2d1x1(BITJOIN,65)@3
    concSXSY_uid66_i_cmp59_conv2d1x1_q <= signX_uid63_i_cmp59_conv2d1x1_b & signY_uid64_i_cmp59_conv2d1x1_b;

    -- sxLTsy_uid67_i_cmp59_conv2d1x1(LOGICAL,66)@3
    sxLTsy_uid67_i_cmp59_conv2d1x1_q <= "1" WHEN concSXSY_uid66_i_cmp59_conv2d1x1_q = two_uid65_i_cmp59_conv2d1x1_q ELSE "0";

    -- rc2_uid74_i_cmp59_conv2d1x1(LOGICAL,73)@3
    rc2_uid74_i_cmp59_conv2d1x1_q <= sxLTsy_uid67_i_cmp59_conv2d1x1_q and oneNonZero_uid73_i_cmp59_conv2d1x1_q;

    -- expFracX_uid54_i_cmp59_conv2d1x1(BITJOIN,53)@2
    expFracX_uid54_i_cmp59_conv2d1x1_q <= exp_x_uid18_i_cmp59_conv2d1x1_b & frac_x_uid19_i_cmp59_conv2d1x1_b;

    -- expFracY_uid56_i_cmp59_conv2d1x1(BITJOIN,55)@2
    expFracY_uid56_i_cmp59_conv2d1x1_q <= exp_y_uid35_i_cmp59_conv2d1x1_b & frac_y_uid36_i_cmp59_conv2d1x1_b;

    -- efxGTefy_uid58_i_cmp59_conv2d1x1(COMPARE,57)@2 + 1
    efxGTefy_uid58_i_cmp59_conv2d1x1_a <= STD_LOGIC_VECTOR("00" & expFracY_uid56_i_cmp59_conv2d1x1_q);
    efxGTefy_uid58_i_cmp59_conv2d1x1_b <= STD_LOGIC_VECTOR("00" & expFracX_uid54_i_cmp59_conv2d1x1_q);
    efxGTefy_uid58_i_cmp59_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid58_i_cmp59_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid58_i_cmp59_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid58_i_cmp59_conv2d1x1_a) - UNSIGNED(efxGTefy_uid58_i_cmp59_conv2d1x1_b));
        END IF;
    END PROCESS;
    efxGTefy_uid58_i_cmp59_conv2d1x1_c(0) <= efxGTefy_uid58_i_cmp59_conv2d1x1_o(32);

    -- efxLTefy_uid59_i_cmp59_conv2d1x1(COMPARE,58)@2 + 1
    efxLTefy_uid59_i_cmp59_conv2d1x1_a <= STD_LOGIC_VECTOR("00" & expFracX_uid54_i_cmp59_conv2d1x1_q);
    efxLTefy_uid59_i_cmp59_conv2d1x1_b <= STD_LOGIC_VECTOR("00" & expFracY_uid56_i_cmp59_conv2d1x1_q);
    efxLTefy_uid59_i_cmp59_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid59_i_cmp59_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid59_i_cmp59_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid59_i_cmp59_conv2d1x1_a) - UNSIGNED(efxLTefy_uid59_i_cmp59_conv2d1x1_b));
        END IF;
    END PROCESS;
    efxLTefy_uid59_i_cmp59_conv2d1x1_c(0) <= efxLTefy_uid59_i_cmp59_conv2d1x1_o(32);

    -- expFracCompMux_uid70_i_cmp59_conv2d1x1(MUX,69)@3
    expFracCompMux_uid70_i_cmp59_conv2d1x1_s <= signX_uid63_i_cmp59_conv2d1x1_b;
    expFracCompMux_uid70_i_cmp59_conv2d1x1_combproc: PROCESS (expFracCompMux_uid70_i_cmp59_conv2d1x1_s, efxLTefy_uid59_i_cmp59_conv2d1x1_c, efxGTefy_uid58_i_cmp59_conv2d1x1_c)
    BEGIN
        CASE (expFracCompMux_uid70_i_cmp59_conv2d1x1_s) IS
            WHEN "0" => expFracCompMux_uid70_i_cmp59_conv2d1x1_q <= efxLTefy_uid59_i_cmp59_conv2d1x1_c;
            WHEN "1" => expFracCompMux_uid70_i_cmp59_conv2d1x1_q <= efxGTefy_uid58_i_cmp59_conv2d1x1_c;
            WHEN OTHERS => expFracCompMux_uid70_i_cmp59_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid68_i_cmp59_conv2d1x1(LOGICAL,67)@3
    xorSigns_uid68_i_cmp59_conv2d1x1_q <= signX_uid63_i_cmp59_conv2d1x1_b xor signY_uid64_i_cmp59_conv2d1x1_b;

    -- sxEQsy_uid69_i_cmp59_conv2d1x1(LOGICAL,68)@3
    sxEQsy_uid69_i_cmp59_conv2d1x1_q <= not (xorSigns_uid68_i_cmp59_conv2d1x1_q);

    -- sxEQsyExpFracCompMux_uid75_i_cmp59_conv2d1x1(LOGICAL,74)@3
    sxEQsyExpFracCompMux_uid75_i_cmp59_conv2d1x1_q <= sxEQsy_uid69_i_cmp59_conv2d1x1_q and expFracCompMux_uid70_i_cmp59_conv2d1x1_q;

    -- r_uid76_i_cmp59_conv2d1x1(LOGICAL,75)@3 + 1
    r_uid76_i_cmp59_conv2d1x1_qi <= sxEQsyExpFracCompMux_uid75_i_cmp59_conv2d1x1_q or rc2_uid74_i_cmp59_conv2d1x1_q;
    r_uid76_i_cmp59_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid76_i_cmp59_conv2d1x1_qi, xout => r_uid76_i_cmp59_conv2d1x1_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid40_i_cmp59_conv2d1x1(LOGICAL,39)@2
    fracXIsNotZero_uid40_i_cmp59_conv2d1x1_q <= not (fracXIsZero_uid39_i_cmp59_conv2d1x1_q);

    -- cstAllOWE_uid15_i_cmp59_conv2d1x1(CONSTANT,14)
    cstAllOWE_uid15_i_cmp59_conv2d1x1_q <= "11111111";

    -- expXIsMax_uid38_i_cmp59_conv2d1x1(LOGICAL,37)@2
    expXIsMax_uid38_i_cmp59_conv2d1x1_q <= "1" WHEN exp_y_uid35_i_cmp59_conv2d1x1_b = cstAllOWE_uid15_i_cmp59_conv2d1x1_q ELSE "0";

    -- excN_y_uid43_i_cmp59_conv2d1x1(LOGICAL,42)@2 + 1
    excN_y_uid43_i_cmp59_conv2d1x1_qi <= expXIsMax_uid38_i_cmp59_conv2d1x1_q and fracXIsNotZero_uid40_i_cmp59_conv2d1x1_q;
    excN_y_uid43_i_cmp59_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid43_i_cmp59_conv2d1x1_qi, xout => excN_y_uid43_i_cmp59_conv2d1x1_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid23_i_cmp59_conv2d1x1(LOGICAL,22)@2
    fracXIsNotZero_uid23_i_cmp59_conv2d1x1_q <= not (fracXIsZero_uid22_i_cmp59_conv2d1x1_q);

    -- expXIsMax_uid21_i_cmp59_conv2d1x1(LOGICAL,20)@2
    expXIsMax_uid21_i_cmp59_conv2d1x1_q <= "1" WHEN exp_x_uid18_i_cmp59_conv2d1x1_b = cstAllOWE_uid15_i_cmp59_conv2d1x1_q ELSE "0";

    -- excN_x_uid26_i_cmp59_conv2d1x1(LOGICAL,25)@2 + 1
    excN_x_uid26_i_cmp59_conv2d1x1_qi <= expXIsMax_uid21_i_cmp59_conv2d1x1_q and fracXIsNotZero_uid23_i_cmp59_conv2d1x1_q;
    excN_x_uid26_i_cmp59_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid26_i_cmp59_conv2d1x1_qi, xout => excN_x_uid26_i_cmp59_conv2d1x1_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid49_i_cmp59_conv2d1x1(LOGICAL,48)@3 + 1
    oneIsNaN_uid49_i_cmp59_conv2d1x1_qi <= excN_x_uid26_i_cmp59_conv2d1x1_q or excN_y_uid43_i_cmp59_conv2d1x1_q;
    oneIsNaN_uid49_i_cmp59_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid49_i_cmp59_conv2d1x1_qi, xout => oneIsNaN_uid49_i_cmp59_conv2d1x1_q, clk => clock, aclr => resetn );

    -- rPostExc_uid77_i_cmp59_conv2d1x1(MUX,76)@4
    rPostExc_uid77_i_cmp59_conv2d1x1_s <= oneIsNaN_uid49_i_cmp59_conv2d1x1_q;
    rPostExc_uid77_i_cmp59_conv2d1x1_combproc: PROCESS (rPostExc_uid77_i_cmp59_conv2d1x1_s, r_uid76_i_cmp59_conv2d1x1_q, GND_q)
    BEGIN
        CASE (rPostExc_uid77_i_cmp59_conv2d1x1_s) IS
            WHEN "0" => rPostExc_uid77_i_cmp59_conv2d1x1_q <= r_uid76_i_cmp59_conv2d1x1_q;
            WHEN "1" => rPostExc_uid77_i_cmp59_conv2d1x1_q <= GND_q;
            WHEN OTHERS => rPostExc_uid77_i_cmp59_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cond_conv2d1x1(MUX,9)@4
    i_cond_conv2d1x1_s <= rPostExc_uid77_i_cmp59_conv2d1x1_q;
    i_cond_conv2d1x1_combproc: PROCESS (i_cond_conv2d1x1_s, c_float_0_000000e_00_q, redist1_i_select12_conv2d1x1_q_3_q)
    BEGIN
        CASE (i_cond_conv2d1x1_s) IS
            WHEN "0" => i_cond_conv2d1x1_q <= c_float_0_000000e_00_q;
            WHEN "1" => i_cond_conv2d1x1_q <= redist1_i_select12_conv2d1x1_q_3_q;
            WHEN OTHERS => i_cond_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@4
    out_c0_exi127_0 <= GND_q;
    out_c0_exi127_1 <= i_cond_conv2d1x1_q;
    out_o_valid <= redist4_sync_in_aunroll_x_in_i_valid_4_q;

END normal;
