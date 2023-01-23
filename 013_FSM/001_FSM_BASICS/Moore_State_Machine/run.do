vlog FSM_3.v
vlog FSM_TB.v

vsim -novopt -suppress 12110 FSM_TB

add wave -position insertpoint sim:/FSM_TB/*

run -all
