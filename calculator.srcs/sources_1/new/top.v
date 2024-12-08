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
    wire [2:0] mode;
    wire [28:0] bDot;
    wire [7:0] aDot;    
    wire enCalc, enSci, enLogi, enUnit, enAge;
    wire dpFlag;
    wire [6:0] seg_main, seg_disp, seg_logi, seg_age, seg_sci;
    wire [3:0] an_main, an_disp, an_logi, an_age, an_sci;
    wire dp_main, dp_disp, dp_age;  // Added dp_age
    wire [3:0] logic_out;
    wire return_to_main_logi, return_to_main_age, return_to_main_sci;
    wire rr;
    
    // Button routing wires
    wire btnL_main, btnR_main, btnC_main;
    wire btnL_age, btnR_age, btnC_age, btnU_age, btnD_age;
    wire btnL_logi, btnR_logi, btnC_logi, btnU_logi, btnD_logi;
    wire btnL_sci, btnR_sci, btnC_sci, btnU_sci, btnD_sci;
    
    // State tracking registers
    reg btnC_prev = 0;
    reg enLogi_prev = 0;
    reg enAge_prev = 0;
    reg enSci_prev = 0;
    reg mode_just_entered = 0;
    reg return_signal_delay = 0;
    
    assign dp_main = 1;
    
    // Edge detection and state tracking
    always @(posedge clk) begin
        btnC_prev <= btnC;
        enLogi_prev <= enLogi;
        enAge_prev <= enAge;
        enSci_prev <= enSci;
        
        // Track mode entry and return signal
        if (!enLogi && !enAge && !enSci) begin
            mode_just_entered <= 0;
            return_signal_delay <= 0;
        end
        else if ((enLogi && !enLogi_prev) || (enAge && !enAge_prev) || (enSci && !enSci_prev)) begin
            mode_just_entered <= 1;
        end
        else if (!btnC) begin
            mode_just_entered <= 0;
        end
        
        // Handle return signals with delay
        if (return_to_main_logi || return_to_main_age || return_to_main_sci) begin
            return_signal_delay <= 1;
        end
    end
    
    // Button routing logic
    // Main module buttons
    assign btnL_main = (enCalc || enSci || enLogi || enUnit || enAge) ? 1'b0 : btnL;
    assign btnR_main = (enCalc || enSci || enLogi || enUnit || enAge) ? 1'b0 : btnR;
    assign btnC_main = (enCalc || enSci || enLogi || enUnit || enAge) ? 1'b0 : btnC;
    
    // Logic Calculator button routing
    assign btnL_logi = enLogi ? btnL : 1'b0;
    assign btnR_logi = enLogi ? btnR : 1'b0;
    assign btnC_logi = (enLogi && !mode_just_entered) ? btnC : 1'b0;
    assign btnU_logi = enLogi ? btnU : 1'b0;
    assign btnD_logi = enLogi ? btnD : 1'b0;
    
    // Age Calculator button routing
    assign btnL_age = enAge ? btnL : 1'b0;
    assign btnR_age = enAge ? btnR : 1'b0;
    assign btnC_age = (enAge && !mode_just_entered) ? btnC : 1'b0;
    assign btnU_age = enAge ? btnU : 1'b0;
    assign btnD_age = enAge ? btnD : 1'b0;

    // Scientific Calculator button routing
    assign btnL_sci = enSci ? btnL : 1'b0;
    assign btnR_sci = enSci ? btnR : 1'b0;
    assign btnC_sci = (enSci && !mode_just_entered) ? btnC : 1'b0;
    assign btnU_sci = enSci ? btnU : 1'b0;
    assign btnD_sci = enSci ? btnD : 1'b0;
    
    // Module instantiations
    SegRefreshRate gen_rr(
        .clk(clk),
        .clk_out(rr)
    );
    
    main main_inst (
        .clk(clk),
        .rr(rr),
        .btnL(btnL_main),
        .btnR(btnR_main),
        .btnC(btnC_main || return_signal_delay),
        .seg(seg_main),
        .an(an_main),
        .enCalc(enCalc),
        .enSci(enSci),
        .enLogi(enLogi),
        .enUnit(enUnit),
        .enAge(enAge)
    );
    
    Logi logic_calc_inst (
        .enLogi(enLogi && !return_signal_delay),
        .rr(rr),
        .clk(clk),
        .btnU(btnU_logi),
        .btnD(btnD_logi),
        .btnL(btnL_logi),
        .btnR(btnR_logi),
        .btnC(btnC_logi),
        .seg(seg_logi),
        .an(an_logi),
        .Out(logic_out),
        .return_to_main(return_to_main_logi)
    );
    
    AgeCalculator age_calc_inst (
        .enAge(enAge && !return_signal_delay),
        .clk(clk),
        .rr(rr),
        .btnU(btnU_age),
        .btnD(btnD_age),
        .btnL(btnL_age),
        .btnR(btnR_age),
        .btnC(btnC_age),
        .seg(seg_age),
        .an(an_age),
        .bDot(bDot),
        .aDot(aDot),
        .return_to_main(return_to_main_age),
        .dp(dp_age),  // Connect to local dp_age wire
        .led(led)
    );
    
    // Output multiplexing
    assign seg = (enLogi && !return_signal_delay) ? seg_logi : 
                (enAge && !return_signal_delay) ? seg_age :
                (enSci && !return_signal_delay) ? seg_sci :
                (dpFlag) ? seg_disp : seg_main;
                
    assign an = (enLogi && !return_signal_delay) ? an_logi : 
                (enAge && !return_signal_delay) ? an_age :
                (enSci && !return_signal_delay) ? an_sci :
                (dpFlag) ? an_disp : an_main;
               
    assign dp = (enLogi && !return_signal_delay) ? 1'b1 : 
                (enAge && !return_signal_delay) ? dp_age :  // Use dp_age instead of 1'b1
                (enSci && !return_signal_delay) ? 1'b1 :
                (dpFlag) ? dp_disp : dp_main;
    
endmodule