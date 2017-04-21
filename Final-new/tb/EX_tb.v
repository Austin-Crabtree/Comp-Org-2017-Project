`timescale 1ns / 1ps
module EX_tb();
reg [31:0] In_DataA_t;		// Data A
reg [31:0] In_DataB_t;		// Data B
reg [31:0] In_SE_t;			// Sign extended value
reg [4:0] In_Rt_t;
reg [4:0] In_Rd_t;
reg Clk_t;						// Clock
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


EX myEX(In_DataA_t, In_DataB_t, In_SE_t, In_Rt_t, In_Rd_t, In_EXControl_t, In_MEMControl_t, In_WBControl_t, In_Funct_t, Out_Result_t,
 Out_Data_t, Out_Rd_t, Out_MEMControl_t, Out_WBControl_t, Clk_t);

initial begin
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
	
	#1 $display( "In_DataA = %b, In_DataB = %b, In_SE = %b, In_Rt = %d, In_Rd = %d, Clk = %b, In_EXControl = %b, In_MEMControl = %b, In_WBControl = %b, Out_Result = %b, Out_Data = %b, Out_Rd = %d, Out_MEMControl = %b, Out_WBControl = %b", In_DataA_t, In_DataB_t, In_SE_t, In_Rt_t, In_Rd_t, Clk_t, In_EXControl_t, In_MEMControl_t, In_WBControl_t, Out_Result_t, Out_Data_t, Out_Rd_t, Out_MEMControl_t, Out_WBControl_t);
end
endmodule
