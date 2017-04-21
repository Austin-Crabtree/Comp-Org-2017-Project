`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2016 12:29:03 PM
// Design Name: 
// Module Name: EX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX(DataA_In, DataB_In, SE_In, Rt_In, Rd_In, EXControl_In, MEMControl_In, WBControl_In, 
Funct_In, Result_Out, Data_Out, Rd_Out, MEMControl_Out, WBControl_Out, Clk);
    
    input [3:0] EXControl_In; 	// Control signals for EX stage
                                        // ([3] ALUSrc, [2:1] ALUOp, [0] RegDst);
    input [1:0] MEMControl_In; // Control signals for MEM stage
                                        // ([1] MemRead, [0] MemWrite);
    input [1:0] WBControl_In;	// Control signals for WB stage.
                                        // ([1] MemToReg, [0] RegWrite)
    input [2:0] Funct_In;       // 3-bit ALU control
    input Clk;	
    input [31:0] DataA_In;		// Data A input
    input [31:0] DataB_In;		// Data B input
    input [31:0] SE_In;			// value (Sign extended)
    input [4:0] Rt_In;
    input [4:0] Rd_In;
    					
    		
                                        
    output [31:0] Result_Out;	// Result from ALU; output for address for MEM
    output [31:0] Data_Out;		// Output for write data for MEM
    output [1:0] MEMControl_Out;	// Control signals for MEM stage
    output [1:0] WBControl_Out;	// Control signals for WB stage
    output [4:0] Rd_Out;
    
    reg [31:0] DataB;				// Data to go into second input of ALU (either In_DataB or In_SE)
    reg [31:0] Data_Out;
    reg [31:0] Result_Out;
    reg [1:0] MEMControl_Out;
    reg [1:0] WBControl_Out;
    reg [4:0] Rd_Out;
    
    wire set, zero, overflow;
    wire [31:0] result;
    
    always @(EXControl_In) begin 
        if (EXControl_In[0]==0) begin
                 Rd_Out=Rt_In;
            end
            else if (EXControl_In[0]==1) begin
                 Rd_Out=Rd_In;
            end
        if (EXControl_In[3]==0) begin
             DataB=DataB_In;
        end
        else if (EXControl_In[3]==1) begin
             DataB=SE_In;
        end
    end
    always@(negedge Clk) begin
        Result_Out=result;
         Data_Out=DataB_In;
         MEMControl_Out=MEMControl_In;
         WBControl_Out=WBControl_In;
    end
    ALU32Bit myALU32Bit(In_DataA,DataB,In_Funct,result,set,zero,overflow);
endmodule
