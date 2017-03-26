module extension_tb();
  // Inputs
  reg [15:0] a;

  // Outputs
  wire [31:0] result;

  initial begin
    //This is needed for iverilog and gtkwave
    $dumpfile("wave");
    $dumpvars(0, test);
    //--------------------------------------
    $display("time\ta\t\t\tresult");
    $monitor("%g\t%b\t%b",
    $time, a, result);

    ///////////////////
    //TEST 1
    // Initialize Inputs
    a = 16'b0000000111011101;

    // Wait 10 s for global reset to finish
    #10;

    ///////////////////
    //TEST 2
    // Initialize Inputs
    a = 16'b1010111111011110;
  end

  SignExtension test(a, result);
endmodule
