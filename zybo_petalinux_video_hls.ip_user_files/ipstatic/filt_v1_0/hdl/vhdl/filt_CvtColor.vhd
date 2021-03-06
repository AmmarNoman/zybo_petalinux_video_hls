-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filt_CvtColor is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_src_rows_V_read : IN STD_LOGIC_VECTOR (8 downto 0);
    p_src_cols_V_read : IN STD_LOGIC_VECTOR (9 downto 0);
    p_src_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_0_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_0_V_read : OUT STD_LOGIC;
    p_src_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_1_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_1_V_read : OUT STD_LOGIC;
    p_src_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_2_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_2_V_read : OUT STD_LOGIC;
    p_dst_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_0_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_0_V_write : OUT STD_LOGIC;
    p_dst_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_1_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_1_V_write : OUT STD_LOGIC;
    p_dst_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_2_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_2_V_write : OUT STD_LOGIC );
end;


architecture behav of filt_CvtColor is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_pp0_stg0_fsm_2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_st6_fsm_3 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_1D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011101";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv30_259168 : STD_LOGIC_VECTOR (29 downto 0) := "000000001001011001000101101000";
    constant ap_const_lv28_74BC6 : STD_LOGIC_VECTOR (27 downto 0) := "0000000001110100101111000110";
    constant ap_const_lv29_1322D0 : STD_LOGIC_VECTOR (28 downto 0) := "00000000100110010001011010000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_21 : BOOLEAN;
    signal p_src_data_stream_0_V_blk_n : STD_LOGIC;
    signal ap_sig_cseq_ST_pp0_stg0_fsm_2 : STD_LOGIC;
    signal ap_sig_58 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it2 : STD_LOGIC := '0';
    signal exitcond_reg_325 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_src_data_stream_1_V_blk_n : STD_LOGIC;
    signal p_src_data_stream_2_V_blk_n : STD_LOGIC;
    signal p_dst_data_stream_0_V_blk_n : STD_LOGIC;
    signal ap_reg_ppstg_exitcond_reg_325_pp0_iter1 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_dst_data_stream_1_V_blk_n : STD_LOGIC;
    signal p_dst_data_stream_2_V_blk_n : STD_LOGIC;
    signal j_reg_162 : STD_LOGIC_VECTOR (8 downto 0);
    signal exitcond2_fu_177_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_95 : BOOLEAN;
    signal i_1_fu_182_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_1_reg_320 : STD_LOGIC_VECTOR (7 downto 0);
    signal exitcond_fu_192_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_108 : BOOLEAN;
    signal ap_sig_118 : BOOLEAN;
    signal j_1_fu_197_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_114_reg_334 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_292_p3 : STD_LOGIC_VECTOR (28 downto 0);
    signal p_Val2_42_reg_339 : STD_LOGIC_VECTOR (28 downto 0);
    signal i_reg_151 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_sig_cseq_ST_st6_fsm_3 : STD_LOGIC;
    signal ap_sig_150 : BOOLEAN;
    signal p_Val2_s_fu_270_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cast_fu_173_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal j_cast_fu_188_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_fu_281_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal tmp_109_fu_226_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Val2_44_fu_217_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_i_i_i_fu_233_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Val2_45_fu_244_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_110_fu_237_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_111_fu_250_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_1_i_i_i_not_fu_258_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal not_carry_fu_264_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_281_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_281_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal grp_fu_281_p2 : STD_LOGIC_VECTOR (28 downto 0);
    signal grp_fu_292_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_292_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal r_V_4_i_fu_299_p2 : STD_LOGIC_VECTOR (28 downto 0);
    signal r_V_4_i_fu_299_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_V_4_i_fu_299_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_fu_281_p00 : STD_LOGIC_VECTOR (29 downto 0);
    signal grp_fu_281_p20 : STD_LOGIC_VECTOR (29 downto 0);
    signal grp_fu_292_p00 : STD_LOGIC_VECTOR (27 downto 0);
    signal r_V_4_i_fu_299_p00 : STD_LOGIC_VECTOR (28 downto 0);

    component filt_mac_muladd_8ns_23ns_29ns_30_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (22 downto 0);
        din2 : IN STD_LOGIC_VECTOR (28 downto 0);
        dout : OUT STD_LOGIC_VECTOR (29 downto 0) );
    end component;


    component filt_mac_muladd_8ns_20ns_29ns_29_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (19 downto 0);
        din2 : IN STD_LOGIC_VECTOR (28 downto 0);
        dout : OUT STD_LOGIC_VECTOR (28 downto 0) );
    end component;


    component filt_mul_mul_8ns_22ns_29_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (21 downto 0);
        dout : OUT STD_LOGIC_VECTOR (28 downto 0) );
    end component;



