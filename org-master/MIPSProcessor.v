`timescale 1ns / 1ps
module MIPSProcessor(Clk, Out_PC, Out_Instr, Out_BranchPC, Out_JumpPC, Out_PCSrc, Out_Jump, Out_DataA, Out_DataB, Out_SE, Out_Funct, Out_WriteAddr, Out_ALUResult, Out_ALUData, Out_Rs, Out_Rt, Out_Rd, Out_MEMAddress, Out_MEMData, Out_Data, Out_RegWrite, Out_EXControl1, Out_MEMControl1, Out_WBControl1, Out_MEMControl2, Out_WBControl2, Out_WBControl3);
input Clk;
output [31:0] Out_PC;
output [31:0] Out_Instr;  
output [31:0] Out_Data;
output Out_RegWrite; 
output [2:0] Out_Funct; 
output [4:0] Out_Rs, Out_Rt, Out_Rd;
output [3:0] Out_EXControl1;
output [1:0] Out_MEMControl1, Out_WBControl1, Out_MEMControl2, Out_WBControl2; 
output [4:0] Out_WriteAddr;
output [31:0] Out_ALUResult, Out_ALUData;
output [1:0] Out_WBControl3;
output [31:0] Out_MEMAddress, Out_MEMData;
output Out_PCSrc, Out_Jump;
output [31:0] Out_BranchPC, Out_JumpPC; 
output [31:0] Out_DataA, Out_DataB, Out_SE; 


reg [31:0] In_PC;

wire [31:0] Out_PC;
wire [31:0] Out_Instr;

wire [4:0] Out_WriteAddr;
wire [31:0] Out_Data;
wire Out_RegWrite, Out_PCSrc, Out_Jump;
wire [31:0] Out_BranchPC, Out_JumpPC;
wire [31:0] Out_DataA, Out_DataB, Out_SE;
wire [2:0] Out_Funct;
wire [4:0] Out_Rs, Out_Rt, Out_Rd;
wire [3:0] Out_EXControl1;
wire [1:0] Out_MEMControl1, Out_WBControl1; 
wire [31:0] Out_ALUResult, Out_ALUData;
wire [1:0] Out_MEMControl2, Out_WBControl2;
wire [1:0] Out_WBControl3;
wire [31:0] Out_MEMAddress, Out_MEMData;

initial begin
	In_PC = 32'd0;
end

always @(negedge Clk) begin
    if(Out_PCSrc==1) begin
		 In_PC=Out_BranchPC;
	end 
	else if(Out_PCSrc==0) begin
		 In_PC=Out_PC;
	end 
	
end 

IF myIF(In_PC, Clk, Out_PC, Out_Instr);
ID myID(Out_PC, Out_Instr, Out_WriteAddr, Out_Data, Out_RegWrite, Out_BranchPC, Out_JumpPC, Out_PCSrc, Out_Jump, Out_DataA, Out_DataB, Out_SE, Out_Funct, Out_Rs, Out_Rt, Out_Rd, Out_EXControl1, Out_MEMControl1, Out_WBControl1, Clk);
EX myEX(Out_DataA, Out_DataB, Out_SE, Out_Rt, Out_Rd, Out_EXControl1, Out_MEMControl1, Out_WBControl1, Out_Funct, Out_ALUResult, Out_ALUData, Out_WriteAddr, Out_MEMControl2, Out_WBControl2, Clk);
MEM myMEM(Out_ALUResult, Out_ALUData, Out_MEMControl2, Out_WBControl2, Out_MEMAddress, Out_MEMData, Out_WBControl3, Clk);
WB myWB(Out_MEMAddress, Out_MEMData, Out_WBControl3, Out_Data, Out_RegWrite, Clk);

endmodule
