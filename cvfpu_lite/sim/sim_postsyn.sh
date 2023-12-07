source /eda/scripts/init_questa_core_prime
source /eda/scripts/init_design_vision

# Exit immediately if any command fails
set -e

DESIGN="fpnew_top" 
vlog -work ./work ../src/cf_math_pkg.sv
vlog -work ./work ../src/fpnew_pkg.sv

vcom -work ./work ../tb/clk_gen.vhd
vcom -work ./work ../tb/data_gen16.vhd
vlog -work ./work ../syn/results/pparch/fpnew_top_postsyn_netlist.v
vlog -work ./work ../tb/tb_fpnew_top_net.sv

vsim -do ./run.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript

