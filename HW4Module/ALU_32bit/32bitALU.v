module thirtytwoBitALU(a, b, op, result, set, zero, overflow);
  input [31:0] a, b;
  input [2:0] op;
  output [31:0] result;
  output set, zero, overflow;

  wire zero0, zero1, setwire, overflow0, overflow1, cin1, null_wire;

               //a,       b,      cin,    less,   op, result,       cout,   set,      zero,   G,         P,         overflow
  sixteenBitALU alu0(a[15:0], b[15:0], op[2], setwire, op, result[15:0], cin1, null_wire, zero0, null_wire, null_wire, overflow0);
  sixteenBitALU alu1(a[31:16], b[31:16], cin1, 1'b0,   op, result[31:16], null_wire, setwire, zero1, null_wire, null_wire, overflow1);

  assign zero = zero0 & zero1;
  assign set = setwire;
  assign overflow = overflow1;
endmodule
