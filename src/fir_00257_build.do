adel -all

alib work
SetActiveLib work

setenv FIR257STORAGE "D:\Telops\FIR-00257-Storage"
setenv COMMON "D:\Telops\FIR-00251-Common"

#__BEGIN COMPILE STORAGE

# Compile Common Section
do 		"$COMMON\compile_all_common.do"

#MGT
acom  \
  "$FIR257STORAGE\src\MGT\hdl\mgt_block.bde" \
  "$FIR257STORAGE\src\MGT\hdl\storage_mgt_wrapper.bde" 

#Buffering
do 		"$FIR257STORAGE\src\Buffering\HDL\build_buffering_intf.do"
								 
#CORE
acom  	"$FIR257STORAGE\src\BD\HDL\bd_wrapper.vhd"

#top
acom  	"$FIR257STORAGE\src\fir_257_top.bde"

#__END COMPILE STORAGE
