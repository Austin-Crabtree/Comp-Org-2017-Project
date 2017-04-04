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
	  assign RFormat = (~opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5]);
	  assign lw = (opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[3] & opcode[4] & opcode[5]);
	  assign sw = (opcode[0] & ~opcode[1] & opcode[2] & ~opcode[3] & opcode[4] & opcode[5]);
	  assign beq = (~opcode[0] & ~opcode[1] & ~opcode[2] & opcode[3] & ~opcode[4] & ~opcode[5]);
	  assign bne = (opcode[0] & opcode[1] & opcode[2] & ~opcode[3] & opcode[4] & opcode[5]);
	  assign jmp = (opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & opcode[5]);

	  assign ALUsrc = (lw | sw); 
	  assign RegDst = RFormat; 
	  assign MemWrite = sw; 
	  assign MemRead = lw; 
	  assign Beq = beq;
	  assign Bne = bne; 
	  assign Jump = jmp; 
	  assign MemToReg = lw; 
	  assign RegWrite = (RFormat | lw);
	  assign ALUop[0] = (bne | beq | jmp);
	  assign ALUop[1] = (RFormat | jmp);
	end

endmodule