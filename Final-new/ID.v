module ID(
	//input
	input [31:0] In_PC,
	input [31:0] In_IR,
	input [4:0] In_Rd,
	input [31:0] In_WriteData,
	input In_RegWrite,
	input Clk,
	//output
	output [31:0] OutBranchPC,
	output [31:0] OutJumpPC,
	output OutPCSrc,
	output OutJump,
	output [31:0] OutDataA,
	output [31:0] OutDataB,
	output [31:0] OutSE,
	output [2:0] OutFunct,
	output [4:0] OutRs,
	output [4:0] OutRt,
	output [4:0] OutRd,
	output [3:0] OutEXControl,
	output [1:0] OutMEMControl,
	output [1:0] OutWBControl
);

	reg [31:0] OutDataA;
	reg [31:0] OutDataB;
	reg [31:0] OutSE;
	reg [2:0] OutFunct;
	reg [4:0] OutRs;
	reg [4:0] OutRt;
	reg [4:0] OutRd;
	reg [3:0] OutEXControl;
	reg [1:0] OutMEMControl;
	reg [1:0] OutWBControl;

	wire [31:0] DataATmp, DataBTmp, SE;
	wire PCSrc;
	wire ALUSrc;
	wire [1:0] ALUOp;
	wire RegDst, MemWrite, MemRead, Beq, Bne, MemToReg, RegWrite;
	wire [2:0] Funct;
	wire [3:0] EXControl;
	wire [1:0] MEMControl, WBControl;

	RegisterFile Reg(In_IR[25:21],In_IR[20:16],In_Rd,In_WriteData,In_RegWrite,Clk,DataATmp,DataBTmp);
	Control Ctrl(In_IR[31:26],In_IR[5:0],ALUSrc,ALUOp,RegDst,MemWrite,MemRead,Beq, Bne, Jump, MemToReg,RegWrite,Funct);
	SignExtension Sign(In_IR[15:0],SE);

	assign EXControl={ALUSrc,ALUOp[1:0],RegDst};
	assign MEMControl={MemWrite,MemRead};
	assign WBControl={MemToReg,RegWrite};

	assign OutBranchPC = In_PC + (SE << 2);
	assign OutJumpPC = {In_PC[31:28], (In_IR[25:0] << 2)};
	assign OutPCSrc = (((Beq == 1) & (DataATmp == DataBTmp)) | ((Bne == 1) & (DataATmp != DataBTmp)));
	assign OutJump = Jump;

	always@(negedge Clk) begin
		 OutDataA = DataATmp;
		 OutDataB = DataBTmp;

		 OutSE = SE;
		 OutRs = In_IR[25:21];
		 OutRt = In_IR[20:16];
		 OutRd = In_IR[15:11];

		 OutEXControl = EXControl;
		 OutMEMControl = MEMControl;
		 OutWBControl = WBControl;
		 OutFunct = Funct;
	end
endmodule
