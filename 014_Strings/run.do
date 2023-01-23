vlog string_.v

vsim -novopt -suppress 12110 string_.v
add wave -position insertpoint sim:/string_.v/*
run -all
