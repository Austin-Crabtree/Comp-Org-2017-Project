`timescale 1ns / 1ps
module WB(Address_In, Data_In, WBControl_In, Data_Out, RegWrite_Out, Clk);
input Clk;
input [31:0] Address_In;
input [1:0] WBControl_In; 
input [31:0] Data_In;
								  
output [31:0] Data_Out;
output RegWrite_Out;
reg [31:0] Data_Out;
wire RegWrite;
reg RegWrite_Out;

always @(WBControl_In) begin
	if(WBControl_In[1]==1) begin
		 Data_Out=Data_In;
	end
	else if(WBControl_In[1]==0) begin
		 Data_Out=Address_In;
	end
end
assign RegWrite=WBControl_In[0];
always @(negedge Clk) begin
	 RegWrite_Out=RegWrite;
end

endmodule
