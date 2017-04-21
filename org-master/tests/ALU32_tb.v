module thiry_two_tb(); 
	reg [31:0] a, b;
	reg [2:0] op;
	wire [31:0] result;  
	wire set, zero, overflow;
	
	ALU32Bit alu32(a, b, op, result, set, zero, overflow);
	
	initial
		begin
	a <= 32'd 21; b <= 32'd 21;
	op <= 3'b 010;
	#1 $display ("a = %d, b = %d, op = %d, result = %d, set = %d, zero = %d, overflow = %d", a, b, op, result, set, zero, overflow);
	end
endmodule