vlog casting_1.sv

vsim -novopt -suppress 12110 tb
add wave -position insertpoint sim:/tb/*
run -all
