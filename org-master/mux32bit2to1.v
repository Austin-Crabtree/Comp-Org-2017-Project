module Mux32Bit2To1(a, b, op, result);
input [31:0] a, b; 	 // 32-bit inputs
input op; 				 // one-bit selection input
output [31:0] result; // 32-bit output
reg [31:0]result;
	wire [31:0] a;
	wire [31:0] b;	  
	wire op;

always@(a,b,op)
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
