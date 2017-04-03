module ALUControl_Test_Bench ();
    //Input
    reg [1:0] ALUOp;
    reg [5:0] Funct;

    //Output
    wire [2:0] ALUControl;

    initial begin
      //This is needed for iverilog and gtkwave
      $dumpfile("wave");
      $dumpvars(0, test);

      //---------------------------------------
      $display("time\tALUOp\tFunct\tALUContol");
      $monitor("%g\t%b\t%b\t%b", 
      $time, ALUOp, Funct, ALUControl);

      /////////////////////////////////////////
      // Test 1
      // Initialize Inputs
      ALUOp = 2'b00;
      Funct = 6'b100101;

      #10;

      /////////////////////////////////////////
      // Test 2
      // Initialize Inputs
      ALUOp = 2'b01;
      Funct = 6'b100101;

      #10;

      /////////////////////////////////////////
      // Test 3
      // Initialize Inputs
      ALUOp = 2'b10;
      Funct = 6'b100101;

      #10;

      /////////////////////////////////////////
      // Test 4
      // Initialize Inputs
      ALUOp = 2'b11;
      Funct = 6'b100101;

      #10;
    end

    ALUControl test(ALUOp, Funct, ALUControl);

endmodule