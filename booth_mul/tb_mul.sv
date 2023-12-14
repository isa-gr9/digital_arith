// Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module tb_mul;

parameter N = 10;
// Declare the `ops` and `result` signals
logic [N-1:0] A;
logic [N-1:0] B;
logic [2*N-1:0] result;
logic co;

// Instantiate a clock and reset signal
logic clk = 1'b0;


// Declare the `daddaTree` module instantiation
multiplier mul (.A(A), .B(B), .result(result), .carry_out(co));

// Create a clock generator
always #5 clk = ~clk;

// Define test vectors for edge cases
logic [N-1:0] zero_vector = 10'b0;
logic [N-1:0] one_vector = 10'b000001;
logic [N-1:0] f_vector = 10'b111111;
logic [N-1:0] random_vectors[10];

// Define test vectors for random cases
genvar i;
for ( i = 0; i < 10; i++) begin
    assign random_vectors[i] = $random;
end

// Initialize the test vectors
initial begin

  //  A = 10'b0011001100;
  //  B = 10'b1111110001;

    repeat(3) @(posedge clk);


    A = zero_vector; // Set the first operand to zero
    B = zero_vector; // Set the first operand to zero

    repeat(3) @(posedge clk);

    A = one_vector; // Set the first operand to one
    B = one_vector; // Set the first operand to one
    repeat(3) @(posedge clk);

    A = f_vector; // Set the second operand to f
    B = f_vector; // Set the second operand to f
    repeat(3) @(posedge clk);

    // Generate and apply random test vectors
    for (int i = 0; i < 10; i++) begin
        A = random_vectors[i];
        B = random_vectors[i];
        repeat(3) @(posedge clk);
    end
end

endmodule