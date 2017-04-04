module OldControlLogic_Test_Bench();
	//Input
	reg [5:0] opcode;

	//Output
	wire ALUsrc,RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite;
	wire [1:0] ALUOp;

	initial begin 
	  //This is needed for iverilog and gtkwave
	  $dumpfile("wave");
	  $dumpvars(0, test);

	  //---------------------------------------
	  $display("time\topcode\tALUsrc\tALUop\tRegDst\tMemWrite\tMemRead\tBeq\tBne\tJump\tMemToRead\tRegWrite");
	  $monitor("%g\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%b\t%b\t\t%b",
	  $time, opcode, ALUsrc, ALUop, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);

	  /////////////////////////////////////////
	  // Test 1
	  // Initialize Inputs
	  opcode = 6'b000000;

	  #10;

	  /////////////////////////////////////////
	  // Test 2
	  // Initialize Inputs
	  opcode = 6'b100011;

	  #10;

	  /////////////////////////////////////////
	  // Test 3
	  // Initialize Inputs
	  opcode = 6'b101011;

	  #10;

	  /////////////////////////////////////////
	  // Test 4
	  // Initialize Inputs
	  opcode = 6'b000100;

	  #10;

	  /////////////////////////////////////////
	  // Test 5
	  // Initialize Inputs
	  opcode = 6'b111011;

	  #10;

	  /////////////////////////////////////////
	  // Test 6
	  // Initialize Inputs
	  opcode = 6'b100001;

	  #10;
	end

	OldControlLogic test(opcode, ALUsrc, ALUop, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);

endmodule
