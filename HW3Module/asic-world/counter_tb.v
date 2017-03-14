module counter_tb();
	reg clk, reset, enable;
	wire [3:0] out;

	initial begin
		//This is needed for iverilog and gtkwave
		$dumpfile("wave");
		$dumpvars(0, test);
		//--------------------------------------
		$display("time\t clk reset enable counter");
		$monitor("%g\t    %b   %b    %b     %b", 
			$time, clk, reset, enable, out);
		clk = 1;
		reset = 0;
		enable = 0; 
		#5 reset = 1;
		#10 reset = 0;
		#10 enable = 1;
		#100 enable = 0;
		#5 $finish;
	end

	always begin
		#5 clk = ~clk;
	end

counter test(clk, reset, enable, out);

endmodule
