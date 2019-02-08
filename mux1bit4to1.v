`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2019 01:28:22 PM
// Design Name: 
// Module Name: mux1bit4to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux1bit4to1(a, b, c, d, op1, op2, result);
input a, b, c, d;
input op1, op2;
output result;
wire wire1, wire2;
mux1bit2to1 mux1(a, b, op1, wire1);
mux1bit2to1 mux2(c, d, op1, wire2);
mux1bit2to1 mux3(wire1, wire2, op2, result);
endmodule
