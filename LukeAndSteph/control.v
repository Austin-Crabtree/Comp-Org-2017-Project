module Control(Op,Out,j,bne,imm,andi,ori,addi); input [5:0] Op;
  output[8:0] Out;
  output j,bne,imm,andi,ori,addi;
  wire regdst,alusrc,memtoreg,regwrite,memread,memwrite,branch;
  //determines type of instruction
  wire r = ~Op[5]&~Op[4]&~Op[3]&~Op[2]&~Op[1]&~Op[0];
  wire lw = Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
  wire sw = Op[5]&~Op[4]&Op[3]&~Op[2]&Op[1]&Op[0];
  wire beq = ~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&~Op[0];
  wire bne = ~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&Op[0];
  wire j = ~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&~Op[0];
  wire andi = ~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&~Op[0];
  wire ori = ~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&Op[0];
  wire addi = ~Op[5]&~Op[4]&Op[3]&~Op[2]&~Op[1]&~Op[0];
  wire imm = andi|ori|addi; //immediate value type
  //seperate control arrays for reference wire [3:0] EXE;
  wire [2:0] M;
  wire [1:0] WB;
  // microcode control
  assign regdst = r;
  assign alusrc = lw|sw|imm;
  assign memtoreg = lw;
  assign regwrite = r|lw|imm;
  assign memread = lw;
  assign memwrite = sw;
  assign branch = beq;
  // EXE control
  assign EXE[3] = regdst;
  assign EXE[2] = alusrc;
  assign EXE[1] = r;
  assign EXE[0] = beq;
  //M control
  assign M[2] = branch;
  assign M[1] = memread;
  assign M[0] = memwrite;
  //WB control
  assign WB[1] = memtoreg; //not same as diagram assign WB[0] = regwrite;
  //output control
  assign Out[8:7] = WB;
  assign Out[6:4] = M;
  assign Out[3:0] = EXE;
endmodule
