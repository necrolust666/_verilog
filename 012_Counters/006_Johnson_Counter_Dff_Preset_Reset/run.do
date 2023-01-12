vlog johnson_Dff.v
vlog johnson_Dff_tb.v

vsim -novopt -suppress 12110 johnson_Dff_tb

add wave -position insertpoint sim:/johnson_Dff_tb /*

run -all
