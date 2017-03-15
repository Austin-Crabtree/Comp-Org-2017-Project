module CLA_tb();

  // Inputs
  reg g0, p0, g1, p1, g2, p2, g3, p3;
  reg cin;

  // Outputs
  wire C1, C2, C3, C4;
  wire G, P;

  initial begin
    //This is needed for iverilog and gtkwave
    $dumpfile("wave");
    $dumpvars(0, test);
    //--------------------------------------
    $display("time\t cin C1 C2 C3 C4 g0 g1 g2 g3 p0 p1 p2 p3 G  P");
    $monitor("%g\t    %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",
    $time, cin, C1, C2, C3, C4, g0, g1, g2, g3, p0, p1, p2, p3, G, P);

    // Instantiate the Unit Under Test (UUT)
    CLA uut (
      .g0(g0),
      .p0(p0),
      .g1(g1),
      .p1(p1),
      .g2(g2),
      .p2(p2),
      .g3(g3),
      .p3(p3),
      .cin(cin),
      .C1(C1),
      .C2(C2),
      .C3(C3),
      .C4(C4),
      .G(G),
      .P(P)
    );

    ///////////////////
    //TEST 1
    // Initialize Inputs
    g0 = 1;
    g1 = 0;
    g2 = 1;
    g3 = 1;

    p0 = 0;
    p1 = 1;
    p2 = 0;
    p3 = 1;

    cin = 0;

    // Wait 100 ns for global reset to finish
    #100;

    ///////////////////
    //TEST 2
    // Initialize Inputs
    g0 = 1;
    g1 = 0;
    g2 = 1;
    g3 = 1;

    p0 = 0;
    p1 = 1;
    p2 = 0;
    p3 = 1;

    cin = 0;

    // Wait 100 ns for global reset to finish
    #100;
  end

  CLA test(g0, p0, g1, p1, g2, p2, g3, p3, cin, C1, C2, C3, C4, G, P);
endmodule
