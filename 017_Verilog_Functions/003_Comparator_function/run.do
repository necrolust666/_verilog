vlog compFunc.v
vlog compFunc_tb.v

vsim -vopt -suppress 12110 compFunc_tb
#add wave -position insertpoint sim:/compFunc_tb/*
run -all
