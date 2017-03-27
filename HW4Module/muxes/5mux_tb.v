module Mux5Bit2to1test();
	//Inputs
	reg [4:0] a, b;
	reg op;

	//Outputs
	wire [4:0] result;

	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);

		$display("time\ta\tb\top\tresult");
		$monitor("%g\t%b\t%b\t%b\t%b",
		$time, a, b, op, result);

		///////////////////
		//TEST 1
		// Initialize Inputs
		a = 5'b10011;
		b = 5'b11111;
		op = 0;

		// Wait 10 s for global reset to finish
		#10;

		///////////////////
		//TEST 2
		// Initialize Inputs
		a = 5'b10011;
		b = 5'b11111;
		op = 1;
	end

	Mux5Bit2To1 test(a, b, op, result);
endmodule
