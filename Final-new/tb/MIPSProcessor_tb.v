`timescale 1ns / 1ps

module MIPSProcessorb();
reg Clk;
wire [31:0] Out_DataB;
wire [31:0] Out_SE;
wire [2:0] Out_Funct;
wire [4:0] Out_WriteAddr;
wire [31:0] Out_ALUResult, Out_ALUData;
wire [4:0] Out_Rs, Out_Rt, Out_Rd;
wire [31:0] Out_MEMAddress, Out_MEMData;
wire [31:0] Out_Data;
wire [31:0] Out_PC;
wire [31:0] Out_Instr;
wire [31:0] Out_Branch_PC, Out_Jump_PC;
wire Out_PCSrc, Out_Jump;
wire [31:0] Out_DataA;
wire Out_RegWrite;
wire [3:0] Out_EXControl1;
wire [1:0] Out_MEMControl1, Out_WBControl1, Out_MEMControl2, Out_WBControl2, Out_WBControl3;

MIPSProcessor myMIPSProcessor(Clk, Out_PC, Out_Instr, Out_Branch_PC, Out_Jump_PC, Out_PCSrc, Out_Jump, Out_DataA, Out_DataB, Out_SE, Out_Funct, Out_WriteAddr, Out_ALUResult, Out_ALUData, Out_Rs, Out_Rt, Out_Rd, Out_MEMAddress, Out_MEMData, Out_Data, Out_RegWrite, Out_EXControl1, Out_MEMControl1, Out_WBControl1, Out_MEMControl2, Out_WBControl2, Out_WBControl3);

initial begin
	Clk<=1'b0;
	#1 $display("Clk=%d, Out_PC=%d, Out_Instr=%d, Out_Branch_PC=%d, Out_PCSrc=%d, Out_DataA=%d, Out_DataB=%d, Out_SE=%d, Out_Funct=%d", Clk, Out_PC, Out_Instr, Out_Branch_PC, Out_PCSrc, Out_DataA, Out_DataB, Out_SE, Out_Funct);
	Clk<=1'b1;
	#1 $display("Clk=%d, Out_PC=%d, Out_Instr=%d, Out_Branch_PC=%d, Out_PCSrc=%d, Out_DataA=%d, Out_DataB=%d, Out_SE=%d, Out_Funct=%d", Clk, Out_PC, Out_Instr, Out_Branch_PC, Out_PCSrc, Out_DataA, Out_DataB, Out_SE, Out_Funct);
	Clk<=1'b0;
	#1 $display("Clk=%d, Out_PC=%d, Out_Instr=%d, Out_Branch_PC=%d, Out_PCSrc=%d, Out_DataA=%d, Out_DataB=%d, Out_SE=%d, Out_Funct=%d", Clk, Out_PC, Out_Instr, Out_Branch_PC, Out_PCSrc, Out_DataA, Out_DataB, Out_SE, Out_Funct);
end

endmodule
