-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filt_Block_codeRepl7882_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    wrk_src_mat_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    wrk_src_mat_data_stream_0_V_empty_n : IN STD_LOGIC;
    wrk_src_mat_data_stream_0_V_read : OUT STD_LOGIC;
    wrk_src_mat_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    wrk_src_mat_data_stream_1_V_empty_n : IN STD_LOGIC;
    wrk_src_mat_data_stream_1_V_read : OUT STD_LOGIC;
    wrk_src_mat_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    wrk_src_mat_data_stream_2_V_empty_n : IN STD_LOGIC;
    wrk_src_mat_data_stream_2_V_read : OUT STD_LOGIC;
    wrk_mats_0_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_0_data_stream_0_V_full_n : IN STD_LOGIC;
    wrk_mats_0_data_stream_0_V_write : OUT STD_LOGIC;
    wrk_mats_0_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_0_data_stream_1_V_full_n : IN STD_LOGIC;
    wrk_mats_0_data_stream_1_V_write : OUT STD_LOGIC;
    wrk_mats_0_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_0_data_stream_2_V_full_n : IN STD_LOGIC;
    wrk_mats_0_data_stream_2_V_write : OUT STD_LOGIC;
    wrk_mats_1_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_1_data_stream_0_V_full_n : IN STD_LOGIC;
    wrk_mats_1_data_stream_0_V_write : OUT STD_LOGIC;
    wrk_mats_1_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_1_data_stream_1_V_full_n : IN STD_LOGIC;
    wrk_mats_1_data_stream_1_V_write : OUT STD_LOGIC;
    wrk_mats_1_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_1_data_stream_2_V_full_n : IN STD_LOGIC;
    wrk_mats_1_data_stream_2_V_write : OUT STD_LOGIC;
    sel_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    sel_empty_n : IN STD_LOGIC;
    sel_read : OUT STD_LOGIC;
    sel_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    sel_out_full_n : IN STD_LOGIC;
    sel_out_write : OUT STD_LOGIC;
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of filt_Block_codeRepl7882_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_20 : BOOLEAN;
    signal sel_blk_n : STD_LOGIC;
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_78 : BOOLEAN;
    signal sel_out_blk_n : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_ap_start : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_ap_done : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_ap_idle : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_ap_ready : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_src_data_stream_0_V_read : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_src_data_stream_1_V_read : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_src_data_stream_2_V_read : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_write : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_write : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_write : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_write : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_write : STD_LOGIC;
    signal grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_write : STD_LOGIC;
    signal ap_reg_grp_filt_Duplicate_fu_54_ap_start : STD_LOGIC := '0';
    signal ap_sig_119 : BOOLEAN;
    signal ap_sig_126 : BOOLEAN;
    signal tmp_102_out_fu_76_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component filt_Duplicate IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_data_stream_0_V_empty_n : IN STD_LOGIC;
        src_data_stream_0_V_read : OUT STD_LOGIC;
        src_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_data_stream_1_V_empty_n : IN STD_LOGIC;
        src_data_stream_1_V_read : OUT STD_LOGIC;
        src_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_data_stream_2_V_empty_n : IN STD_LOGIC;
        src_data_stream_2_V_read : OUT STD_LOGIC;
        dst1_0_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst1_0_data_stream_V_full_n : IN STD_LOGIC;
        dst1_0_data_stream_V_write : OUT STD_LOGIC;
        dst1_1_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst1_1_data_stream_V_full_n : IN STD_LOGIC;
        dst1_1_data_stream_V_write : OUT STD_LOGIC;
        dst1_2_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst1_2_data_stream_V_full_n : IN STD_LOGIC;
        dst1_2_data_stream_V_write : OUT STD_LOGIC;
        dst2_0_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst2_0_data_stream_V_full_n : IN STD_LOGIC;
        dst2_0_data_stream_V_write : OUT STD_LOGIC;
        dst2_1_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst2_1_data_stream_V_full_n : IN STD_LOGIC;
        dst2_1_data_stream_V_write : OUT STD_LOGIC;
        dst2_2_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst2_2_data_stream_V_full_n : IN STD_LOGIC;
        dst2_2_data_stream_V_write : OUT STD_LOGIC );
    end component;



