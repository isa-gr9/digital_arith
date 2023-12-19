#!/bin/sh

# Move to the run directory
cd ../syn
mkdir work

source /eda/scripts/init_design_vision

TIME=`date "+%T"`
DATE=`date +%d-%m-%y` 
FILE=sys
EXT=.log
FINALS=${FILE}_${DATE}_${TIME}_dc${EXT}
FINALP=${FILE}_${DATE}_${TIME}_pt${EXT}


echo "Running the synthesis.."

# Check if a command line parameter is provided
if [ "$#" -eq 0 ]; then
    # If no parameter is provided, use the default script
    dc_shell-xg-t -64 -f ./syn_booth.tcl > ${FINALS}
else
    # If an invalid parameter is provided, display an error message
    echo "Invalid parameter. Usage: $0 [cg]"
    exit 1
fi

