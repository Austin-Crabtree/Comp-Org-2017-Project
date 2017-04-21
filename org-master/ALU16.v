module ALU16Bit(a, b, cin, less, op, result, cout, set, zero, g, p, overflow);
input [15:0] a, b;
input cin, less;
input [2:0] op; 					// op[2] is "binv". op[1:0] denotes the 2-bit operation.
output [15:0] result;
output cout, set, zero, g, p, overflow;
// set is the result of the most-significant
// ADDER unit. zero is 1 if the result is 0x0000.
// Otherwise, it is 0.
wire [3:0] c;		// cout from each 4-bit ALU
wire g0, g1, g2,g3, p0, p1, p2, p3;	// G and P from each 4-bit ALU
wire [3:0] setv;	// set from each 4-bit ALU
wire [3:0] ovf;	// overflow from each 4-bit ALU
wire [3:0] z;		// zero from each 4-bit ALU
wire C1, C2, C3, C4;


//module    FourBitALU(       a,       b, cin,    less, op,       result,  cout, G, P,     set, overflow, zero);
FourBitALU FourBitALU0(  a[3:0], b[3:0],    cin,    less, op,  result[3:0], c[0], g0, p0, setv[0], ovf[0], z[0]);
FourBitALU FourBitALU1(  a[7:4],  b[7:4],  C1,    1'b0, op,  result[7:4], c[1], g1, p1, setv[1], ovf[1], z[1]);
FourBitALU FourBitALU2( a[11:8], b[11:8],  C2,    1'b0, op, result[11:8], c[2], g2, p2, setv[2], ovf[2], z[2]);
FourBitALU FourBitALU3(a[15:12],b[15:12],  C3,    1'b0, op, result[15:12], c[3], g3, p3, setv[3], ovf[3], z[3]);

//module CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, G, P);
CLA CLA0(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, g, p);

assign cout=C4;
assign set=setv[3];
assign zero=z[0]&z[1]&z[2]&z[3];
assign overflow=c[3];

endmodule
