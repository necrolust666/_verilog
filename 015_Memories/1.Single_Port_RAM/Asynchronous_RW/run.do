vlog async_single_port_RAM.v
vlog async_single_port_RAM_TB.v

vsim -novopt -suppress 12110 async_single_port_RAM_TB
add wave -position insertpoint sim:/async_single_port_RAM_TB/*
run -all
