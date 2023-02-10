vlog vars.v
vlog accessVars_tb.v 

vsim -novopt -suppress 12110 accessVars_tb
add wave -position insertpoint sim:/accessVars_tb/*
run -all
