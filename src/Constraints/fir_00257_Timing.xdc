## Timing Constraints Section

# Primary clocks
create_clock -period 5.000 [get_ports SYSCLK_0_P]
create_clock -period 5.000 [get_ports SYSCLK_1_P]
create_clock -period 8.000 -name MGT_CLK [get_ports RCLKC_P]

# Virtual clocks

# Generated clocks
create_generated_clock -name DIMM0_UI_CLK [get_pins CORE_BD/core_wrapper_i/core_i/MemoryBuffer/dimm0_ctrl/u_core_dimm0_ctrl_0_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]
create_generated_clock -name DIMM1_UI_CLK [get_pins CORE_BD/core_wrapper_i/core_i/MemoryBuffer/dimm1_ctrl/u_core_dimm1_ctrl_0_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]
create_generated_clock -name CLK_MB [get_pins CORE_BD/core_wrapper_i/core_i/clk_wiz_1/inst/mmcm_adv_inst/CLKOUT0]
create_generated_clock -name CLK_DATA [get_pins CORE_BD/core_wrapper_i/core_i/clk_wiz_1/inst/mmcm_adv_inst/CLKOUT1]
create_generated_clock -name CLK_MGT_INIT [get_pins CORE_BD/core_wrapper_i/core_i/clk_wiz_1/inst/mmcm_adv_inst/CLKOUT2]

# Clock Groups
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks *SYSCLK_0*]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks *SYSCLK_1*]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks MGT_CLK]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks MGT*TXOUTCLK]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks MGT*RXOUTCLK]
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
#set_false_path -from [get_cells *reset*_reg* -hierarchical -filter {NAME =~ *rst_clk_wiz*}]
# Since 2018.3, *reset*_reg* are replaced by : FDRE_BSR*,FDRE_PER*
set_false_path -from [get_cells *FDRE_* -hierarchical -filter {NAME =~ *rst_clk_wiz*}]

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
set_disable_timing [get_ports SEQ_WRITE_DONE]
set_disable_timing [get_ports B34_BUFFER_SPARE*]
set_disable_timing [get_ports SDXC_PIN*]
set_disable_timing [get_ports CALIB_COMPLETE_TP13]
set_disable_timing [get_ports TP12]
set_disable_timing [get_ports TP11]

