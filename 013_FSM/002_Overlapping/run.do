vlog seqDet_111.v
vlog seqDet_111_TB.v

vsim -novopt -suppress 12110 seqDet_111_TB
add wave -position insertpoint sim:/seqDet_111_TB/*
run -all
