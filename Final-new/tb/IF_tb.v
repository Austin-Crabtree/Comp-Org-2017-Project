`timescale 1ns / 1ps
module IF_tb();
reg [31:0] In_PC_t;
reg Clk_t;
wire [31:0] Out_PC_t;
wire [31:0] Out_Instr_t;

IF myIF(In_PC_t,Clk_t,Out_PC_t,Out_Instr_t);

initial begin
In_PC_t<=32'd 1; Clk_t<=1'b0;
#1 $display("In_PC = %b, Clk = %d, Out_PC = %b, Out_Instr = %b", In_PC_t, Clk_t, Out_PC_t, Out_Instr_t);
end

endmodule
