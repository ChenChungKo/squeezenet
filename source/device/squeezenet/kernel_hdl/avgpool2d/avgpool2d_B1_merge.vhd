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

-- VHDL created from avgpool2d_B1_merge
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

entity avgpool2d_B1_merge is
    port (
        in_fpgaindvars_iv_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_fpgaindvars_iv_1 : in std_logic_vector(8 downto 0);  -- ufix9
        in_global_id_04_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_04_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_02_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_02_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idx_ext1_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_idx_ext1_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_01_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_01_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(8 downto 0);  -- ufix9
        out_global_id_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_idx_ext1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_01 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end avgpool2d_B1_merge;

architecture normal of avgpool2d_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_q : STD_LOGIC_VECTOR (8 downto 0);
    signal global_id_04_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_04_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_02_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_02_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal idx_ext1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal idx_ext1_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_01_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_01_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fpgaindvars_iv_mux(MUX,2)
    fpgaindvars_iv_mux_s <= in_valid_in_0;
    fpgaindvars_iv_mux_combproc: PROCESS (fpgaindvars_iv_mux_s, in_fpgaindvars_iv_1, in_fpgaindvars_iv_0)
    BEGIN
        CASE (fpgaindvars_iv_mux_s) IS
            WHEN "0" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_1;
            WHEN "1" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_0;
            WHEN OTHERS => fpgaindvars_iv_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,19)
    out_fpgaindvars_iv <= fpgaindvars_iv_mux_q;

    -- global_id_04_mux(MUX,3)
    global_id_04_mux_s <= in_valid_in_0;
    global_id_04_mux_combproc: PROCESS (global_id_04_mux_s, in_global_id_04_1, in_global_id_04_0)
    BEGIN
        CASE (global_id_04_mux_s) IS
            WHEN "0" => global_id_04_mux_q <= in_global_id_04_1;
            WHEN "1" => global_id_04_mux_q <= in_global_id_04_0;
            WHEN OTHERS => global_id_04_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_04(GPOUT,20)
    out_global_id_04 <= global_id_04_mux_q;

    -- i_02_mux(MUX,4)
    i_02_mux_s <= in_valid_in_0;
    i_02_mux_combproc: PROCESS (i_02_mux_s, in_i_02_1, in_i_02_0)
    BEGIN
        CASE (i_02_mux_s) IS
            WHEN "0" => i_02_mux_q <= in_i_02_1;
            WHEN "1" => i_02_mux_q <= in_i_02_0;
            WHEN OTHERS => i_02_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i_02(GPOUT,21)
    out_i_02 <= i_02_mux_q;

    -- idx_ext1_mux(MUX,5)
    idx_ext1_mux_s <= in_valid_in_0;
    idx_ext1_mux_combproc: PROCESS (idx_ext1_mux_s, in_idx_ext1_1, in_idx_ext1_0)
    BEGIN
        CASE (idx_ext1_mux_s) IS
            WHEN "0" => idx_ext1_mux_q <= in_idx_ext1_1;
            WHEN "1" => idx_ext1_mux_q <= in_idx_ext1_0;
            WHEN OTHERS => idx_ext1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_idx_ext1(GPOUT,22)
    out_idx_ext1 <= idx_ext1_mux_q;

    -- valid_or(LOGICAL,30)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,27)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,23)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,28)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,24)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_01_mux(MUX,29)
    tmp_01_mux_s <= in_valid_in_0;
    tmp_01_mux_combproc: PROCESS (tmp_01_mux_s, in_tmp_01_1, in_tmp_01_0)
    BEGIN
        CASE (tmp_01_mux_s) IS
            WHEN "0" => tmp_01_mux_q <= in_tmp_01_1;
            WHEN "1" => tmp_01_mux_q <= in_tmp_01_0;
            WHEN OTHERS => tmp_01_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_01(GPOUT,25)
    out_tmp_01 <= tmp_01_mux_q;

    -- out_valid_out(GPOUT,26)
    out_valid_out <= valid_or_q;

END normal;
