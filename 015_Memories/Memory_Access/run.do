vlog memory_types.v

vsim -novopt -suppress 12110 memory_types
add wave -position insertpoint sim:/memory_types/*
run -all
