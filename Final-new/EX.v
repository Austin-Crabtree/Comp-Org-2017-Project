module EX(
  //input
  input [3:0] EXControlIn,
  input [1:0] MEMControlIn,
  input [1:0] WBControlIn,
  input [2:0] FunctIn,
  input Clk,
  input [31:0] DataAIn,
  input [31:0] DataBIn,
  input [31:0] SEIn,
  input [4:0] RtIn,
  input [4:0] RdIn,
  //output
  output [31:0] ResultOut,
  output [31:0] DataOut,
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

    always @(EXControlIn) begin
        if (EXControlIn[0] == 0) begin
                 RdOut = RtIn;
            end
            else if (EXControlIn[0] == 1) begin
                 RdOut = RdIn;
            end
        if (EXControlIn[3] == 0) begin
             DataB = DataBIn;
        end
        else if (EXControlIn[3] == 1) begin
             DataB = SEIn;
        end
    end
    always@(negedge Clk) begin
        ResultOut = result;
         DataOut = DataBIn;
         MEMControlOut = MEMControlIn;
         WBControlOut = WBControlIn;
    end
    thirtytwoBitALU ALU(InDataA, DataB, InFunct, result, set, zero, overflow);
endmodule
