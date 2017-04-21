module Mux5Bit2To1(a, b, op, result);
input [4:0] a, b; // 5-bit inputs
input op; // one-bit selection input
output [4:0] result; // 5-bit output

reg [4:0]result;
	wire [4:0] a;
	wire [4:0] b;	  
	wire op;

always@(op,a,b)
	begin
		if(op==1'b0) 
			begin
				 result=a;
			end
		else
			begin
				 result=b;
			end
	end

endmodule
