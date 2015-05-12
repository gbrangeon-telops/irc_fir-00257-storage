adel -all

alib work
SetActiveLib work

setenv FIR257STORAGE "D:\Telops\FIR-00257-Storage"
setenv COMMON "D:\Telops\FIR-00251-Common"
    
# Compile Common Section
do "$COMMON\compile_all_common.do"

#MGT
do  	"$FIR257STORAGE\src\MGT\hdl\compile_mgt.do" 

#Buffering
do 		"$FIR257STORAGE\src\Buffering\HDL\build_buffering_intf.do"
								 
#CORE
acom  	"$FIR257STORAGE\src\BD\HDL\bd_wrapper.vhd" 

#top
acom  	"$FIR257STORAGE\src\fir_00257_top.bde"
