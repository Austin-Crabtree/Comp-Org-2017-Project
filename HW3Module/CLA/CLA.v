 module CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, G, P);
 	input wire g0, p0, g1, p1, g2, p2, g3, p3; // Gen and Prop signals for each bit 
	input wire cin; //Carry in input
	output wire C1, C2, C3, C4; //Carry bits computed by CLA
	output wire G, P; //Block Gen and Block Prop used by CLA's at a higher level 

	