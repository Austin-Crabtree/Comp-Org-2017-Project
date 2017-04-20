module Execute(
  input clk,
  input [31:0] Data1,
  input [31:0] Data2,
  input [31:0] SignExtended,
  input ALUSrc,
  input [2:0] ALUControl,
  input RegDst,
  input MemToReg,
  input MemRead,
  input RegWrite,
  input MemWrite,

  output reg Prop_Zero,
  output reg Prop_MemToReg,
  output reg [31:0] Prop_ALUResult,
  output reg [4:0] Prop_WriteAddr,

  output reg [31:0] Prop_Data1,
  output reg [31:0] Prop_Data2,

  output reg Prop_MemRead,
  output reg Prop_RegWrite,
  output reg Prop_MemWrite
);

  wire zero;
  reg [31:0] A, B, B_;
  wire [31:0] Result;

  // Forwarding Unit
  reg [1:0] ForwardA, ForwardB;

  Forward FU(
    MEMWB_Rd,
    EXMEM_Rd,
    IDEX_Rs,
    IDEX_Rt,
    MEMWB_RegWrite,
    EXMEM_RegWrite,
    ForwardA,
    ForwardB
  );

  // ALU
  wire set, overflow;
  thirtytwoBitALU ALU(A, B_, ALUControl, Result, set, zero, overflow);

  // Multiplexers
  always @(*) begin
    ForwardA <= 0; ForwardB <= 0;
    case(ForwardA)
      2'b 00 : A <= Data1;
      2'b 01 : A <= MEMWB_Data;
      2'b 10 : A <= EXE_ALUResult;
      2'b 11 : A <= 0;
    endcase

    case(ForwardB)
      2'b 00 : B <= Data1;
      2'b 01 : B <= MEMWB_Data;
      2'b 10 : B <= EXE_ALUResult;
      2'b 11 : B <= 0;
    endcase
    A <= Data1; B <= Data2;

    B_ <= ALUSrc ? B : SignExtended;

  end

  always @(negedge clk) begin
    Prop_Zero <= zero;
    Prop_ALUResult <= Result;
    Prop_MemToReg <= MemToReg;
    Prop_Data2 <= Data2;
    Prop_MemRead <= MemRead;
    Prop_RegWrite <= RegWrite;
    Prop_MemWrite <= MemWrite;
  end

endmodule
