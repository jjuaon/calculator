`timescale 1ns / 1ps

module test_display(
    input clk, btnL, btnR, btnC,             
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output dp
);

    reg [31:0] btnC_counter = 0;
    reg btnC_state = 0; 
    reg reset_flag = 0;
    reg en = 1; // Enable signal for display modules
    reg [15:0] mode_data = 16'd0; // Data to be displayed based on the mode

    wire [28:0] bDot;
    wire [7:0] aDot;
    SegRefreshRate gen_rr(clk,rr);

    always @(posedge clk) begin
        if (btnC) begin
            if (btnC_state == 0) begin
                btnC_state <= 1; // btnC is now pressed
                btnC_counter <= 0; // Reset counter on new press
            end else begin
                btnC_counter <= btnC_counter + 1; // Increment counter while pressed
            end
        end else begin
            btnC_state <= 0; // btnC is released
            btnC_counter <= 0; // Reset counter on release
        end

        if (btnC_state == 1 && btnC_counter >= 120000000) begin // Adjust for your clock frequency
            reset_flag <= 1;
        end else begin
            reset_flag <= 0;
        end
    end

    // Binary values for the display
    assign bDot = {1'b1, 28'd98778943};
    assign aDot = 8'd25;

    // Instantiate the displayDec module
    displayDec(
        .en(en), 
        .clk(clk), 
        .rr(rr), 
        .btnL(btnL), 
        .btnR(btnR), 
        .bDot(bDot), 
        .aDot(aDot), 
        .seg(seg), 
        .an(an), 
        .led(led), 
        .dp(dp)
    );

endmodule