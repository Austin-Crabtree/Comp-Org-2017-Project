`timescale 1ns / 1ps
module Control(opcode, funct, ALUSrc, ALUOp, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl);
input [5:0] opcode;		 // 6-bit operation code
input [5:0] funct;  		 // 6-bit function code from the instruction
								 // least significant 6 bits of an instruction
output ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite; // Output control lines
output [1:0] ALUOp;
output [2:0] ALUControl; // 3-bit control for the ALU that specifies the operation

//wire [1:0] ALUOp; 		 // 2-bit intermediate output for controlling ALU

ControlOld ControlOld(opcode, ALUSrc, ALUOp, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);
ALUOpToALUControl ALUOpToALUControl1(ALUOp, funct, ALUControl);

endmodule