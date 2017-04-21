module p3a_ttb(); //test bench module
	reg cin_t ,g0_t, g1_t, g2_t, g3_t, p0_t, p1_t, p2_t, p3_t; //input registers
   wire G_t, P_t, C1_t, C2_t, C3_t, C4_t;
	
	CLA CLA_tst(g0_t, p0_t, g1_t, p1_t, g2_t, p2_t, g3_t, p3_t, cin_t,  C1_t, C2_t, C3_t, C4_t, G_t, P_t);
	
	initial
	begin
	// Case : all p's and g's are 1
	g0_t <= 0; 
	p0_t <= 0; 
	g1_t <= 0; 
	p1_t <= 0; 
	g2_t <= 0; 
	p2_t <= 0; 
	g3_t <= 0; 
	p3_t <= 0;
	cin_t <= 0;
	#1 $display("C1_t = %b, C2_t = %b,C3_t = %b,C4_t = %b, G_t = %b, P_t = %b", C1_t, C2_t, C3_t, C4_t, G_t, P_t);
	
	// Case: all p's and g's are 0
	g0_t <= 1; 
	p0_t <= 1; 
	g1_t <= 1; 
	p1_t <= 1; 
	g2_t <= 1; 
	p2_t <= 1; 
	g3_t <= 1; 
	p3_t <= 1;
	cin_t <= 1;
	#1 $display("C1_t = %b, C2_t = %b,C3_t = %b,C4_t = %b, G_t = %b, P_t = %b", C1_t, C2_t, C3_t, C4_t, G_t, P_t);
	
	// Case: Misc 1
	g0_t <= 1; 
	p0_t <= 1; 
	g1_t <= 1; 
	p1_t <= 1; 
	g2_t <= 0; 
	p2_t <= 0; 
	g3_t <= 0; 
	p3_t <= 0;
	cin_t <= 0;
	#1 $display("C1_t = %b, C2_t = %b,C3_t = %b,C4_t = %b, G_t = %b, P_t = %b", C1_t, C2_t, C3_t, C4_t, G_t, P_t);
	
   // Case: Misc 2
	g0_t <= 0; 
	p0_t <= 0; 
	g1_t <= 0; 
	p1_t <= 0; 
	g2_t <= 0; 
	p2_t <= 0; 
	g3_t <= 1; 
	p3_t <= 1;
	cin_t <= 1;
	#1 $display("C1_t = %b, C2_t = %b,C3_t = %b,C4_t = %b, G_t = %b, P_t = %b", C1_t, C2_t, C3_t, C4_t, G_t, P_t);
	
	

   end
endmodule
