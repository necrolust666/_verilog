vlog ring_Dff.v
vlog ring_Dff_tb.v

vsim -novopt -suppress 12110 ring_Dff_tb 

add wave -position insertpoint sim:/ring_Dff_tb/*

run -all