begin
    grp_filt_Duplicate_fu_54 : component filt_Duplicate
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_filt_Duplicate_fu_54_ap_start,
        ap_done => grp_filt_Duplicate_fu_54_ap_done,
        ap_idle => grp_filt_Duplicate_fu_54_ap_idle,
        ap_ready => grp_filt_Duplicate_fu_54_ap_ready,
        src_data_stream_0_V_dout => wrk_src_mat_data_stream_0_V_dout,
        src_data_stream_0_V_empty_n => wrk_src_mat_data_stream_0_V_empty_n,
        src_data_stream_0_V_read => grp_filt_Duplicate_fu_54_src_data_stream_0_V_read,
        src_data_stream_1_V_dout => wrk_src_mat_data_stream_1_V_dout,
        src_data_stream_1_V_empty_n => wrk_src_mat_data_stream_1_V_empty_n,
        src_data_stream_1_V_read => grp_filt_Duplicate_fu_54_src_data_stream_1_V_read,
        src_data_stream_2_V_dout => wrk_src_mat_data_stream_2_V_dout,
        src_data_stream_2_V_empty_n => wrk_src_mat_data_stream_2_V_empty_n,
        src_data_stream_2_V_read => grp_filt_Duplicate_fu_54_src_data_stream_2_V_read,
        dst1_0_data_stream_V_din => grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_din,
        dst1_0_data_stream_V_full_n => wrk_mats_0_data_stream_0_V_full_n,
        dst1_0_data_stream_V_write => grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_write,
        dst1_1_data_stream_V_din => grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_din,
        dst1_1_data_stream_V_full_n => wrk_mats_0_data_stream_1_V_full_n,
        dst1_1_data_stream_V_write => grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_write,
        dst1_2_data_stream_V_din => grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_din,
        dst1_2_data_stream_V_full_n => wrk_mats_0_data_stream_2_V_full_n,
        dst1_2_data_stream_V_write => grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_write,
        dst2_0_data_stream_V_din => grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_din,
        dst2_0_data_stream_V_full_n => wrk_mats_1_data_stream_0_V_full_n,
        dst2_0_data_stream_V_write => grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_write,
        dst2_1_data_stream_V_din => grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_din,
        dst2_1_data_stream_V_full_n => wrk_mats_1_data_stream_1_V_full_n,
        dst2_1_data_stream_V_write => grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_write,
        dst2_2_data_stream_V_din => grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_din,
        dst2_2_data_stream_V_full_n => wrk_mats_1_data_stream_2_V_full_n,
        dst2_2_data_stream_V_write => grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_write);





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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done))))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_filt_Duplicate_fu_54_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_filt_Duplicate_fu_54_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_119))) then 
                    ap_reg_grp_filt_Duplicate_fu_54_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_filt_Duplicate_fu_54_ap_ready)) then 
                    ap_reg_grp_filt_Duplicate_fu_54_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv1_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done))))) then 
                    ap_return_preg <= tmp_102_out_fu_76_p2;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_CS_fsm, grp_filt_Duplicate_fu_54_ap_done, ap_sig_119, ap_sig_126)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_119)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done)))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    ap_done_assign_proc : process(ap_done_reg, ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_ap_done, ap_sig_126)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done)))))) then 
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


    ap_ready_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_ap_done, ap_sig_126)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done))))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_ap_done, ap_sig_126, tmp_102_out_fu_76_p2, ap_return_preg)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done))))) then 
            ap_return <= tmp_102_out_fu_76_p2;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;


    ap_sig_119_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_119 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_sig_126_assign_proc : process(sel_empty_n, sel_out_full_n)
    begin
                ap_sig_126 <= ((sel_empty_n = ap_const_logic_0) or (sel_out_full_n = ap_const_logic_0));
    end process;


    ap_sig_20_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_20 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_78_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_78 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_20)
    begin
        if (ap_sig_20) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_78)
    begin
        if (ap_sig_78) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;

    grp_filt_Duplicate_fu_54_ap_start <= ap_reg_grp_filt_Duplicate_fu_54_ap_start;

    sel_blk_n_assign_proc : process(sel_empty_n, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            sel_blk_n <= sel_empty_n;
        else 
            sel_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    sel_out_blk_n_assign_proc : process(sel_out_full_n, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            sel_out_blk_n <= sel_out_full_n;
        else 
            sel_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    sel_out_din <= sel_dout;

    sel_out_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_ap_done, ap_sig_126)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done))))) then 
            sel_out_write <= ap_const_logic_1;
        else 
            sel_out_write <= ap_const_logic_0;
        end if; 
    end process;


    sel_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_ap_done, ap_sig_126)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_sig_126 or (ap_const_logic_0 = grp_filt_Duplicate_fu_54_ap_done))))) then 
            sel_read <= ap_const_logic_1;
        else 
            sel_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_102_out_fu_76_p2 <= "1" when (sel_dout = ap_const_lv32_0) else "0";
    wrk_mats_0_data_stream_0_V_din <= grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_din;

    wrk_mats_0_data_stream_0_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_0_data_stream_0_V_write <= grp_filt_Duplicate_fu_54_dst1_0_data_stream_V_write;
        else 
            wrk_mats_0_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_0_data_stream_1_V_din <= grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_din;

    wrk_mats_0_data_stream_1_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_0_data_stream_1_V_write <= grp_filt_Duplicate_fu_54_dst1_1_data_stream_V_write;
        else 
            wrk_mats_0_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_0_data_stream_2_V_din <= grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_din;

    wrk_mats_0_data_stream_2_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_0_data_stream_2_V_write <= grp_filt_Duplicate_fu_54_dst1_2_data_stream_V_write;
        else 
            wrk_mats_0_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_1_data_stream_0_V_din <= grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_din;

    wrk_mats_1_data_stream_0_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_1_data_stream_0_V_write <= grp_filt_Duplicate_fu_54_dst2_0_data_stream_V_write;
        else 
            wrk_mats_1_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_1_data_stream_1_V_din <= grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_din;

    wrk_mats_1_data_stream_1_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_1_data_stream_1_V_write <= grp_filt_Duplicate_fu_54_dst2_1_data_stream_V_write;
        else 
            wrk_mats_1_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_1_data_stream_2_V_din <= grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_din;

    wrk_mats_1_data_stream_2_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_1_data_stream_2_V_write <= grp_filt_Duplicate_fu_54_dst2_2_data_stream_V_write;
        else 
            wrk_mats_1_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;


    wrk_src_mat_data_stream_0_V_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_src_data_stream_0_V_read)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_src_mat_data_stream_0_V_read <= grp_filt_Duplicate_fu_54_src_data_stream_0_V_read;
        else 
            wrk_src_mat_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    wrk_src_mat_data_stream_1_V_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_src_data_stream_1_V_read)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_src_mat_data_stream_1_V_read <= grp_filt_Duplicate_fu_54_src_data_stream_1_V_read;
        else 
            wrk_src_mat_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;


    wrk_src_mat_data_stream_2_V_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_Duplicate_fu_54_src_data_stream_2_V_read)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_src_mat_data_stream_2_V_read <= grp_filt_Duplicate_fu_54_src_data_stream_2_V_read;
        else 
            wrk_src_mat_data_stream_2_V_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
