// Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module tb_csa;

parameter N = 20;
// Declare the `ops` and `result` signals
logic [20-1:0] A;
logic [20-1:0] B;
logic carry_in;
logic carry_o;
logic [20:0] result;

// Instantiate a clock and reset signal
logic clk = 1'b0;


// Declare the `daddaTree` module instantiation
CSA #(.sizeCSA(20), .sizeRCA(4)) csa (.A(A), .B(B), .S(result), .Carry_i(carry_in), .Carry_o(carry_o));


// Create a clock generator
always #5 clk = ~clk;

// Define test vectors for edge cases
logic [N-1:0] zero_vector = 20'b0;
logic [N-1:0] one_vector = 20'b000001;
logic [N-1:0] f_vector = 20'b111111;
logic [N-1:0] random_vectors[10];

// Define test vectors for random cases
genvar i;
for ( i = 0; i < 10; i++) begin
    assign random_vectors[i] = $random;
end

// Initialize the test vectors
initial begin
    A = zero_vector; // Set the first operand to zero
    B = zero_vector; // Set the first operand to zero
    carry_in = 0;
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