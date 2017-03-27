module sixteenBitALUTest(a, b, cin, less, op, result, cout, set, zero, G, P, overflow);

    reg [15:0] a, b;
    reg cin, less;
    reg [2:0] op;

    wire [15:0] result;
    wire cout, set, zero, G, P, overflow;

    initial begin
        $dumpfile("wave");
		$dumpvars(0, test);

		$display("time\ta\tb\tcin\tless\top\tresult\tcout\tset\tzero\tG\tP\toverflow");
		$monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", 
		$time, a, b, cin, less, op, result, cout, set, zero, G, P, overflow);

        ///////////////////
		//TEST 1
		// Initialize Inputs
		a = 15'b10000000001001;
		b = 5'b100000000011111;
        cin = 1'b0;
        less = 1'b1;
		op = 0;

		// Wait 10 s for global reset to finish
		#10;

		///////////////////
		//TEST 2
		// Initialize Inputs
		a = 15'b10000000001001;
		b = 5'b100000000011111;
        cin = 1'b1;
        less = 1'b1;
		op = 1;
    end