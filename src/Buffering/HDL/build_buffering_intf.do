alib work
setActivelib work

setenv BUF_INTF "D:\Telops\FIR-00257-Storage\src\Buffering\HDL"
setenv COMMON "D:\Telops\FIR-00251-Common"
setenv COMMON_HDL "D:\Telops\Common_HDL"
setenv STORAGE "D:\Telops\FIR-00257-Storage"

#__BEGIN COMPILE BUFFERING

#common_hdl
acom  \
  "$COMMON_HDL\Utilities\SYNC_RESET.vhd" \
  "$COMMON_HDL\Utilities\double_sync.vhd" \
  "$COMMON_HDL\Utilities\double_sync_vector.vhd" \
  "$COMMON_HDL\Utilities\sync_resetn.vhd"

#fir-00251-common
acom  \
  "$COMMON\VHDL\tel2000pkg.vhd" \
  "$STORAGE\IP\ip_axis32_fanout2\ip_axis32_fanout2_funcsim.vhdl" \
  "$COMMON\VHDL\Utilities\axis32_fanout2.vhd" \
  "$COMMON\VHDL\Utilities\axis32_sw_1_2.vhd" \
  "$COMMON\VHDL\Utilities\axis32_sw_2_1.vhd" \
  "$COMMON\VHDL\Utilities\axis32_hole.vhd" \
  "$COMMON\VHDL\Utilities\axis32_reg.vhd" \
  "$COMMON\VHDL\Utilities\axis32_stub.vhd" \
  "$COMMON\VHDL\Utilities\axis32_hole_sync.vhd" \
  "$COMMON\VHDL\Utilities\axis32_tid_gen.vhd" \
  "$COMMON\VHDL\Utilities\axis32_img_boundaries.vhd" \
  "$STORAGE\IP\t_axi4_stream32_sfifo_d16\t_axi4_stream32_sfifo_d16_funcsim.vhdl" \
  "$STORAGE\IP\t_axi4_stream32_sfifo_d64\t_axi4_stream32_sfifo_d64_funcsim.vhdl" \
  "$STORAGE\IP\t_axi4_stream32_sfifo_d256\t_axi4_stream32_sfifo_d256_funcsim.vhdl" \
  "$STORAGE\IP\t_axi4_stream32_afifo_d512\t_axi4_stream32_afifo_d512_funcsim.vhdl" \
  "$STORAGE\IP\t_axi4_stream32_sfifo_d2048\t_axi4_stream32_sfifo_d2048_funcsim.vhdl" \
  "$STORAGE\IP\ip_axis16_merge_axis32\ip_axis16_merge_axis32_funcsim.vhdl" \
  "$COMMON\VHDL\fifo\t_axi4_stream32_fifo.vhd" \
  "$COMMON\VHDL\Utilities\axil32_to_native96.vhd" \
  "$COMMON\VHDL\Utilities\shift_registers_x.vhd" \
  "$COMMON\VHDL\axis32_pixel_cnt.vhd" \
  "$COMMON\VHDL\Utilities\axis16_merge_axis32.vhd"

#source Buffering
acom  \
  "$COMMON\VHDL\buffering\BufferingDefine.vhd" \
  "$BUF_INTF\buffering_fsm.vhd" \
  "$STORAGE\IP\buffer_table_ram\buffer_table_ram_funcsim.vhdl" \
  "$COMMON\VHDL\buffering\axis32_img_sof.vhd" \
  "$COMMON\VHDL\buffering\axis32_img_eof.vhd"
acom -relax "$BUF_INTF\buffering_Ctrl.vhd"

#Top
acom "$BUF_INTF\buffering.bde"

#__END COMPILE BUFFERING


