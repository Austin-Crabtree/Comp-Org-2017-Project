`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:42 11/02/2016 
// Design Name: 
// Module Name:    OverFlowDection 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module OverflowDetection(a,b,overflow);
input a,b;
output overflow;



assign overflow=a^b;


endmodule