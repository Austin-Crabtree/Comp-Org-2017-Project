module CPU(
	input Clk,
	output [31:0] OutPC,
	output [31:0] Instr,
	output [31:0] Data,
	output RegWrite,
	output [2:0] Funct,
	output [4:0] Rs, Rt, Rd,
	output [3:0] EXControl1,
	output [1:0] MEMControl1, WBControl1, MEMControl2, WBControl2,
	output [4:0] WriteAddr,
	output [31:0] ALUResult, ALUData,
	output [1:0] WBControl3,
	output [31:0] MEMAddress, MEMData,
	output PCSrc, Jump,
	output [31:0] BranchPC, JumpPC,
	output [31:0] DataA, DataB, SE
);

	reg [31:0] PC;

	wire [31:0] OutPC;
	wire [31:0] Instr;
	wire [4:0] WriteAddr;
	wire [31:0] Data;
	wire RegWrite, PCSrc, Jump;
	wire [31:0] BranchPC, JumpPC;
	wire [31:0] DataA, DataB, SE;
	wire [2:0] Funct;
	wire [4:0] Rs, Rt, Rd;
	wire [3:0] EXControl1;
	wire [1:0] MEMControl1, WBControl1;
	wire [31:0] ALUResult, ALUData;
	wire [1:0] MEMControl2, WBControl2;
	wire [1:0] WBControl3;
	wire [31:0] MEMAddress, MEMData;

	initial begin
		PC = 32'd0;
	end

	always @(negedge Clk) begin
	    if(PCSrc == 1) begin
			 PC = BranchPC;
		end
		else if(PCSrc == 0) begin
			 PC = OutPC;
		end

	end

	IF IF_(PC, Clk, OutPC, Instr);
	ID ID_(OutPC, Instr, WriteAddr, Data, RegWrite, BranchPC, JumpPC, PCSrc, Jump, DataA, DataB, SE, Funct, Rs, Rt, Rd, EXControl1, MEMControl1, WBControl1, Clk);
	EX EX_(DataA, DataB, SE, Rt, Rd, EXControl1, MEMControl1, WBControl1, Funct, ALUResult, ALUData, WriteAddr, MEMControl2, WBControl2, Clk);
	MEM MEM_(ALUResult, ALUData, MEMControl2, WBControl2, MEMAddress, MEMData, WBControl3, Clk);
	WB WB_(MEMAddress, MEMData, WBControl3, Data, RegWrite, Clk);

endmodule
