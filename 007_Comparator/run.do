vlog four_bit_comp.v
vlog four_bit_compTB.v
vsim -novopt -suppress 12110 four_bit_compTB 

add wave -position insertpoint sim:/four_bit_compTB/*

run -all
