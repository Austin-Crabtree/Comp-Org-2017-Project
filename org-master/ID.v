`timescale 1ns / 1ps
module ID(In_PC, In_IR, In_Rd, In_WriteData, In_RegWrite,Out_BranchPC, Out_JumpPC, Out_PCSrc, Out_Jump, Out_DataA, Out_DataB, Out_SE, 
Out_Funct, Out_Rs, Out_Rt, Out_Rd, Out_EXControl,
Out_MEMControl, Out_WBControl, Clk);

input [31:0] In_PC;			// Program counter
input [31:0] In_IR;			// Instruction register
input [4:0] In_Rd;			// Address for writing
input [31:0] In_WriteData;	// Data to be written
input In_RegWrite;			// Control line for writing into register
input Clk;

output [31:0] Out_BranchPC;	// Branch target address 
output [31:0] Out_JumpPC;		// Jump address
output Out_PCSrc;					// PCSrc control input to the multiplexor in the IF stage
output Out_Jump;					// Jump control input
output [31:0] Out_DataA;		// Read Register A
output [31:0] Out_DataB;		// Read Register B
output [31:0] Out_SE;			// Sign extended value
output [2:0] Out_Funct;			// 3-bit ALU control value

output [4:0] Out_Rs;				// Rs register address In_IR[25:21]; for use in forwarding logic
output [4:0] Out_Rt;				// Rt register address In_IR[20:16];
output [4:0] Out_Rd;				// Rd register address In_IR[15:11];

output [3:0] Out_EXControl;	// Control signals for EX stage
										// ([3] ALUSrc, [2:1] ALUOp, [0] RegDst);
output [1:0] Out_MEMControl;	// Control signals for MEM stage
										// ([1] MemWrite, [0] MemRead);
output [1:0] Out_WBControl;	// Control signals for WB stage.
										// ([1] MemToReg, [0] RegWrite)
										
reg [31:0] Out_DataA;			// Read Register A
reg [31:0] Out_DataB;			// Read Register B
reg [31:0] Out_SE;				// Sign extended value
reg [2:0] Out_Funct;				// 6 bit funct field

reg [4:0] Out_Rs;					// Rs register address In_IR[25:21]; for use in forwarding logic
reg [4:0] Out_Rt;					// Rt register address In_IR[20:16];
reg [4:0] Out_Rd;					// Rd register address In_IR[15:11];

reg [3:0] Out_EXControl;		// Control signals for EX stage
										// ([3] ALUSRc, [2:1] ALUOp, [0] RegDst;
reg [1:0] Out_MEMControl;		// Control signals for MEM stage
										// ([1] MemRead, [0] MemWrite);
reg [1:0] Out_WBControl;		// Control signals for WB stage 
										// ([1] MemToReg, [0] RegWrite);
										
wire [31:0] DataA, DataB, SE;
wire PCSrc;
wire ALUSrc;
wire [1:0] ALUOp;
wire RegDst, MemWrite, MemRead, Beq, Bne, MemToReg, RegWrite;
wire [2:0] Funct;
wire [3:0] EXControl;
wire [1:0] MEMControl, WBControl;

RegisterFile RF(In_IR[25:21],In_IR[20:16],In_Rd,In_WriteData,In_RegWrite,Clk,DataA,DataB);
//module Control(opcode, funct, ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl); 
Control Ctrl(In_IR[31:26],In_IR[5:0],ALUSrc,ALUOp,RegDst,MemWrite,MemRead,Beq, Bne, Jump, MemToReg,RegWrite,Funct);
SignExtension SE1(In_IR[15:0],SE);

assign EXControl={ALUSrc,ALUOp[1:0],RegDst};
assign MEMControl={MemWrite,MemRead};
assign WBControl={MemToReg,RegWrite};


assign Out_BranchPC=In_PC+(SE<<2);	// Branch target address computation
assign Out_JumpPC={In_PC[31:28],(In_IR[25:0]<<2)};

assign Out_PCSrc=(((Beq==1)&(DataA==DataB))|((Bne==1)&(DataA!=DataB)));
assign Out_Jump=Jump;

// Assign the outputs at the negative edge of the clock.
// You do not want the outputs to settle after the positive edge.
always@(negedge Clk) begin
	 Out_DataA=DataA;
	 Out_DataB=DataB;
	
	 Out_SE=SE;
	 Out_Rs=In_IR[25:21];
	 Out_Rt=In_IR[20:16];
	 Out_Rd=In_IR[15:11];
	
	 Out_EXControl=EXControl;
	 Out_MEMControl=MEMControl;
	 Out_WBControl=WBControl;
	 Out_Funct=Funct; 
end 
endmodule
