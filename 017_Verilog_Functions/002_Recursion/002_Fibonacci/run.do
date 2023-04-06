vlog fibo.v

vsim -vopt -suppress 12110 fibo_factorial
#add wave -position insertpoint sim:/fibo_factorial/*
run -all
