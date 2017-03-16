module Adder(a, b, cin, sum, cout);
	input a, b, cin; 
	output sum, cout;

	assign sum =  (~a & ~b & cin) | (~a & b & ~cin) | (a & ~b & ~cin) | (a & b & cin);
	assign cout = (b & cin) | (a & cin) | (a & b); 

endmodule
