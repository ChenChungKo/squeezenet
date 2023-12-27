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

-- VHDL created from i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d34
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

entity i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d34 is
    port (
        in_c1_eni2_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni2_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni2_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi124_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi124_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d34;

architecture normal of i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter22_maxpool2d34 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tmp_4_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tmp_4_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid8_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid9_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid10_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid11_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid12_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid13_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid17_i_cmp27_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid17_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid19_i_cmp27_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid19_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid28_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid29_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid30_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid31_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid33_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid34_i_cmp27_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid34_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid36_i_cmp27_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid36_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid42_i_cmp27_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid42_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid47_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid49_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid51_i_cmp27_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid51_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid51_i_cmp27_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid51_i_cmp27_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid52_i_cmp27_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid52_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid52_i_cmp27_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid52_i_cmp27_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid56_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid57_i_cmp27_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid58_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid59_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid60_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid61_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid62_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid63_i_cmp27_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid63_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid64_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid65_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid66_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid67_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid68_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid69_i_cmp27_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid69_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid70_i_cmp27_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid70_i_cmp27_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sync_in_aunroll_x_in_c1_eni2_1_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_sync_in_aunroll_x_in_c1_eni2_1_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni2_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c1_eni2_2_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist4_sync_in_aunroll_x_in_i_valid_2(DELAY,75)
    redist4_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist4_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist0_sync_in_aunroll_x_in_c1_eni2_1_1(DELAY,71)
    redist0_sync_in_aunroll_x_in_c1_eni2_1_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni2_1, xout => redist0_sync_in_aunroll_x_in_c1_eni2_1_1_q, clk => clock, aclr => resetn );

    -- redist1_sync_in_aunroll_x_in_c1_eni2_1_2(DELAY,72)
    redist1_sync_in_aunroll_x_in_c1_eni2_1_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_sync_in_aunroll_x_in_c1_eni2_1_1_q, xout => redist1_sync_in_aunroll_x_in_c1_eni2_1_2_q, clk => clock, aclr => resetn );

    -- redist2_sync_in_aunroll_x_in_c1_eni2_2_1(DELAY,73)
    redist2_sync_in_aunroll_x_in_c1_eni2_2_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni2_2, xout => redist2_sync_in_aunroll_x_in_c1_eni2_2_1_q, clk => clock, aclr => resetn );

    -- redist3_sync_in_aunroll_x_in_c1_eni2_2_2(DELAY,74)
    redist3_sync_in_aunroll_x_in_c1_eni2_2_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_sync_in_aunroll_x_in_c1_eni2_2_1_q, xout => redist3_sync_in_aunroll_x_in_c1_eni2_2_2_q, clk => clock, aclr => resetn );

    -- frac_y_uid29_i_cmp27_maxpool2d(BITSELECT,28)@149
    frac_y_uid29_i_cmp27_maxpool2d_b <= in_c1_eni2_1(22 downto 0);

    -- cstZeroWF_uid9_i_cmp27_maxpool2d(CONSTANT,8)
    cstZeroWF_uid9_i_cmp27_maxpool2d_q <= "00000000000000000000000";

    -- fracXIsZero_uid32_i_cmp27_maxpool2d(LOGICAL,31)@149
    fracXIsZero_uid32_i_cmp27_maxpool2d_q <= "1" WHEN cstZeroWF_uid9_i_cmp27_maxpool2d_q = frac_y_uid29_i_cmp27_maxpool2d_b ELSE "0";

    -- cstAllZWE_uid10_i_cmp27_maxpool2d(CONSTANT,9)
    cstAllZWE_uid10_i_cmp27_maxpool2d_q <= "00000000";

    -- exp_y_uid28_i_cmp27_maxpool2d(BITSELECT,27)@149
    exp_y_uid28_i_cmp27_maxpool2d_b <= in_c1_eni2_1(30 downto 23);

    -- expXIsZero_uid30_i_cmp27_maxpool2d(LOGICAL,29)@149
    expXIsZero_uid30_i_cmp27_maxpool2d_q <= "1" WHEN exp_y_uid28_i_cmp27_maxpool2d_b = cstAllZWE_uid10_i_cmp27_maxpool2d_q ELSE "0";

    -- excZ_y_uid34_i_cmp27_maxpool2d(LOGICAL,33)@149 + 1
    excZ_y_uid34_i_cmp27_maxpool2d_qi <= expXIsZero_uid30_i_cmp27_maxpool2d_q and fracXIsZero_uid32_i_cmp27_maxpool2d_q;
    excZ_y_uid34_i_cmp27_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid34_i_cmp27_maxpool2d_qi, xout => excZ_y_uid34_i_cmp27_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid64_i_cmp27_maxpool2d(LOGICAL,63)@150
    invExcYZ_uid64_i_cmp27_maxpool2d_q <= not (excZ_y_uid34_i_cmp27_maxpool2d_q);

    -- frac_x_uid12_i_cmp27_maxpool2d(BITSELECT,11)@149
    frac_x_uid12_i_cmp27_maxpool2d_b <= in_c1_eni2_2(22 downto 0);

    -- fracXIsZero_uid15_i_cmp27_maxpool2d(LOGICAL,14)@149
    fracXIsZero_uid15_i_cmp27_maxpool2d_q <= "1" WHEN cstZeroWF_uid9_i_cmp27_maxpool2d_q = frac_x_uid12_i_cmp27_maxpool2d_b ELSE "0";

    -- exp_x_uid11_i_cmp27_maxpool2d(BITSELECT,10)@149
    exp_x_uid11_i_cmp27_maxpool2d_b <= in_c1_eni2_2(30 downto 23);

    -- expXIsZero_uid13_i_cmp27_maxpool2d(LOGICAL,12)@149
    expXIsZero_uid13_i_cmp27_maxpool2d_q <= "1" WHEN exp_x_uid11_i_cmp27_maxpool2d_b = cstAllZWE_uid10_i_cmp27_maxpool2d_q ELSE "0";

    -- excZ_x_uid17_i_cmp27_maxpool2d(LOGICAL,16)@149 + 1
    excZ_x_uid17_i_cmp27_maxpool2d_qi <= expXIsZero_uid13_i_cmp27_maxpool2d_q and fracXIsZero_uid15_i_cmp27_maxpool2d_q;
    excZ_x_uid17_i_cmp27_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid17_i_cmp27_maxpool2d_qi, xout => excZ_x_uid17_i_cmp27_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid65_i_cmp27_maxpool2d(LOGICAL,64)@150
    invExcXZ_uid65_i_cmp27_maxpool2d_q <= not (excZ_x_uid17_i_cmp27_maxpool2d_q);

    -- oneNonZero_uid66_i_cmp27_maxpool2d(LOGICAL,65)@150
    oneNonZero_uid66_i_cmp27_maxpool2d_q <= invExcXZ_uid65_i_cmp27_maxpool2d_q or invExcYZ_uid64_i_cmp27_maxpool2d_q;

    -- two_uid58_i_cmp27_maxpool2d(CONSTANT,57)
    two_uid58_i_cmp27_maxpool2d_q <= "10";

    -- signX_uid56_i_cmp27_maxpool2d(BITSELECT,55)@150
    signX_uid56_i_cmp27_maxpool2d_b <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_c1_eni2_2_1_q(31 downto 31));

    -- signY_uid57_i_cmp27_maxpool2d(BITSELECT,56)@150
    signY_uid57_i_cmp27_maxpool2d_b <= STD_LOGIC_VECTOR(redist0_sync_in_aunroll_x_in_c1_eni2_1_1_q(31 downto 31));

    -- concSXSY_uid59_i_cmp27_maxpool2d(BITJOIN,58)@150
    concSXSY_uid59_i_cmp27_maxpool2d_q <= signX_uid56_i_cmp27_maxpool2d_b & signY_uid57_i_cmp27_maxpool2d_b;

    -- sxLTsy_uid60_i_cmp27_maxpool2d(LOGICAL,59)@150
    sxLTsy_uid60_i_cmp27_maxpool2d_q <= "1" WHEN concSXSY_uid59_i_cmp27_maxpool2d_q = two_uid58_i_cmp27_maxpool2d_q ELSE "0";

    -- rc2_uid67_i_cmp27_maxpool2d(LOGICAL,66)@150
    rc2_uid67_i_cmp27_maxpool2d_q <= sxLTsy_uid60_i_cmp27_maxpool2d_q and oneNonZero_uid66_i_cmp27_maxpool2d_q;

    -- expFracX_uid47_i_cmp27_maxpool2d(BITJOIN,46)@149
    expFracX_uid47_i_cmp27_maxpool2d_q <= exp_x_uid11_i_cmp27_maxpool2d_b & frac_x_uid12_i_cmp27_maxpool2d_b;

    -- expFracY_uid49_i_cmp27_maxpool2d(BITJOIN,48)@149
    expFracY_uid49_i_cmp27_maxpool2d_q <= exp_y_uid28_i_cmp27_maxpool2d_b & frac_y_uid29_i_cmp27_maxpool2d_b;

    -- efxGTefy_uid51_i_cmp27_maxpool2d(COMPARE,50)@149 + 1
    efxGTefy_uid51_i_cmp27_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracY_uid49_i_cmp27_maxpool2d_q);
    efxGTefy_uid51_i_cmp27_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracX_uid47_i_cmp27_maxpool2d_q);
    efxGTefy_uid51_i_cmp27_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid51_i_cmp27_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid51_i_cmp27_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid51_i_cmp27_maxpool2d_a) - UNSIGNED(efxGTefy_uid51_i_cmp27_maxpool2d_b));
        END IF;
    END PROCESS;
    efxGTefy_uid51_i_cmp27_maxpool2d_c(0) <= efxGTefy_uid51_i_cmp27_maxpool2d_o(32);

    -- efxLTefy_uid52_i_cmp27_maxpool2d(COMPARE,51)@149 + 1
    efxLTefy_uid52_i_cmp27_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracX_uid47_i_cmp27_maxpool2d_q);
    efxLTefy_uid52_i_cmp27_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracY_uid49_i_cmp27_maxpool2d_q);
    efxLTefy_uid52_i_cmp27_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid52_i_cmp27_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid52_i_cmp27_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid52_i_cmp27_maxpool2d_a) - UNSIGNED(efxLTefy_uid52_i_cmp27_maxpool2d_b));
        END IF;
    END PROCESS;
    efxLTefy_uid52_i_cmp27_maxpool2d_c(0) <= efxLTefy_uid52_i_cmp27_maxpool2d_o(32);

    -- expFracCompMux_uid63_i_cmp27_maxpool2d(MUX,62)@150
    expFracCompMux_uid63_i_cmp27_maxpool2d_s <= signX_uid56_i_cmp27_maxpool2d_b;
    expFracCompMux_uid63_i_cmp27_maxpool2d_combproc: PROCESS (expFracCompMux_uid63_i_cmp27_maxpool2d_s, efxLTefy_uid52_i_cmp27_maxpool2d_c, efxGTefy_uid51_i_cmp27_maxpool2d_c)
    BEGIN
        CASE (expFracCompMux_uid63_i_cmp27_maxpool2d_s) IS
            WHEN "0" => expFracCompMux_uid63_i_cmp27_maxpool2d_q <= efxLTefy_uid52_i_cmp27_maxpool2d_c;
            WHEN "1" => expFracCompMux_uid63_i_cmp27_maxpool2d_q <= efxGTefy_uid51_i_cmp27_maxpool2d_c;
            WHEN OTHERS => expFracCompMux_uid63_i_cmp27_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid61_i_cmp27_maxpool2d(LOGICAL,60)@150
    xorSigns_uid61_i_cmp27_maxpool2d_q <= signX_uid56_i_cmp27_maxpool2d_b xor signY_uid57_i_cmp27_maxpool2d_b;

    -- sxEQsy_uid62_i_cmp27_maxpool2d(LOGICAL,61)@150
    sxEQsy_uid62_i_cmp27_maxpool2d_q <= not (xorSigns_uid61_i_cmp27_maxpool2d_q);

    -- sxEQsyExpFracCompMux_uid68_i_cmp27_maxpool2d(LOGICAL,67)@150
    sxEQsyExpFracCompMux_uid68_i_cmp27_maxpool2d_q <= sxEQsy_uid62_i_cmp27_maxpool2d_q and expFracCompMux_uid63_i_cmp27_maxpool2d_q;

    -- r_uid69_i_cmp27_maxpool2d(LOGICAL,68)@150 + 1
    r_uid69_i_cmp27_maxpool2d_qi <= sxEQsyExpFracCompMux_uid68_i_cmp27_maxpool2d_q or rc2_uid67_i_cmp27_maxpool2d_q;
    r_uid69_i_cmp27_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid69_i_cmp27_maxpool2d_qi, xout => r_uid69_i_cmp27_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid33_i_cmp27_maxpool2d(LOGICAL,32)@149
    fracXIsNotZero_uid33_i_cmp27_maxpool2d_q <= not (fracXIsZero_uid32_i_cmp27_maxpool2d_q);

    -- cstAllOWE_uid8_i_cmp27_maxpool2d(CONSTANT,7)
    cstAllOWE_uid8_i_cmp27_maxpool2d_q <= "11111111";

    -- expXIsMax_uid31_i_cmp27_maxpool2d(LOGICAL,30)@149
    expXIsMax_uid31_i_cmp27_maxpool2d_q <= "1" WHEN exp_y_uid28_i_cmp27_maxpool2d_b = cstAllOWE_uid8_i_cmp27_maxpool2d_q ELSE "0";

    -- excN_y_uid36_i_cmp27_maxpool2d(LOGICAL,35)@149 + 1
    excN_y_uid36_i_cmp27_maxpool2d_qi <= expXIsMax_uid31_i_cmp27_maxpool2d_q and fracXIsNotZero_uid33_i_cmp27_maxpool2d_q;
    excN_y_uid36_i_cmp27_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid36_i_cmp27_maxpool2d_qi, xout => excN_y_uid36_i_cmp27_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid16_i_cmp27_maxpool2d(LOGICAL,15)@149
    fracXIsNotZero_uid16_i_cmp27_maxpool2d_q <= not (fracXIsZero_uid15_i_cmp27_maxpool2d_q);

    -- expXIsMax_uid14_i_cmp27_maxpool2d(LOGICAL,13)@149
    expXIsMax_uid14_i_cmp27_maxpool2d_q <= "1" WHEN exp_x_uid11_i_cmp27_maxpool2d_b = cstAllOWE_uid8_i_cmp27_maxpool2d_q ELSE "0";

    -- excN_x_uid19_i_cmp27_maxpool2d(LOGICAL,18)@149 + 1
    excN_x_uid19_i_cmp27_maxpool2d_qi <= expXIsMax_uid14_i_cmp27_maxpool2d_q and fracXIsNotZero_uid16_i_cmp27_maxpool2d_q;
    excN_x_uid19_i_cmp27_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid19_i_cmp27_maxpool2d_qi, xout => excN_x_uid19_i_cmp27_maxpool2d_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid42_i_cmp27_maxpool2d(LOGICAL,41)@150 + 1
    oneIsNaN_uid42_i_cmp27_maxpool2d_qi <= excN_x_uid19_i_cmp27_maxpool2d_q or excN_y_uid36_i_cmp27_maxpool2d_q;
    oneIsNaN_uid42_i_cmp27_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid42_i_cmp27_maxpool2d_qi, xout => oneIsNaN_uid42_i_cmp27_maxpool2d_q, clk => clock, aclr => resetn );

    -- rPostExc_uid70_i_cmp27_maxpool2d(MUX,69)@151
    rPostExc_uid70_i_cmp27_maxpool2d_s <= oneIsNaN_uid42_i_cmp27_maxpool2d_q;
    rPostExc_uid70_i_cmp27_maxpool2d_combproc: PROCESS (rPostExc_uid70_i_cmp27_maxpool2d_s, r_uid69_i_cmp27_maxpool2d_q, GND_q)
    BEGIN
        CASE (rPostExc_uid70_i_cmp27_maxpool2d_s) IS
            WHEN "0" => rPostExc_uid70_i_cmp27_maxpool2d_q <= r_uid69_i_cmp27_maxpool2d_q;
            WHEN "1" => rPostExc_uid70_i_cmp27_maxpool2d_q <= GND_q;
            WHEN OTHERS => rPostExc_uid70_i_cmp27_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_tmp_4_maxpool2d(MUX,6)@151
    i_tmp_4_maxpool2d_s <= rPostExc_uid70_i_cmp27_maxpool2d_q;
    i_tmp_4_maxpool2d_combproc: PROCESS (i_tmp_4_maxpool2d_s, redist3_sync_in_aunroll_x_in_c1_eni2_2_2_q, redist1_sync_in_aunroll_x_in_c1_eni2_1_2_q)
    BEGIN
        CASE (i_tmp_4_maxpool2d_s) IS
            WHEN "0" => i_tmp_4_maxpool2d_q <= redist3_sync_in_aunroll_x_in_c1_eni2_2_2_q;
            WHEN "1" => i_tmp_4_maxpool2d_q <= redist1_sync_in_aunroll_x_in_c1_eni2_1_2_q;
            WHEN OTHERS => i_tmp_4_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@151
    out_c1_exi124_0 <= GND_q;
    out_c1_exi124_1 <= i_tmp_4_maxpool2d_q;
    out_o_valid <= redist4_sync_in_aunroll_x_in_i_valid_2_q;

END normal;
