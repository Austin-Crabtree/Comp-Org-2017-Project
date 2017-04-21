`timescale 1ns / 1ps
module IF(PC_In,Clk,PC_Out,Instr_Out);
output [31:0] PC_Out;
output [31:0] Instr_Out;
input [31:0] PC_In;
input Clk;
InstructionMemory IM(PC_In,Clk,Instr_Out);
assign PC_Out=PC_In+32'd 1;

endmodule
