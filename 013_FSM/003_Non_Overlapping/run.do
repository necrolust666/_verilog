vlog seqDet_111_NO.v
vlog seqDet_111_TB_NO.v

vsim -novopt -suppress 12110 seqDet_111_TB_NO
add wave -position insertpoint sim:/seqDet_111_TB_NO/*
run -all
