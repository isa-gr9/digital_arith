`timescale 1ns / 1ps

module LUT #(parameter N = 10)
  (input logic [2:0] sel,
   input logic [N-1:0] A_in,
   output logic [N:0] out);

  

  always_comb begin
    case (sel)
      3'b000: out = '0;
      3'b001: out = A_in;
      3'b010: out = A_in;
      3'b011: out = {A_in[(N-1):0], 1'b0};
      3'b100: out = ~{A_in[(N-1):0], 1'b0};
      3'b101: out = ~A_in; 
      3'b110: out = ~A_in;
      3'b111: out = '0;
      default: out = '0;
    endcase
  end

endmodule
