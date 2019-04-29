## Physical Constraints Section
# located anywhere in the file, preferably before or after the timing constraints
# or stored in a separate constraint file

############### DEVICE PARAMETER ##################
set_operating_conditions -grade industrial
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 12 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.5 [current_design]


############### DCI ###############################
set_property DCI_CASCADE {32 34} [get_iobanks 33]

### Internal Vref for Banks 14 and 33 (using SSTL inputs) ###
set_property INTERNAL_VREF 0.75 [get_iobanks 14]
set_property INTERNAL_VREF 0.75 [get_iobanks 33]

####################### Sys clocks #######################
set_property PACKAGE_PIN C12 [get_ports SYSCLK_0_P]
set_property PACKAGE_PIN C11 [get_ports SYSCLK_0_N]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYSCLK_0_P]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYSCLK_0_N]
set_property DIFF_TERM FALSE [get_ports SYSCLK_0_P]
set_property DIFF_TERM FALSE [get_ports SYSCLK_0_N]

set_property PACKAGE_PIN AB11 [get_ports SYSCLK_1_P]
set_property PACKAGE_PIN AC11 [get_ports SYSCLK_1_N]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYSCLK_1_P]
set_property DIFF_TERM FALSE [get_ports SYSCLK_1_P]

####################### GT reference clock LOC #######################
set_property PACKAGE_PIN H6 [get_ports RCLKC_P]
#set_property PACKAGE_PIN H5 [get_ports RCLKC_N]

############################### GT LOC ###################################

set_property PACKAGE_PIN P1 [get_ports {TO_PROC_N[0]}]
set_property PACKAGE_PIN M1 [get_ports {TO_PROC_N[1]}]

################### PROM  ##############################
set_property PACKAGE_PIN B24 [get_ports {PROM_QSPI[0]}]
set_property PACKAGE_PIN A25 [get_ports {PROM_QSPI[1]}]
set_property PACKAGE_PIN B22 [get_ports {PROM_QSPI[2]}]
set_property PACKAGE_PIN A22 [get_ports {PROM_QSPI[3]}]
set_property PACKAGE_PIN C23 [get_ports FCS_B]
#set_property PACKAGE_PIN C8 [get_ports PROM_SCLK]

