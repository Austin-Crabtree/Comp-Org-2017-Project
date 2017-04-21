module ALU16Bitb();
    reg [15:0] a, b;
    reg cin, less;
    reg [2:0] op; 
    wire [15:0] result;
    wire cout, set, zero, g, p, overflow;		   
	
	ALU16Bit  alu(a, b, cin, less, op, result, cout, set, zero, g, p, overflow);
	
	initial
		begin
	//Overflow!
	a <= 16'b 1111111111111111; b <= 16'b 1111111111111111;	cin <= 0; less <= 0; op <= 3'b010;
	#1 $display ( "Addition:  a = %d, b = %d, cin = %d, op = %d, result = %d, cout = %d, set = %d, zero = %d, g = %d, p = &b, overflow = %d", a, b, cin, op, result, cout, set, zero, g, p, overflow);
	
	a <= 16'b 0000000001000000; b <= 16'b 0000000000000001;	cin <= 0; less <= 0; op <= 3'b010;
	#1 $display ("Addition: a = %d, b = %d, cin = %d, op = %d, result = %d, cout = %d, set = %d, zero = %d, g = %d, p = &b, overflow = %d", a, b, cin, op, result, cout, set, zero, g, p, overflow);

	a <= 16'b 0101010101010101; b <= 16'b 1010101010101010;	cin <= 0; less <= 0; op <= 3'b010;
	#1 $display ( "Addition 3 a = %d, b = %d, cin = %d, op = %d, result = %d, cout = %d, set = %d, zero = %d, g = %d, p = &b, overflow = %d", a, b, cin, op, result, cout, set, zero, g, p, overflow);
			
	a <= 16'b 100000100000001; b <= 16'b 1101001000000101;	cin <= 0; less <= 0; op <= 3'b000;
	#1 $display ( "And: a = %b, b = %b, cin = %d, op = %d, result = %b, cout = %d, set = %d, zero = %d, g = %d, p = &b, overflow = %d", a, b, cin, less, op, result, cout, set, zero, g, p, overflow);
	

	a <= 16'b 000000000000000; b <= 16'b 0000000000000000;	cin <= 0; less <= 0; op <= 3'b000;
	#1 $display ( "And: a = %b, b = %b, cin = %d, result = %b, cout = %d, set = %d, zero = %d, g = %d, p = &b, overflow = %d", a, b, cin,  result, cout, set, zero, g, p, overflow);



	a <= 16'b 1100000000000011; b <= 16'b 0000000000000000; cin <= 0; less <= 0; op <= 3'b001;
	#1 $display ( "Or a = %b, b = %b, cin = %d, result = %b, cout = %d, set = %d, zero = %d, g = %d, p = &b, overflow = %d", a, b, cin, result, cout, set, zero, g, p, overflow);
								
			
		end
endmodule
