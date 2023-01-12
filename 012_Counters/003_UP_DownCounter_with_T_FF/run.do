vlog upDown_T.v
vlog upDown_T_tb.v

vsim -novopt -suppress 12110 upDown_T_tb 

add wave -position insertpoint sim:/upDown_T_tb/*

run -all
