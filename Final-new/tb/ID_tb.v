module ID_testben();

reg [31:0] In_PC_t; // Program counter
reg [31:0] In_IR_t; // Instruction register
reg [4:0] In_Rd_t; // Address for writing
reg [31:0] In_WriteData_t; // Data to be written
reg In_RegWrite_t; // Control line for writing into register
wire Clk_t;
wire Out_PCSrc_t; // PCSrc control input to the multiplexor in the IF stage
wire [31:0] Out_DataA_t; // Read Register A
wire [31:0] Out_DataB_t; // Read Register B
wire [31:0] Out_SE_t; // Sign extended value
wire [2:0] Out_Funct_t; // 6 bit funct field
wire [31:0] Out_BranchPC_t; // Branch target address or jump address

wire [4:0] Out_Rt_t; // Rt register address In_IR[20:16];
wire [4:0] Out_Rd_t; // Rd register address In_IR[15:11];
wire [4:0] Out_Rs_t; // Rs register address In_IR[25:21]; for use in forwarding logic


wire [3:0] Out_EXControl_t; // Control signals for EX stage
// ([3] ALUSrc, [2:1] ALUOp, [0] RegDst);
wire [1:0] Out_MEMControl_t; // Control signals for MEM stage
// ([1] MemWrite, [0] MemRead);
wire [1:0] Out_WBControl_t; // Control signals for WB stage.
// ([1] MemToReg, [0] RegWrite)

ID myID(In_PC_t, In_IR_t, In_Rd_t, In_WriteData_t, In_RegWrite_t,
Out_BranchPC_t, Out_PCSrc_t, Out_DataA_t, Out_DataB_t, Out_SE_t, 
Out_Funct_t, Out_Rs_t, Out_Rt_t, Out_Rd_t, Out_EXControl_t,
Out_MEMControl_t, Out_WBControl_t, Clk_t);

initial begin

In_PC_t <= 32'h 00000000; // Program counter
In_IR_t <= 32'b 00000000010010000100100000100000; // Instruction register.
In_Rd_t <= 5'b 01001; // Address for writing
In_WriteData_t <= 32'd 15; // Data to be written
In_RegWrite_t <= 1'b 0; // Control line for writing into register
//Clk_t <= 1'b 0;

#1 $display( "Out_DataA = %b, Out_DataB = %b,  In_IR[25:21] = %b, In_IR_t[20:16] = %b, In_Rd_t = %b, In_WriteData_t = %b, In_RegWrite_t = %b, Clk_t = %b", Out_DataA_t, Out_DataB_t, In_IR_t[25:21], In_IR_t[20:16], In_Rd_t, In_WriteData_t, In_RegWrite_t, Clk_t);

end
endmodule
