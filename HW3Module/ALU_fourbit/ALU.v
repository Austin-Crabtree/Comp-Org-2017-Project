module FourBitALU(a, b, op, result, cout, G, P, set, overflow);
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

OneBitALU alu1bit_0(a, b, cin, less, op, result, g, p, set, cout);
OneBitALU alu1bit_1(a, b, cin, less, op, result, g, p, set, cout);
OneBitALU alu1bit_2(a, b, cin, less, op, result, g, p, set, cout);
OneBitALU alu1bit_3(a, b, cin, less, op, result, g, p, set, cout);

CLA cla(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, G, P);

overflowdetect overflow(cin, cout, v);

endmodule
