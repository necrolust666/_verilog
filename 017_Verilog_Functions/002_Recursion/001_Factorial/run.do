vlog recursion_factorial.v

vsim -vopt -suppress 12110 rec_factorial
#add wave -position insertpoint sim:/rec_factorial/*
run -all
