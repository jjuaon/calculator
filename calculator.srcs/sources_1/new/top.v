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
    wire enCalc, enSci, enLogi, enUnit, enAge;
    wire dpFlag;
    wire [6:0] seg_main, seg_disp;
    wire [3:0] an_main, an_disp;
    wire dp_main, dp_disp;

    assign dp_main = 1;

    SegRefreshRate gen_rr(clk, rr);

    main main_inst (
        .clk(clk),
        .rr(rr),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .seg(seg_main),
        .an(an_main),
        .enCalc(enCalc),
        .enSci(enSci),
        .enLogi(enLogi),
        .enUnit(enUnit),
        .enAge(enAge)
    );

    AgeCalculator age_calc_inst (
        .enAge(enAge),
        .clk(clk),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .btnU(btnU),
        .btnD(btnD),
        .bDot(bDot),
        .aDot(aDot),
        .dpFlag(dpFlag)
    );

    displayDec display_dec_inst (
        .dpFlag(dpFlag),
        .clk(clk),
        .rr(rr),
        .btnL(btnL),
        .btnR(btnR),
        .bDot(bDot),
        .aDot(aDot),
        .seg(seg_disp),
        .an(an_disp),
        .led(led),
        .dp(dp_disp)
    );

    assign seg = dpFlag ? seg_disp : seg_main;
    assign an = dpFlag ? an_disp : an_main;
    assign dp = dpFlag ? dp_disp : dp_main;

    // Debug LED output
//    assign led = dpFlag ? led : {8'b0, aDot};

endmodule
