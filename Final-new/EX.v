module EX(
  //input
  input [3:0] EXControl,
  input [1:0] MEMControl,
  input [1:0] WBControl,
  input [2:0] Funct,
  input Clk,
  input [31:0] DataA,
  input [31:0] DataB,
  input [31:0] SE,
  input [4:0] Rt,
  input [4:0] Rd,
  //output
  output [31:0] DataOut,
  output [31:0] ResultOut,
  output [1:0] MEMControlOut,
  output [1:0] WBControlOut,
  output [4:0] RdOut
);

  reg [31:0] DataB;
  reg [31:0] DataOut;
  reg [31:0] ResultOut;
  reg [1:0] MEMControlOut;
  reg [1:0] WBControlOut;
  reg [4:0] RdOut;

  wire set, zero, overflow;
  wire [31:0] result;

  always @(EXControl) begin
      if (EXControl[0] == 0) begin
               RdOut = Rt;
          end
          else if (EXControl[0] == 1) begin
               RdOut = Rd;
          end
      if (EXControl[3] == 0) begin
           DataB = DataB;
      end
      else if (EXControl[3] == 1) begin
           DataB = SE;
      end
  end
  always@(negedge Clk) begin
       DataOut = DataB;
       ResultOut = result;
       MEMControlOut = MEMControl;
       WBControlOut = WBControl;
  end
  thirtytwoBitALU ALU(In_DataA, DataB, In_Funct, result, set, zero, overflow);
endmodule
