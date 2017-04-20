module ControlOld(opcode, ALUSrc, ALUOp, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);
  input [5:0] opcode; // 6-bit operation code
  output reg ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite; // Output control lines
  output reg [1:0] ALUOp; // 2-bit intermediate output for controlling ALU


  //ALUOP:: 00 = lw, sw; 01 = beq; 10 = arithmetic; 11 = Jump
  always @(*) begin
    ALUSrc = 0;  RegDst = 0;  MemWrite = 0;   MemRead = 0;  Beq = 0;   Bne = 0;  Jump = 0;  MemToReg = 0;  RegWrite = 0;
    case(opcode)
      6'b 000100: //beq
      	begin
      	  ALUOp = 2'b 01;
      	  Beq = 1;
      	end
      6'b 000101: begin//bne
      	  ALUOp = 2'b 01;
      	  Bne = 1;
      	end
      6'b 000010: begin//j
      	  ALUOp = 2'b 11;
      	  Jump = 1;
      	end
      6'b 100011: begin//lw
      	  ALUOp = 2'b 00;
      	  ALUSrc = 1;   MemToReg = 1;   RegWrite = 1;   MemRead = 1;
      	end
      6'b 101011: begin //sw
      	  ALUOp = 2'b 00;
      	  ALUSrc = 1;   MemWrite = 1;
      	end
      6'b 000000: //r-type
      	begin
      	  ALUOp = 2'b 10;
      	  RegDst = 1;   RegWrite = 1;
      	end
    endcase
  end
endmodule

module ALUOpToALUControl(ALUOp, Funct, ALUControl);
  input [1:0] ALUOp;
  input [5:0] Funct;
  output reg [2:0] ALUControl;
  //00 lw&&sw
  always @ (ALUOp, Funct) begin
  	case(ALUOp)
  		2'b 00: ALUControl = 3'b 010;
  		2'b 01: ALUControl = 3'b 110;
  		2'b 10: begin
  			case(Funct)
  				6'b 100000: ALUControl = 3'b 010;
  				6'b 100010: ALUControl = 3'b 110;
  				6'b 100100: ALUControl = 3'b 000;
  				6'b 100101: ALUControl = 3'b 001;
  				6'b 101010: ALUControl = 3'b 111;
  			endcase
  			end
  	endcase
	end
endmodule

module Control(opcode, funct, ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite, ALUControl);
  input [5:0] opcode; // 6-bit operation code
  input [5:0] funct;  // 6-bit function code from the instruction
  						  // least significant 6 bits of an instruction
  output ALUSrc, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite; // Output control lines
  output [2:0] ALUControl; // 3-bit control for the ALU that specifies the operation

  wire [1:0] ALUOp;

  ControlOld Cntrl(opcode, ALUSrc, ALUOp, RegDst, MemWrite, MemRead, Beq, Bne, Jump, MemToReg, RegWrite);
  ALUOpToALUControl ALUOp2Ctrl(ALUOp, funct, ALUControl);
endmodule
