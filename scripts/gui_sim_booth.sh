#!/bin/sh

# Exit immediately if any command fails
#set -e


#COMPILE
vlog -reportprogress 300 -work work ../booth_mul/halfAdder.sv
vlog -reportprogress 300 -work work ../booth_mul/fullAdder.sv
vlog -reportprogress 300 -work work ../booth_mul/RCA.sv
vlog -reportprogress 300 -work work ../booth_mul/CS_block.sv
vlog -reportprogress 300 -work work ../booth_mul/CSA.sv
vlog -reportprogress 300 -work work ../booth_mul/LUT.sv
vlog -reportprogress 300 -work work ../booth_mul/daddatree.sv
vlog -reportprogress 300 -work work ../booth_mul/multiplier.sv
#Testbench
vlog -reportprogress 300 -work work ./tb_mul.sv

vsim -do ./run_booth.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript
