module ID_tb();
  //input
  reg [31:0] In_PC;
  reg [31:0] In_IR;
  reg [4:0] In_Rd;
  reg [31:0] In_WriteData;
  reg In_RegWrite;
  reg Clk;
  //output
  wire OutPCSrc;
  wire [31:0] OutDataA;
  wire [31:0] OutDataB;
  wire [31:0] OutSE;
  wire [2:0] OutFunct;
  wire [31:0] OutBranchPC;
  wire [4:0] OutRt;
  wire [4:0] OutRd;
  wire [4:0] OutRs;
  wire [3:0] OutEXControl;
  wire [1:0] OutMEMControl;
  wire [1:0] OutWBControl;

  initial begin
    $dumpfile("wave");
    $dumpvars(0, test);

    $display("time\tIn_PC\tIn_IR\tIn_Rd\tIn_WriteData\tIn_RegWrite\tClk\tOutBranchPC\tOutJumpPC\tOutPCSrc\tOutJump\tOutDataA\tOutDataB\tOutSE\tOutFunct\tOutRs\tOutRt\tOutRd\tOutEXControl\tOutMEMControl\tOutWBControl");
    $monitor("%g\t%b\t%b\t%b\t%d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
    $time, In_PC, In_IR, In_Rd, In_WriteData, In_RegWrite, Clk, OutBranchPC, OutJumpPC, OutPCSrc, OutJump, OutDataA, OutDataB, OutSE, OutFunct, OutRs, OutRt, OutRd, OutEXControl, OutMEMControl, OutWBControl);

    Clk = 1;

    ///////////////////
    //TEST 1
    // Initialize regs
    In_PC = 32'h 00000000;
    In_IR = 32'b 00000000010010000100100000100000;
    In_Rd = 5'b 01001;
    In_WriteData = 32'd 15;
    In_RegWrite = 1'b 0;

    // Wait 20 s for global reset to finish
    #20;

    #20 $finish;
  end

  always begin
    #10 Clk = ~Clk;
  end

  ID test(In_PC, In_IR, In_Rd, In_WriteData, In_RegWrite, Clk, OutBranchPC, OutJumpPC, OutPCSrc, OutJump, OutDataA, OutDataB, OutSE, OutFunct, OutRs, OutRt, OutRd, OutEXControl, OutMEMControl, OutWBControl);

endmodule
