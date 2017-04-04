module DataMemory(Address, WriteData, MemRead, MemWrite, Clk, ReadData);
  input [6:0] Address; // 7-bit address to memory.
  input [31:0] WriteData; // Data to be written into WriteRegister
  input MemRead; // Data in memory location Address is read if this control isset
  input MemWrite; // WriteData is written in Address during positive clock edge if this control is set
  input Clk;
  output reg [31:0] ReadData; // Value read from memory location Address

// Address size for MEM arr needs to change?
///////////////////////////////////////////
  reg [31:0] MEM[0:127];  // 128 words of 32-bit memory
///////////////////////////////////////////

  always @(posedge Clk) begin
    if (MemWrite == 1'b1) begin
      MEM[Address] <= WriteData;
    end

    if (MemRead == 1'b1) begin
      ReadData <= MEM[Address];
    end
  end
endmodule
