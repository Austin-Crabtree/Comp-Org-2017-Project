module Mux32Bit2To1_tb(); 

  // Inputs
  reg [31:0] a, b;
  reg op;

  // Outputs
  wire [31:0] result;

  initial begin
    //This is needed for iverilog and gtkwave
    $dumpfile("wave");
    $dumpvars(0, test);
    //--------------------------------------
    $display("time\ta\tb\top\tresul");
    $monitor("%g\t%b\t%b\t%b\t%b",
    $time, a, b, op, result);

    ///////////////////
    //TEST 1
    // Initialize Inputs
    a = 32'b00000000000000000000000001000011;
    b = 32'b10000000000000000000000001111111;
    op = 0;

    // Wait 10 s for global reset to finish
    #10;

    ///////////////////
    //TEST 2
    // Initialize Inputs
    a = 32'b00000000000000000000000001000011;
    b = 32'b10000000000000000000000001111111;
    op = 1;
  end

  Mux32Bit2To1 test(a, b, op, result);
endmodule
