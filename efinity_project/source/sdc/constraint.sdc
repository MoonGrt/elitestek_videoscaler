
# Efinity Interface Designer SDC
# Version: 2021.2.316
# Date: 2021-12-07 12:40

# Copyright (C) 2017 - 2021 Efinix Inc. All rights reserved.

# Device: Ti60F225
# Project: DDR3_MC
# Timing Model: C4 (preliminary)
#               NOTE: The timing data is not final

# PLL Constraints
#################
create_clock -period 10.00 io_memoryClk
create_clock -period 20.00 pll1
create_clock -period 2.50 ddr_tdqss_clk
create_clock -period 5.00 ddr_core_clk
create_clock -period 2.50 ddr_tac_clk
create_clock -waveform {0.625 1.875} -period 2.50 ddr_twd_clk
create_clock -period 20.00 pll_inst1_CLKOUT4

set_clock_groups -exclusive  -group {ddr_twd_clk} -group {io_memoryClk} -group {ddr_tac_clk} -group {ddr_tdqss_clk} - group {ddr_core_clk}

set_false_path -from [get_clocks ddr_twd_clk] -to [get_clocks ddr_core_clk]
set_false_path -from [get_clocks ddr_tac_clk] -to [get_clocks ddr_core_clk]
set_false_path -from [get_clocks ddr_tdqss_clk] -to [get_clocks ddr_core_clk]


