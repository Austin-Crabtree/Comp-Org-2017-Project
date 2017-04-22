module IF_tb();
  //input
  reg [31:0] PC;
  reg Clk;
  //output
  wire [31:0] OutPC;
  wire [31:0] Instr;

  initial begin
    $dumpfile("wave");
    $dumpvars(0, test);

    $display("time\tPC\tClk\tOutPC\tInstr");
    $monitor("%g\t%b\t%b\t%b\t%d",
    $time, PC, Clk, OutPC, Instr);

    Clk = 1;

    ///////////////////
    //TEST 1
    // Initialize regs
    PC = 32'd 1;

    // Wait 20 s for global reset to finish
    #20;

    #20 $finish;
  end

  always begin
    #10 Clk = ~Clk;
  end

  IF test(PC, Clk, OutPC, Instr);

endmodule
