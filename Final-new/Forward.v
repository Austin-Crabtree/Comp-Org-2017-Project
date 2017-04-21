module Forward(
  //input
  input [4:0] RD_MemWb,
  input [4:0] RD_EXMem,
  input [4:0] RS_IDEX,
  input [4:0] Rt_IDEX,
  input Mb_Write,
  input EM_Write,
  //output
  output reg [1:0] a,
  output reg [1:0] b
);

    always @(*)
    begin
      if ((Mb_Write == 1'b 1) && (RD_MemWb != 5'b 00000) && (RD_EXMem !=RS_IDEX) &&(RD_MemWb == RS_IDEX ))
        a <= 2'b 01;
      else begin
        if ((EM_Write == 1'b 1) && (RD_EXMem != 5'b 00000) && (RD_EXMem == RS_IDEX))
          a <= 2'b 10;
        else
          a <= 2'b 00;
      end
      if ((Mb_Write == 1'b 1) && (RD_MemWb != 5'b 00000) && (RD_EXMem != Rt_IDEX) && (RD_MemWb == Rt_IDEX))
        b <= 2'b 01;
      else begin
        if ((EM_Write == 1'b 1) && (RD_EXMem != 5'b 00000) && (RD_EXMem == Rt_IDEX))
          b <= 2'b10;
        else
          b <= 2'b 00;
      end
    end
endmodule
