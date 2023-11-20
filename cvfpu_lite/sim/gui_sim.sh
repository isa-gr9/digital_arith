#!/bin/sh

# Exit immediately if any command fails
set -e


#COMPILE

vlog ../src/cf_math_pkg.sv
vlog ../src/lzc.sv
vlog ../src/rr_arb_tree.sv
vlog ../src/fpnew_pkg.sv
vlog ../src/fpnew_classifier.sv
vlog ../src/fpnew_rounding.sv
vlog ../src/fpnew_fma.sv
vlog ../src/fpnew_opgroup_fmt_slice.sv
vlog ../src/fpnew_opgroup_block.sv
vlog ../src/fpnew_top.sv

#Testbench
vcom ../tb/clk_gen.vhd
vcom ../tb/data_gen16.vhd
vlog ../tb/tb_fpnew_top_rtl.sv


vsim -do ./gui_run.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript