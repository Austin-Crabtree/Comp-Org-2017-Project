module overflowdetect (cin, cout, v);
	input cin;   // This is the carryk-2 which is the carry in for the MSB adder
	input cout;  // This is the carry out of the MSB adder

	output v;    // This is the overflow 

	assign v = cin ^ cout; // This is xoring the cin and cout which will give us the overflow

endmodule
