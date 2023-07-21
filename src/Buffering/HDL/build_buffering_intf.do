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
  "$COMMON_HDL\Utilities\Pulse_gen.vhd" \
  "$COMMON_HDL\Utilities\sync_resetn.vhd"

#fir-00251-common
acom  \
  "$COMMON\VHDL\tel2000pkg.vhd" \
  "$COMMON\VHDL\Utilities\axis128_reg.vhd" \
  "$COMMON\VHDL\Utilities\axis128_img_boundaries.vhd" \
  "$COMMON\VHDL\Utilities\axis128_hole_sync.vhd" \
  "$COMMON\VHDL\Utilities\axis128_tid_gen.vhd" \
  "$COMMON\VHDL\fifo\t_axi4_stream64_fifo.vhd" \
  "$COMMON\VHDL\fifo\t_axi4_stream128_fifo.vhd" \
  "$COMMON\VHDL\Utilities\axil32_to_native96.vhd" \
  "$COMMON\VHDL\Utilities\shift_registers_x.vhd" \
  "$COMMON\VHDL\axis128_pixel_cnt.vhd" \
  "$COMMON\VHDL\buffering\BufferingDefine.vhd" \
  "$COMMON\VHDL\buffering\buffering_fsm.vhd" \
  "$COMMON\VHDL\buffering\axis64_img_sof.vhd" \
  "$COMMON\VHDL\Utilities\axis16_merge_axis64.vhd"
acom -relax "$COMMON\VHDL\buffering\buffering_Ctrl.vhd"

#source Buffering
acom "$BUF_INTF\memory_access_handler.vhd"
acom "$COMMON\VHDL\buffering\flow_controller.vhd"
#Top
acom "$COMMON\VHDL\buffering\buffering.bde"
acom "$BUF_INTF\buffering_wrapper.bde"	

#__END COMPILE BUFFERING


