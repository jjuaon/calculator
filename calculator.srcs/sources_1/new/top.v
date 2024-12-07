`timescale 1ns / 1ps

module top(
    input clk,              
    input btnL,            
    input btnR,            
    input btnC,
    input btnU,          
    input btnD,          
    output [6:0] seg,
    output [3:0] an,
    output dp,
    output [15:0] led
);

    wire rr;
    wire [2:0] mode;
    wire [28:0] bDot;
    wire [7:0] aDot;    
    wire enCalc,enSci,enLogi,enUnit,enAge;
    
    SegRefreshRate gen_rr(clk, rr);
    
    assign bDot = {1'b1,28'd98778943};
    assign aDot = 8'd25;
    main(clk,rr,btnL,btnR,btnC,seg,an,enCalc,enSci,enLogi,enUnit,enAge);
 
    assign led = {11'b0,enCalc, enSci,enLogi,enUnit,enAge};
    

endmodule