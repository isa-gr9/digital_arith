`timescale 1ns / 1ps

module multiplier #(parameter N = 10)(
  input logic [N-1:0] A,
  input logic [N-1:0] B,
  output logic [N-1:0] result
);

  // LUT component declaration
  module LUT #(parameter N = 10)
  (
    input logic [2:0] sel,
    input logic [N-1:0] A_in,
    output logic [N:0] out
  );
  endmodule
  
  module CSA #(parameter int sizeCSA = 20, int sizeRCA = 4) (
    input logic [sizeCSA-1:0] A,
    input logic [sizeCSA-1:0] B,
    input logic Carry_i,
    output logic [sizeCSA-1:0] S,
    output logic Carry_o
    );
  endmodule
  
  // type definition
  typedef logic [N-1:0] A_array [(N-2)/2:0];
  //typedef logic [N-1:0] partialProd_array [(((N-2)/2)+1):0]; 

  // signal declaration
  A_array A_temp;
  A_array partialProd;
  logic [2:0] sel_temp;
  logic [][] M1

  // stage 0
  //assign A_temp[0] = A;
  //assign A_temp[1] = {A_temp[0][(N-3):0], 2'b00};
  assign sel_temp = {B[1:0], 1'b0};
  //assign partialProd[((N-2)/2)+1][0] = B[1];

  LUT LUT0 (
    .sel(sel_temp),
    .A_in(A),
    .out(M1[0][Nbit : 0])
  );
  
  assign M1[1][0] = B[1];
  
  // matrix1 creation -> partial product placement (with the proper left shift)
  genvar i;
  generate
    for (i = 1; i <= (N-2)/2; i=i+1) begin : STAGE_1toN
      
      LUT LUTs (
        .sel(B[(2*i+1) : (2*i-1)]),
        .A_in(A),
        .out(M1[i][Nbit + 2*i : 2*i])
      );
      
      assign M1[i+1][2*i] = B[((2*i)+1)];
      assign M1[i][Nbit + 2*i +1] = ~B[((2*i)+1)];
      assign M1[i][Nbit + 2*i +2] = 1'b1;
    end
  endgenerate

  // adjust the elements positions (form a V-shape)
  
  
  assign M1[0][13:17] = M1[4][14:17];
  assign M1[1][15:17] = M1[3][14:17];


// START COMPRESSING THE MATRIX 
// l= 6 -> set of central adders 

	genvar i;
	generate
	   for (i = 8; i<= 12; i=i+1) begin: M1ADD
	   
	   fullAdder(M1[0][i], M1[1][i], M1[2][i], M2[0][i], M2[1][i+1]);
	   halfAdder(M1[3][i], M1[4][i], M1[2][i], M2[3][i+1]);
	end 
	endgenerate
	

//l = 6 -> non regular adders

	HA1: halfAdder(M1[0][6], M1[1][6], M2[0][6], M2[1][7]);
	HA2: halfAdder(M1[0][7], M1[1][7], M2[0][7], M2[1][8]);
	FA1: fullAdder(M1[0][13], M1[1][13], M2[0][13], M2[3][14]);
	  
	
//l = 6 -> forming the next level matrix


	assign M2[0:3][0:5] = M1[0:3][0:5]; //RIGHT
	assign M2[0:2][14:17] = M1[0:2][14:17] //LEFT
	
	assign M2[1:3][6] = M1[2:4][6];
	assign M2[3][8] = M1[6][8];
	assign M2[2][13] = M1[3][13];

// l = 4 -> set of central adders

	genvar i;
	generate 
		for (i = 6; i<= 14; i = i+1) begin: M2ADD
				
	   fullAdder(M2[0][i], M2[1][i], M2[2][i], M3[0][i], M3[1][i+1]);
	  
	   
		end
	endgenerate

// l = 4 ->  non regular adders

HA3:	halfAdder(M2[0][4], M2[1][4], M3[0][4], M3[1,5]);
HA4:	halfAdder(M2[0][5], M2[1][5], M3[0][5], M3[1,6]);
HA5:	halfAdder(M2[0][15], M2[1][15], M3[0][15], M3[1,16]);

// l = 4 -> forming the next level matrix

	assign M3[0:2][0:3] = M2[0:2][0:3];
	assign M3[1:2][4:5] = M2[2:3][4:5];
	assign M3[0:2][16:17] = M2[0:2][16:17];
	assign M3[2][6:14] = M2[3][6:14];
	
// l = 3 -> set of central adders
	
	genvar i;
	generate
		for (i=4; i<= 15; i = i+1) begin: M3ADD
		
		fullAdder(M3[0][i], M3[1][i], M3[2][i], fastAdd[0][i], fastAdd[1][i+1]);
	
	end
	endgenerate
	
// l = 3 -> non regular adders

HA6: 	halfAdder(M3[0][2], M3[1][2], fastAdd[0][2], fastAdd[1][3]);
HA7:	halfAdder(M3[0][3], M3[1][3], fastAdd[0][3], fastAdd[1][3]);
HA8:	halfAdder(M3[0][16],M3[1][16], fastAdd[0][16], fastAdd[1][17]);
HA9: 	halfAdder(M3[0][17], M3[1][17], fastAdd[0][17], fastAdd[1][18]);

// final sum (2 operands) adder instantiation

CSA_FINAL: CSA(fastAdd[0][0:18], fastAdd[1][0:18], 0, result[0:18], cout??);


endmodule
