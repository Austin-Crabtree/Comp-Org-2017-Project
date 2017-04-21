module fourbit_bench();
 reg [3:0] a;
 reg [3:0] b;
 reg cin;
 reg less;
 reg [2:0] op;
 wire [3:0] result;
 wire cout, G, P, set, overflow, zero;
 
 //module FourBitALU  (  a,   b,   op,   result,   cout,   G,   P,   set,   overflow, zero);
FourBitALU fourbitalu1(a, b, cin, less, op, result, cout, G, P, set, overflow, zero);

initial begin
	a <= 4'b 0001; b <= 4'b 0001; op <= 3'b 010; cin <= 1'b0; less <= 1'b0;

	#1 $display("a = %d, b = %d, result = %d, cout = %b, G = %b, P = %b, set = %b, overflow = %b",a,b,result,cout,G,P,set,overflow) ;

        a <= 4'b 0100; b <= 4'b 0001; cin <= 1'b0; less <= 1'b0; op <= 3'b 110;
 #1 $display ("a = %d, b = %d, op = %d, result = %d, cout = %d, G = %d, P = %d, set = %d, overflow = %d",  a, b, op, result, cout, G, P, set, overflow);


end
endmodule
