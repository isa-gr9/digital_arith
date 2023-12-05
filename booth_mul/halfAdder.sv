`timescale 1ns / 1ps

module halfAdder (
  input logic A, B,
  output logic Sum, Cout
);

  assign Sum = A ^ B;
  assign Cout = A & B;

endmodule
