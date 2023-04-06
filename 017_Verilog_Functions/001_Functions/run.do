vlog functions.v

vsim -novopt -suppress 12110 function_ex
add wave -position insertpoint sim:/function_ex/*
run -all
