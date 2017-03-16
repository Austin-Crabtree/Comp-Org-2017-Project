module OneBitALU_tb();

  // Inputs
  reg a, b, cin, less;
  reg [2:0] op;

  // Outputs
  wire result, g, p, set, cout;

  initial begin
    //This is needed for iverilog and gtkwave
    $dumpfile("wave");
    $dumpvars(0, test);
    //--------------------------------------
    $display("time\ta\tb\tcin\tless\top\tresult\tg\tp\tset\tcout");
    $monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
    $time, a, b, cin, less, op, result, g, p, set, cout);

    ///////////////////
    //TEST 1
    // Initialize Inputs
    a = 1;
    b = 0;
    cin = 0;
    less = 1;
    op = 3'b001;

    // Wait 10 ns for global reset to finish
    #10;

    ///////////////////
    //TEST 2
    // Initialize Inputs
    a = 1;
    b = 1;
    cin = 0;
    less = 1;
    op = 3'b101;

    // Wait 10 ns for global reset to finish
    #10;

    ///////////////////
    //TEST 3
    // Initialize Inputs
    a = 1;
    b = 1;
    cin = 0;
    less = 1;
    op = 3'b001;


    // Wait 10 ns for global reset to finish
    #10;
  end

  OneBitALU test(a, b, cin, less, op, result, g, p, set, cout);
endmodule
