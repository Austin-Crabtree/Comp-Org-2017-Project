module MEMb();
  //input
  reg [31:0] Address;
  reg [31:0] Data;
  reg [1:0] WBControl;
  reg Clk;
  reg [1:0] MEMControl;
  //output
  wire [31:0] AddressOut;
  wire [31:0] DataOut;
  wire [1:0] WBControlOut;

  initial begin
    $dumpfile("wave");
    $dumpvars(0, test);

    $display("time\tAddress\tData\tWBControl\tClk\tMEMControl\tAddressOut\tDataOut\tWBControlOut");
    $monitor("%g\t%b\t%b\t%b\t%d\t%b\t%b\t%b\t%b",
    $time, Address, Data, WBControl, Clk, MEMControl, AddressOut, DataOut, WBControlOut);

    Clk = 1;

    ///////////////////
    //TEST 2
    // Initialize regs
    MEMControl = 2'b10;
    WBControl = 2'b00;
    Address = 32'd2;
    Data = 32'd8;

    // Wait 20 s for global reset to finish
    #20;

    ///////////////////
    //TEST 2
    // Initialize regs
    Data = 32'd8;
    MEMControl = 2'b01;
    WBControl = 2'b00;
    Address = 32'd8;

    // Wait 20 s for global reset to finish
    #20;

    #20 $finish;
  end

  always begin
    #10 Clk = ~Clk;
  end

  MEM test(Address, Data, WBControl, Clk, MEMControl, AddressOut, DataOut, WBControlOut);

endmodule
