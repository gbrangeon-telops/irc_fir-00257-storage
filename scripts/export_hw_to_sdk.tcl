set root_dir "d:/Telops/fir-00257-Storage"
set proj_name "fir_00257_Storage_$memconf"
set runs_dir "$root_dir/xilinx/$proj_name.runs"
set top_level "fir_257_top"
set top_level_bd "fir_257_top_bd"

write_hwdef -force -file $runs_dir/synth_1/$top_level.hwdef
write_sysdef -force -hwdef $runs_dir/synth_1/$top_level.hwdef -bitfile $runs_dir/impl_1/$top_level.bit -meminfo $runs_dir/impl_1/$top_level.mmi -file $runs_dir/impl_1/$top_level.sysdef
file copy -force $runs_dir/impl_1/$top_level.sysdef $root_dir/sdk/hw_$memconf/$top_level.hdf
