module FourBitALU(a, b, cin, less, op, result, cout, G, P, set, overflow, zero);
input [3:0] a, b; 	// Inputs to the one-bit ALU.
input cin;				// Carry-in bit of the ALU.
input less;
input [2:0] op; 		// 3-bit operation code. op[2] is the "binv". op[0] is the
							// least significant bit.
output [3:0] result; // The result of the ALU (depends on the operation that
							// is chosen)
output cout; 			// Carry-out bit of the ALU
output G, P; 			// Block generate and propagate of the four-bit ALU
output set; 			// This is the set output of the most significant ALU block
output overflow; 		// This bit indicates that an overflow has occurred.
							// (Ignores what operation is chosen for ALU)
output zero;			// This bit indicates if the result is zero (1 if zero,
							// 0 if non-zero)


wire [3:0] C;
wire [3:0] g,p;
wire [3:0] setv;
wire C1,C2,C3,C4;  
CLA CLA0(g[0],p[0],g[1],p[1],g[2]   ,p[2],g[3],p[3],cin,C1,C2,C3,C4,G,P);

//module OneBitALU(     a,   b,cin,   less,op,   result,cout,   g,   p,    set);
OneBitALU onebitALU0(a[0],b[0],cin,   less,op,result[0],C[0],g[0],p[0],setv[0]);
OneBitALU onebitALU1(a[1],b[1], C1,   1'b0,op,result[1],C[1],g[1],p[1],setv[1]);
OneBitALU onebitALU2(a[2],b[2], C2,   1'b0,op,result[2],C[2],g[2],p[2],setv[2]);
OneBitALU onebitALU3(a[3],b[3], C3,1'b0,op,result[3],C[3],g[3],p[3],setv[3]);

OverflowDetection OverflowDetection1(C3,C4,overflow);

assign set=setv[3];
assign cout=C4;
assign zero=~(result[0]|result[1]|result[2]|result[3]);

endmodule
