vlog d_ff.v
vlog d_latch.v
vlog d_ff_async.v
vlog tst_d.v
vsim -novopt -suppress 12110 tst_d 

add wave -position insertpoint sim:/tst_d/*

run -all
