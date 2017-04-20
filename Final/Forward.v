module Forward(
  input [4:0] MEMWB_Rd,
  input [4:0] EXMEM_Rd,
  input [4:0] IDEX_Rs,
  input [4:0] IDEX_Rt,
  input MB_Write,
  input EM_Write,
  output reg [1:0] A,
  output reg [1:0] B
);
  always @(*) begin
    if ((MB_Write == 1'b 1) && (MEMWB_Rd != 5'b 00000) && (EXMEM_Rd !=IDEX_Rs) &&(MEMWB_Rd == IDEX_Rs ))
      A <= 2'b 01;
    else begin
      if ((EM_Write == 1'b 1) && (EXMEM_Rd != 5'b 00000) && (EXMEM_Rd == IDEX_Rs))
        A <= 2'b 10;
      else
        A <= 2'b 00;
    end

    if ((MB_Write == 1'b 1) && (MEMWB_Rd != 5'b 00000) && (EXMEM_Rd != IDEX_Rt) && (MEMWB_Rd == IDEX_Rt))
      B <= 2'b 01;
    else begin
      if ((EM_Write == 1'b 1) && (EXMEM_Rd != 5'b 00000) && (EXMEM_Rd == IDEX_Rt))
        B <= 2'b10;
      else
        B <= 2'b 00;
    end
  end
endmodule
