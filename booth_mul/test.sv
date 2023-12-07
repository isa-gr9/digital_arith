`timescale 1ns / 1ps

module daddaTree (
  input logic [5:0][12:0] ops,
  output logic [0:19] result
);

module CSA #(parameter int sizeCSA = 18, int sizeRCA = 4) (
  input logic [sizeCSA-1:0] A,
  input logic [sizeCSA-1:0] B,
  input logic Carry_i,
  output logic [sizeCSA-1:0] S,
  output logic Carry_o
);
endmodule

module fullAdder (
input logic a, b, Cin,
output logic s, Co
);
endmodule

module halfAdder (
input logic A, B,
output logic Sum, Cout
);
endmodule



  logic [0:5][0:17] M1;
  logic [0:4][0:17] M2;
  logic [0:3][0:17] M3;
  logic [0:1][0:18] fastAdd;

  genvar i;

 generate 
    for (i = 0; i<5; i= i+1) begin 
 
 assign M1[i][0 + 2*i : 12 + 2*i]  = ops[i];
 assign M1[i+1][2*i] = 1;
end
endgenerate


  // adjust the elements positions (form a V-shape)

 assign M1[0][13:17] = M1[4][13:17];
 assign M1[1][14:17] = M1[3][14:17];

 



// START COMPRESSING THE MATRIX 

// l= 6 -> set of central adders 

  generate
     for (i = 8; i<= 12; i=i+1) begin
     fullAdder FA1 (M1[0][i], M1[1][i], M1[2][i], M2[0][i], M2[1][i+1]);
     halfAdder HA2 (M1[3][i], M1[4][i], M2[2][i], M2[3][i+1]);
  end 
  endgenerate
  

//l = 6 -> non regular adders

 halfAdder HA0 (M1[0][6], M1[1][6], M2[0][6], M2[1][7]);
 halfAdder HA1 (M1[0][7], M1[1][7], M2[0][7], M2[1][8]);
 fullAdder FA0 (M1[0][13], M1[1][13], M1[2][13], M2[0][13], M2[3][14]);



//l = 6 -> forming the next level matrix
  assign M2[0][14:17] = M1[0][14:17]; //LEFT
  assign M2[1][14:17] = M1[1][14:17]; //LEFT
  assign M2[2][14:17] = M1[2][14:17]; //LEFT

  assign M2[0][0:5] = M1[0][0:5]; //RIGHT
  assign M2[1][0:5] = M1[1][0:5]; //RIGHT
  assign M2[2][0:5] = M1[2][0:5]; //RIGHT
  assign M2[3][0:5] = M1[3][0:5]; //RIGHT
  
  assign M2[1][6] = M1[2][6];
  assign M2[2][6] = M1[3][6];
  assign M2[3][6] = M1[4][6];

  assign M2[3][8] = M1[6][8];
  assign M2[2][13] = M1[3][13];




    
  
// l = 4 -> forming the next level matrix

  assign M3[0][0:3] = M2[0][0:3];
  assign M3[1][0:3] = M2[1][0:3];
  assign M3[2][0:3] = M2[2][0:3];
  assign M3[1][4:5] = M2[2][4:5];
  assign M3[2][4:5] = M2[3][4:5];
  assign M3[0][16:17] = M2[0][16:17];
  assign M3[1][16:17] = M2[1][16:17];
  assign M3[2][16:17] = M2[2][16:17];
  assign M3[2][6:14] = M2[3][6:14];


// l = 4 -> set of central adders

  generate 
    for (i = 6; i<= 14; i = i+1) begin: M2ADD
        
     fullAdder FA2 (M2[0][i], M2[1][i], M2[2][i], M3[0][i], M3[1][i+1]);
    
     
    end
  endgenerate

// l = 4 ->  non regular adders

 halfAdder HA3 (M2[0][4], M2[1][4], M3[0][4], M3[1][5]);
 halfAdder HA4 (M2[0][5], M2[1][5], M3[0][5], M3[1][6]);
 halfAdder HA5 (M2[0][15], M2[1][15], M3[0][15], M3[1][16]);

  
// l = 3 -> set of central adders
  
  generate
    for (i=4; i<= 15; i = i+1) begin: M3ADD
    
    fullAdder FA3 (M3[0][i], M3[1][i], M3[2][i], fastAdd[0][i], fastAdd[1][i+1]);
  
  end
  endgenerate
  
// l = 3 -> non regular adders

  halfAdder HA6 (M3[0][2], M3[1][2], fastAdd[0][2], fastAdd[1][3]);
  halfAdder HA7 (M3[0][3], M3[1][3], fastAdd[0][3], fastAdd[1][3]);
  halfAdder HA8 (M3[0][16],M3[1][16], fastAdd[0][16], fastAdd[1][17]);
  halfAdder HA9 (M3[0][17], M3[1][17], fastAdd[0][17], fastAdd[1][18]);

// final sum (2 operands) adder instantiation

 CSA CSA0 (fastAdd[0][0:18], fastAdd[1][0:18], 0, result[0:18], result[19]);

endmodule