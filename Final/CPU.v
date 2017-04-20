module cpu(input clock);

  reg Zero, Branch, BranchNe, IFFlush, Stall;
  reg [31:0] SignExtended_PC;
  wire [31:0] Instruction, PCPlus4;
  wire [2:0] ALUControl;
  wire [31:0] branch_addr;
  wire [31:0] ReadData1, ReadData2;
  wire [31:0] Prop_ALUResult, Prop_Data1, Prop_Data2;
  wire [4:0] Prop_WriteAddr;

  InstructionFetch IF(clk, Zero, Branch, BranchNe, IFFlush, Stall, SignExtended_PC, Instruction, PCPlus4, Flush_prop);
  InstructionDecoder ID(clk, Instruction, PCPlus4, ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl, branch_addr, ReadData1, ReadData2);
  Execute EX(clk, ReadData1, ReadData2, SignExtended_PC, ALUSrc, ALUControl, RegDst, MemToReg, MemRead, RegWrite, MemWrite, Prop_Zero, Prop_MemToReg, Prop_ALUResult, Prop_WriteAddr, Prop_Data1, Prop_Data2, Prop_MemRead, Prop_RegWrite, Prop_MemWrite );


endmodule
