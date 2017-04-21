`timescale 1ns / 1ps
module MEM_tb();
wire [31:0] Out_Address_t;
wire [31:0] Out_Data_t;
wire [1:0] Out_WBControl_t;
reg [31:0] In_Address_t;
reg [31:0] In_Data_t;
reg [1:0] In_MEMControl_t;
reg [1:0] In_WBControl_t;
reg Clk_t;


MEM myMEM(In_Address_t, In_Data_t, In_MEMControl_t, In_WBControl_t, Out_Address_t, Out_Data_t, Out_WBControl_t, Clk_t);

initial begin
In_MEMControl_t<=2'b10;
In_WBControl_t<=2'b00;
In_Address_t<=32'd2;
In_Data_t<=32'd8;
Clk_t<=1'b0;
#1 $display("In_Address=%b, In_Data=%b, In_MEMControl=%b, In_WBControl=%b, Out_Address=%b, Out_Data=%b, Out_WBControl=%b, Clk=%b", In_Address_t, In_Data_t, In_MEMControl_t, In_WBControl_t, Out_Address_t, Out_Data_t, Out_WBControl_t, Clk_t);

In_Data_t<=32'd8;
In_MEMControl_t<=2'b01;
In_WBControl_t<=2'b00;
In_Address_t<=32'd8;
Clk_t<=1'b0;
#1 $display("In_Address=%b, In_Data=%b, In_MEMControl=%b, In_WBControl=%b, Out_Address=%b, Out_Data=%b, Out_WBControl=%b, Clk=%b", In_Address_t, In_Data_t, In_MEMControl_t, In_WBControl_t, Out_Address_t, Out_Data_t, Out_WBControl_t, Clk_t);
end

endmodule
