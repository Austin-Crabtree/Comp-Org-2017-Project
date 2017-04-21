`timescale 1ns / 1ps
module WB_tb();
reg [31:0] In_Address_t;
reg [31:0] In_Data_t;
reg [1:0] In_WBControl_t; // Control signals for WB stage.
								  // ([1] MemToReg, [0] RegWrite)
reg Clk_t;

wire [31:0] Out_Data_t;
wire Out_RegWrite_t;

WB myWB(In_Address_t, In_Data_t, In_WBControl_t, Out_Data_t, Out_RegWrite_t, Clk_t);

initial begin
In_Address_t<=32'd1;
In_Data_t<=32'd2;
In_WBControl_t<=2'b11;
Clk_t<=1'b0;

#1 $display("In_Address = %b, In_Data = %b, In_WBControl = %b, Out_Data = %b, Out_RegWrite = %b, Clk = %b", In_Address_t, In_Data_t, In_WBControl_t, Out_Data_t, Out_RegWrite_t, Clk_t);
end

endmodule
