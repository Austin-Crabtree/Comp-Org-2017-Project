module ALUControl (ALUOp, Funct, ALUControl);
	//Input
	input [1:0] ALUOp;
	input [5:0] Funct;

	//Output
	output [2:0] ALUControl;

	assign ALUControl[2] = ALUOp[0] | (ALUOp[1] & Funct[1]);
	assign ALUControl[1] = ~(ALUOp[1]) | ~(Funct[2]);
	assign ALUControl[0] = ALUOp[1] & (Funct[3] | Funct[0]);
endmodule