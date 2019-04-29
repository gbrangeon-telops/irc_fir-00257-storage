## Timing Constraints Section

# Primary clocks
create_clock -period 5.000 [get_ports SYSCLK_0_P]
create_clock -period 5.000 [get_ports SYSCLK_1_P]
create_clock -period 8.000 -name MGT_CLK [get_ports RCLKC_P]
create_clock -period 10.000 [get_pins MGT/MGT/EXP/U0/gt_wrapper_i/exp_mgt_multi_gt_i/gt0_exp_mgt_i/gtxe2_i/TXOUTCLK]
create_clock -period 10.000 -name DIMM0_UI_CLK [get_pins CORE_BD/core_wrapper_i/core_i/MemoryBuffer/dimm0_ctrl/u_core_mig_7series_0_0_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]
create_clock -period 10.000 -name DIMM1_UI_CLK [get_pins CORE_BD/core_wrapper_i/core_i/MemoryBuffer/dimm1_ctrl/u_core_mig_7series_0_1_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]
create_clock -period 10.000 -name CLK_MB [get_pins CORE_BD/core_wrapper_i/core_i/clk_wiz_1/inst/clk_out1]
create_clock -period 11.764 -name CLK_DATA [get_pins CORE_BD/core_wrapper_i/core_i/clk_wiz_1/inst/clk_out2]
create_clock -period 20.000 -name CLK_MGT_INIT [get_pins CORE_BD/core_wrapper_i/core_i/clk_wiz_1/inst/clk_out3]

# Virtual clocks

# Generated clocks

# Clock Groups
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks *SYSCLK_0*]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks *SYSCLK_1*]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks MGT_CLK]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks *MGT*TXOUTCLK*]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks DIMM0_UI_CLK]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks DIMM1_UI_CLK]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks CLK_MB]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks CLK_DATA]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks CLK_MGT_INIT]

# Input and output delay constraints
#[get_ports {PROM_QSPI*}]
#[get_ports FCS_B]

## Timing Exceptions Section

# False Paths
set_false_path -from [get_cells *reset*_reg* -hierarchical -filter {NAME =~ *rst_clk_wiz*}]

# Max Delay / Min Delay

# Multicycle Paths

# Case Analysis

# Disable Timing
set_disable_timing [get_ports UART_TX]
set_disable_timing [get_ports UART_RX]
set_disable_timing [get_ports I2C_SCL]
set_disable_timing [get_ports I2C_SDA]
set_disable_timing [get_ports SMB_CLK]
set_disable_timing [get_ports SMB_DAT]
set_disable_timing [get_ports SMB_NALERT]
set_disable_timing [get_ports DIMM0_TEMP_EVENTN]
set_disable_timing [get_ports DIMM1_TEMP_EVENTN]
set_disable_timing [get_ports WATER_LEVEL]
set_disable_timing [get_ports MOI]
set_disable_timing [get_ports B34_BUFFER_SPARE*]
set_disable_timing [get_ports SDXC_PIN*]
set_disable_timing [get_ports CALIB_COMPLETE_TP13]
set_disable_timing [get_ports TP12]
set_disable_timing [get_ports TP11]

