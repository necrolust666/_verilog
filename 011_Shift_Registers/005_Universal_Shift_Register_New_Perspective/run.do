vlog usr.v
vlog usrTB.v

vsim -novopt -suppress 12110 usrTB 

add wave -position insertpoint sim:/usrTB/*

run -all
