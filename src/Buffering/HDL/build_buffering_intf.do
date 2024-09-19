alib work
setactivelib work

setenv BUF_INTF "$FIR257STORAGE/src/Buffering/HDL"
setenv STORAGE "$FIR257STORAGE"

#__BEGIN COMPILE BUFFERING

#common_hdl
acom  \
  "$COMMON_HDL/Utilities/SYNC_RESET.vhd" \
  "$COMMON_HDL/Utilities/double_sync.vhd" \
  "$COMMON_HDL/Utilities/double_sync_vector.vhd" \
  "$COMMON_HDL/Utilities/Pulse_gen.vhd" \
  "$COMMON_HDL/Utilities/sync_resetn.vhd"

#fir-00251-common
acom  \
  "$FIR251COMMON/VHDL/tel2000pkg.vhd" \
  "$FIR251COMMON/VHDL/Utilities/axis128_reg.vhd" \
  "$FIR251COMMON/VHDL/Utilities/axis128_img_boundaries.vhd" \
  "$FIR251COMMON/VHDL/Utilities/axis128_hole_sync.vhd" \
  "$FIR251COMMON/VHDL/Utilities/axis128_tid_gen.vhd" \
  "$FIR251COMMON/VHDL/fifo/t_axi4_stream64_fifo.vhd" \
  "$FIR251COMMON/VHDL/fifo/t_axi4_stream128_fifo.vhd" \
  "$FIR251COMMON/VHDL/Utilities/axil32_to_native96.vhd" \
  "$FIR251COMMON/VHDL/Utilities/shift_registers_x.vhd" \
  "$FIR251COMMON/VHDL/axis128_pixel_cnt.vhd" \
  "$FIR251COMMON/VHDL/buffering/BufferingDefine.vhd" \
  "$FIR251COMMON/VHDL/buffering/buffering_fsm.vhd" \
  "$FIR251COMMON/VHDL/buffering/axis64_img_sof.vhd" \
  "$FIR251COMMON/VHDL/Utilities/axis16_merge_axis64.vhd"
acom -relax "$FIR251COMMON/VHDL/buffering/buffering_Ctrl.vhd"

#source Buffering
acom "$BUF_INTF/memory_access_handler.vhd"
acom "$FIR251COMMON/VHDL/buffering/flow_controller.vhd"
#Top
acom "$FIR251COMMON/VHDL/buffering/buffering.bde"
acom "$BUF_INTF/buffering_wrapper.bde"	

#__END COMPILE BUFFERING


