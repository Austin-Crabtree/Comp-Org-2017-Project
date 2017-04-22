module WBb();
  //input
  reg Clk;
  reg [31:0] Address_In;
  reg [1:0] WBControl_In;
  reg [31:0] Data_In;
  //output
  wire [31:0] Data_Out;
  wire RegWrite_Out;

  initial begin
    $dumpfile("wave");
    $dumpvars(0, test);

    $display("time\tClk\tAddress_In\tWBControl_In\tIn_Data\tData_Out\tRegWrite_Out");
    $monitor("%g\t%b\t%b\t%b\t%d\t%b\t%b",
    $time, Clk, Address_In, WBControl_In, Data_In, Data_Out, RegWrite_Out);

    Clk = 1;

    ///////////////////
    //TEST 1
    // Initialize regs
    Address_In = 32'd1;
    Data_In = 32'd2;
    WBControl_In = 2'b11;

    // Wait 20 s for global reset to finish
    #20;

    #20 $finish;
  end

  WB test(Clk, Address_In, WBControl_In, Data_In, Data_Out, RegWrite_Out);

endmodule
