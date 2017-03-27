module thirtytwoBitALUTest();
  reg [31:0] a, b;
  reg [2:0] op;
  wire [31:0] result;
  wire set, zero, overflow;

  initial begin
    $dumpfile("wave");
		$dumpvars(0, test);

		$display("time\ta\t\t\t\t\tb\t\t\t\t\top\tresult\t\t\t\t\tset\tzero\toverflow");
		$monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
		$time, a, b, op, result, set, zero, overflow);

    ///////////////////
		//TEST 1
		// Initialize Inputs
    a = 32'b00000000000000000000000001000011;
    b = 32'b10000000000000000000000001111111;
    op = 2'b01;

		// Wait 10 s for global reset to finish
		#10;

		///////////////////
		//TEST 2
		// Initialize Inputs
    a = 32'b00000000000000000000000001000011;
    b = 32'b10000000000000000000000001111111;
    op = 2'b00;
  end

  thirtytwoBitALU test(a, b, op, result, set, zero, overflow);
endmodule
