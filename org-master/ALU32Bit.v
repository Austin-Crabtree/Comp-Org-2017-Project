module ALU32Bit(a, b, op, result, set, zero, overflow);
input [31:0] a, b;
input [2:0] op; // op[2] is "binv". op[1:0] denotes the 2-bit operation.
output [31:0] result;
output set; // set is the result of the most-significant ADDER unit.
output zero; // zero is 1 if the result is 0x0000. Otherwise, it is 0.
output overflow; // Overflow is 1 if the output is 0x00000000.
wire [7:0] g,p; 
wire [1:0] over;

wire s0,s1, over0,over1;
wire [1:0] z;
wire cout0, cout1;
wire zero0, zero1;
//module ALU16Bit(   a,        b,  *cin*, *less*, op,     result*cout*, *set*, zero,      g,     p, overflow);
ALU16Bit alu0( a[15:0],  b[15:0], op[2], s1 , op, result[15:0], cout0, s0 , zero0, g[3:0], p[3:0],  over0);
ALU16Bit alu1(a[31:16], b[31:16],  cout0,  1'b0, op,result[31:16], cout1,  s1, zero1, g[7:4], p[7:4],  over1);

assign overflow = cout1;
assign set = s1;
assign zero = zero0 & zero1;
endmodule 


/*module ALU32Bit(a, b, op, result, set, zero, overflow);
input [31:0] a, b;
input [2:0] op; // op[2] is "binv". op[1:0] denotes the 2-bit operation.
output [31:0] result;
output set; // set is the result of the most-significant ADDER unit.
output zero; // zero is 1 if the result is 0x0000. Otherwise, it is 0.
output overflow; // Overflow is 1 if the output is 0x00000000.

wire cout;
wire z0, z1;
wire s;
wire dontCare;
ALU16Bit alu16_1(a[15:0], b[15:0], op[2], s, op, result[15:0], cout, dontCare, z0, G, P, overflow);
ALU16Bit alu16_2(a[31:16], b[31:16], cout, 0, op, result[31:16], cout, s, z1, G, P, overflow);

assign zero = z0 & z1;



endmodule
*/
