 module CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, G, P);
 	input wire g0, p0, g1, p1, g2, p2, g3, p3; // Gen and Prop signals for each bit
	input wire cin; //Carry in input
	output wire C1, C2, C3, C4; //Carry bits computed by CLA
	output wire G, P; //Block Gen and Block Prop used by CLA's at a higher level

  //carry output assignments
  assign C1 = g0 | (p0 & cin);
  assign C2 = g1 | (p1 & g0) | (p1 & p0 & cin);
  assign C3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin);
  assign C4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);

  //super generate and super propagate assignments
  assign G = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0);
  assign P = p3 & p2 & p1 & p0;
endmodule
