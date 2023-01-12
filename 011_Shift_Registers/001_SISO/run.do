vlog siso.v
vlog sisoTB.v

vsim -novopt -suppress 12110 sisoTB 

add wave -position insertpoint sim:/sisoTB/*

run -all
