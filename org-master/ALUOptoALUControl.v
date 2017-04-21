`timescale 1ns / 1ps

module ALUOpToALUControl(ALUOp, Funct, ALUControl);
input [1:0] ALUOp; 		 // 2-bit intermediate output for controlling ALU
input [5:0] Funct;		 // 6-bit function code
output [2:0] ALUControl; // 3-bit output for controlling ALU based on ALUOp and function code 

reg [2:0] ALUControl;
always@(ALUOp, Funct) begin
	ALUControl[0]=(ALUOp[1]&(Funct[0]|Funct[3]));
	ALUControl[1]=(~ALUOp[1]|~Funct[2]);
	ALUControl[2]=(ALUOp[0]|(ALUOp[1]&Funct[1]));
end

endmodule
