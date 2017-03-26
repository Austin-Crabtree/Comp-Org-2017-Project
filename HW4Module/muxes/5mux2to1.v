module Mux5Bit2To1(a, b, op, result);
  input [4:0] a, b;
  input op;
  output [4:0] result;
  reg [4:0] tmp;

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
