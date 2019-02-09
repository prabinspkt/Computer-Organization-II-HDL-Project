`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2019 10:24:59 AM
// Design Name: 
// Module Name: ALU1Bit
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
module adder(a, b, cin, total, cout);
input a, b, cin;
output total, cout;

assign total = a^b^cin;    //sum
assign cout = (a & cin)|(a & b)|(b & cin);   //carryout

endmodule


module ALU1Bit(a, b, cin, less, op, result, cout, set, zero, g, p);
input a, b, cin, less;
input [0:2] op;
output result, cout, set, zero, g, p;

wire wire1, sumWire;

mux1bit2to1 mux1(b, ~b, op[2], wire1);
assign g = wire1 & a;
assign p = wire1 | a;
adder addermodule(a, wire1, cin, sumWire, cout);  
mux1bit4to1 mux2(g, p, sumWire, less, op[0], op[1], result);
assign zero = ~result;	//if result is 0, then zero will be 1 or vice-versa.

endmodule
