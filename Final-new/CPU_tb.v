module CPU_tb();

	//Input
	reg Clk;

	//Outputs
	wire [31:0] OutPC;
	wire [31:0] Instr;
	wire [31:0] Data;
	wire RegWrite;
	wire [2:0] Funct;
	wire [4:0] Rs, Rt, Rd;
	wire [3:0] EXControl1;
	wire [1:0] MEMControl1, WBControl1, MEMControl2, WBControl2;
	wire [4:0] WriteAddr;
	wire [31:0] ALUResult, ALUData;
	wire [1:0] WBControl3;
	wire [31:0] MEMAddress, MEMData;
	wire PCSrc, Jump;
	wire [31:0] BranchPC, JumpPC;
	wire [31:0] DataA, DataB, SE;

	initial begin
		$dumpfile("wave");
    	$dumpvars(0, test);

    	$display("time\tClk\tOutPC\tInstr\tData\tRegWrite\tFunct\tRs\tRt\tRd\tEXControl1\tMEMControl1\tWBControl1\tMEMControl2\tWBControl2\tWriteAddr\tALUResult\tALUData\tWBControl3\tMEMAddress\tMEMData PCSrc\tJump\tBranchPC\tJumpPC\tDataA\tDataB\tSE");
    	$monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",
    	$time, Clk, OutPC, Instr, Data, RegWrite, Funct, Rs, Rt, Rd, EXControl1, MEMControl1, WBControl1, MEMControl2, WBControl2, WriteAddr, ALUResult, ALUData, WBControl3, MEMAddress, MEMData, PCSrc, Jump, BranchPC, JumpPC, DataA, DataB, SE);

    	Clk = 1;

		#80 $finish; 
	end

	always begin
		#10 Clk = ~Clk;
	end

	CPU test(Clk, OutPC, Instr, Data, RegWrite, Funct, Rs, Rt, Rd, EXControl1, MEMControl1, WBControl1, MEMControl2, WBControl2, WriteAddr, ALUResult, ALUData, WBControl3, MEMAddress, MEMData, PCSrc, Jump, BranchPC, JumpPC, DataA, DataB, SE);
endmodule
