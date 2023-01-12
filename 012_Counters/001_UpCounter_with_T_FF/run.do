vlog up_T.v
vlog up_T_tb.v

vsim -novopt -suppress 12110 up_T_tb 

add wave -position insertpoint sim:/up_T_tb/*

run -all
