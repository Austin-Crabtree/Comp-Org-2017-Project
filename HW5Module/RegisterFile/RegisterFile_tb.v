module RegisterFile_tb();
	//Inputs
  reg [4:0] ReadRegister1, ReadRegister2; // Two registers to be read
  reg [4:0] WriteRegister; // Register address to write into
  reg [31:0] WriteData; // Data to be written into WriteRegister
  reg RegWrite; // RegWrite control signal. Data is written only when this signal is enabled
  reg Clk;

  //Outputs
  wire [31:0] ReadData1, ReadData2;

	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);

		$display("time\tReadRegister1\tReadRegister2\tWriteRegister\tWriteData\t\t\t\tRegWrite\tClk\tReadData1\tReadData2");
		$monitor("%g\t%b\t\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b",
		$time, ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);

    Clk = 1;

		///////////////////
		//TEST 1
		// Initialize Inputs
		ReadRegister1 = 5'b10011;
    ReadRegister2 = 5'b11010;
    WriteRegister = 5'b11010;
    WriteData = 32'b10000000000000000000000001111111;
    RegWrite = 1;

		// Wait 20 s for global reset to finish
		#20;

		///////////////////
		//TEST 2
		// Initialize Inputs
    ReadRegister1 = 5'b10011;
    ReadRegister2 = 5'b11010;
    WriteRegister = 5'b10011;
    WriteData = 32'b10000000000000000000000001111111;
    RegWrite = 0;

    // Wait 20 s for global reset to finish
		#20;

		///////////////////
		//TEST 3
		// Initialize Inputs
    ReadRegister1 = 5'b10011;
    ReadRegister2 = 5'b11010;
    WriteRegister = 5'b10011;
    WriteData = 32'b11011000001111110000000000111111;
    RegWrite = 1;

		#20 $finish;
	end

  always begin
		#10 Clk = ~Clk;
	end

	RegisterFile test(ReadRegister1, ReadRegister2, WriteRegister, WriteData,RegWrite, Clk, ReadData1, ReadData2);
endmodule
