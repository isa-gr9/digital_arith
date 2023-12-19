#!/bin/sh

# Exit immediately if any command fails
set -e


#COMPILE

vlog ../cvfpu_lite/src/cf_math_pkg.sv
vlog ../cvfpu_lite/src/lzc.sv
vlog ../cvfpu_lite/src/rr_arb_tree.sv
vlog ../cvfpu_lite/src/fpnew_pkg.sv
vlog ../cvfpu_lite/src/fpnew_classifier.sv
vlog ../cvfpu_lite/src/fpnew_rounding.sv
vlog ../cvfpu_lite/src/fpnew_fma.sv
vlog ../cvfpu_lite/src/fpnew_opgroup_fmt_slice.sv
vlog ../cvfpu_lite/src/fpnew_opgroup_block.sv
vlog ../cvfpu_lite/src/fpnew_top.sv

#Testbench
vcom ../cvfpu_lite/tb/clk_gen.vhd
vcom ../cvfpu_lite/tb/data_gen16.vhd
vlog ../cvfpu_lite/tb/tb_fpnew_top_rtl.sv


vsim -do ./gui_run.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript