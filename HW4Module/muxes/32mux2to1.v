module mux2to1(a, b, op, result);
  input [31:0] a, b
  input op;
  output [31:0] result;

  assign result = (~op & a) + (op & b);
endmodule
