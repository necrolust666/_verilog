vlog backdoor_tst.v
vsim -novopt -suppress 12110 backdoor_tst
add wave -position insertpoint sim:/backdoor_tst/*
run -all
