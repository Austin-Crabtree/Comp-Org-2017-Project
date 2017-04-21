`timescale 1ns / 1ps
module MEM(Address_In, Data_In, MEMControl_In, WBControl_In, Address_Out, Data_Out, WBControl_Out, Clk);
input [31:0] Address_In;
input [31:0] Data_In;
input [1:0] WBControl_In;
input Clk;
input [1:0] MEMControl_In; // Control signals for MEM stage ([1] MemRead, [0] MemWrite);
output [31:0] Address_Out;
output [31:0] Data_Out;
output [1:0] WBControl_Out;

reg [31:0] Address_Out;
reg [31:0] Data_Out;
reg [1:0] WBControl_Out;

wire [31:0] Data;
wire [6:0] Address;

assign Address=Address_In[6:0];

DataMemory myDataMemory(Address, Data_In, MEMControl_In[1], MEMControl_In[0], Clk, Data);

always@(negedge Clk) begin
	 Address_Out=Address_In;
	 Data_Out=Data;
	 WBControl_Out=WBControl_In;
end

endmodule
