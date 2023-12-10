`timescale 1ns / 1ps

module multiplier #(parameter N = 10)(
  input logic [N-1:0] A,
  input logic [N-1:0] B,
  output logic [2*N:0] result
);

logic [2:0] sel_temp;
logic [(N-2)/2 :0][N:0] partProducts;
logic [(N-2)/2 :0][N+2:0] ops;


assign sel_temp = {B[1:0], 1'b0};

LUT LUT0 (
  .sel(sel_temp),
  .A_in(A),
  .out(partProducts[0][N:0])
);

//assign partProducts[0][N+3:N+1] = {~partProducts[0][N],partProducts[0][N],partProducts[0][N]}; 


// matrix1 creation -> partial product placement 
genvar i;
generate
  for (i = 1; i <= ((N-2)/2); i=i+1) begin : STAGE_1toN

    LUT LUTs (
      .sel(B[(2*i+1) : (2*i-1)]),
      .A_in(A),
      .out(partProducts[i][N:0])
    );

//    if (i < 4) assign partProducts[i][N+2:N+1] = {1'b1, ~partProducts[0][N]};
//    else assign partProducts[i][N+2:N+1] = {1'b0, ~partProducts[0][N]};
  end
endgenerate


//create the operators matrix (made of partial products properly complemented and sign-extended)

generate
  for (i = 0; i <= ((N-2)/2); i=i+1) begin

    assign ops[i][N:0] = partProducts[i][N:0];
    
    if (i == 0) assign ops[i][N+2:N+1] = {partProducts[i][N],partProducts[i][N]}; 
    else if (i < 4) assign ops[i][N+2:N+1] = {1'b1, ~partProducts[0][N]};
    else assign ops[i][N+2:N+1] = {1'b1, ~partProducts[0][N]};
   
  end
endgenerate


daddaTree dadda (.ops(ops), .result(result));


endmodule
