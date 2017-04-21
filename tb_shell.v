module DataMemory_tb();
	//Inputs

	//Outputs

	initial begin
		$dumpfile("wave");
		$dumpvars(0, test);

		$display("time\tIn_DataA_t\tIn_DataB_t\tIn_SE_t\tIn_Rt_t\tIn_Rd_t\tClk_t\tIn_EXControl_t\tIn_MEMControl_t\tIn_WBControl_t\tOut_Result_t\tOut_Data_t\tOut_Rd_t\tOut_MEMControl_t\tOut_WBControl_t");
		$monitor("%t\t%b\t%b\t%b\t%d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d\t%b\t%b", 
		$time, In_DataA_t, In_DataB_t, In_SE_t, In_Rt_t, In_Rd_t, Clk_t, In_EXControl_t, In_MEMControl_t, In_WBControl_t, Out_Result_t, Out_Data_t, Out_Rd_t, Out_MEMControl_t, Out_WBControl_t

	Clk = 1;

		///////////////////
		//TEST 1
		// Initialize Inputs
		In_DataA_t<=32'd 4;
		In_DataB_t<=32'd 8;
		In_SE_t<=32'h ffffffff;
		In_Rt_t<=5'd8;
		In_Rd_t<=5'd9;
		In_EXControl_t<=4'b1101;
		In_MEMControl_t<=2'b00;
		In_WBControl_t<=2'b11;
		In_Funct_t<=3'b010;
		Clk_t<=1'b0;

		// Wait 20 s for global reset to finish
		#20;
	
		#20 $finish;
	end

  always begin
		#10 Clk = ~Clk;
	end

	//Module to Test
	EX myEX(In_DataA_t, In_DataB_t, In_SE_t, In_Rt_t, In_Rd_t, In_EXControl_t, In_MEMControl_t, In_WBControl_t, In_Funct_t, Out_Result_t, Out_Data_t, Out_Rd_t, Out_MEMControl_t, Out_WBControl_t, Clk_t);
endmodule
