## Timing Assertions Section

# Primary clocks
create_clock -name SYSCLK_0_P -period 5.000 [get_ports SYSCLK_0_P]
create_clock -name SYSCLK_1_P -period 5.000 [get_ports SYSCLK_1_P]
create_clock -name MGT_CLK -period 8.000 [get_ports RCLKC_P]

# Virtual clocks

# Generated clocks

# Clock Groups
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks SYSCLK_0_P]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks SYSCLK_1_P]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks MGT_CLK]

# Input and output delay constraints

## Timing Exceptions Section

# False Paths
# set_false_path -from [get_clocks clk_out1_core_clk_wiz_1*] -to [get_clocks clk_out2_core_clk_wiz_1*]
# set_false_path -from [get_clocks clk_out1_core_clk_wiz_1*] -to [get_clocks clk_out3_core_clk_wiz_1*]
# set_false_path -from [get_clocks clk_out2_core_clk_wiz_1*] -to [get_clocks clk_out1_core_clk_wiz_1*]
# set_false_path -from [get_clocks clk_out2_core_clk_wiz_1*] -to [get_clocks clk_out3_core_clk_wiz_1*]
# set_false_path -from [get_clocks clk_out3_core_clk_wiz_1*] -to [get_clocks clk_out1_core_clk_wiz_1*]
# set_false_path -from [get_clocks clk_out3_core_clk_wiz_1*] -to [get_clocks clk_out2_core_clk_wiz_1*]

# set_false_path -from [get_cells *reset*_reg* -hierarchical -filter {NAME =~ *rst_clk_wiz*}]

# Max Delay / Min Delay

# Multicycle Paths

# Case Analysis

# Disable Timing


