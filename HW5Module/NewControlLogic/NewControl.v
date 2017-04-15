module NewControlLogic (opcode, ALUsrc, ALUop, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, Funct, ALUControl);
	//Input
	input [5:0] opcode;
	input [5:0] Funct;

	//Output
	output ALUsrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
	output [1:0] ALUop;
	output [2:0] ALUControl;

	//Temp variables
	reg RFormat, lw, sw, beq, bne, jmp;

	reg ALUsrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALU;
	reg [1:0] ALUop;
	reg [2:0] ALUControl;

	always@(opcode)
	begin
	   RFormat = (~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]);
	   lw = (opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0]);
	   sw = (opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0]);
	   beq = (~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0]);
	   bne = (opcode[5] & opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0]);
	   jmp = (opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0]);

	   ALUsrc = (lw | sw);
	   RegDst = RFormat;
	   MemWrite = sw; 
	   MemRead = lw;
	   Beq = beq;
	   Bne = bne;
	   Jump = jmp;
	   MemToReg = lw;
	   RegWrite = (RFormat | lw);
	   ALUop[0] = (bne | beq | jmp);
	   ALUop[1] = (RFormat | jmp);

		ALUControl[2] = ALUop[0] | (ALUop[1] & Funct[1]);
		ALUControl[1] = ~(ALUop[1]) | ~(Funct[2]);
		ALUControl[0] = ALUop[1] & (Funct[3] | Funct[0]);
	end

endmodule