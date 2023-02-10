vlog string_.v

vsim -novopt -suppress 12110 string_
add wave -position insertpoint sim:/string_/*
run -all
