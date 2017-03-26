module 16BitALU(a, b, cin, less, op, result, cout, set, zero, G, P, overflow);

input [15:0] a, b;
input cin, less;
input [2:0] op;
output [15:0] result;
output cout, set, zero, G, P, overflow;

wire g0, p0;
wire g1, p1; 
wire g2, p2;
wire g3, p3;

wire C1, C2, C3;

wire [3:0] zeros;
 
FourBitALU alu_0(a[3:0], b[3:0], cin, result[3:0], cout, g0, p0, set, overflow,zeros[0], op);
FourBitALU alu_0(a[7:4], b[7:4], C1, result[7:4], cout, g1, p1, set, overflow, zeros[1], op);
FourBitALU alu_0(a[11:8], b[11:8], C2, result[11:8], cout, g2, p2, set, overflow, zeros[2], op);
FourBitALU alu_0(a[15:12], b[15:12], C3, result[15:12], cout, g3 p3, set, overflow, zeros[3], op);

CLA CLA1(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, cout, G, P);

assign zero = zeros[0] & zeros[1] & zeros[2] & zeros[3];
