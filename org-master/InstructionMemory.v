`timescale 1ns / 1ps
module InstructionMemory(PC_In,Clk,Instr_Out);
input Clk;	
output [31:0] Instr_Out;
reg [31:0] ins[0:65536];														
reg [31:0] Instr_Out;
input [31:0] PC_In;																
					
						

initial begin
	ins[0]=32'b 00000000010010000100100000100000;
	ins[1]=32'b 00000001001000101000000000100010; 
end
always@(negedge Clk) begin
	 Instr_Out=ins[PC_In];
end

endmodule