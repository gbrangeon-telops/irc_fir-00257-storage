alib work
setActivelib work

setenv BUF_INTF "D:\Telops\FIR-00257-Storage\src\Buffering\HDL"
setenv COMMON "D:\Telops\FIR-00251-Common"
setenv COMMON_HDL "D:\Telops\Common_HDL"
setenv STORAGE "D:\Telops\FIR-00257-Storage"
setenv PROC "D:\Telops\FIR-00251-Proc"

#__BEGIN COMPILE BUFFERING

# Package
acom  "$COMMON\VHDL\tel2000pkg.vhd"

#common_hdl
acom "$COMMON_HDL\Utilities\SYNC_RESET.vhd"
acom "$COMMON_HDL\Utilities\double_sync.vhd"
acom "$COMMON_HDL\Utilities\double_sync_vector.vhd"
acom "$COMMON_HDL\Utilities\sync_resetn.vhd"

#fir-00251-common
acom "$STORAGE\IP\ip_axis32_fanout2\ip_axis32_fanout2_funcsim.vhdl"
acom "$COMMON\VHDL\Utilities\axis32_fanout2.vhd"
acom "$COMMON\VHDL\Utilities\axis32_sw_1_2.vhd"
acom "$COMMON\VHDL\Utilities\axis32_sw_2_1.vhd"
acom "$COMMON\VHDL\Utilities\axis32_hole.vhd"				 
acom "$COMMON\VHDL\Utilities\axis32_reg.vhd"
acom "$COMMON\VHDL\Utilities\axis32_stub.vhd"
acom "$COMMON\VHDL\Utilities\axis32_hole_sync.vhd"
acom "$COMMON\VHDL\Utilities\axis32_img_boundaries.vhd"		 
acom "$STORAGE\IP\t_axi4_stream32_sfifo_d16\t_axi4_stream32_sfifo_d16_funcsim.vhdl"
acom "$STORAGE\IP\t_axi4_stream32_sfifo_d64\t_axi4_stream32_sfifo_d64_funcsim.vhdl"
acom "$STORAGE\IP\t_axi4_stream32_sfifo_d256\t_axi4_stream32_sfifo_d256_funcsim.vhdl"
acom "$STORAGE\IP\t_axi4_stream32_afifo_d512\t_axi4_stream32_afifo_d512_funcsim.vhdl"
acom "$STORAGE\IP\t_axi4_stream32_sfifo_d2048\t_axi4_stream32_sfifo_d2048_funcsim.vhdl"
acom "$STORAGE\IP\ip_axis16_merge_axis32\ip_axis16_merge_axis32_funcsim.vhdl"
acom "$COMMON\VHDL\fifo\t_axi4_stream32_fifo.vhd"
acom "$COMMON\VHDL\Utilities\axil32_to_native96.vhd"
acom "$COMMON\VHDL\Utilities\shift_registers_x.vhd"
acom "$COMMON\VHDL\axis32_pixel_cnt.vhd"
acom "$COMMON\VHDL\Utilities\axis16_merge_axis32.vhd"

#source Buffering
acom "$COMMON\VHDL\buffering\BufferingDefine.vhd"
acom "$BUF_INTF\buffering_fsm.vhd"
acom -relax "$BUF_INTF\buffering_Ctrl.vhd"
acom "$STORAGE\IP\buffer_table_ram\buffer_table_ram_funcsim.vhdl"
acom "$COMMON\VHDL\buffering\axis32_img_sof.vhd"
acom "$COMMON\VHDL\buffering\axis32_img_eof.vhd"

#Top
acom "$BUF_INTF\buffering.bde"

#__END COMPILE BUFFERING


