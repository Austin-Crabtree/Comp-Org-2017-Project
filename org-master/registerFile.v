`timescale 1ns / 1ps
module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister,WriteData, RegWrite, Clk, ReadData1, ReadData2);
input [4:0] ReadRegister1, ReadRegister2; // Two registers to be read
input [4:0] WriteRegister; // Register address to write into
input [31:0] WriteData; // Data to be written into WriteRegister
input RegWrite; // RegWrite control signal. Data is written only whenthis signal is enabled
output [31:0] ReadData1, ReadData2;
input Clk;
reg [31:0] ReadData1, ReadData2;
reg [31:0] iamReg[0:31];

initial begin
        iamReg[8]=32'h FFFFFFFF;
		iamReg[2]=32'h 00000000;
		iamReg[16]=32'h F0F0F0F0; 
		iamReg[9]=32'h 0F0F0F0F;
end

always @(negedge Clk) begin
	if(RegWrite) begin
	   iamReg[WriteRegister] = WriteData ;
	end 
	 ReadData1 = iamReg[ReadRegister1] ;
	 ReadData2 = iamReg[ReadRegister2] ;
end
	
	


endmodule
