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
    wire [6:0] seg_main, seg_disp, seg_logi;
    wire [3:0] an_main, an_disp, an_logi;
    wire dp_main, dp_disp;
    wire [3:0] logic_out;
    wire return_to_main;
    wire rr;
    
    // Button routing wires
    wire btnL_main, btnR_main, btnC_main;
    wire btnL_age, btnR_age, btnC_age, btnU_age, btnD_age;
    wire btnL_logi, btnR_logi, btnC_logi, btnU_logi, btnD_logi;
    
    // State tracking registers
    reg btnC_prev = 0;
    reg enLogi_prev = 0;
    reg mode_just_entered = 0;  // Flag to track mode entry
    reg return_signal_delay = 0;  // Add delay for return signal
    
    assign dp_main = 1;
    
    // Edge detection and state tracking
    always @(posedge clk) begin
        btnC_prev <= btnC;
        enLogi_prev <= enLogi;
        
        // Track mode entry and return signal
        if (!enLogi) begin
            mode_just_entered <= 0;
            return_signal_delay <= 0;
        end
        else if (enLogi && !enLogi_prev) begin
            mode_just_entered <= 1;  // Set flag when entering mode
        end
        else if (!btnC) begin
            mode_just_entered <= 0;  // Clear flag when btnC is released
        end
        
        // Handle the return signal with a delay
        if (return_to_main) begin
            return_signal_delay <= 1;
        end
    end
    
    // Button routing logic
    // Main module buttons
    assign btnL_main = (enCalc || enSci || enLogi || enUnit || enAge) ? 1'b0 : btnL;
    assign btnR_main = (enCalc || enSci || enLogi || enUnit || enAge) ? 1'b0 : btnR;
    assign btnC_main = (enCalc || enSci || enLogi || enUnit || enAge) ? 1'b0 : btnC;
    
    // Logic Calculator button routing - block btnC during mode entry
    assign btnL_logi = enLogi ? btnL : 1'b0;
    assign btnR_logi = enLogi ? btnR : 1'b0;
    assign btnC_logi = (enLogi && !mode_just_entered) ? btnC : 1'b0;
    assign btnU_logi = enLogi ? btnU : 1'b0;
    assign btnD_logi = enLogi ? btnD : 1'b0;
    
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
        .btnC(btnC_main || return_signal_delay),  // Use delayed return signal
        .seg(seg_main),
        .an(an_main),
        .enCalc(enCalc),
        .enSci(enSci),
        .enLogi(enLogi),
        .enUnit(enUnit),
        .enAge(enAge)
    );
    
    Logi logic_calc_inst (
        .enLogi(enLogi && !return_signal_delay),  // Disable when returning
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
        .return_to_main(return_to_main)
    );
    
    // Output multiplexing
    assign seg = (enLogi && !return_signal_delay) ? seg_logi : 
                (dpFlag) ? seg_disp : seg_main;
                
    assign an = (enLogi && !return_signal_delay) ? an_logi : 
               (dpFlag) ? an_disp : an_main;
               
    assign dp = (enLogi && !return_signal_delay) ? 1'b1 : 
               (dpFlag) ? dp_disp : dp_main;
               
    // LED output
    assign led = 16'b0;
    
endmodule