
#vsim work.tb_fpnew_top
vsim -L /eda/dk/nangate45/verilog/qsim2020.4  -sdfmax /tb_fpnew_top/UUT=../syn/results/pparch/fpnew_top.sdf work.tb_fpnew_top
#vcd file ./design.vcd
#vcd add /tb_fpnew_top/UUT/*
add wave -position insertpoint sim:/tb_fpnew_top/UUT/*
run 500 ns
wave zoom full
