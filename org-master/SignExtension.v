`timescale 1ns / 1ps
module SignExtension(a, result);
input [15:0] a; 			// 16-bit input
output [31:0] result;   // 32-bit output
reg [31:0] result;

always@(a) 
  begin
  if(a[15]==1'b1) 
    begin
    result={16'b1111111111111111,a};
    end
  else
      begin
      result={16'b0000000000000000,a};
      end
  end

endmodule
