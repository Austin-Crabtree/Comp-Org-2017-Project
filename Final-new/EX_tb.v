module EX_tb();
	//input
	reg [3:0] EXControlIn;
	reg [1:0] MEMControlIn, WBControlIn;
	reg [2:0] FunctIn;
	reg Clk;
	reg [31:0] DataAIn, DataBIn, SEIn;
	reg [4:0] RtIn, RdIn;
	//output
	wire [31:0] ResultOut, DataOut;
	wire [1:0] MEMControlOut, WBControlOut;
	wire [4:0] RdOut;

	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);

		$display("time\tEXControlIn\tMEMControlIn\tWBControlIn\tFunctIn\tClk\tDataAIn\tDataBIn\tSEIn\tRtIn\tRdIn\tResultOut\tDataOut\tMEMControlOut\tWBControlOut\tRdOut");
		$monitor("%g\t%b\t%b\t%b\t%d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d\t%b\t%b",
		$time, EXControlIn, MEMControlIn, WBControlIn, FunctIn, Clk, DataAIn, DataBIn, SEIn, RtIn, RdIn, ResultOut, DataOut, MEMControlOut, WBControlOut, RdOut);

		Clk = 1;

		///////////////////
		//TEST 1
		// Initialize regs
		DataAIn = 32'd 4;
		DataBIn = 32'd 8;
		SEIn=32'h ffffffff;
		RtIn=5'd8;
		RdIn=5'd9;
		EXControlIn=4'b1101;
		MEMControlIn=2'b00;
		WBControlIn=2'b11;
		FunctIn=3'b010;

		// Wait 20 s for global reset to finish
		#20;

		#20 $finish;
	end

  always begin
		#10 Clk = ~Clk;
	end

	//Module to Test
	EX test(EXControlIn, MEMControlIn, WBControlIn, FunctIn, Clk, DataAIn, DataBIn, SEIn, RtIn, RdIn, ResultOut, DataOut, MEMControlOut, WBControlOut, RdOut);
endmodule
