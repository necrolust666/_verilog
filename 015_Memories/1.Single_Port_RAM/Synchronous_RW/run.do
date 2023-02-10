vlog single_port_RAM.v
vlog single_port_RAM_TB.v

vsim -novopt -suppress 12110 single_port_RAM_TB
add wave -position insertpoint sim:/single_port_RAM_TB/*
run -all
