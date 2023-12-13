`timescale 1 ns / 1 ns

module daddaTree (
  input logic [4:0][12:0] ops,
  output logic [20:0] result
);

logic [5:0][18:0] M0;
logic [5:0][18:0] M1;
logic [3:0][18:0] M2;
logic [2:0][18:0] M3;
logic [1:0][19:0] fastAdd;
logic [19:0]result0;

genvar i;


//MO generation
generate 
  for (i = 0; i<=4; i= i+1) begin 
    assign M0[i+1][2*i +1] = 0;
    assign M0[i][12 + 2*i : 0 + 2*i]  = ops[i];

    if (i == 0) 
      assign M0[i+1][2*i] = ops[i][11];
    else
    assign M0[i+1][2*i] = ~ops[i][11];

  end
endgenerate

assign M0[0][18:13] = '0;
assign M0[1][18:15] = '0;
assign M0[2][1:0] = '0;
assign M0[2][18:17] = '0;
assign M0[3][3:0] = '0;
assign M0[4][5:0] = '0;
assign M0[5][7:0] = '0;
assign M0[5][18:10] = '0;


// adjust the elements positions (form a V-shape)
assign M1[0][13]    = ~ops[0][12]; 
assign M1[0][12:0]  = M0[0][12:0];
assign M1[0][18:14] = M0[4][18:14];
assign M1[1][14:0]  = M0[1][14:0];
assign M1[1][18:15] = M0[3][18:15];
assign M1[2][16:0]  = M0[2][16:0];
assign M1[2][18:17] = '0;
assign M1[3][14:0]  = M0[3][14:0];
assign M1[3][18:15] = '0;
assign M1[4][13:0]  = M0[4][13:0];
assign M1[4][18:14] = '0;
assign M1[5][18:0]  = M0[5][18:0];

 
// START COMPRESSING THE MATRIX 
// l= 6 -> set of central adders 
generate
    for (i = 8; i<= 13; i=i+1) begin
      fullAdder FA1 (M1[0][i], M1[1][i], M1[2][i], M2[0][i], M2[1][i+1]);
      halfAdder HA2 (M1[3][i], M1[4][i], M2[2][i], M2[3][i+1]);
  end
endgenerate

//l = 6 -> non regular adders
halfAdder HA0 (M1[0][6], M1[1][6], M2[0][6], M2[1][7]);
fullAdder FA4 (M1[0][7], M1[1][7], M1[2][7], M2[0][7], M2[1][8]);
fullAdder FA0 (M1[0][14], M1[1][14], M1[2][14], M2[0][14], M2[3][15]);
 

//l = 6 -> forming the next level matrix
assign M2[0][18:15] = M1[0][18:15]; //LEFT
assign M2[1][18:15] = M1[1][18:15]; //LEFT
assign M2[2][16:15] = M1[2][16:15]; //LEFT
assign M2[2][18:17] = '0;
assign M2[0][5:0]   = M1[0][5:0]; //RIGHT
assign M2[1][5:0]   = M1[1][5:0]; //RIGHT
assign M2[2][5:0]   = M1[2][5:0]; //RIGHT
assign M2[3][5:0]   = M1[3][5:0]; //RIGHT
assign M2[1][6]     = M1[2][6];
assign M2[2][6]     = M1[3][6];
assign M2[3][6]     = M1[4][6];
assign M2[2][7]     = M1[3][7];
assign M2[3][7]     = M1[4][7];
assign M2[2][14]    = M1[3][14];
assign M2[3][8]     = M1[5][8];
assign M2[3][18:16] = '0;




// l = 4 -> set of central adders
generate 
  for (i = 6; i<= 15; i = i+1) begin: M2ADD
    fullAdder FA2 (M2[0][i], M2[1][i], M2[2][i], M3[0][i], M3[1][i+1]);
  end
endgenerate

// l = 4 ->  non regular adders
halfAdder HA3 (M2[0][4], M2[1][4], M3[0][4], M3[1][5]);
halfAdder HA4 (M2[0][5], M2[1][5], M3[0][5], M3[1][6]);
halfAdder HA5 (M2[0][16], M2[1][16], M3[0][16], M3[2][17]);


// l = 4 -> forming the next level matrix
assign M3[0][3:0]   = M2[0][3:0];
assign M3[1][3:0]   = M2[1][3:0];
assign M3[2][3:0]   = M2[2][3:0];
assign M3[1][4]     = M2[3][4];
assign M3[2][5:4]   = M2[2][5:4];
assign M3[0][18:17] = M2[0][18:17];
assign M3[1][18:17] = M2[1][18:17];
assign M3[2][16]    = M2[2][16];
assign M3[2][15:6]  = M2[3][15:6];
assign M3[2][18]    = '0;

// l = 3 -> set of central adders
generate
  for (i=4; i<= 18; i = i+1) begin: M3ADD
    fullAdder FA3 (M3[0][i], M3[1][i], M3[2][i], fastAdd[0][i], fastAdd[1][i+1]);
end
endgenerate

// l = 3 -> non regular adders
halfAdder HA6 (M3[0][2], M3[1][2], fastAdd[0][2], fastAdd[1][3]);
halfAdder HA7 (M3[0][3], M3[1][3], fastAdd[0][3], fastAdd[1][4]);

 // forming fastAdd
assign fastAdd[0][1:0] = M3[0][1:0];
assign fastAdd[1][0]   = M3[1][0];
assign fastAdd[1][2]   = M3[2][2];
assign fastAdd[1][1]   = 0;
assign fastAdd[0][19]  = ops[3][11];


assign result0 = fastAdd[0] + fastAdd[1];

// final sum (2 operands) adder instantiation
CSA #(.sizeCSA(20), .sizeRCA(4)) CSA0 (.A(fastAdd[0][19:0]), .B(fastAdd[1][19:0]), .Carry_i(1'b0), .S(result[19:0]), .Carry_o(result[20]));

endmodule
