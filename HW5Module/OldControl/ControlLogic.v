module OldControlLogic (opcode, ALUsrc, ALUop, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);
	//Input
	input [5:0] opcode;

	//Output
	output ALUsrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
	output [1:0] ALUop;

	//Temp variables
	reg RFormat, lw, sw, beq, bne, jmp;

	reg ALUsrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
	reg [1:0] ALUop;

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
	end

endmodule
