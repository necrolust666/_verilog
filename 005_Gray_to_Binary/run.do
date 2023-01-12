vlog gray2bin.v
vlog gray2bin_tb.v
vsim -novopt -suppress 12110 gray2bin_tb

add wave -position insertpoint sim:/gray2bin_tb/*

run -all
