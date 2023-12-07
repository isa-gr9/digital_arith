`timescale 1ns / 1ps

module CSA #(parameter int sizeCSA = 20, int sizeRCA = 4) (
    input logic [sizeCSA-1:0] A,
    input logic [sizeCSA-1:0] B,
    input logic Carry_i,
    output logic [sizeCSA-1:0] S,
    output logic Carry_o
    );


    module CS_block#(parameter int sizeRCA = 4) (
        input logic [sizeRCA-1:0] A,
        input logic [sizeRCA-1:0] B,
        input logic sel,
        output logic [sizeRCA-1:0] S,
        output logic Carry_o
    );
    endmodule
    
    logic carrySel[(sizeCSA/sizeRCA)-1 : 0];
    
    CS_block #(.sizeRCA(sizeRCA)) firstBlock  (
                .A(A[sizeRCA - 1 : 0]),
                .B(B[sizeRCA - 1 : 0]),
                .sel(Carry_i),
                .S(S[sizeRCA - 1 : 0]),
                .Carry_o(carrySel[0])
            );
    
    genvar i;
    generate
        for (i = 1; i <= (sizeCSA/sizeRCA)-1; i=i+1) begin : STAGE_1toN
           
      
            CS_block #(.sizeRCA(sizeRCA)) RCA0  (
                .A(A[((i * sizeRCA)+(sizeRCA - 1)) : i * sizeRCA]),
                .B(B[((i * sizeRCA)+(sizeRCA - 1)) : i * sizeRCA]),
                .sel(carrySel[i-1]),
                .S(S[((i * sizeRCA)+(sizeRCA - 1)) : i * sizeRCA]),   
                .Carry_o(carrySel[i])
            );
            
       end   
    endgenerate
    
endmodule
