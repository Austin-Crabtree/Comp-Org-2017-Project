module IF(
  //input
  input [31:0] PC,
  input Clk,
  //output
  output [31:0] OutPC,
  output [31:0] Instr
);

  InstructionMemory IM(PC,Clk,Instr);
  assign OutPC = PC + 32'd 1;

endmodule
