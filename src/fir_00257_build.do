adel -all

alib work
setactivelib work

#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
set parts [file split $current_file_location_absolute_path]
setenv root_location_absolute_path [file join {*}[lrange $parts 0 end-2]]

setenv FIR251PROC "$root_location_absolute_path/irc_fir-00251-proc/"
setenv FIR251COMMON "$root_location_absolute_path/irc_fir-00251-common/"
setenv FIR257STORAGE "$root_location_absolute_path/irc_fir-00257-storage/"
setenv COMMON_HDL "$root_location_absolute_path/irc_common_hdl/"

#__BEGIN COMPILE STORAGE

# Compile Common Section
do 		"$FIR251COMMON/compile_all_common.do"

#MGT
acom  \
  "$FIR257STORAGE/src/MGT/hdl/mgt_block.bde" \
  "$FIR257STORAGE/src/MGT/hdl/storage_mgt_wrapper.bde" 

#Buffering
do 		"$FIR257STORAGE/src/Buffering/HDL/build_buffering_intf.do"

#CORE
acom  	"$FIR257STORAGE/src/BD/HDL/bd_wrapper.vhd"

#top
acom  	"$FIR257STORAGE/src/fir_257_top.bde"

#__END COMPILE STORAGE