# GPIO Constraints
####################
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {nrst}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {nrst}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {cal_done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {cal_done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {cal_pass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {cal_pass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {core_clk_rstn}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {core_clk_rstn}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {pass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {pass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {tdqss_clk_rstn}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {tdqss_clk_rstn}]

# HSIO GPIO Constraints
#########################
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~167~1}] -max 0.263 [get_ports {ddr_addr[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~167~1}] -min 0.140 [get_ports {ddr_addr[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~151~1}] -max 0.263 [get_ports {ddr_addr[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~151~1}] -min 0.140 [get_ports {ddr_addr[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~190~1}] -max 0.263 [get_ports {ddr_addr[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~190~1}] -min 0.140 [get_ports {ddr_addr[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~175~1}] -max 0.263 [get_ports {ddr_addr[3]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~175~1}] -min 0.140 [get_ports {ddr_addr[3]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~143~1}] -max 0.263 [get_ports {ddr_addr[4]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~143~1}] -min 0.140 [get_ports {ddr_addr[4]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~174~1}] -max 0.263 [get_ports {ddr_addr[5]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~174~1}] -min 0.140 [get_ports {ddr_addr[5]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~142~1}] -max 0.263 [get_ports {ddr_addr[6]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~142~1}] -min 0.140 [get_ports {ddr_addr[6]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~159~1}] -max 0.263 [get_ports {ddr_addr[7]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~159~1}] -min 0.140 [get_ports {ddr_addr[7]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~123~1}] -max 0.263 [get_ports {ddr_addr[8]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~123~1}] -min 0.140 [get_ports {ddr_addr[8]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~191~1}] -max 0.263 [get_ports {ddr_addr[9]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~191~1}] -min 0.140 [get_ports {ddr_addr[9]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~166~1}] -max 0.263 [get_ports {ddr_addr[10]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~166~1}] -min 0.140 [get_ports {ddr_addr[10]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~150~1}] -max 0.263 [get_ports {ddr_addr[11]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~150~1}] -min 0.140 [get_ports {ddr_addr[11]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~122~1}] -max 0.263 [get_ports {ddr_addr[12]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~122~1}] -min 0.140 [get_ports {ddr_addr[12]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~158~1}] -max 0.263 [get_ports {ddr_addr[13]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~158~1}] -min 0.140 [get_ports {ddr_addr[13]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~131~1}] -max 0.263 [get_ports {ddr_addr[14]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~131~1}] -min 0.140 [get_ports {ddr_addr[14]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~132~1}] -max 0.263 [get_ports {ddr_addr[15]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~132~1}] -min 0.140 [get_ports {ddr_addr[15]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~83~322}] -max 0.263 [get_ports {ddr_ba[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~83~322}] -min 0.140 [get_ports {ddr_ba[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~84~322}] -max 0.263 [get_ports {ddr_ba[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~84~322}] -min 0.140 [get_ports {ddr_ba[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~182~322}] -max 0.263 [get_ports {ddr_ba[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~182~322}] -min 0.140 [get_ports {ddr_ba[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~74~1}] -max 0.263 [get_ports {ddr_cas}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~74~1}] -min 0.140 [get_ports {ddr_cas}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~24~1}] -max 0.263 [get_ports {ddr_cke}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~24~1}] -min 0.140 [get_ports {ddr_cke}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~14~1}] -max 0.263 [get_ports {ddr_cs}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~14~1}] -min 0.140 [get_ports {ddr_cs}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~34~322}] -max 0.263 [get_ports {o_ddr_dm_lo[0] o_ddr_dm_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~34~322}] -min 0.140 [get_ports {o_ddr_dm_lo[0] o_ddr_dm_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~167~322}] -max 0.263 [get_ports {o_ddr_dm_lo[1] o_ddr_dm_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~167~322}] -min 0.140 [get_ports {o_ddr_dm_lo[1] o_ddr_dm_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~183~322}] -max 0.263 [get_ports {ddr_odt}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~183~322}] -min 0.140 [get_ports {ddr_odt}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~50~1}] -max 0.263 [get_ports {ddr_ras}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~50~1}] -min 0.140 [get_ports {ddr_ras}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~25~1}] -max 0.263 [get_ports {ddr_reset}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~25~1}] -min 0.140 [get_ports {ddr_reset}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~73~1}] -max 0.263 [get_ports {ddr_we}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~73~1}] -min 0.140 [get_ports {ddr_we}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~73~322}] -max 0.414 [get_ports {i_ddr_dq_lo[0] i_ddr_dq_hi[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~73~322}] -min 0.276 [get_ports {i_ddr_dq_lo[0] i_ddr_dq_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~75~322}] -max 0.263 [get_ports {o_ddr_dq_lo[0] o_ddr_dq_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~75~322}] -min 0.140 [get_ports {o_ddr_dq_lo[0] o_ddr_dq_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~75~322}] -max 0.263 [get_ports {o_ddr_dq_oe[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~75~322}] -min 0.140 [get_ports {o_ddr_dq_oe[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~57~322}] -max 0.414 [get_ports {i_ddr_dq_lo[1] i_ddr_dq_hi[1]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~57~322}] -min 0.276 [get_ports {i_ddr_dq_lo[1] i_ddr_dq_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~59~322}] -max 0.263 [get_ports {o_ddr_dq_lo[1] o_ddr_dq_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~59~322}] -min 0.140 [get_ports {o_ddr_dq_lo[1] o_ddr_dq_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~59~322}] -max 0.263 [get_ports {o_ddr_dq_oe[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~59~322}] -min 0.140 [get_ports {o_ddr_dq_oe[1]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~65~322}] -max 0.414 [get_ports {i_ddr_dq_lo[2] i_ddr_dq_hi[2]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~65~322}] -min 0.276 [get_ports {i_ddr_dq_lo[2] i_ddr_dq_hi[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~67~322}] -max 0.263 [get_ports {o_ddr_dq_lo[2] o_ddr_dq_hi[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~67~322}] -min 0.140 [get_ports {o_ddr_dq_lo[2] o_ddr_dq_hi[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~67~322}] -max 0.263 [get_ports {o_ddr_dq_oe[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~67~322}] -min 0.140 [get_ports {o_ddr_dq_oe[2]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~33~322}] -max 0.414 [get_ports {i_ddr_dq_lo[3] i_ddr_dq_hi[3]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~33~322}] -min 0.276 [get_ports {i_ddr_dq_lo[3] i_ddr_dq_hi[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~35~322}] -max 0.263 [get_ports {o_ddr_dq_lo[3] o_ddr_dq_hi[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~35~322}] -min 0.140 [get_ports {o_ddr_dq_lo[3] o_ddr_dq_hi[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~35~322}] -max 0.263 [get_ports {o_ddr_dq_oe[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~35~322}] -min 0.140 [get_ports {o_ddr_dq_oe[3]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~72~322}] -max 0.414 [get_ports {i_ddr_dq_lo[4] i_ddr_dq_hi[4]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~72~322}] -min 0.276 [get_ports {i_ddr_dq_lo[4] i_ddr_dq_hi[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~74~322}] -max 0.263 [get_ports {o_ddr_dq_lo[4] o_ddr_dq_hi[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~74~322}] -min 0.140 [get_ports {o_ddr_dq_lo[4] o_ddr_dq_hi[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~74~322}] -max 0.263 [get_ports {o_ddr_dq_oe[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~74~322}] -min 0.140 [get_ports {o_ddr_dq_oe[4]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~56~322}] -max 0.414 [get_ports {i_ddr_dq_lo[5] i_ddr_dq_hi[5]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~56~322}] -min 0.276 [get_ports {i_ddr_dq_lo[5] i_ddr_dq_hi[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~58~322}] -max 0.263 [get_ports {o_ddr_dq_lo[5] o_ddr_dq_hi[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~58~322}] -min 0.140 [get_ports {o_ddr_dq_lo[5] o_ddr_dq_hi[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~58~322}] -max 0.263 [get_ports {o_ddr_dq_oe[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~58~322}] -min 0.140 [get_ports {o_ddr_dq_oe[5]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~64~322}] -max 0.414 [get_ports {i_ddr_dq_lo[6] i_ddr_dq_hi[6]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~64~322}] -min 0.276 [get_ports {i_ddr_dq_lo[6] i_ddr_dq_hi[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~66~322}] -max 0.263 [get_ports {o_ddr_dq_lo[6] o_ddr_dq_hi[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~66~322}] -min 0.140 [get_ports {o_ddr_dq_lo[6] o_ddr_dq_hi[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~66~322}] -max 0.263 [get_ports {o_ddr_dq_oe[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~66~322}] -min 0.140 [get_ports {o_ddr_dq_oe[6]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~25~322}] -max 0.414 [get_ports {i_ddr_dq_lo[7] i_ddr_dq_hi[7]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~25~322}] -min 0.276 [get_ports {i_ddr_dq_lo[7] i_ddr_dq_hi[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~27~322}] -max 0.263 [get_ports {o_ddr_dq_lo[7] o_ddr_dq_hi[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~27~322}] -min 0.140 [get_ports {o_ddr_dq_lo[7] o_ddr_dq_hi[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~27~322}] -max 0.263 [get_ports {o_ddr_dq_oe[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~27~322}] -min 0.140 [get_ports {o_ddr_dq_oe[7]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~129~322}] -max 0.414 [get_ports {i_ddr_dq_lo[8] i_ddr_dq_hi[8]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~129~322}] -min 0.276 [get_ports {i_ddr_dq_lo[8] i_ddr_dq_hi[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~131~322}] -max 0.263 [get_ports {o_ddr_dq_lo[8] o_ddr_dq_hi[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~131~322}] -min 0.140 [get_ports {o_ddr_dq_lo[8] o_ddr_dq_hi[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~131~322}] -max 0.263 [get_ports {o_ddr_dq_oe[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~131~322}] -min 0.140 [get_ports {o_ddr_dq_oe[8]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~130~322}] -max 0.414 [get_ports {i_ddr_dq_lo[9] i_ddr_dq_hi[9]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~130~322}] -min 0.276 [get_ports {i_ddr_dq_lo[9] i_ddr_dq_hi[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~132~322}] -max 0.263 [get_ports {o_ddr_dq_lo[9] o_ddr_dq_hi[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~132~322}] -min 0.140 [get_ports {o_ddr_dq_lo[9] o_ddr_dq_hi[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~132~322}] -max 0.263 [get_ports {o_ddr_dq_oe[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~132~322}] -min 0.140 [get_ports {o_ddr_dq_oe[9]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~141~322}] -max 0.414 [get_ports {i_ddr_dq_lo[10] i_ddr_dq_hi[10]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~141~322}] -min 0.276 [get_ports {i_ddr_dq_lo[10] i_ddr_dq_hi[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~143~322}] -max 0.263 [get_ports {o_ddr_dq_lo[10] o_ddr_dq_hi[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~143~322}] -min 0.140 [get_ports {o_ddr_dq_lo[10] o_ddr_dq_hi[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~143~322}] -max 0.263 [get_ports {o_ddr_dq_oe[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~143~322}] -min 0.140 [get_ports {o_ddr_dq_oe[10]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~157~322}] -max 0.414 [get_ports {i_ddr_dq_lo[11] i_ddr_dq_hi[11]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~157~322}] -min 0.276 [get_ports {i_ddr_dq_lo[11] i_ddr_dq_hi[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~159~322}] -max 0.263 [get_ports {o_ddr_dq_lo[11] o_ddr_dq_hi[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~159~322}] -min 0.140 [get_ports {o_ddr_dq_lo[11] o_ddr_dq_hi[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~159~322}] -max 0.263 [get_ports {o_ddr_dq_oe[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~159~322}] -min 0.140 [get_ports {o_ddr_dq_oe[11]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~164~322}] -max 0.414 [get_ports {i_ddr_dq_lo[12] i_ddr_dq_hi[12]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~164~322}] -min 0.276 [get_ports {i_ddr_dq_lo[12] i_ddr_dq_hi[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~166~322}] -max 0.263 [get_ports {o_ddr_dq_lo[12] o_ddr_dq_hi[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~166~322}] -min 0.140 [get_ports {o_ddr_dq_lo[12] o_ddr_dq_hi[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~166~322}] -max 0.263 [get_ports {o_ddr_dq_oe[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~166~322}] -min 0.140 [get_ports {o_ddr_dq_oe[12]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~148~322}] -max 0.414 [get_ports {i_ddr_dq_lo[13] i_ddr_dq_hi[13]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~148~322}] -min 0.276 [get_ports {i_ddr_dq_lo[13] i_ddr_dq_hi[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~150~322}] -max 0.263 [get_ports {o_ddr_dq_lo[13] o_ddr_dq_hi[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~150~322}] -min 0.140 [get_ports {o_ddr_dq_lo[13] o_ddr_dq_hi[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~150~322}] -max 0.263 [get_ports {o_ddr_dq_oe[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~150~322}] -min 0.140 [get_ports {o_ddr_dq_oe[13]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~140~322}] -max 0.414 [get_ports {i_ddr_dq_lo[14] i_ddr_dq_hi[14]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~140~322}] -min 0.276 [get_ports {i_ddr_dq_lo[14] i_ddr_dq_hi[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~142~322}] -max 0.263 [get_ports {o_ddr_dq_lo[14] o_ddr_dq_hi[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~142~322}] -min 0.140 [get_ports {o_ddr_dq_lo[14] o_ddr_dq_hi[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~142~322}] -max 0.263 [get_ports {o_ddr_dq_oe[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~142~322}] -min 0.140 [get_ports {o_ddr_dq_oe[14]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~149~322}] -max 0.414 [get_ports {i_ddr_dq_lo[15] i_ddr_dq_hi[15]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~149~322}] -min 0.276 [get_ports {i_ddr_dq_lo[15] i_ddr_dq_hi[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~151~322}] -max 0.263 [get_ports {o_ddr_dq_lo[15] o_ddr_dq_hi[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~151~322}] -min 0.140 [get_ports {o_ddr_dq_lo[15] o_ddr_dq_hi[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~151~322}] -max 0.263 [get_ports {o_ddr_dq_oe[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~151~322}] -min 0.140 [get_ports {o_ddr_dq_oe[15]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~48~322}] -max 0.414 [get_ports {i_ddr_dqs_lo[0] i_ddr_dqs_hi[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~48~322}] -min 0.276 [get_ports {i_ddr_dqs_lo[0] i_ddr_dqs_hi[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~50~322}] -max 0.263 [get_ports {o_ddr_dqs_lo[0] o_ddr_dqs_hi[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~50~322}] -min 0.140 [get_ports {o_ddr_dqs_lo[0] o_ddr_dqs_hi[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~50~322}] -max 0.263 [get_ports {o_ddr_dqs_oe[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~50~322}] -min 0.140 [get_ports {o_ddr_dqs_oe[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~51~322}] -max 0.263 [get_ports {o_ddr_dqs_n_oe[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~51~322}] -min 0.140 [get_ports {o_ddr_dqs_n_oe[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~120~322}] -max 0.414 [get_ports {i_ddr_dqs_lo[1] i_ddr_dqs_hi[1]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~120~322}] -min 0.276 [get_ports {i_ddr_dqs_lo[1] i_ddr_dqs_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~122~322}] -max 0.263 [get_ports {o_ddr_dqs_lo[1] o_ddr_dqs_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~122~322}] -min 0.140 [get_ports {o_ddr_dqs_lo[1] o_ddr_dqs_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~122~322}] -max 0.263 [get_ports {o_ddr_dqs_oe[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~122~322}] -min 0.140 [get_ports {o_ddr_dqs_oe[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~123~322}] -max 0.263 [get_ports {o_ddr_dqs_n_oe[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~123~322}] -min 0.140 [get_ports {o_ddr_dqs_n_oe[1]}]

# Clockout Interface
######################
# core_clk_out -clock core_clk -reference_pin [get_ports {core_clk~CLKOUT~5~1}]
# dqss_clk_out -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~209~1}]
# addr[0] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~167~1}]
# addr[10] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~166~1}]
# addr[11] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~150~1}]
# addr[12] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~122~1}]
# addr[13] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~158~1}]
# addr[14] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~131~1}]
# addr[15] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~132~1}]
# addr[1] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~151~1}]
# addr[2] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~190~1}]
# addr[3] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~175~1}]
# addr[4] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~143~1}]
# addr[5] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~174~1}]
# addr[6] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~142~1}]
# addr[7] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~159~1}]
# addr[8] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~123~1}]
# addr[9] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~191~1}]
# ba[0] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~83~322}]
# ba[1] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~84~322}]
# ba[2] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~182~322}]
# cas -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~74~1}]
# cke -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~24~1}]
# cs -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~14~1}]
# dm[0] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~34~322}]
# dm[1] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~167~322}]
# dq[0] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~73~322}]
# dq[0] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~75~322}]
# dq[10] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~141~322}]
# dq[10] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~143~322}]
# dq[11] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~157~322}]
# dq[11] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~159~322}]
# dq[12] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~164~322}]
# dq[12] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~166~322}]
# dq[13] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~148~322}]
# dq[13] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~150~322}]
# dq[14] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~140~322}]
# dq[14] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~142~322}]
# dq[15] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~149~322}]
# dq[15] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~151~322}]
# dq[1] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~57~322}]
# dq[1] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~59~322}]
# dq[2] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~65~322}]
# dq[2] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~67~322}]
# dq[3] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~33~322}]
# dq[3] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~35~322}]
# dq[4] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~72~322}]
# dq[4] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~74~322}]
# dq[5] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~56~322}]
# dq[5] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~58~322}]
# dq[6] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~64~322}]
# dq[6] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~66~322}]
# dq[7] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~25~322}]
# dq[7] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~27~322}]
# dq[8] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~129~322}]
# dq[8] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~131~322}]
# dq[9] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~130~322}]
# dq[9] -clock twd_clk -reference_pin [get_ports {twd_clk~CLKOUT~132~322}]
# dqs[0] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~48~322}]
# dqs[0] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~50~322}]
# dqs[0] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~51~322}]
# dqs[1] -clock tac_clk -reference_pin [get_ports {tac_clk~CLKOUT~120~322}]
# dqs[1] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~122~322}]
# dqs[1] -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~123~322}]
# odt -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~183~322}]
# ras -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~50~1}]
# reset -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~25~1}]
# we -clock tdqss_clk -reference_pin [get_ports {tdqss_clk~CLKOUT~73~1}]
