module mux32bit_tb();
reg [31:0] at, bt; // 32-bit inputs
    reg opt; // one-bit selection input
    wire [31:0] resultt; // 32-bit output
	
	Mux32Bit2To1 mymux(at, bt, opt, resultt);
	
initial	begin
	        
	at <= 32'd 23; bt <= 32'd 32 ; opt <= 0;
	#1 $display ( " a = %d, b = %d, op = %b, result = %d", at, bt, opt, resultt);
		
	at <= 32'd 23; bt <= 32'd 32; opt <= 1;
	#1 $display ( " a = %d, b = %d, op = %b result = %d", at, bt, opt, resultt);
						
end
	
	
	
endmodule