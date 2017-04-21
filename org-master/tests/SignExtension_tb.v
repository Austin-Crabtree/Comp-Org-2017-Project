module SignExtension_tb();
	reg [15:0] a;
	wire [31:0] result;
	
	SignExtension ext(a, result);
	initial
		begin
		a <= 16'd 0; 
		#1 $display ( "a = %b, result = %b",  a, result);

		a <= 16'd 23; 
		#1 $display ( "a = %b, result = %b",  a, result);
		a <= 16'b 1111111111111111; 
		#1 $display ( "a = %b, result = %b",  a, result);
	end
endmodule