set_property IOSTANDARD LVCMOS15 [get_ports {PROM_QSPI[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {PROM_QSPI[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {PROM_QSPI[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {PROM_QSPI[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports FCS_B]


################### FPGA COM ######################
set_property PACKAGE_PIN AD10 [get_ports UART_TX]
set_property PACKAGE_PIN AE10 [get_ports UART_RX]
set_property IOSTANDARD SSTL15 [get_ports UART_TX]
set_property IOSTANDARD SSTL15 [get_ports UART_RX]

################### I2C  ###########################
set_property PACKAGE_PIN W26 [get_ports I2C_SCL]
set_property PACKAGE_PIN V21 [get_ports I2C_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SDA]

################### SMB  ###########################
set_property PACKAGE_PIN AA24 [get_ports SMB_CLK]
set_property PACKAGE_PIN Y23 [get_ports SMB_DAT]
set_property PACKAGE_PIN AB24 [get_ports SMB_NALERT]
set_property IOSTANDARD LVCMOS33 [get_ports SMB_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports SMB_DAT]
set_property IOSTANDARD LVCMOS33 [get_ports SMB_NALERT]



################### DIMM  ###########################
set_property PACKAGE_PIN AD21 [get_ports DIMM0_TEMP_EVENTN]
set_property PACKAGE_PIN AC21 [get_ports DIMM1_TEMP_EVENTN]
set_property IOSTANDARD LVCMOS33 [get_ports DIMM0_TEMP_EVENTN]
set_property IOSTANDARD LVCMOS33 [get_ports DIMM1_TEMP_EVENTN]

################### BUFFERING  ###########################
set_property PACKAGE_PIN A23 [get_ports WATER_LEVEL]
set_property PACKAGE_PIN A24 [get_ports MOI]
set_property IOSTANDARD SSTL15 [get_ports WATER_LEVEL]
set_property IOSTANDARD SSTL15 [get_ports MOI]


################### B32 BUFFER SPARE  ###########################
##WARNING: B32_BUFFER_SPARE_8 are connected on a bank at 1.8V on Output FPGA
#set_property PACKAGE_PIN AF10 [get_ports B32_BUFFER_SPARE_8_P]
#set_property PACKAGE_PIN AF9 [get_ports B32_BUFFER_SPARE_8_N]
#set_property PACKAGE_PIN E13 [get_ports B32_BUFFER_SPARE_9_P]
#set_property PACKAGE_PIN E12 [get_ports B32_BUFFER_SPARE_9_N]
#set_property PACKAGE_PIN B10 [get_ports B32_BUFFER_SPARE_10_P]
#set_property PACKAGE_PIN A10 [get_ports B32_BUFFER_SPARE_10_N]
#set_property PACKAGE_PIN C14 [get_ports B32_BUFFER_SPARE_11_P]
#set_property PACKAGE_PIN C13 [get_ports B32_BUFFER_SPARE_11_N]
#set_property PACKAGE_PIN B15 [get_ports B32_BUFFER_SPARE_12_P]
#set_property PACKAGE_PIN A15 [get_ports B32_BUFFER_SPARE_12_N]
#set_property PACKAGE_PIN B12 [get_ports B32_BUFFER_SPARE_13_P]
#set_property PACKAGE_PIN B11 [get_ports B32_BUFFER_SPARE_13_N]
#set_property PACKAGE_PIN A13 [get_ports B32_BUFFER_SPARE_14_P]
#set_property PACKAGE_PIN A12 [get_ports B32_BUFFER_SPARE_14_N]

################### B34 BUFFER SPARE  ###########################
set_property PACKAGE_PIN AE12 [get_ports B34_BUFFER_SPARE_2_P]
set_property PACKAGE_PIN AF12 [get_ports B34_BUFFER_SPARE_2_N]
set_property PACKAGE_PIN D26 [get_ports B34_BUFFER_SPARE_3_P]
set_property PACKAGE_PIN C26 [get_ports B34_BUFFER_SPARE_3_N]
set_property PACKAGE_PIN AE8 [get_ports B34_BUFFER_SPARE_4_P]
set_property PACKAGE_PIN AF8 [get_ports B34_BUFFER_SPARE_4_N]
set_property PACKAGE_PIN L22 [get_ports B34_BUFFER_SPARE_5_P]
set_property PACKAGE_PIN K22 [get_ports B34_BUFFER_SPARE_5_N]
set_property PACKAGE_PIN AE13 [get_ports B34_BUFFER_SPARE_6_P]
set_property PACKAGE_PIN AF13 [get_ports B34_BUFFER_SPARE_6_N]
set_property PACKAGE_PIN K23 [get_ports B34_BUFFER_SPARE_7_P]
set_property PACKAGE_PIN J23 [get_ports B34_BUFFER_SPARE_7_N]
set_property IOSTANDARD SSTL15 [get_ports B34_BUFFER_SPARE*]

################### SDXC  ###########################
set_property PACKAGE_PIN AE26 [get_ports SDXC_PIN1]
set_property PACKAGE_PIN AE23 [get_ports SDXC_PIN3]
set_property PACKAGE_PIN AF23 [get_ports SDXC_PIN5]
set_property PACKAGE_PIN AD25 [get_ports SDXC_PIN7]
set_property PACKAGE_PIN AD26 [get_ports SDXC_PIN8]
set_property PACKAGE_PIN AE25 [get_ports SDXC_PIN9]
set_property PACKAGE_PIN AF25 [get_ports SDXC_PIN10]
set_property PACKAGE_PIN AE22 [get_ports SDXC_PIN11]
set_property PACKAGE_PIN AF22 [get_ports SDXC_PIN13]
set_property PACKAGE_PIN Y20 [get_ports SDXC_PIN15]
set_property IOSTANDARD LVCMOS33 [get_ports SDXC_PIN*]

################### OTHERS  ###########################
set_property PACKAGE_PIN AB21 [get_ports CALIB_COMPLETE_TP13]
set_property IOSTANDARD LVCMOS33 [get_ports CALIB_COMPLETE_TP13]

set_property PACKAGE_PIN AB22 [get_ports TP12]
set_property IOSTANDARD LVCMOS33 [get_ports TP12]

set_property PACKAGE_PIN AA25 [get_ports TP11]
set_property IOSTANDARD LVCMOS33 [get_ports TP11]

