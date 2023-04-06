vlog enum.sv

vsim -novopt -suppress 12110 tb
add wave -position insertpoint sim:/tb/*
run -all
