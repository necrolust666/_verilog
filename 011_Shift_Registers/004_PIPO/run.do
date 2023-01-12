vlog pipo.v
vlog pipoTB.v

vsim -novopt -suppress 12110 pipoTB 

add wave -position insertpoint sim:/pipoTB/*

run -all
