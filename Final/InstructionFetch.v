module InstructionFetch(
  input clk,
  input Zero,
  input Branch,
  input BranchNe,
  input IFFlush,
  input Stall,
  input [31:0] SignExtended_PC,
  output reg [31:0] IFID_Instruction,
  output reg [31:0] IFID_PCPlus4,
  output reg Prop_IFFlush
);

  reg [31:0] PC, PCPlus4, PCNext, Prop_Instruction;
  wire [31:0] Instruction;
  // Start the PC at 0
  initial begin
    PC <= 0;
  end

  InstructionMemory IF_Mem(PC, Instruction);

  always @(*) begin
    // Add to PC
    PCPlus4 <= PC + 4;

    // Decide what PC and Instruction to use
    if (IFFlush == 1 && (Zero == 0 && Branch == 1) || (Zero != 0 && BranchNe == 1)) begin
      PCNext <= SignExtended_PC;
      Prop_Instruction <= 0;
    end
    else begin
      PCNext <= PCPlus4;
      Prop_Instruction <= Instruction;
    end
  end

  always @(negedge clk) begin
    if (Stall == 1) begin end
    else begin
      PC <= PCNext;
      IFID_Instruction <= Prop_Instruction;
      IFID_PCPlus4 <= PCPlus4;
      if (IFFlush == 1 && (Zero == 0 && Branch == 1) || (Zero != 0 && BranchNe == 1))
        Prop_IFFlush <= 1;
      else
        Prop_IFFlush <= 0;
    end
  end

endmodule
