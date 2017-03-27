module sixteenBitALU(a, b, cin, less, op, result, cout, set, zero, G, P, overflow);
  input [15:0] a, b;
  input cin, less;
  input [2:0] op;
  output [15:0] result;
  output cout, set, zero, G, P, overflow;

  wire g0, p0;
  wire g1, p1;
  wire g2, p2;
  wire g3, p3;
  wire null_cout;

  wire C1, C2, C3;

  wire [3:0] zeros;

  FourBitALU alu_0(a[3:0], b[3:0], cin, op, result[3:0], null_cout, g0, p0, set, overflow,zeros[0], 1'b0);
  FourBitALU alu_1(a[7:4], b[7:4], C1, op, result[7:4], null_cout, g1, p1, set, overflow, zeros[1], 1'b0);
  FourBitALU alu_2(a[11:8], b[11:8], C2, op, result[11:8], null_cout, g2, p2, set, overflow, zeros[2], 1'b0);
  FourBitALU alu_3(a[15:12], b[15:12], C3, op, result[15:12], cout, g3 p3, set, overflow, zeros[3], 1'b0);

  CLA CLA1(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, cout, G, P);

  assign zero = zeros[0] & zeros[1] & zeros[2] & zeros[3];
endmodule
