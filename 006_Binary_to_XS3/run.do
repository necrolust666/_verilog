vlog bin2xs3.v
vlog bin2xs3_tb.v
vsim -novopt -suppress 12110 bin2xs3_tb

add wave -position insertpoint sim:/bin2xs3_tb/*

#run -all
