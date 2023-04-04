
################################################################
# This is a generated script based on design: core
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source core_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k160tfbg676-1
}


# CHANGE DESIGN NAME HERE
set design_name core

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}


##################################################################
# MIG PRJ FILE TCL PROCs
##################################################################

proc write_mig_file_core_dimm0_ctrl_0 { str_mig_prj_filepath } {

   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {<?xml version='1.0' encoding='UTF-8'?>}
   puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
   puts $mig_prj_file {<Project NoOfControllers="1" >}
   puts $mig_prj_file {    <ModuleName>core_dimm0_ctrl_0</ModuleName>}
   puts $mig_prj_file {    <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {    <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {    <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {    <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {    <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {    <XADC_En>Disabled</XADC_En>}
   puts $mig_prj_file {    <TargetFPGA>xc7k160t-fbg676/-1</TargetFPGA>}
   puts $mig_prj_file {    <Version>4.0</Version>}
   puts $mig_prj_file {    <SystemClock>Differential</SystemClock>}
   puts $mig_prj_file {    <ReferenceClock>Use System Clock</ReferenceClock>}
   puts $mig_prj_file {    <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
   puts $mig_prj_file {    <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {    <InternalVref>0</InternalVref>}
   puts $mig_prj_file {    <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {    <dci_cascade>1</dci_cascade>}
   puts $mig_prj_file {    <Controller number="0" >}
   puts $mig_prj_file {        <MemoryDevice>DDR3_SDRAM/SODIMMs/MT16KTF51264HZ-1G4</MemoryDevice>}
   puts $mig_prj_file {        <TimePeriod>2500</TimePeriod>}
   puts $mig_prj_file {        <VccAuxIO>1.8V</VccAuxIO>}
   puts $mig_prj_file {        <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {        <InputClkFreq>200</InputClkFreq>}
   puts $mig_prj_file {        <UIExtraClocks>0</UIExtraClocks>}
   puts $mig_prj_file {        <MMCM_VCO>800</MMCM_VCO>}
   puts $mig_prj_file {        <MMCMClkOut0> 1.000</MMCMClkOut0>}
   puts $mig_prj_file {        <MMCMClkOut1>1</MMCMClkOut1>}
   puts $mig_prj_file {        <MMCMClkOut2>1</MMCMClkOut2>}
   puts $mig_prj_file {        <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {        <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {        <DataWidth>64</DataWidth>}
   puts $mig_prj_file {        <DeepMemory>2</DeepMemory>}
   puts $mig_prj_file {        <DataMask>1</DataMask>}
   puts $mig_prj_file {        <ECC>Disabled</ECC>}
   puts $mig_prj_file {        <Ordering>Normal</Ordering>}
   puts $mig_prj_file {        <BankMachineCnt>4</BankMachineCnt>}
   puts $mig_prj_file {        <CustomPart>TRUE</CustomPart>}
   puts $mig_prj_file {        <NewPartName>16GB</NewPartName>}
   puts $mig_prj_file {        <RowAddress>16</RowAddress>}
   puts $mig_prj_file {        <ColAddress>11</ColAddress>}
   puts $mig_prj_file {        <BankAddress>3</BankAddress>}
   puts $mig_prj_file {        <MemoryVoltage>1.5V</MemoryVoltage>}
   puts $mig_prj_file {        <C0_MEM_SIZE>17179869184</C0_MEM_SIZE>}
   puts $mig_prj_file {        <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {        <PinSelection>}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F24" SLEW="" name="ddr3_addr[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E22" SLEW="" name="ddr3_addr[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E21" SLEW="" name="ddr3_addr[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="A20" SLEW="" name="ddr3_addr[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="B20" SLEW="" name="ddr3_addr[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="C22" SLEW="" name="ddr3_addr[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="D21" SLEW="" name="ddr3_addr[15]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G24" SLEW="" name="ddr3_addr[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F23" SLEW="" name="ddr3_addr[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G22" SLEW="" name="ddr3_addr[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E23" SLEW="" name="ddr3_addr[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F22" SLEW="" name="ddr3_addr[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="D24" SLEW="" name="ddr3_addr[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="D23" SLEW="" name="ddr3_addr[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="B21" SLEW="" name="ddr3_addr[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="C21" SLEW="" name="ddr3_addr[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G25" SLEW="" name="ddr3_ba[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="D25" SLEW="" name="ddr3_ba[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E25" SLEW="" name="ddr3_ba[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F25" SLEW="" name="ddr3_cas_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="G21" SLEW="" name="ddr3_ck_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="H24" SLEW="" name="ddr3_ck_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="H21" SLEW="" name="ddr3_ck_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="H23" SLEW="" name="ddr3_ck_p[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="J21" SLEW="" name="ddr3_cke[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="H22" SLEW="" name="ddr3_cke[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="J26" SLEW="" name="ddr3_cs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="H26" SLEW="" name="ddr3_cs_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="C16" SLEW="" name="ddr3_dm[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="H16" SLEW="" name="ddr3_dm[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G19" SLEW="" name="ddr3_dm[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="K20" SLEW="" name="ddr3_dm[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="K25" SLEW="" name="ddr3_dm[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N19" SLEW="" name="ddr3_dm[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="T20" SLEW="" name="ddr3_dm[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="T18" SLEW="" name="ddr3_dm[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="B16" SLEW="" name="ddr3_dq[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F15" SLEW="" name="ddr3_dq[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E15" SLEW="" name="ddr3_dq[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E16" SLEW="" name="ddr3_dq[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G17" SLEW="" name="ddr3_dq[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F18" SLEW="" name="ddr3_dq[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F17" SLEW="" name="ddr3_dq[15]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E18" SLEW="" name="ddr3_dq[16]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="D18" SLEW="" name="ddr3_dq[17]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="H17" SLEW="" name="ddr3_dq[18]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="H18" SLEW="" name="ddr3_dq[19]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="A18" SLEW="" name="ddr3_dq[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F20" SLEW="" name="ddr3_dq[20]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="F19" SLEW="" name="ddr3_dq[21]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E20" SLEW="" name="ddr3_dq[22]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="H19" SLEW="" name="ddr3_dq[23]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="J18" SLEW="" name="ddr3_dq[24]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="J19" SLEW="" name="ddr3_dq[25]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="K16" SLEW="" name="ddr3_dq[26]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="K17" SLEW="" name="ddr3_dq[27]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M17" SLEW="" name="ddr3_dq[28]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="L18" SLEW="" name="ddr3_dq[29]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="A19" SLEW="" name="ddr3_dq[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="L17" SLEW="" name="ddr3_dq[30]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="K18" SLEW="" name="ddr3_dq[31]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="K26" SLEW="" name="ddr3_dq[32]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R26" SLEW="" name="ddr3_dq[33]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="P26" SLEW="" name="ddr3_dq[34]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="P24" SLEW="" name="ddr3_dq[35]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N24" SLEW="" name="ddr3_dq[36]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N26" SLEW="" name="ddr3_dq[37]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M26" SLEW="" name="ddr3_dq[38]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R25" SLEW="" name="ddr3_dq[39]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="C19" SLEW="" name="ddr3_dq[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M20" SLEW="" name="ddr3_dq[40]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M24" SLEW="" name="ddr3_dq[41]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="L24" SLEW="" name="ddr3_dq[42]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M21" SLEW="" name="ddr3_dq[43]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M22" SLEW="" name="ddr3_dq[44]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="P23" SLEW="" name="ddr3_dq[45]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N23" SLEW="" name="ddr3_dq[46]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N21" SLEW="" name="ddr3_dq[47]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R21" SLEW="" name="ddr3_dq[48]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="P21" SLEW="" name="ddr3_dq[49]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="B19" SLEW="" name="ddr3_dq[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R22" SLEW="" name="ddr3_dq[50]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R23" SLEW="" name="ddr3_dq[51]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R20" SLEW="" name="ddr3_dq[52]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="T22" SLEW="" name="ddr3_dq[53]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="T23" SLEW="" name="ddr3_dq[54]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="U19" SLEW="" name="ddr3_dq[55]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="P16" SLEW="" name="ddr3_dq[56]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N17" SLEW="" name="ddr3_dq[57]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="N18" SLEW="" name="ddr3_dq[58]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="M19" SLEW="" name="ddr3_dq[59]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="C17" SLEW="" name="ddr3_dq[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="U17" SLEW="" name="ddr3_dq[60]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="T17" SLEW="" name="ddr3_dq[61]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="R18" SLEW="" name="ddr3_dq[62]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="P18" SLEW="" name="ddr3_dq[63]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="C18" SLEW="" name="ddr3_dq[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="D15" SLEW="" name="ddr3_dq[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G16" SLEW="" name="ddr3_dq[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G15" SLEW="" name="ddr3_dq[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="A17" SLEW="" name="ddr3_dqs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="J16" SLEW="" name="ddr3_dqs_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="D20" SLEW="" name="ddr3_dqs_n[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="L20" SLEW="" name="ddr3_dqs_n[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="L25" SLEW="" name="ddr3_dqs_n[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="P20" SLEW="" name="ddr3_dqs_n[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="T25" SLEW="" name="ddr3_dqs_n[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="R17" SLEW="" name="ddr3_dqs_n[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="B17" SLEW="" name="ddr3_dqs_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="J15" SLEW="" name="ddr3_dqs_p[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="D19" SLEW="" name="ddr3_dqs_p[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="L19" SLEW="" name="ddr3_dqs_p[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="M25" SLEW="" name="ddr3_dqs_p[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="P19" SLEW="" name="ddr3_dqs_p[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="T24" SLEW="" name="ddr3_dqs_p[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="R16" SLEW="" name="ddr3_dqs_p[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="J24" SLEW="" name="ddr3_odt[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="J25" SLEW="" name="ddr3_odt[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="G26" SLEW="" name="ddr3_ras_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="LVCMOS15" PADName="E17" SLEW="" name="ddr3_reset_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="E26" SLEW="" name="ddr3_we_n" IN_TERM="" />}
   puts $mig_prj_file {        </PinSelection>}
   puts $mig_prj_file {        <System_Clock>}
   puts $mig_prj_file {            <Pin PADName="C12/C11(CC_P/N)" Bank="16" name="sys_clk_p/n" />}
   puts $mig_prj_file {        </System_Clock>}
   puts $mig_prj_file {        <System_Control>}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="sys_rst" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="init_calib_complete" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="tg_compare_error" />}
   puts $mig_prj_file {        </System_Control>}
   puts $mig_prj_file {        <TimingParameters>}
   puts $mig_prj_file {            <Parameters twtr="7.5" trrd="6" trefi="7.8" tfaw="40" trtp="7.5" tcke="7.5" trfc="300" trp="13.125" tras="35" trcd="13.125" />}
   puts $mig_prj_file {        </TimingParameters>}
   puts $mig_prj_file {        <mrBurstLength name="Burst Length" >8 - Fixed</mrBurstLength>}
   puts $mig_prj_file {        <mrBurstType name="Read Burst Type and Length" >Sequential</mrBurstType>}
   puts $mig_prj_file {        <mrCasLatency name="CAS Latency" >6</mrCasLatency>}
   puts $mig_prj_file {        <mrMode name="Mode" >Normal</mrMode>}
   puts $mig_prj_file {        <mrDllReset name="DLL Reset" >No</mrDllReset>}
   puts $mig_prj_file {        <mrPdMode name="DLL control for precharge PD" >Slow Exit</mrPdMode>}
   puts $mig_prj_file {        <emrDllEnable name="DLL Enable" >Enable</emrDllEnable>}
   puts $mig_prj_file {        <emrOutputDriveStrength name="Output Driver Impedance Control" >RZQ/7</emrOutputDriveStrength>}
   puts $mig_prj_file {        <emrMirrorSelection name="Address Mirroring" >Disable</emrMirrorSelection>}
   puts $mig_prj_file {        <emrRTT name="RTT (nominal) - On Die Termination (ODT)" >RZQ/4</emrRTT>}
   puts $mig_prj_file {        <emrPosted name="Additive Latency (AL)" >0</emrPosted>}
   puts $mig_prj_file {        <emrOCD name="Write Leveling Enable" >Disabled</emrOCD>}
   puts $mig_prj_file {        <emrDQS name="TDQS enable" >Enabled</emrDQS>}
   puts $mig_prj_file {        <emrRDQS name="Qoff" >Output Buffer Enabled</emrRDQS>}
   puts $mig_prj_file {        <mr2PartialArraySelfRefresh name="Partial-Array Self Refresh" >Full Array</mr2PartialArraySelfRefresh>}
   puts $mig_prj_file {        <mr2CasWriteLatency name="CAS write latency" >5</mr2CasWriteLatency>}
   puts $mig_prj_file {        <mr2AutoSelfRefresh name="Auto Self Refresh" >Enabled</mr2AutoSelfRefresh>}
   puts $mig_prj_file {        <mr2SelfRefreshTempRange name="High Temparature Self Refresh Rate" >Normal</mr2SelfRefreshTempRange>}
   puts $mig_prj_file {        <mr2RTTWR name="RTT_WR - Dynamic On Die Termination (ODT)" >Dynamic ODT off</mr2RTTWR>}
   puts $mig_prj_file {        <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {        <AXIParameters>}
   puts $mig_prj_file {            <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {            <C0_S_AXI_ADDR_WIDTH>34</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_DATA_WIDTH>512</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_ID_WIDTH>3</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {        </AXIParameters>}
   puts $mig_prj_file {    </Controller>}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_core_dimm0_ctrl_0()


proc write_mig_file_core_dimm1_ctrl_0 { str_mig_prj_filepath } {

   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {<?xml version='1.0' encoding='UTF-8'?>}
   puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
   puts $mig_prj_file {<Project NoOfControllers="1" >}
   puts $mig_prj_file {    <ModuleName>core_dimm1_ctrl_0</ModuleName>}
   puts $mig_prj_file {    <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {    <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {    <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {    <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {    <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {    <XADC_En>Disabled</XADC_En>}
   puts $mig_prj_file {    <TargetFPGA>xc7k160t-fbg676/-1</TargetFPGA>}
   puts $mig_prj_file {    <Version>4.0</Version>}
   puts $mig_prj_file {    <SystemClock>Differential</SystemClock>}
   puts $mig_prj_file {    <ReferenceClock>Use System Clock</ReferenceClock>}
   puts $mig_prj_file {    <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
   puts $mig_prj_file {    <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {    <InternalVref>0</InternalVref>}
   puts $mig_prj_file {    <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {    <dci_cascade>1</dci_cascade>}
   puts $mig_prj_file {    <Controller number="0" >}
   puts $mig_prj_file {        <MemoryDevice>DDR3_SDRAM/SODIMMs/MT16KTF51264HZ-1G4</MemoryDevice>}
   puts $mig_prj_file {        <TimePeriod>2500</TimePeriod>}
   puts $mig_prj_file {        <VccAuxIO>1.8V</VccAuxIO>}
   puts $mig_prj_file {        <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {        <InputClkFreq>200</InputClkFreq>}
   puts $mig_prj_file {        <UIExtraClocks>0</UIExtraClocks>}
   puts $mig_prj_file {        <MMCM_VCO>800</MMCM_VCO>}
   puts $mig_prj_file {        <MMCMClkOut0> 1.000</MMCMClkOut0>}
   puts $mig_prj_file {        <MMCMClkOut1>1</MMCMClkOut1>}
   puts $mig_prj_file {        <MMCMClkOut2>1</MMCMClkOut2>}
   puts $mig_prj_file {        <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {        <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {        <DataWidth>64</DataWidth>}
   puts $mig_prj_file {        <DeepMemory>2</DeepMemory>}
   puts $mig_prj_file {        <DataMask>1</DataMask>}
   puts $mig_prj_file {        <ECC>Disabled</ECC>}
   puts $mig_prj_file {        <Ordering>Normal</Ordering>}
   puts $mig_prj_file {        <BankMachineCnt>4</BankMachineCnt>}
   puts $mig_prj_file {        <CustomPart>TRUE</CustomPart>}
   puts $mig_prj_file {        <NewPartName>16GB</NewPartName>}
   puts $mig_prj_file {        <RowAddress>16</RowAddress>}
   puts $mig_prj_file {        <ColAddress>11</ColAddress>}
   puts $mig_prj_file {        <BankAddress>3</BankAddress>}
   puts $mig_prj_file {        <MemoryVoltage>1.5V</MemoryVoltage>}
   puts $mig_prj_file {        <C0_MEM_SIZE>17179869184</C0_MEM_SIZE>}
   puts $mig_prj_file {        <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {        <PinSelection>}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AC7" SLEW="" name="ddr3_addr[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y10" SLEW="" name="ddr3_addr[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y11" SLEW="" name="ddr3_addr[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y7" SLEW="" name="ddr3_addr[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y8" SLEW="" name="ddr3_addr[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="W9" SLEW="" name="ddr3_addr[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="W10" SLEW="" name="ddr3_addr[15]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AB7" SLEW="" name="ddr3_addr[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AD8" SLEW="" name="ddr3_addr[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AC8" SLEW="" name="ddr3_addr[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA7" SLEW="" name="ddr3_addr[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA8" SLEW="" name="ddr3_addr[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AF7" SLEW="" name="ddr3_addr[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AE7" SLEW="" name="ddr3_addr[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="W8" SLEW="" name="ddr3_addr[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="V9" SLEW="" name="ddr3_addr[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AC9" SLEW="" name="ddr3_ba[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AB9" SLEW="" name="ddr3_ba[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA9" SLEW="" name="ddr3_ba[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AB12" SLEW="" name="ddr3_cas_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="W11" SLEW="" name="ddr3_ck_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="V7" SLEW="" name="ddr3_ck_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="V11" SLEW="" name="ddr3_ck_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15" PADName="V8" SLEW="" name="ddr3_ck_p[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AC13" SLEW="" name="ddr3_cke[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AD13" SLEW="" name="ddr3_cke[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA13" SLEW="" name="ddr3_cs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA12" SLEW="" name="ddr3_cs_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="U6" SLEW="" name="ddr3_dm[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y3" SLEW="" name="ddr3_dm[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AB6" SLEW="" name="ddr3_dm[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AD4" SLEW="" name="ddr3_dm[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AE17" SLEW="" name="ddr3_dm[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA14" SLEW="" name="ddr3_dm[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AA19" SLEW="" name="ddr3_dm[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y17" SLEW="" name="ddr3_dm[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="U2" SLEW="" name="ddr3_dq[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V1" SLEW="" name="ddr3_dq[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="W1" SLEW="" name="ddr3_dq[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="Y1" SLEW="" name="ddr3_dq[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB2" SLEW="" name="ddr3_dq[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC2" SLEW="" name="ddr3_dq[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AA3" SLEW="" name="ddr3_dq[15]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AA4" SLEW="" name="ddr3_dq[16]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB4" SLEW="" name="ddr3_dq[17]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC4" SLEW="" name="ddr3_dq[18]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC3" SLEW="" name="ddr3_dq[19]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="U5" SLEW="" name="ddr3_dq[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC6" SLEW="" name="ddr3_dq[20]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="Y6" SLEW="" name="ddr3_dq[21]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="Y5" SLEW="" name="ddr3_dq[22]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD6" SLEW="" name="ddr3_dq[23]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD1" SLEW="" name="ddr3_dq[24]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AE1" SLEW="" name="ddr3_dq[25]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AE3" SLEW="" name="ddr3_dq[26]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AE2" SLEW="" name="ddr3_dq[27]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AE6" SLEW="" name="ddr3_dq[28]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AE5" SLEW="" name="ddr3_dq[29]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="U1" SLEW="" name="ddr3_dq[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF3" SLEW="" name="ddr3_dq[30]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF2" SLEW="" name="ddr3_dq[31]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF17" SLEW="" name="ddr3_dq[32]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF14" SLEW="" name="ddr3_dq[33]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF15" SLEW="" name="ddr3_dq[34]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD15" SLEW="" name="ddr3_dq[35]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AE15" SLEW="" name="ddr3_dq[36]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF19" SLEW="" name="ddr3_dq[37]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AF20" SLEW="" name="ddr3_dq[38]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD16" SLEW="" name="ddr3_dq[39]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V3" SLEW="" name="ddr3_dq[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AA15" SLEW="" name="ddr3_dq[40]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC14" SLEW="" name="ddr3_dq[41]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD14" SLEW="" name="ddr3_dq[42]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB14" SLEW="" name="ddr3_dq[43]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB15" SLEW="" name="ddr3_dq[44]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AA17" SLEW="" name="ddr3_dq[45]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AA18" SLEW="" name="ddr3_dq[46]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB16" SLEW="" name="ddr3_dq[47]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC18" SLEW="" name="ddr3_dq[48]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD18" SLEW="" name="ddr3_dq[49]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="W3" SLEW="" name="ddr3_dq[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB17" SLEW="" name="ddr3_dq[50]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC17" SLEW="" name="ddr3_dq[51]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AA20" SLEW="" name="ddr3_dq[52]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AC19" SLEW="" name="ddr3_dq[53]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AD19" SLEW="" name="ddr3_dq[54]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="AB19" SLEW="" name="ddr3_dq[55]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V16" SLEW="" name="ddr3_dq[56]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V17" SLEW="" name="ddr3_dq[57]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="W15" SLEW="" name="ddr3_dq[58]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="W16" SLEW="" name="ddr3_dq[59]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="U7" SLEW="" name="ddr3_dq[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V18" SLEW="" name="ddr3_dq[60]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V19" SLEW="" name="ddr3_dq[61]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V14" SLEW="" name="ddr3_dq[62]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="W14" SLEW="" name="ddr3_dq[63]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V6" SLEW="" name="ddr3_dq[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V4" SLEW="" name="ddr3_dq[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="Y2" SLEW="" name="ddr3_dq[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15_T_DCI" PADName="V2" SLEW="" name="ddr3_dq[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="W5" SLEW="" name="ddr3_dqs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AC1" SLEW="" name="ddr3_dqs_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AB5" SLEW="" name="ddr3_dqs_n[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AF4" SLEW="" name="ddr3_dqs_n[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AF18" SLEW="" name="ddr3_dqs_n[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="Y16" SLEW="" name="ddr3_dqs_n[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AE20" SLEW="" name="ddr3_dqs_n[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="W19" SLEW="" name="ddr3_dqs_n[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="W6" SLEW="" name="ddr3_dqs_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AB1" SLEW="" name="ddr3_dqs_p[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AA5" SLEW="" name="ddr3_dqs_p[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AF5" SLEW="" name="ddr3_dqs_p[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AE18" SLEW="" name="ddr3_dqs_p[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="Y15" SLEW="" name="ddr3_dqs_p[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD20" SLEW="" name="ddr3_dqs_p[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="W18" SLEW="" name="ddr3_dqs_p[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y13" SLEW="" name="ddr3_odt[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="Y12" SLEW="" name="ddr3_odt[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AD9" SLEW="" name="ddr3_ras_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="LVCMOS15" PADName="AA2" SLEW="" name="ddr3_reset_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL15" PADName="AC12" SLEW="" name="ddr3_we_n" IN_TERM="" />}
   puts $mig_prj_file {        </PinSelection>}
   puts $mig_prj_file {        <System_Clock>}
   puts $mig_prj_file {            <Pin PADName="AB11/AC11(CC_P/N)" Bank="33" name="sys_clk_p/n" />}
   puts $mig_prj_file {        </System_Clock>}
   puts $mig_prj_file {        <System_Control>}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="sys_rst" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="init_calib_complete" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="tg_compare_error" />}
   puts $mig_prj_file {        </System_Control>}
   puts $mig_prj_file {        <TimingParameters>}
   puts $mig_prj_file {            <Parameters twtr="7.5" trrd="6" trefi="7.8" tfaw="40" trtp="7.5" tcke="7.5" trfc="300" trp="13.125" tras="35" trcd="13.125" />}
   puts $mig_prj_file {        </TimingParameters>}
   puts $mig_prj_file {        <mrBurstLength name="Burst Length" >8 - Fixed</mrBurstLength>}
   puts $mig_prj_file {        <mrBurstType name="Read Burst Type and Length" >Sequential</mrBurstType>}
   puts $mig_prj_file {        <mrCasLatency name="CAS Latency" >6</mrCasLatency>}
   puts $mig_prj_file {        <mrMode name="Mode" >Normal</mrMode>}
   puts $mig_prj_file {        <mrDllReset name="DLL Reset" >No</mrDllReset>}
   puts $mig_prj_file {        <mrPdMode name="DLL control for precharge PD" >Slow Exit</mrPdMode>}
   puts $mig_prj_file {        <emrDllEnable name="DLL Enable" >Enable</emrDllEnable>}
   puts $mig_prj_file {        <emrOutputDriveStrength name="Output Driver Impedance Control" >RZQ/7</emrOutputDriveStrength>}
   puts $mig_prj_file {        <emrMirrorSelection name="Address Mirroring" >Disable</emrMirrorSelection>}
   puts $mig_prj_file {        <emrRTT name="RTT (nominal) - On Die Termination (ODT)" >RZQ/4</emrRTT>}
   puts $mig_prj_file {        <emrPosted name="Additive Latency (AL)" >0</emrPosted>}
   puts $mig_prj_file {        <emrOCD name="Write Leveling Enable" >Disabled</emrOCD>}
   puts $mig_prj_file {        <emrDQS name="TDQS enable" >Enabled</emrDQS>}
   puts $mig_prj_file {        <emrRDQS name="Qoff" >Output Buffer Enabled</emrRDQS>}
   puts $mig_prj_file {        <mr2PartialArraySelfRefresh name="Partial-Array Self Refresh" >Full Array</mr2PartialArraySelfRefresh>}
   puts $mig_prj_file {        <mr2CasWriteLatency name="CAS write latency" >5</mr2CasWriteLatency>}
   puts $mig_prj_file {        <mr2AutoSelfRefresh name="Auto Self Refresh" >Enabled</mr2AutoSelfRefresh>}
   puts $mig_prj_file {        <mr2SelfRefreshTempRange name="High Temparature Self Refresh Rate" >Normal</mr2SelfRefreshTempRange>}
   puts $mig_prj_file {        <mr2RTTWR name="RTT_WR - Dynamic On Die Termination (ODT)" >Dynamic ODT off</mr2RTTWR>}
   puts $mig_prj_file {        <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {        <AXIParameters>}
   puts $mig_prj_file {            <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {            <C0_S_AXI_ADDR_WIDTH>34</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_DATA_WIDTH>512</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_ID_WIDTH>3</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {        </AXIParameters>}
   puts $mig_prj_file {    </Controller>}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_core_dimm1_ctrl_0()



##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 LMB_M

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst LMB_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_NUM_LMB {2} \
 ] $dlmb_bram_if_cntlr

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_NUM_LMB.VALUE_SRC {DEFAULT} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Use_RSTB_Pin {true} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.use_bram_block.VALUE_SRC {DEFAULT} \
 ] $lmb_bram

  # Create instance: lmb_v10, and set properties
  set lmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 lmb_v10 ]

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_0_lmb [get_bd_intf_pins LMB_M] [get_bd_intf_pins lmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_lmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB1] [get_bd_intf_pins lmb_v10/LMB_Sl_0]

  # Create port connections
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk] [get_bd_pins lmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_0_LMB_Rst [get_bd_pins LMB_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst] [get_bd_pins lmb_v10/SYS_Rst]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: MemoryBuffer
proc create_hier_cell_MemoryBuffer { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_MemoryBuffer() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DIMM1
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_MM2S
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_MM2S_STS
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_S2MM_STS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYS_CLK
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYS_CLK_1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_MM2S_CMD
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM_CMD
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE1

  # Create pins
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -type clk CLK_DATA
  create_bd_pin -dir I -type clk CLK_MB
  create_bd_pin -dir O -type intr cdma_introut
  create_bd_pin -dir O -type intr cdma_introut1
  create_bd_pin -dir I -from 11 -to 0 device_temp_i
  create_bd_pin -dir O init_calib_complete
  create_bd_pin -dir O init_calib_complete1
  create_bd_pin -dir I -from 0 -to 0 -type rst m_axis_s2mm_cmdsts_aresetn
  create_bd_pin -dir O -type clk ui_clk
  create_bd_pin -dir O ui_clk_rst

  # Create instance: axi_cdma_0, and set properties
  set axi_cdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_cdma:4.1 axi_cdma_0 ]
  set_property -dict [ list \
CONFIG.C_ADDR_WIDTH {64} \
CONFIG.C_INCLUDE_SG {0} \
CONFIG.C_M_AXI_DATA_WIDTH {512} \
CONFIG.C_M_AXI_MAX_BURST_LEN {64} \
 ] $axi_cdma_0

  # Create instance: axi_cdma_1, and set properties
  set axi_cdma_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_cdma:4.1 axi_cdma_1 ]
  set_property -dict [ list \
CONFIG.C_ADDR_WIDTH {64} \
CONFIG.C_INCLUDE_SG {0} \
CONFIG.C_M_AXI_DATA_WIDTH {512} \
CONFIG.C_M_AXI_MAX_BURST_LEN {64} \
 ] $axi_cdma_1

  # Create instance: axi_datamover_0, and set properties
  set axi_datamover_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover_0 ]
  set_property -dict [ list \
CONFIG.c_addr_width {64} \
CONFIG.c_include_mm2s_dre {true} \
CONFIG.c_include_s2mm_dre {true} \
CONFIG.c_m_axi_mm2s_data_width {64} \
CONFIG.c_m_axis_mm2s_tdata_width {64} \
CONFIG.c_mm2s_btt_used {23} \
CONFIG.c_mm2s_burst_size {16} \
CONFIG.c_s2mm_btt_used {23} \
CONFIG.c_s2mm_burst_size {256} \
 ] $axi_datamover_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
CONFIG.M00_HAS_DATA_FIFO {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S01_HAS_DATA_FIFO {0} \
CONFIG.STRATEGY {0} \
CONFIG.XBAR_DATA_WIDTH {512} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
CONFIG.M00_HAS_DATA_FIFO {1} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S01_HAS_DATA_FIFO {0} \
CONFIG.STRATEGY {0} \
CONFIG.XBAR_DATA_WIDTH {512} \
 ] $axi_interconnect_1

  # Create instance: buffer_interconnect_0, and set properties
  set buffer_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 buffer_interconnect_0 ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
CONFIG.M00_HAS_DATA_FIFO {1} \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.M01_HAS_DATA_FIFO {1} \
CONFIG.M01_HAS_REGSLICE {1} \
CONFIG.NUM_MI {2} \
CONFIG.NUM_SI {3} \
CONFIG.S00_HAS_DATA_FIFO {2} \
CONFIG.S00_HAS_REGSLICE {1} \
CONFIG.S01_HAS_DATA_FIFO {2} \
CONFIG.S01_HAS_REGSLICE {1} \
CONFIG.S02_HAS_DATA_FIFO {2} \
CONFIG.S02_HAS_REGSLICE {1} \
CONFIG.S03_HAS_DATA_FIFO {2} \
CONFIG.S04_HAS_DATA_FIFO {2} \
CONFIG.STRATEGY {2} \
 ] $buffer_interconnect_0

  # Create instance: dimm0_ctrl, and set properties
  set dimm0_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.0 dimm0_ctrl ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $dimm0_ctrl ] ] ]
  set str_mig_file_name mig_a.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}

  write_mig_file_core_dimm0_ctrl_0 $str_mig_file_path

  set_property -dict [ list \
CONFIG.BOARD_MIG_PARAM {Custom} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.XML_INPUT_FILE {mig_a.prj} \
 ] $dimm0_ctrl

  # Create instance: dimm1_ctrl, and set properties
  set dimm1_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.0 dimm1_ctrl ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $dimm1_ctrl ] ] ]
  set str_mig_file_name mig_b.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}

  write_mig_file_core_dimm1_ctrl_0 $str_mig_file_path

  set_property -dict [ list \
CONFIG.BOARD_MIG_PARAM {Custom} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.XML_INPUT_FILE {mig_b.prj} \
 ] $dimm1_ctrl

  # Create instance: vcc, and set properties
  set vcc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vcc ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S02_AXI] [get_bd_intf_pins buffer_interconnect_0/S02_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_cdma_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins SYS_CLK] [get_bd_intf_pins dimm0_ctrl/SYS_CLK]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins DDR3] [get_bd_intf_pins dimm0_ctrl/DDR3]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S_AXI_LITE1] [get_bd_intf_pins axi_cdma_1/S_AXI_LITE]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins S_AXIS_S2MM] [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins S_AXIS_MM2S_CMD] [get_bd_intf_pins axi_datamover_0/S_AXIS_MM2S_CMD]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins M_AXIS_MM2S_STS] [get_bd_intf_pins axi_datamover_0/M_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net Conn9 [get_bd_intf_pins M_AXIS_S2MM_STS] [get_bd_intf_pins axi_datamover_0/M_AXIS_S2MM_STS]
  connect_bd_intf_net -intf_net Conn10 [get_bd_intf_pins M_AXIS_MM2S] [get_bd_intf_pins axi_datamover_0/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net Conn11 [get_bd_intf_pins S_AXIS_S2MM_CMD] [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM_CMD]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins buffer_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins buffer_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net S00_AXI_3 [get_bd_intf_pins axi_datamover_0/M_AXI_MM2S] [get_bd_intf_pins buffer_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins axi_cdma_0/M_AXI] [get_bd_intf_pins axi_interconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net S01_AXI_2 [get_bd_intf_pins axi_cdma_1/M_AXI] [get_bd_intf_pins axi_interconnect_1/S01_AXI]
  connect_bd_intf_net -intf_net S01_AXI_3 [get_bd_intf_pins axi_datamover_0/M_AXI_S2MM] [get_bd_intf_pins buffer_interconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net SYS_CLK_1_1 [get_bd_intf_pins SYS_CLK_1] [get_bd_intf_pins dimm1_ctrl/SYS_CLK]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins dimm0_ctrl/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins dimm1_ctrl/S_AXI]
  connect_bd_intf_net -intf_net dimm1_ctrl_DDR3 [get_bd_intf_pins DIMM1] [get_bd_intf_pins dimm1_ctrl/DDR3]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins CLK_MB] [get_bd_pins axi_cdma_0/s_axi_lite_aclk] [get_bd_pins axi_cdma_1/s_axi_lite_aclk] [get_bd_pins buffer_interconnect_0/S02_ACLK]
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins buffer_interconnect_0/ARESETN]
  connect_bd_net -net axi_cdma_0_cdma_introut [get_bd_pins cdma_introut] [get_bd_pins axi_cdma_0/cdma_introut]
  connect_bd_net -net axi_cdma_1_cdma_introut [get_bd_pins cdma_introut1] [get_bd_pins axi_cdma_1/cdma_introut]
  connect_bd_net -net clk_wiz_1_clk_out2 [get_bd_pins CLK_DATA] [get_bd_pins axi_datamover_0/m_axi_mm2s_aclk] [get_bd_pins axi_datamover_0/m_axi_s2mm_aclk] [get_bd_pins axi_datamover_0/m_axis_mm2s_cmdsts_aclk] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_awclk] [get_bd_pins buffer_interconnect_0/ACLK] [get_bd_pins buffer_interconnect_0/S00_ACLK] [get_bd_pins buffer_interconnect_0/S01_ACLK]
  connect_bd_net -net device_temp_i_1 [get_bd_pins device_temp_i] [get_bd_pins dimm0_ctrl/device_temp_i] [get_bd_pins dimm1_ctrl/device_temp_i]
  connect_bd_net -net dimm0_ctrl_init_calib_complete [get_bd_pins init_calib_complete] [get_bd_pins dimm0_ctrl/init_calib_complete]
  connect_bd_net -net dimm0_ctrl_ui_clk [get_bd_pins axi_cdma_0/m_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_0/S01_ACLK] [get_bd_pins buffer_interconnect_0/M00_ACLK] [get_bd_pins dimm0_ctrl/ui_clk]
  connect_bd_net -net dimm1_ctrl_init_calib_complete [get_bd_pins init_calib_complete1] [get_bd_pins dimm1_ctrl/init_calib_complete]
  connect_bd_net -net dimm1_ctrl_ui_clk_sync_rst [get_bd_pins ui_clk_rst] [get_bd_pins dimm1_ctrl/ui_clk_sync_rst]
  connect_bd_net -net mig_7series_0_ui_clk [get_bd_pins ui_clk] [get_bd_pins axi_cdma_1/m_axi_aclk] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_interconnect_1/S01_ACLK] [get_bd_pins buffer_interconnect_0/M01_ACLK] [get_bd_pins dimm1_ctrl/ui_clk]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axi_cdma_0/s_axi_lite_aresetn] [get_bd_pins axi_cdma_1/s_axi_lite_aresetn] [get_bd_pins axi_datamover_0/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover_0/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover_0/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_0/S01_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_interconnect_1/S01_ARESETN] [get_bd_pins buffer_interconnect_0/M00_ARESETN] [get_bd_pins buffer_interconnect_0/M01_ARESETN] [get_bd_pins buffer_interconnect_0/S00_ARESETN] [get_bd_pins buffer_interconnect_0/S01_ARESETN] [get_bd_pins buffer_interconnect_0/S02_ARESETN] [get_bd_pins dimm0_ctrl/aresetn] [get_bd_pins dimm1_ctrl/aresetn]
  connect_bd_net -net vcc_dout [get_bd_pins dimm0_ctrl/sys_rst] [get_bd_pins dimm1_ctrl/sys_rst] [get_bd_pins vcc/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: MCU
proc create_hier_cell_MCU { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_MCU() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:mbinterrupt_rtl:1.0 INTERRUPT
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_DP
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_MDM

  # Create pins
  create_bd_pin -dir I -type clk Clk
  create_bd_pin -dir O -type rst Debug_SYS_Rst
  create_bd_pin -dir I -from 0 -to 0 -type rst LMB_Rst
  create_bd_pin -dir I -type rst processor_rst
  create_bd_pin -dir I -from 0 -to 0 -type rst s_axi_aresetn

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
CONFIG.C_DBG_MEM_ACCESS {1} \
CONFIG.C_USE_CROSS_TRIGGER {0} \
CONFIG.C_USE_UART {1} \
 ] $mdm_1

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:10.0 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_D_AXI {1} \
CONFIG.C_USE_STACK_PROTECTION {1} \
 ] $microblaze_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_USE_STACK_PROTECTION.VALUE_SRC {DEFAULT} \
 ] $microblaze_0

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

  # Create interface connections
  connect_bd_intf_net -intf_net INTERRUPT_1 [get_bd_intf_pins INTERRUPT] [get_bd_intf_pins microblaze_0/INTERRUPT]
  connect_bd_intf_net -intf_net S_AXI_MDM_1 [get_bd_intf_pins S_AXI_MDM] [get_bd_intf_pins mdm_1/S_AXI]
  connect_bd_intf_net -intf_net mdm_1_MBDEBUG_0 [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_DLMB [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ILMB [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DP [get_bd_intf_pins M_AXI_DP] [get_bd_intf_pins microblaze_0/M_AXI_DP]
  connect_bd_intf_net -intf_net microblaze_0_lmb [get_bd_intf_pins mdm_1/LMB_0] [get_bd_intf_pins microblaze_0_local_memory/LMB_M]

  # Create port connections
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins Debug_SYS_Rst] [get_bd_pins mdm_1/Debug_SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins Clk] [get_bd_pins mdm_1/M_AXI_ACLK] [get_bd_pins mdm_1/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_local_memory/LMB_Clk]
  connect_bd_net -net processor_rst_1 [get_bd_pins processor_rst] [get_bd_pins microblaze_0/Reset]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins LMB_Rst] [get_bd_pins microblaze_0_local_memory/LMB_Rst]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins mdm_1/M_AXI_ARESETN] [get_bd_pins mdm_1/S_AXI_ARESETN]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: INTC
proc create_hier_cell_INTC { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_INTC() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:mbinterrupt_rtl:1.0 interrupt
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi

  # Create pins
  create_bd_pin -dir I -type intr In4
  create_bd_pin -dir I -type intr In5
  create_bd_pin -dir I -type clk processor_clk
  create_bd_pin -dir I -type rst processor_rst
  create_bd_pin -dir I -from 0 -to 0 qspi_intc
  create_bd_pin -dir I -from 0 -to 0 -type rst s_axi_aresetn
  create_bd_pin -dir I -from 0 -to 0 timer_intc
  create_bd_pin -dir I -from 0 -to 0 uart_intc
  create_bd_pin -dir I -from 0 -to 0 xadc_intc

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_HAS_FAST.VALUE_SRC {DEFAULT} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {6} \
 ] $microblaze_0_xlconcat

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_axi_intc_interrupt [get_bd_intf_pins interrupt] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins s_axi] [get_bd_intf_pins microblaze_0_axi_intc/s_axi]

  # Create port connections
  connect_bd_net -net In2_1 [get_bd_pins qspi_intc] [get_bd_pins microblaze_0_xlconcat/In2]
  connect_bd_net -net In3_1 [get_bd_pins timer_intc] [get_bd_pins microblaze_0_xlconcat/In3]
  connect_bd_net -net In4_1 [get_bd_pins In4] [get_bd_pins microblaze_0_xlconcat/In4]
  connect_bd_net -net In5_1 [get_bd_pins In5] [get_bd_pins microblaze_0_xlconcat/In5]
  connect_bd_net -net axi_uart_fpga_output_ip2intc_irpt [get_bd_pins uart_intc] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins processor_clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk]
  connect_bd_net -net microblaze_0_xlconcat_dout [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins processor_rst] [get_bd_pins microblaze_0_axi_intc/processor_rst]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn]
  connect_bd_net -net xadc_wiz_0_ip2intc_irpt [get_bd_pins xadc_intc] [get_bd_pins microblaze_0_xlconcat/In1]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set AXIL_MEM_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXIL_MEM_IN ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {64} \
CONFIG.ARUSER_WIDTH {0} \
CONFIG.AWUSER_WIDTH {0} \
CONFIG.BUSER_WIDTH {0} \
CONFIG.DATA_WIDTH {32} \
CONFIG.HAS_BRESP {1} \
CONFIG.HAS_BURST {1} \
CONFIG.HAS_CACHE {1} \
CONFIG.HAS_LOCK {1} \
CONFIG.HAS_PROT {1} \
CONFIG.HAS_QOS {1} \
CONFIG.HAS_REGION {1} \
CONFIG.HAS_RRESP {1} \
CONFIG.HAS_WSTRB {1} \
CONFIG.ID_WIDTH {0} \
CONFIG.MAX_BURST_LENGTH {1} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_READ_THREADS {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.NUM_WRITE_THREADS {1} \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.READ_WRITE_MODE {READ_WRITE} \
CONFIG.RUSER_BITS_PER_BYTE {0} \
CONFIG.RUSER_WIDTH {0} \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.WUSER_BITS_PER_BYTE {0} \
CONFIG.WUSER_WIDTH {0} \
 ] $AXIL_MEM_IN
  set AXIL_MEM_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXIL_MEM_OUT ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {32} \
CONFIG.DATA_WIDTH {32} \
CONFIG.PROTOCOL {AXI4LITE} \
 ] $AXIL_MEM_OUT
  set AXIL_PERIPHERAL [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXIL_PERIPHERAL ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {32} \
CONFIG.DATA_WIDTH {32} \
CONFIG.PROTOCOL {AXI4LITE} \
 ] $AXIL_PERIPHERAL
  set DIMM0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DIMM0 ]
  set DIMM1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DIMM1 ]
  set IIC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC ]
  set MEM_ADDR_MSB [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 MEM_ADDR_MSB ]
  set M_AXIS_MM2S [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_MM2S ]
  set M_AXIS_MM2S_STS [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_MM2S_STS ]
  set M_AXIS_S2MM_STS [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_S2MM_STS ]
  set QSPI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 QSPI ]
  set STARTUP_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_startup_io:startup_io_rtl:1.0 STARTUP_IO ]
  set SYS_CLK_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYS_CLK_0 ]
  set SYS_CLK_1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYS_CLK_1 ]
  set S_AXIS_MM2S_CMD [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_MM2S_CMD ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {0} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {13} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $S_AXIS_MM2S_CMD
  set S_AXIS_S2MM [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {1} \
CONFIG.HAS_TLAST {1} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {8} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $S_AXIS_S2MM
  set S_AXIS_S2MM_CMD [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM_CMD ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {0} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {13} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $S_AXIS_S2MM_CMD
  set TEST_POINT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 TEST_POINT ]
  set UART [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART ]

  # Create ports
  set ARESETN [ create_bd_port -dir O -from 0 -to 0 -type rst ARESETN ]
  set CLK_DATA [ create_bd_port -dir O -type clk CLK_DATA ]
  set_property -dict [ list \
CONFIG.ASSOCIATED_BUSIF {S_AXIS_MM2S_CMD:M_AXIS_MM2S:M_AXIS_MM2S_STS:S_AXIS_S2MM_CMD:S_AXIS_S2MM:M_AXIS_S2MM_STS} \
 ] $CLK_DATA
  set CLK_MB [ create_bd_port -dir O -type clk CLK_MB ]
  set_property -dict [ list \
CONFIG.ASSOCIATED_BUSIF {AXIL_PERIPHERAL:AXIL_MEM_IN:AXIL_MEM_OUT} \
 ] $CLK_MB
  set CLK_MGT_INIT [ create_bd_port -dir O -type clk CLK_MGT_INIT ]
  set dimm0_init_calib_complete [ create_bd_port -dir O dimm0_init_calib_complete ]
  set dimm1_init_calib_complete [ create_bd_port -dir O dimm1_init_calib_complete ]

  # Create instance: INTC
  create_hier_cell_INTC [current_bd_instance .] INTC

  # Create instance: MCU
  create_hier_cell_MCU [current_bd_instance .] MCU

  # Create instance: MemoryBuffer
  create_hier_cell_MemoryBuffer [current_bd_instance .] MemoryBuffer

  # Create instance: axi_gpio, and set properties
  set axi_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_ALL_OUTPUTS_2 {1} \
CONFIG.C_GPIO2_WIDTH {5} \
CONFIG.C_GPIO_WIDTH {2} \
CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio

  # Create instance: axi_hwicap_0, and set properties
  set axi_hwicap_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_hwicap:3.0 axi_hwicap_0 ]

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
CONFIG.NUM_MI {13} \
CONFIG.S00_HAS_DATA_FIFO {0} \
CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_0

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
CONFIG.C_SPI_MODE {2} \
 ] $axi_quad_spi_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_SPI_MODE.VALUE_SRC {DEFAULT} \
 ] $axi_quad_spi_0

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: axi_uart_fpga_output, and set properties
  set axi_uart_fpga_output [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart_fpga_output ]
  set_property -dict [ list \
CONFIG.C_EXTERNAL_XIN_CLK_HZ {25000000} \
CONFIG.C_S_AXI_ACLK_FREQ_HZ {100000000} \
 ] $axi_uart_fpga_output

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_EXTERNAL_XIN_CLK_HZ.VALUE_SRC {DEFAULT} \
CONFIG.C_S_AXI_ACLK_FREQ_HZ.VALUE_SRC {DEFAULT} \
 ] $axi_uart_fpga_output

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKIN2_JITTER_PS {166.66} \
CONFIG.CLKOUT1_JITTER {139.197} \
CONFIG.CLKOUT1_PHASE_ERROR {109.126} \
CONFIG.CLKOUT2_JITTER {144.010} \
CONFIG.CLKOUT2_PHASE_ERROR {109.126} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {85.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_JITTER {161.019} \
CONFIG.CLKOUT3_PHASE_ERROR {109.126} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50.000} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {8.500} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.500} \
CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
CONFIG.MMCM_CLKOUT2_DIVIDE {17} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.NUM_OUT_CLKS {3} \
CONFIG.PRIM_SOURCE {No_buffer} \
 ] $clk_wiz_1

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CLKIN2_JITTER_PS.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_USED.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT2_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
CONFIG.NUM_OUT_CLKS.VALUE_SRC {DEFAULT} \
CONFIG.PRIM_SOURCE.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_1

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create instance: vcc_1, and set properties
  set vcc_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vcc_1 ]

  # Create instance: xadc_wiz_0, and set properties
  set xadc_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_0 ]
  set_property -dict [ list \
CONFIG.ADC_CONVERSION_RATE {1000} \
CONFIG.CHANNEL_ENABLE_VP_VN {false} \
CONFIG.DCLK_FREQUENCY {100} \
CONFIG.ENABLE_RESET {false} \
CONFIG.ENABLE_TEMP_BUS {true} \
CONFIG.INTERFACE_SELECTION {Enable_AXI} \
 ] $xadc_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.ADC_CONVERSION_RATE.VALUE_SRC {DEFAULT} \
CONFIG.CHANNEL_ENABLE_VP_VN.VALUE_SRC {DEFAULT} \
CONFIG.DCLK_FREQUENCY.VALUE_SRC {DEFAULT} \
CONFIG.ENABLE_RESET.VALUE_SRC {DEFAULT} \
CONFIG.INTERFACE_SELECTION.VALUE_SRC {DEFAULT} \
 ] $xadc_wiz_0

  # Create interface connections
  connect_bd_intf_net -intf_net AXIL_MEM_IN_1 [get_bd_intf_ports AXIL_MEM_IN] [get_bd_intf_pins MemoryBuffer/S02_AXI]
  connect_bd_intf_net -intf_net MemoryBuffer_DDR3 [get_bd_intf_ports DIMM0] [get_bd_intf_pins MemoryBuffer/DDR3]
  connect_bd_intf_net -intf_net MemoryBuffer_DDR4 [get_bd_intf_ports DIMM1] [get_bd_intf_pins MemoryBuffer/DIMM1]
  connect_bd_intf_net -intf_net MemoryBuffer_M_AXIS_MM2S [get_bd_intf_ports M_AXIS_MM2S] [get_bd_intf_pins MemoryBuffer/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net MemoryBuffer_M_AXIS_MM2S_STS [get_bd_intf_ports M_AXIS_MM2S_STS] [get_bd_intf_pins MemoryBuffer/M_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net MemoryBuffer_M_AXIS_S2MM_STS [get_bd_intf_ports M_AXIS_S2MM_STS] [get_bd_intf_pins MemoryBuffer/M_AXIS_S2MM_STS]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins MCU/M_AXI_DP] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net SYS_CLK_0_1 [get_bd_intf_ports SYS_CLK_0] [get_bd_intf_pins MemoryBuffer/SYS_CLK]
  connect_bd_intf_net -intf_net SYS_CLK_1_1 [get_bd_intf_ports SYS_CLK_1] [get_bd_intf_pins MemoryBuffer/SYS_CLK_1]
  connect_bd_intf_net -intf_net S_AXIS_MM2S_CMD_1 [get_bd_intf_ports S_AXIS_MM2S_CMD] [get_bd_intf_pins MemoryBuffer/S_AXIS_MM2S_CMD]
  connect_bd_intf_net -intf_net S_AXIS_S2MM_1 [get_bd_intf_ports S_AXIS_S2MM] [get_bd_intf_pins MemoryBuffer/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net S_AXIS_S2MM_CMD_1 [get_bd_intf_ports S_AXIS_S2MM_CMD] [get_bd_intf_pins MemoryBuffer/S_AXIS_S2MM_CMD]
  connect_bd_intf_net -intf_net axi_gpio_GPIO1 [get_bd_intf_ports TEST_POINT] [get_bd_intf_pins axi_gpio/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_GPIO2 [get_bd_intf_ports MEM_ADDR_MSB] [get_bd_intf_pins axi_gpio/GPIO2]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports IIC] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins INTC/s_axi] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins xadc_wiz_0/s_axi_lite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_interconnect_0/M02_AXI] [get_bd_intf_pins axi_uart_fpga_output/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins axi_gpio/S_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_ports AXIL_MEM_OUT] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_ports AXIL_PERIPHERAL] [get_bd_intf_pins axi_interconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins axi_interconnect_0/M06_AXI] [get_bd_intf_pins axi_quad_spi_0/AXI_LITE]
  connect_bd_intf_net -intf_net axi_interconnect_0_M07_AXI [get_bd_intf_pins axi_interconnect_0/M07_AXI] [get_bd_intf_pins axi_timer_0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M08_AXI [get_bd_intf_pins MemoryBuffer/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M08_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins MemoryBuffer/S_AXI_LITE1] [get_bd_intf_pins axi_interconnect_0/M09_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M10_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M10_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M11_AXI [get_bd_intf_pins axi_hwicap_0/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M11_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M12_AXI [get_bd_intf_pins MCU/S_AXI_MDM] [get_bd_intf_pins axi_interconnect_0/M12_AXI]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports QSPI] [get_bd_intf_pins axi_quad_spi_0/SPI_0]
  connect_bd_intf_net -intf_net axi_quad_spi_0_STARTUP_IO [get_bd_intf_ports STARTUP_IO] [get_bd_intf_pins axi_quad_spi_0/STARTUP_IO]
  connect_bd_intf_net -intf_net axi_uart_fpga_output_UART [get_bd_intf_ports UART] [get_bd_intf_pins axi_uart_fpga_output/UART]
  connect_bd_intf_net -intf_net microblaze_0_axi_intc_interrupt [get_bd_intf_pins INTC/interrupt] [get_bd_intf_pins MCU/INTERRUPT]

  # Create port connections
  connect_bd_net -net In4_1 [get_bd_pins INTC/In4] [get_bd_pins MemoryBuffer/cdma_introut]
  connect_bd_net -net In5_1 [get_bd_pins INTC/In5] [get_bd_pins MemoryBuffer/cdma_introut1]
  connect_bd_net -net MemoryBuffer_init_calib_complete [get_bd_ports dimm0_init_calib_complete] [get_bd_pins MemoryBuffer/init_calib_complete]
  connect_bd_net -net MemoryBuffer_init_calib_complete1 [get_bd_ports dimm1_init_calib_complete] [get_bd_pins MemoryBuffer/init_calib_complete1]
  connect_bd_net -net MemoryBuffer_ui_clk [get_bd_pins MemoryBuffer/ui_clk] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net MemoryBuffer_ui_clk_rst [get_bd_pins MemoryBuffer/ui_clk_rst] [get_bd_pins clk_wiz_1/reset]
  connect_bd_net -net axi_quad_spi_0_eos [get_bd_pins axi_hwicap_0/eos_in] [get_bd_pins axi_quad_spi_0/eos]
  connect_bd_net -net axi_quad_spi_0_ip2intc_irpt [get_bd_pins INTC/qspi_intc] [get_bd_pins axi_quad_spi_0/ip2intc_irpt]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins INTC/timer_intc] [get_bd_pins axi_timer_0/interrupt]
  connect_bd_net -net axi_uart_fpga_output_ip2intc_irpt [get_bd_pins INTC/uart_intc] [get_bd_pins axi_uart_fpga_output/ip2intc_irpt]
  connect_bd_net -net clk_wiz_1_clk_out2 [get_bd_ports CLK_DATA] [get_bd_pins MemoryBuffer/CLK_DATA] [get_bd_pins clk_wiz_1/clk_out2]
  connect_bd_net -net clk_wiz_1_clk_out3 [get_bd_ports CLK_MGT_INIT] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins clk_wiz_1/clk_out3] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins MCU/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_ports CLK_MB] [get_bd_pins INTC/processor_clk] [get_bd_pins MCU/Clk] [get_bd_pins MemoryBuffer/CLK_MB] [get_bd_pins axi_gpio/s_axi_aclk] [get_bd_pins axi_hwicap_0/icap_clk] [get_bd_pins axi_hwicap_0/s_axi_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_interconnect_0/M08_ACLK] [get_bd_pins axi_interconnect_0/M09_ACLK] [get_bd_pins axi_interconnect_0/M10_ACLK] [get_bd_pins axi_interconnect_0/M11_ACLK] [get_bd_pins axi_interconnect_0/M12_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins axi_uart_fpga_output/s_axi_aclk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins xadc_wiz_0/s_axi_aclk]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins MCU/LMB_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins MemoryBuffer/ARESETN] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins INTC/processor_rst] [get_bd_pins MCU/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_ports ARESETN] [get_bd_pins INTC/s_axi_aresetn] [get_bd_pins MCU/s_axi_aresetn] [get_bd_pins MemoryBuffer/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axi_gpio/s_axi_aresetn] [get_bd_pins axi_hwicap_0/s_axi_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_interconnect_0/M08_ARESETN] [get_bd_pins axi_interconnect_0/M09_ARESETN] [get_bd_pins axi_interconnect_0/M10_ARESETN] [get_bd_pins axi_interconnect_0/M11_ARESETN] [get_bd_pins axi_interconnect_0/M12_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins axi_uart_fpga_output/s_axi_aresetn] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn] [get_bd_pins xadc_wiz_0/s_axi_aresetn]
  connect_bd_net -net vcc_1_dout [get_bd_pins rst_clk_wiz_1_100M/aux_reset_in] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in] [get_bd_pins vcc_1/dout]
  connect_bd_net -net xadc_wiz_0_ip2intc_irpt [get_bd_pins INTC/xadc_intc] [get_bd_pins xadc_wiz_0/ip2intc_irpt]
  connect_bd_net -net xadc_wiz_0_temp_out [get_bd_pins MemoryBuffer/device_temp_i] [get_bd_pins xadc_wiz_0/temp_out]

  # Create address segments
  create_bd_addr_seg -range 0x00080000 -offset 0x00000000 [get_bd_addr_spaces MCU/mdm_1/Data] [get_bd_addr_segs MCU/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB1/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x80000000 -offset 0x80000000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs AXIL_MEM_OUT/Reg] SEG_AXIL_MEM_OUT_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40060000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs AXIL_PERIPHERAL/Reg] SEG_AXIL_PERIPHERAL_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40070000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MemoryBuffer/axi_cdma_0/S_AXI_LITE/Reg] SEG_axi_cdma_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40080000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MemoryBuffer/axi_cdma_1/S_AXI_LITE/Reg] SEG_axi_cdma_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40000000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs axi_gpio/S_AXI/Reg] SEG_axi_gpio_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40090000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs axi_hwicap_0/S_AXI_LITE/Reg] SEG_axi_hwicap_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x400A0000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40010000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40020000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40030000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs axi_uart_fpga_output/S_AXI/Reg] SEG_axi_uart_fpga_output_Reg
  create_bd_addr_seg -range 0x00080000 -offset 0x00000000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00080000 -offset 0x00000000 [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs MCU/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00001000 -offset 0x400B0000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/mdm_1/S_AXI/Reg] SEG_mdm_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40050000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs INTC/microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40040000 [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs xadc_wiz_0/s_axi_lite/Reg] SEG_xadc_wiz_0_Reg
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces MemoryBuffer/axi_cdma_0/Data] [get_bd_addr_segs MemoryBuffer/dimm0_ctrl/memmap/memaddr] SEG_dimm0_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x000400000000 [get_bd_addr_spaces MemoryBuffer/axi_cdma_1/Data] [get_bd_addr_segs MemoryBuffer/dimm1_ctrl/memmap/memaddr] SEG_dimm1_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces MemoryBuffer/axi_datamover_0/Data_MM2S] [get_bd_addr_segs MemoryBuffer/dimm0_ctrl/memmap/memaddr] SEG_dimm0_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces MemoryBuffer/axi_datamover_0/Data_S2MM] [get_bd_addr_segs MemoryBuffer/dimm0_ctrl/memmap/memaddr] SEG_dimm0_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x000400000000 [get_bd_addr_spaces MemoryBuffer/axi_datamover_0/Data_MM2S] [get_bd_addr_segs MemoryBuffer/dimm1_ctrl/memmap/memaddr] SEG_dimm1_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x000400000000 [get_bd_addr_spaces MemoryBuffer/axi_datamover_0/Data_S2MM] [get_bd_addr_segs MemoryBuffer/dimm1_ctrl/memmap/memaddr] SEG_dimm1_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x00000000 [get_bd_addr_spaces AXIL_MEM_IN] [get_bd_addr_segs MemoryBuffer/dimm0_ctrl/memmap/memaddr] TEL_dimm0_ctrl_memaddr
  create_bd_addr_seg -range 0x000400000000 -offset 0x000400000000 [get_bd_addr_spaces AXIL_MEM_IN] [get_bd_addr_segs MemoryBuffer/dimm1_ctrl/memmap/memaddr] TEL_dimm1_ctrl_memaddr

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port dimm1_init_calib_complete -pg 1 -y 1530 -defaultsOSRD
preplace port MEM_ADDR_MSB -pg 1 -y 930 -defaultsOSRD
preplace port dimm0_init_calib_complete -pg 1 -y 1510 -defaultsOSRD
preplace port AXIL_PERIPHERAL -pg 1 -y 360 -defaultsOSRD
preplace port UART -pg 1 -y 740 -defaultsOSRD
preplace port TEST_POINT -pg 1 -y 910 -defaultsOSRD
preplace port S_AXIS_MM2S_CMD -pg 1 -y 1410 -defaultsOSRD
preplace port SYS_CLK_0 -pg 1 -y 1370 -defaultsOSRD
preplace port CLK_MGT_INIT -pg 1 -y 320 -defaultsOSRD
preplace port SYS_CLK_1 -pg 1 -y 1390 -defaultsOSRD
preplace port STARTUP_IO -pg 1 -y 240 -defaultsOSRD
preplace port S_AXIS_S2MM_CMD -pg 1 -y 1450 -defaultsOSRD
preplace port QSPI -pg 1 -y 220 -defaultsOSRD
preplace port M_AXIS_S2MM_STS -pg 1 -y 1450 -defaultsOSRD
preplace port CLK_DATA -pg 1 -y 1670 -defaultsOSRD
preplace port IIC -pg 1 -y 420 -defaultsOSRD
preplace port AXIL_MEM_OUT -pg 1 -y 340 -defaultsOSRD
preplace port S_AXIS_S2MM -pg 1 -y 1430 -defaultsOSRD
preplace port M_AXIS_MM2S -pg 1 -y 1410 -defaultsOSRD
preplace port CLK_MB -pg 1 -y 850 -defaultsOSRD
preplace port AXIL_MEM_IN -pg 1 -y 1350 -defaultsOSRD
preplace port M_AXIS_MM2S_STS -pg 1 -y 1430 -defaultsOSRD
preplace port DIMM0 -pg 1 -y 1370 -defaultsOSRD
preplace port DIMM1 -pg 1 -y 1390 -defaultsOSRD
preplace portBus ARESETN -pg 1 -y 990 -defaultsOSRD
preplace inst axi_uart_fpga_output -pg 1 -lvl 4 -y 740 -defaultsOSRD
preplace inst MCU -pg 1 -lvl 2 -y 870 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 4 -y 430 -defaultsOSRD
preplace inst xadc_wiz_0 -pg 1 -lvl 4 -y 1160 -defaultsOSRD
preplace inst axi_timer_0 -pg 1 -lvl 4 -y 580 -defaultsOSRD
preplace inst MemoryBuffer -pg 1 -lvl 4 -y 1470 -defaultsOSRD
preplace inst axi_gpio -pg 1 -lvl 4 -y 910 -defaultsOSRD
preplace inst INTC -pg 1 -lvl 1 -y 890 -defaultsOSRD
preplace inst vcc_1 -pg 1 -lvl 2 -y 1030 -defaultsOSRD
preplace inst axi_interconnect_0 -pg 1 -lvl 3 -y 370 -defaultsOSRD
preplace inst axi_hwicap_0 -pg 1 -lvl 4 -y 80 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 3 -y 990 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 3 -y 1740 -defaultsOSRD
preplace inst axi_quad_spi_0 -pg 1 -lvl 4 -y 250 -defaultsOSRD
preplace netloc SYS_CLK_1_1 1 0 4 NJ 1390 NJ 1390 NJ 1390 NJ
preplace netloc axi_quad_spi_0_SPI_0 1 4 1 NJ
preplace netloc axi_interconnect_0_M09_AXI 1 3 1 1110
preplace netloc xadc_wiz_0_temp_out 1 3 2 1250 1010 1650
preplace netloc axi_uart_fpga_output_ip2intc_irpt 1 0 5 50 700 NJ 700 700J 820 NJ 820 1670
preplace netloc AXIL_MEM_IN_1 1 0 4 NJ 1350 NJ 1350 NJ 1350 NJ
preplace netloc MemoryBuffer_M_AXIS_MM2S_STS 1 4 1 NJ
preplace netloc axi_interconnect_0_M12_AXI 1 1 3 370 730 NJ 730 1090
preplace netloc MemoryBuffer_M_AXIS_MM2S 1 4 1 NJ
preplace netloc microblaze_0_Clk 1 0 5 70 1550 370 1550 690 1550 1140 840 1670J
preplace netloc MemoryBuffer_init_calib_complete 1 4 1 NJ
preplace netloc axi_gpio_GPIO1 1 4 1 1670J
preplace netloc axi_interconnect_0_M10_AXI 1 3 1 1150
preplace netloc axi_interconnect_0_M02_AXI 1 3 1 1220
preplace netloc xadc_wiz_0_ip2intc_irpt 1 0 5 90 1090 NJ 1090 NJ 1090 1220J 1000 1660
preplace netloc In5_1 1 0 5 20 1640 NJ 1640 NJ 1640 NJ 1640 1660
preplace netloc axi_quad_spi_0_STARTUP_IO 1 4 1 NJ
preplace netloc axi_gpio_GPIO2 1 4 1 1670J
preplace netloc axi_uart_fpga_output_UART 1 4 1 1700J
preplace netloc axi_interconnect_0_M07_AXI 1 3 1 1160
preplace netloc MemoryBuffer_init_calib_complete1 1 4 1 NJ
preplace netloc S_AXIS_S2MM_1 1 0 4 NJ 1430 NJ 1430 NJ 1430 NJ
preplace netloc MemoryBuffer_M_AXIS_S2MM_STS 1 4 1 NJ
preplace netloc axi_interconnect_0_M04_AXI 1 3 2 1210J 340 NJ
preplace netloc axi_interconnect_0_M08_AXI 1 3 1 1130
preplace netloc rst_clk_wiz_1_100M_interconnect_aresetn 1 2 2 730 1510 1100
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 1 3 380 760 NJ 760 1090
preplace netloc MemoryBuffer_ui_clk 1 2 3 750 1660 NJ 1660 1680
preplace netloc MemoryBuffer_DDR3 1 4 1 NJ
preplace netloc S00_AXI_1 1 2 1 680
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 0 5 80 1590 380 1590 720 1590 1180 980 1680J
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 0 4 80 740 360 740 NJ 740 1100
preplace netloc clk_wiz_1_locked 1 2 2 750 1120 1090
preplace netloc axi_quad_spi_0_eos 1 3 2 1250 330 1680
preplace netloc axi_iic_0_IIC 1 4 1 1700J
preplace netloc MemoryBuffer_DDR4 1 4 1 NJ
preplace netloc axi_interconnect_0_M05_AXI 1 3 2 NJ 350 1700J
preplace netloc axi_interconnect_0_M00_AXI 1 0 4 70 0 NJ 0 NJ 0 1110
preplace netloc clk_wiz_1_clk_out2 1 3 2 1240 1730 1700J
preplace netloc S_AXIS_S2MM_CMD_1 1 0 4 NJ 1450 NJ 1450 NJ 1450 NJ
preplace netloc SYS_CLK_0_1 1 0 4 NJ 1370 NJ 1370 NJ 1370 NJ
preplace netloc axi_interconnect_0_M01_AXI 1 3 1 1200
preplace netloc clk_wiz_1_clk_out3 1 2 3 740 1100 1230 1750 1690J
preplace netloc S_AXIS_MM2S_CMD_1 1 0 4 NJ 1410 NJ 1410 NJ 1410 NJ
preplace netloc microblaze_0_axi_intc_interrupt 1 1 1 350
preplace netloc axi_interconnect_0_M06_AXI 1 3 1 1130
preplace netloc mdm_1_debug_sys_rst 1 2 1 680
preplace netloc axi_quad_spi_0_ip2intc_irpt 1 0 5 30 10 NJ 10 NJ 10 1230J 170 1690
preplace netloc In4_1 1 0 5 60 1080 NJ 1080 NJ 1080 1190J 990 1670
preplace netloc axi_interconnect_0_M11_AXI 1 3 1 1120
preplace netloc axi_interconnect_0_M03_AXI 1 3 1 1170
preplace netloc vcc_1_dout 1 2 1 700
preplace netloc axi_timer_0_interrupt 1 0 5 40 680 NJ 680 710J 830 NJ 830 1680
preplace netloc MemoryBuffer_ui_clk_rst 1 2 3 740 1650 NJ 1650 1650
levelinfo -pg 1 0 230 550 930 1450 1720 -top -10 -bot 1820
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


