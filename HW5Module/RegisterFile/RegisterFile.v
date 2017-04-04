module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData,RegWrite, Clk, ReadData1, ReadData2);
  input [4:0] ReadRegister1, ReadRegister2; // Two registers to be read
  input [4:0] WriteRegister; // Register address to write into
  input [31:0] WriteData; // Data to be written into WriteRegister
  input RegWrite; // RegWrite control signal. Data is written only when this signal is enabled
  output [31:0] ReadData1, ReadData2;

  reg [31:0] RegFile[0:16];

  assign ReadData1 = regfile[ReadRegister1];
  assign ReadData2 = regfile[ReadRegister2];

  always @(posedge Clk) begin
    if (RegWrite == 1'b1)
      regfile[wrAddr] <= wrData;
    end
  end
endmodule
