module Mux32Bit2To1(a, b, op, result);
  input [31:0] a, b;
  input op;
  output [31:0] result;
  reg [31:0] tmp;

  always@(op)
    begin
      if (op) begin
        assign tmp = b;
      end
      else begin
        assign tmp = a;
      end
    end
    assign result = tmp;
endmodule
