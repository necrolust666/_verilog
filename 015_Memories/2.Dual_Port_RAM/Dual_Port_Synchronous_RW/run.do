vlog dual_port_RAM.v
vlog dual_port_RAM_TB.v

vsim -novopt -suppress 12110 dual_port_RAM_TB
vsim -debugDB dual_port_RAM_TB
add wave -position insertpoint sim:/dual_port_RAM_TB/*
run -all


