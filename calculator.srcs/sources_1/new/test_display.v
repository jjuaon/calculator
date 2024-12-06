`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 09:40:25 PM
// Design Name: 
// Module Name: test_display
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


module test_display(
    input clk, btnL, btnR,                
    output [6:0] seg, [3:0] an, [15:0] led,
    output dp
);
    wire [28:0] bDot;
    wire [7:0] aDot;
    assign bDot = {1'b1,28'd98778943};
    assign aDot = 8'd25;
//    displayBin(clk, btnL, btnR, bDot, aDot, flag, seg, an, led);
    displayDec(clk, btnL, btnR, bDot, aDot, seg, an, led, dp);
endmodule