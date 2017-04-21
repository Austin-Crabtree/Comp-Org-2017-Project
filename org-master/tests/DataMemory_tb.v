`timescale 1ns / 1ps
module DataMemory_tb();
reg [6:0] Address_t;		 // 7-bit address to memory.
reg [31:0] WriteData_t;  // Data to be written into WriteRegister
reg MemRead_t;				 // Data in memory location Address is read if this control is set
reg MemWrite_t;			 // WriteData is written in Address during positive clock edge if this control is set
reg Clk_t;					 // Clock input
wire [31:0] ReadData_t;  // Value read from memory location Address

DataMemory dmem(Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);

initial 
	begin
	 Address_t <= 7'd 2; WriteData_t <= 32'd 1000; MemRead_t <= 1; MemWrite_t <= 0; Clk_t <= 0;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);
	 
	 Address_t <= 7'd 2; WriteData_t <= 32'd 1000; MemRead_t <= 0; MemWrite_t <= 0; Clk_t <= 1;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);
	 	 
	 Address_t <= 7'd 2; WriteData_t <= 32'd 1000; MemRead_t <= 0; MemWrite_t <= 1; Clk_t <= 0;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);
	 
	 Address_t <= 7'd 2; WriteData_t <= 32'd 1000; MemRead_t <= 0; MemWrite_t <= 1; Clk_t <= 1;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);

	 Address_t <= 7'd 8; WriteData_t <= 32'd 1000; MemRead_t <= 1; MemWrite_t <= 0; Clk_t <= 0;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);

	Address_t <= 7'd 8; WriteData_t <= 32'd 1000; MemRead_t <= 1; MemWrite_t <= 0; Clk_t <= 1;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);

	Address_t <= 7'd 8; WriteData_t <= 32'd 1000; MemRead_t <= 0; MemWrite_t <= 0; Clk_t <= 0;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);
	 
	 Address_t <= 7'd 9; WriteData_t <= 32'd 1000; MemRead_t <= 0; MemWrite_t <= 0; Clk_t <= 1;
	 #1 $display ("Address = %d, WriteData =%d, MemRead =%d, MemWrite = %d, Clk = %d, ReadData = %d", Address_t, WriteData_t, MemRead_t, MemWrite_t, Clk_t, ReadData_t);
	 
	end

endmodule
