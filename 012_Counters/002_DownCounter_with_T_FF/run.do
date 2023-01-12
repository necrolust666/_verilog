vlog down_T.v
vlog down_T_tb.v

vsim -novopt -suppress 12110 down_T_tb 

add wave -position insertpoint sim:/down_T_tb/*

run -all
