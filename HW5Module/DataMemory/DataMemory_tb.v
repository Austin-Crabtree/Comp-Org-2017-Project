module DataMemory_tb();
	//Inputs
  reg [6:0] Address; // 7-bit address to memory.
  reg [31:0] WriteData; // Data to be written into WriteRegister
  reg MemRead; // Data in memory location Address is read if this control isset
  reg MemWrite; // WriteData is written in Address during positive clock edge if this control is set
  reg Clk;

  //Outputs
  wire [31:0] ReadData;

	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);

		$display("time\tAddress\tWriteData\t\t\t\tMemRead\tMemWrite\tClk\tReadData");
		$monitor("%g\t%b\t%b\t%b\t%b\t\t%b\t%b",
		$time, Address, WriteData, MemRead, MemWrite, Clk, ReadData);

    Clk = 1;

		///////////////////
		//TEST 1
		// Initialize Inputs
    Address = 7'b1000011;
    WriteData = 32'b11011000001111110000000000111111;
    MemRead = 1;
    MemWrite = 0;

		// Wait 20 s for global reset to finish
		#20;

		///////////////////
		//TEST 2
		// Initialize Inputs
    Address = 7'b1000011;
    WriteData = 32'b11011000001111110000000000111111;
    MemRead = 0;
    MemWrite = 1;

    // Wait 20 s for global reset to finish
		#20;

		///////////////////
		//TEST 3
		// Initialize Inputs
    Address = 7'b1000011;
    WriteData = 0;
    MemRead = 0;
    MemWrite = 1;

    // Wait 20 s for global reset to finish
		#20;

		///////////////////
		//TEST 4
		// Initialize Inputs
    Address = 7'b1000011;
    WriteData = 0;
    MemRead = 1;
    MemWrite = 0;

		#20 $finish;
	end

  always begin
		#10 Clk = ~Clk;
	end

	DataMemory test(Address, WriteData, MemRead, MemWrite, Clk, ReadData);
endmodule
