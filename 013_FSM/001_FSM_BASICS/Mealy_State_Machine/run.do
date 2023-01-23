vlog FSM_1_Mealy.v
vlog FSM_TB_1_Mealy.v

#vsim -novopt -suppress 12110 FSM_TB_1_Mealy
#add wave -position insertpoint sim:/FSM_TB_1_Mealy/*


vlog FSM_3_Mealy.v
vlog FSM_TB_Mealy.v
vsim -novopt -suppress 12110 FSM_TB_Mealy
add wave -position insertpoint sim:/FSM_TB_Mealy/*



run -all
