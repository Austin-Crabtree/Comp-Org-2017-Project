module InstructionMemory(
  input [31:0] instruction_address,
  output reg [31:0] instruction
);

  reg [31:0] instruction_memory_file[31:0];

  initial
  begin
    // Put program in here...
    instruction_memory_file[0] <= 32'b 00000001001000110100110000100000;
    instruction_memory_file[4] <= 32'b 00000001001000110100110000100000;
    instruction_memory_file[8] <= 32'b 00000001001000110100110000100000;
    instruction_memory_file[12] <= 32'b 00000001001000110100110000100000;
    instruction_memory_file[16] <= 32'b 00000001001000110100110000100000;
    instruction_memory_file[17] <= 32'b 00000001001000110100110000100000;
  end

  always @(*) begin
    instruction <= instruction_memory_file[instruction_address];
    /*$display("from inst_mem: %b", instruction);*/
  end

endmodule
