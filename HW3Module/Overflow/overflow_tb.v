module overflowtestbench ();

	// Inputs 
	reg cin, cout;

	// Output
	wire v;

	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);
		
		$display("time\tcin\tcout\tv");
		$monitor("%g\t%b\t%b\t%b", 
		$time, cin, cout, v);

		// Test 1
		// Inputs
		cin = 1; 
		cout = 1; 
		
		#10;

		// Test 2
		// Inputs
		cin = 0; 
		cout = 0; 

		#10;

		// Test 3
		// Inputs
		cin = 0; 
		cout = 1;
		
		#10;

		// Test 4
		// Inputs
		cin = 1; 
		cout = 0; 

		#10;

	end

	overflowdetect test(cin, cout, v);
endmodule

