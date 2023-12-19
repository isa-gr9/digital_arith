###################################################################

# Created by write_sdc on Tue Dec 19 19:39:10 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 3.40189 [get_ports in_ready_o]
set_load -pin_load 3.40189 [get_ports {result_o[15]}]
set_load -pin_load 3.40189 [get_ports {result_o[14]}]
set_load -pin_load 3.40189 [get_ports {result_o[13]}]
set_load -pin_load 3.40189 [get_ports {result_o[12]}]
set_load -pin_load 3.40189 [get_ports {result_o[11]}]
set_load -pin_load 3.40189 [get_ports {result_o[10]}]
set_load -pin_load 3.40189 [get_ports {result_o[9]}]
set_load -pin_load 3.40189 [get_ports {result_o[8]}]
set_load -pin_load 3.40189 [get_ports {result_o[7]}]
set_load -pin_load 3.40189 [get_ports {result_o[6]}]
set_load -pin_load 3.40189 [get_ports {result_o[5]}]
set_load -pin_load 3.40189 [get_ports {result_o[4]}]
set_load -pin_load 3.40189 [get_ports {result_o[3]}]
set_load -pin_load 3.40189 [get_ports {result_o[2]}]
set_load -pin_load 3.40189 [get_ports {result_o[1]}]
set_load -pin_load 3.40189 [get_ports {result_o[0]}]
set_load -pin_load 3.40189 [get_ports status_o_NV_]
set_load -pin_load 3.40189 [get_ports status_o_DZ_]
set_load -pin_load 3.40189 [get_ports status_o_OF_]
set_load -pin_load 3.40189 [get_ports status_o_UF_]
set_load -pin_load 3.40189 [get_ports status_o_NX_]
set_load -pin_load 3.40189 [get_ports tag_o]
set_load -pin_load 3.40189 [get_ports out_valid_o]
set_load -pin_load 3.40189 [get_ports busy_o]
create_clock [get_ports clk_i]  -name CLK_SYS  -period 2.6  -waveform {0 1.3}
set_clock_uncertainty 0.07  [get_clocks CLK_SYS]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports clk_i]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports rst_ni]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[47]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[46]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[45]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[44]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[43]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[42]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[41]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[40]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[39]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[38]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[37]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[36]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[35]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[34]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[33]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[32]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[31]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[30]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[29]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[28]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[27]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[26]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[25]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[24]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[23]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[22]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[21]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[20]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[19]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[18]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[17]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[16]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[15]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[14]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[13]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[12]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[11]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[10]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[9]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[8]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[7]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[6]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[5]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[4]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[3]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {operands_i[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {rnd_mode_i[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {rnd_mode_i[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {rnd_mode_i[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {op_i[3]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {op_i[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {op_i[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {op_i[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports op_mod_i]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {src_fmt_i[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {src_fmt_i[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {src_fmt_i[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {dst_fmt_i[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {dst_fmt_i[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {dst_fmt_i[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {int_fmt_i[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {int_fmt_i[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports vectorial_op_i]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports tag_i]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports in_valid_i]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports flush_i]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports out_ready_i]
set_output_delay -clock CLK_SYS  0.5  [get_ports in_ready_o]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[15]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[14]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[13]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[12]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[11]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[10]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[9]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[8]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[7]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[6]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[5]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[4]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[3]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[2]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[1]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {result_o[0]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports status_o_NV_]
set_output_delay -clock CLK_SYS  0.5  [get_ports status_o_DZ_]
set_output_delay -clock CLK_SYS  0.5  [get_ports status_o_OF_]
set_output_delay -clock CLK_SYS  0.5  [get_ports status_o_UF_]
set_output_delay -clock CLK_SYS  0.5  [get_ports status_o_NX_]
set_output_delay -clock CLK_SYS  0.5  [get_ports tag_o]
set_output_delay -clock CLK_SYS  0.5  [get_ports out_valid_o]
set_output_delay -clock CLK_SYS  0.5  [get_ports busy_o]