module DataMemory(Address, WriteData, MemRead, MemWrite, Clk,ReadData);
input [6:0] Address; // 7-bit address to memory.
input [31:0] WriteData; // Data to be written into WriteRegister
input MemRead; // Data in memory location Address is read if thiscontrol is set
input MemWrite; // WriteData is written in Address during positiveclock edge if this control is set
output [31:0] ReadData; // Value read from memory location Address
reg [31:0] ReadData;
input Clk;
reg [255:0] memFile[31:0];


initial @(Clk) begin
   memFile[0] <= 10;
end


always @(*) begin
	if (MemRead) begin
		 ReadData = memFile[Address];
	end
	
	if (MemWrite) begin
		memFile[Address] = WriteData;
	end
end

endmodule
