module DataMemory_tb();
	reg [31:0] In_DataA_t;		// Data A
	reg [31:0] In_DataB_t;		// Data B
	reg [31:0] In_SE_t;			// Sign extended value
	reg [4:0] In_Rt_t;
	reg [4:0] In_Rd_t;
	wire Clk_t;						// Clock
	reg [3:0] In_EXControl_t; 	// Control signals for EX stage
									// ([3] ALUSrc, [2:1] ALUOp, [0] RegDst);
	reg [1:0] In_MEMControl_t; // Control signals for MEM stage
									// ([1] MemWrite, [0] MemRead);
	reg [1:0] In_WBControl_t;	// Control signals for WB stage.
									// ([1] MemToReg, [0] RegWrite)
	reg [2:0] In_Funct_t;		// 3-bit ALU control value
									
	wire [31:0] Out_Result_t;	// Result from ALU; output for address for MEM
	wire [31:0] Out_Data_t;		// Output for write data for MEM
	wire [1:0] Out_MEMControl_t;	// Control signals for MEM stage
	wire [1:0] Out_WBControl_t;	// Control signals for WB stage
	wire [4:0] Out_Rd_t;


	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);

		$display("time\tIn_DataA_t\tIn_DataB_t\tIn_SE_t\tIn_Rt_t\tIn_Rd_t\tClk_t\tIn_EXControl_t\tIn_MEMControl_t\tIn_WBControl_t\tOut_Result_t\tOut_Data_t\tOut_Rd_t\tOut_MEMControl_t\tOut_WBControl_t");
		$monitor("%t\t%b\t%b\t%b\t%d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d\t%b\t%b", 
		$time, In_DataA_t, In_DataB_t, In_SE_t, In_Rt_t, In_Rd_t, Clk_t, In_EXControl_t, In_MEMControl_t, In_WBControl_t, Out_Result_t, Out_Data_t, Out_Rd_t, Out_MEMControl_t, Out_WBControl_t);

	Clk_t = 1;

		///////////////////
		//TEST 1
		// Initialize Inputs
		In_DataA_t<=32'd 4;
		In_DataB_t<=32'd 8;
		In_SE_t<=32'h ffffffff;
		In_Rt_t<=5'd8;
		In_Rd_t<=5'd9;
		In_EXControl_t<=4'b1101;
		In_MEMControl_t<=2'b00;
		In_WBControl_t<=2'b11;
		In_Funct_t<=3'b010;
		Clk_t<=1'b0;

		// Wait 20 s for global reset to finish
		#20;
	
		#20 $finish;
	end

  always begin
		#10 Clk_t = ~Clk_t;
	end

	//Module to Test
	EX myEX(In_DataA_t, In_DataB_t, In_SE_t, In_Rt_t, In_Rd_t, In_EXControl_t, In_MEMControl_t, In_WBControl_t, In_Funct_t, Out_Result_t, Out_Data_t, Out_Rd_t, Out_MEMControl_t, Out_WBControl_t, Clk_t);
endmodule
