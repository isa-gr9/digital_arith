// Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module daddaTree_tb;

   // Declare the `ops` and `result` signals
   logic [5:0][12:0] ops;
   logic [0:20] result = 21'b0;

   // Instantiate a clock and reset signal
   logic clk = 1'b0;


   // Declare the `daddaTree` module instantiation
   daddaTree dadda_tree(.ops(ops), .result(result));


   // Create a clock generator
   always #5 clk = ~clk;

   // Define test vectors for edge cases
   logic [5:0][12:0] zero_vector = 6'b0;
   logic [5:0][12:0] one_vector = 6'b000001;
   logic [5:0][12:0] f_vector = 6'b111111;
   logic [5:0][12:0] random_vectors[10];

   // Define test vectors for random cases

   genvar i;
   for ( i = 0; i < 10; i++) begin
      assign random_vectors[i] = $random;
   end

   // Initialize the test vectors
    initial begin
        ops = zero_vector; // Set the first operand to zero
        repeat(3) @(posedge clk);

        ops = one_vector; // Set the first operand to one
        repeat(3) @(posedge clk);

        ops = f_vector; // Set the second operand to f
        repeat(3) @(posedge clk);

        // Generate and apply random test vectors
        for (int i = 0; i < 10; i++) begin
            ops = random_vectors[i];
            repeat(3) @(posedge clk);
        end
    end

endmodule