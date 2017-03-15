module mux4to1(a, b, c, d, s0, s1, out);
  input a, b, c, d, s0, s1;
  output out;

  assign out = (~s0 & ~s1 & a) + (~s0 & s1 & b) + (s0 & ~s1 & c) + (s0 & s1 & d);
endmodule
