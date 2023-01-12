vlog bin2gray.v
vlog bin2gray_tb.v
vsim -novopt -suppress 12110 bin2gray_tb +BIN=4'b1111
add wave -position insertpoint sim:/bin2gray_tb/*

run -all
