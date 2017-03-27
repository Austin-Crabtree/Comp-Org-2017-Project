module FourBitALU(a, b, cin, op, result, cout, G, P, set, overflow, zero, less);
input [3:0] a, b;   // Inputs to the one-bit ALU.
input [2:0] op;     // 3-bit operation code.op[2] is the "binv".op[0] is the
                    // least significant bit.
output [3:0] result;// The result of the ALU(depends on the operation that
                    // is chosen)
output cout;        // Carry-out bit of the ALU
output G, P;        // Block generate and propagate of the four-bit ALU
output set;         // This is the set output of the most significant ALU block
output overflow;    // This bit indicatesthat an overflow has occurred.
                    // (Ignores what operation is chosen for ALU)
output zero;
input less;
input cin;

wire p0, p1, p2, p3;
wire g0, g1, g2, g3;
wire C1, C2, C3;
wire set0, set1, set2, set3;
wire cout0, cout1, cout2, cout3;

OneBitALU alu1bit_0(a[0], b[0], cin, less, op, result[0], g0, p0, set0, cout0); //where do these couts need to go?
OneBitALU alu1bit_1(a[1], b[1], C1, 1'b0, op, result[1], g1, p1, set1, cout1);
OneBitALU alu1bit_2(a[2], b[2], C2, 1'b0, op, result[2], g2, p2, set2, cout2);
OneBitALU alu1bit_3(a[3], b[3], C3, 1'b0, op, result[3], g3, p3, set3, cout3);

assign set = result[3];

CLA cla(g0, p0, g1, p1, g2, p2, g3, p3, op[2], C1, C2, C3, cout, G, P);

overflowdetect ovrflw(C3, cout, overflow);

// always@(result)
// 	begin
// 		assign zero = ~(result[0] | result[1] | result[2] | result[3]);
// 	end
assign zero = ~(result[0] | result[1] | result[2] | result[3]);

endmodule
