#!/bin/sh

# Exit immediately if any command fails
set -e


#COMPILE

vlog -reportprogress 300 -work work /home/manu/Documents/ISA/isa_lab2/booth_mul/halfAdder.sv
vlog -reportprogress 300 -work work /home/manu/Documents/ISA/isa_lab2/booth_mul/fullAdder.sv
vlog -reportprogress 300 -work work /home/manu/Documents/ISA/isa_lab2/booth_mul/CSA.sv
vlog -reportprogress 300 -work work /home/manu/Documents/ISA/isa_lab2/booth_mul/test.sv


#Testbench
vlog -reportprogress 300 -work work /home/manu/Documents/ISA/isa_lab2/booth_mul/tb_daddatree.sv

vsim work.daddaTree_tb

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript