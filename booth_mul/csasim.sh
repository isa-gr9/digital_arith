#!/bin/sh

# Exit immediately if any command fails
set -e


#COMPILE
vlog -reportprogress 300 -work work ./halfAdder.sv
vlog -reportprogress 300 -work work ./fullAdder.sv
vlog -reportprogress 300 -work work ./RCA.sv
vlog -reportprogress 300 -work work ./CS_block.sv
vlog -reportprogress 300 -work work ./CSA.sv

#Testbench
vlog -reportprogress 300 -work work ./tb_csa.sv

vsim -do ./runcsa.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript