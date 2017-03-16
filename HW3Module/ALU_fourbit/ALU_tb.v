module FourBitALU_tb();

  // Inputs
  reg [3:0] a, b;
  reg [2:0] op;

  // Outputs
  wire [3:0] result;
  wire cout, G, P, set, overflow;

  initial begin
    //This is needed for iverilog and gtkwave
    $dumpfile("wave");
    $dumpvars(0, test);
    //--------------------------------------
    $display("time\ta\tb\top\tresult\tcout\tG\tP\tset\toverflow");
    $monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
    $time, a, b, op, result, cout, G, P, set, overflow);

    ///////////////////
    //TEST 1
    // Initialize Inputs
    a = 4'b1101;
    b = 4'b1001;
    op = 3'b001;

    // Wait 10 ns for global reset to finish
    #10;

    ///////////////////
    //TEST 2
    // Initialize Inputs
    a = 4'b1101;
    b = 4'b1001;
    op = 3'b101;

    // Wait 10 ns for global reset to finish
    #10;

    ///////////////////
    //TEST 3
    // Initialize Inputs
    a = 4'b0001;
    b = 4'b1000;
    op = 3'b001;


    // Wait 10 ns for global reset to finish
    #10;
  end

  FourBitALU test(a, b, op, result, cout, G, P, set, overflow);
endmodule
