#vsim work.tb_iir -t ns -voptargs=+architecture
vsim work.daddaTree_tb
add wave *
#add wave -position insertpoint sim:/tb_iir/UUT/*

#add wave -position insertpoint sim:/tb_daddatree/dadda_tree/fastAdd
add wave -position insertpoint sim:/daddaTree_tb/dadda_tree/*
add wave -position insertpoint sim:/daddaTree_tb/dadda_tree/CSA0/*
add wave -position insertpoint sim:/daddaTree_tb/dadda_tree/CSA0/firstBlock/*

run 2000 ns
wave zoom full
#quit -sim
#exit -f