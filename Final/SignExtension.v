module SignExtension(a, result);
  input [15:0] a;  // 16-bit input
  output reg [31:0] result; // 32-bit output
  reg [31:0] tmp;

  //assign result[31:16] = 16'b0;
  //assign result[15:0] = a;

  always@(a)
    begin
      result <= $signed(a);
    end
endmodule
