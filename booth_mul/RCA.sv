`timescale 1ns / 1ps

module RCA #(parameter int N = 4) (
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic Carry_i,
    output logic [N-1:0] S,
    output logic Carry_o
);
  
    logic [N-1:0] STMP;
    logic [N:0] CTMP;

    module fullAdder (
        input logic a, b, Cin,
        output logic s, Co
    );
    endmodule
    
    genvar i;
    generate
        for(i = 0; i < N; i = i+1)
        begin 
            fullAdder FA (
                .a(A[i-1]),
                .b(B[i-1]),
                .Ci(CTMP[i-1]),
                .s(STMP[i-1]),
                .Co(CTMP[i])
                );
        end
    endgenerate
    
    assign CTMP[0] = Carry_i;
    assign S = STMP;
    assign Carry_o = CTMP[6];

 
endmodule

