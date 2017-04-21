module mux5bitb();
reg [4:0] a, b; // 32-bit inputs
    reg op; // one-bit selection input
    wire [4:0] result; // 32-bit output
	
	Mux5Bit2To1 mymux(a, b, op, result);
	initial
		begin
		
			a <= 5'd 2; b <= 5'd 3; op <= 0;
			#1 $display ( " a = %d, b = %d, op = %b, result = %d", a, b, op, result);
		
			a <= 5'd 2; b <= 5'd 3; op <= 1;
			#1 $display ( " a = %d, b = %d, op = %b, result = %d", a, b, op, result);
						
		end
	
	
	
endmodule