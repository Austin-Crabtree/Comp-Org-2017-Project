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
		ins[0]=32'b 10101100000000000000000000000001; // sw 1, 0($1)
		ins[1]=32'b 10001100010000000000000000000001; // lw $2, 0($1)
		ins[2]=32'b 00000000001000010000000000100101; // add $2, $2, $3
		ins[3]=32'b 00010000000001000000100000100000; // beq $2, $2, end
	end
	always@(negedge Clk) begin
		 Instr=ins[PC];
	end
endmodule