begin
    filt_mac_muladd_8ns_23ns_29ns_30_1_U48 : component filt_mac_muladd_8ns_23ns_29ns_30_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 23,
        din2_WIDTH => 29,
        dout_WIDTH => 30)
    port map (
        din0 => grp_fu_281_p0,
        din1 => grp_fu_281_p1,
        din2 => grp_fu_281_p2,
        dout => grp_fu_281_p3);

    filt_mac_muladd_8ns_20ns_29ns_29_1_U49 : component filt_mac_muladd_8ns_20ns_29ns_29_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 20,
        din2_WIDTH => 29,
        dout_WIDTH => 29)
    port map (
        din0 => grp_fu_292_p0,
        din1 => grp_fu_292_p1,
        din2 => r_V_4_i_fu_299_p2,
        dout => grp_fu_292_p3);

    filt_mul_mul_8ns_22ns_29_1_U50 : component filt_mul_mul_8ns_22ns_29_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 22,
        dout_WIDTH => 29)
    port map (
        din0 => r_V_4_i_fu_299_p0,
        din1 => r_V_4_i_fu_299_p1,
        dout => r_V_4_i_fu_299_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and not((ap_const_lv1_0 = exitcond_fu_192_p2)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond2_fu_177_p2))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and (ap_const_lv1_0 = exitcond_fu_192_p2))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond2_fu_177_p2)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and not((ap_const_lv1_0 = exitcond_fu_192_p2))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ppiten_pp0_it2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
            else
                if (not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118)))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond2_fu_177_p2))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_reg_151_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_3)) then 
                i_reg_151 <= i_1_reg_320;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                i_reg_151 <= ap_const_lv8_0;
            end if; 
        end if;
    end process;

    j_reg_162_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and (ap_const_lv1_0 = exitcond_fu_192_p2))) then 
                j_reg_162 <= j_1_fu_197_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond2_fu_177_p2))) then 
                j_reg_162 <= ap_const_lv9_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then
                ap_reg_ppstg_exitcond_reg_325_pp0_iter1 <= exitcond_reg_325;
                exitcond_reg_325 <= exitcond_fu_192_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                i_1_reg_320 <= i_1_fu_182_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then
                p_Val2_42_reg_339 <= grp_fu_292_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond_reg_325 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then
                tmp_114_reg_334 <= p_src_data_stream_1_V_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it0, ap_reg_ppiten_pp0_it2, exitcond2_fu_177_p2, exitcond_fu_192_p2, ap_sig_108, ap_sig_118)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((ap_const_lv1_0 = exitcond2_fu_177_p2))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_pp0_stg0_fsm_2 => 
                if ((not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and not((ap_const_lv1_0 = exitcond_fu_192_p2)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                elsif ((((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))) and not((ap_const_lv1_0 = exitcond_fu_192_p2)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then
                    ap_NS_fsm <= ap_ST_st6_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_st6_fsm_3 => 
                ap_NS_fsm <= ap_ST_st2_fsm_1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;

    ap_done_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0, exitcond2_fu_177_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_lv1_0 = exitcond2_fu_177_p2))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(exitcond2_fu_177_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_lv1_0 = exitcond2_fu_177_p2)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_108_assign_proc : process(p_src_data_stream_0_V_empty_n, p_src_data_stream_1_V_empty_n, p_src_data_stream_2_V_empty_n, exitcond_reg_325)
    begin
                ap_sig_108 <= (((exitcond_reg_325 = ap_const_lv1_0) and (p_src_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_reg_325 = ap_const_lv1_0) and (p_src_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_reg_325 = ap_const_lv1_0) and (p_src_data_stream_2_V_empty_n = ap_const_logic_0)));
    end process;


    ap_sig_118_assign_proc : process(p_dst_data_stream_0_V_full_n, p_dst_data_stream_1_V_full_n, p_dst_data_stream_2_V_full_n, ap_reg_ppstg_exitcond_reg_325_pp0_iter1)
    begin
                ap_sig_118 <= (((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1) and (p_dst_data_stream_0_V_full_n = ap_const_logic_0)) or ((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1) and (p_dst_data_stream_1_V_full_n = ap_const_logic_0)) or ((ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1) and (p_dst_data_stream_2_V_full_n = ap_const_logic_0)));
    end process;


    ap_sig_150_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_150 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    ap_sig_21_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_21 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_58_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_58 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    ap_sig_95_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_95 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_cseq_ST_pp0_stg0_fsm_2_assign_proc : process(ap_sig_58)
    begin
        if (ap_sig_58) then 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_21)
    begin
        if (ap_sig_21) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_95)
    begin
        if (ap_sig_95) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st6_fsm_3_assign_proc : process(ap_sig_150)
    begin
        if (ap_sig_150) then 
            ap_sig_cseq_ST_st6_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st6_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond2_fu_177_p2 <= "1" when (i_cast_fu_173_p1 = p_src_rows_V_read) else "0";
    exitcond_fu_192_p2 <= "1" when (j_cast_fu_188_p1 = p_src_cols_V_read) else "0";
    grp_fu_281_p0 <= grp_fu_281_p00(8 - 1 downto 0);
    grp_fu_281_p00 <= std_logic_vector(resize(unsigned(tmp_114_reg_334),30));
    grp_fu_281_p1 <= ap_const_lv30_259168(23 - 1 downto 0);
    grp_fu_281_p2 <= grp_fu_281_p20(29 - 1 downto 0);
    grp_fu_281_p20 <= std_logic_vector(resize(unsigned(p_Val2_42_reg_339),30));
    grp_fu_292_p0 <= grp_fu_292_p00(8 - 1 downto 0);
    grp_fu_292_p00 <= std_logic_vector(resize(unsigned(p_src_data_stream_0_V_dout),28));
    grp_fu_292_p1 <= ap_const_lv28_74BC6(20 - 1 downto 0);
    i_1_fu_182_p2 <= std_logic_vector(unsigned(i_reg_151) + unsigned(ap_const_lv8_1));
    i_cast_fu_173_p1 <= std_logic_vector(resize(unsigned(i_reg_151),9));
    j_1_fu_197_p2 <= std_logic_vector(unsigned(j_reg_162) + unsigned(ap_const_lv9_1));
    j_cast_fu_188_p1 <= std_logic_vector(resize(unsigned(j_reg_162),10));
    not_carry_fu_264_p2 <= (tmp_111_fu_250_p3 or p_Result_1_i_i_i_not_fu_258_p2);
    p_Result_1_i_i_i_not_fu_258_p2 <= (tmp_110_fu_237_p3 xor ap_const_lv1_1);
    p_Val2_44_fu_217_p4 <= grp_fu_281_p3(29 downto 22);
    p_Val2_45_fu_244_p2 <= std_logic_vector(unsigned(p_Val2_44_fu_217_p4) + unsigned(tmp_1_i_i_i_fu_233_p1));
    p_Val2_s_fu_270_p3 <= 
        p_Val2_45_fu_244_p2 when (not_carry_fu_264_p2(0) = '1') else 
        ap_const_lv8_FF;

    p_dst_data_stream_0_V_blk_n_assign_proc : process(p_dst_data_stream_0_V_full_n, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_reg_325_pp0_iter1)
    begin
        if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1))) then 
            p_dst_data_stream_0_V_blk_n <= p_dst_data_stream_0_V_full_n;
        else 
            p_dst_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_data_stream_0_V_din <= p_Val2_s_fu_270_p3;

    p_dst_data_stream_0_V_write_assign_proc : process(ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_reg_325_pp0_iter1, ap_sig_108, ap_sig_118)
    begin
        if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then 
            p_dst_data_stream_0_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_dst_data_stream_1_V_blk_n_assign_proc : process(p_dst_data_stream_1_V_full_n, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_reg_325_pp0_iter1)
    begin
        if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1))) then 
            p_dst_data_stream_1_V_blk_n <= p_dst_data_stream_1_V_full_n;
        else 
            p_dst_data_stream_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_data_stream_1_V_din <= p_Val2_s_fu_270_p3;

    p_dst_data_stream_1_V_write_assign_proc : process(ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_reg_325_pp0_iter1, ap_sig_108, ap_sig_118)
    begin
        if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then 
            p_dst_data_stream_1_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_dst_data_stream_2_V_blk_n_assign_proc : process(p_dst_data_stream_2_V_full_n, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_reg_325_pp0_iter1)
    begin
        if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1))) then 
            p_dst_data_stream_2_V_blk_n <= p_dst_data_stream_2_V_full_n;
        else 
            p_dst_data_stream_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_data_stream_2_V_din <= p_Val2_s_fu_270_p3;

    p_dst_data_stream_2_V_write_assign_proc : process(ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_reg_325_pp0_iter1, ap_sig_108, ap_sig_118)
    begin
        if (((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_reg_325_pp0_iter1) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then 
            p_dst_data_stream_2_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_stream_0_V_blk_n_assign_proc : process(p_src_data_stream_0_V_empty_n, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_reg_ppiten_pp0_it1, exitcond_reg_325)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0))) then 
            p_src_data_stream_0_V_blk_n <= p_src_data_stream_0_V_empty_n;
        else 
            p_src_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_data_stream_0_V_read_assign_proc : process(ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it2, exitcond_reg_325, ap_sig_108, ap_sig_118)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then 
            p_src_data_stream_0_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_stream_1_V_blk_n_assign_proc : process(p_src_data_stream_1_V_empty_n, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_reg_ppiten_pp0_it1, exitcond_reg_325)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0))) then 
            p_src_data_stream_1_V_blk_n <= p_src_data_stream_1_V_empty_n;
        else 
            p_src_data_stream_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_data_stream_1_V_read_assign_proc : process(ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it2, exitcond_reg_325, ap_sig_108, ap_sig_118)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then 
            p_src_data_stream_1_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_stream_2_V_blk_n_assign_proc : process(p_src_data_stream_2_V_empty_n, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_reg_ppiten_pp0_it1, exitcond_reg_325)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0))) then 
            p_src_data_stream_2_V_blk_n <= p_src_data_stream_2_V_empty_n;
        else 
            p_src_data_stream_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_data_stream_2_V_read_assign_proc : process(ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_reg_ppiten_pp0_it1, ap_reg_ppiten_pp0_it2, exitcond_reg_325, ap_sig_108, ap_sig_118)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_reg_325 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and ap_sig_108) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and ap_sig_118))))) then 
            p_src_data_stream_2_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_2_V_read <= ap_const_logic_0;
        end if; 
    end process;

    r_V_4_i_fu_299_p0 <= r_V_4_i_fu_299_p00(8 - 1 downto 0);
    r_V_4_i_fu_299_p00 <= std_logic_vector(resize(unsigned(p_src_data_stream_2_V_dout),29));
    r_V_4_i_fu_299_p1 <= ap_const_lv29_1322D0(22 - 1 downto 0);
    tmp_109_fu_226_p3 <= grp_fu_281_p3(21 downto 21);
    tmp_110_fu_237_p3 <= grp_fu_281_p3(29 downto 29);
    tmp_111_fu_250_p3 <= p_Val2_45_fu_244_p2(7 downto 7);
    tmp_1_i_i_i_fu_233_p1 <= std_logic_vector(resize(unsigned(tmp_109_fu_226_p3),8));
end behav;
