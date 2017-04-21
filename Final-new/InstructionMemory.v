module InstructionMemory(
	//input
	input Clk,
	input [31:0] PC,
	//output
	output [31:0] Instr
);

	reg [31:0] ins[0:31];
	reg [31:0] Instr;

	initial begin
		ins[0]=32'b 00000000010010000100100000100000;
		ins[1]=32'b 00000001001000101000000000100010;
		ins[2]=32'b 00000000010010000100100000100000;
		ins[3]=32'b 00000001001000101000000000100010;
		ins[4]=32'b 00000000010010000100100000100000;
		ins[5]=32'b 00000001001000101000000000100010;
	end
	always@(negedge Clk) begin
		 Instr=ins[PC];
	end
endmodule
