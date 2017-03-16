module OneBitALU(a, b, cin, less, op, result, g, p, set, cout);
  input a, b, cin; // Inputs to the one-bit ALU, "cin" is the carry-in bit.
  input [2:0] op;  // 3-bit operation code.op[2] is the "binv".op[0] is the
                   // least significant bit.
  input less;      // This input will be set as 0 for all ALUs but the one
                   //corresponding to the most-significant bit.
  output result;   // The result of the ALU (depends on the operation that is
                   // chosen)
  output g, p, set;// Generate and propagate signals that are to be used by the
                   // CLA unit.output set;
                   // This is the "sum" output of the full-adder.
  output cout;

  wire bmux;
  mux2to1 bmux2to1(b, ~b, op[2], bmux);

  assign p = a | bmux;
  assign g = a & bmux;

  Adder sumadder(a, bmux, cin, set, cout);

  mux4to1 resultmux4to1(g, p, set, less, op[1], op[0], result);

endmodule
