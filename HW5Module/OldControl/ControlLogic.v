module OldControlLogic (opcode, ALUsrc, ALUop, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);
	input [5:0] opcode;
	output ALUsrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
	output [1:0] ALUop;

	reg RFormat, lw, sw, Beq, Bne, Jump;

	always @* begin
		case (opcode)
			6'b100011: assign lw = 1'b1;
			6'b101011: assign sw = 1'b1;
			6'b000100: assign Beq = 1'b1;
			6'b111011: assign Bne = 1'b1;
			6'b100001: assign Jump = 1'b1;
			default: assign RFormat = 1'b1;
		endcase
	end

	assign RegDst = RFormat;
	assign ALUsrc = lw | sw;
	assign MemToReg = lw;
	assign RegWrite = RFormat | lw; 
	assign MemRead = lw; 
	assign MemWrite = sw; 
	assign ALUop[1] = RFormat; 
	assign ALUop[0] = Beq | Bne | Jump; 
endmodule