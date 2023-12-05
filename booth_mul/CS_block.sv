`timescale 1ns / 1ps

module CS_block#(parameter int sizeRCA = 4) (
    input logic [sizeRCA-1:0] A,
    input logic [sizeRCA-1:0] B,
    input logic sel,
    output logic [sizeRCA-1:0] S,
    output logic Carry_o
    );
    
    module RCA #(parameter int N = 4) (
        input logic [N-1:0] A,
        input logic [N-1:0] B,
        input logic Carry_i,
        output logic [N-1:0] S,
        output logic Carry_o
    );
    endmodule
    
    RCA #(.N(sizeRCA)) RCA0  (
        .A(A),
        .B(B),
        .Carry_i(1'b0),
        .S(Sum0),   
        .Carry_o(carry0)
    );
            
    RCA #(.N(sizeRCA)) RCA1  (
        .A(A),
        .B(B),
        .Carry_i(1'b1),
        .S(Sum1),   
        .Carry_o(carry1)
    );
    
    always @ (carry1. carry0, Sum1, Sum0, sel) begin
        case (sel)
            1'b0: begin
                    assign S = Sum0;
                    assign Carry_o = carry0;
                  end
            1'b1: begin
                    assign S = Sum1;
                    assign Carry_o = carry1;
                  end
            default: begin
                    assign S = Sum0;
                    assign Carry_o = carry0;
                  end
        endcase
    end
                 
endmodule
