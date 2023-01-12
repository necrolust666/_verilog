vlog ringC.v
vlog ringC_TB.v

vsim -novopt -suppress 12110 ringC_TB 

add wave -position insertpoint sim:/ringC_TB/*

run -all
