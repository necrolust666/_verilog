vlog Single_Port_ROM.v
vlog Single_Port_ROM_tb.v
vsim -novopt -suppress 12110 Single_Port_ROM_tb
add wave -position insertpoint sim:/Single_Port_ROM_tb/*
run -all
