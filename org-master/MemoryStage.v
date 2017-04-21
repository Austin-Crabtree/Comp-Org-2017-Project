`timescale 1ns / 1ps
module MemoryStage(Clk, ReadMemory_TF, WriteMemory_TF, Write_Data, Mem_Addr, From_Mem);
    input [31:0] Write_Data;
    input [4:0] Mem_Addr;
    input Clk;
    input ReadMemory_TF;
    input WriteMemory_TF;
    output [31:0] From_Mem;
    
    DataMemory Memory(Clk, Mem_Addr, Write_Data, ReadMemory_TF, Write_Memory_TF, From_Mem);
    
endmodule
