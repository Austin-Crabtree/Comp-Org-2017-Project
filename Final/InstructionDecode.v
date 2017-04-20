module InstructionDecoder(
  input Clk,
  input [31:0] Instruction,
  input [31:0] PC_plus_4,
  output ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite,
  output [2:0] ALUControl,
  output reg [31:0] branch_addr,
  output [31:0] ReadData1, ReadData2
);
  //**UPDATE BRANCH_ADDR if REQ'd
  wire [31:0] branch_cmp;
  wire [4:0] Register_Rs, Register_Rt, Register_Rd;

  Control ID_Control(Instruction[31:26], Instruction[5:0], ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl);

  // calculate and load branch addr for jump case
  SignExtension ID_BranchExt(Instruction[15:0], branch_cmp);

  always @(*) begin
    branch_addr <= (branch_cmp << 2) + PC_plus_4;
  end

  // load values from registers -- don't write
  assign Register_Rs = Instruction[25:21];
  assign Register_Rt = Instruction[20:16];
  assign Register_Rd = Instruction[15:11];                  //branch_cmp rand input -- NC
  RegisterFile registers(Register_Rs, Register_Rt, Register_Rd, branch_cmp, 0, Clk, ReadData1, ReadData2);

endmodule
