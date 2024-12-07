module button_debounce(
    input clk,
    input btn_in,
    output reg btn_out
);
    // For 100MHz clock, we want about 20ms debounce time
    // 100MHz = 100,000,000 cycles per second
    // 20ms = 0.02 seconds
    // 100,000,000 * 0.02 = 2,000,000 cycles needed
    // We need 21 bits to represent 2,000,000 (2^21 = 2,097,152)
    reg [20:0] debounce_counter = 0;
    reg btn_prev = 0;
    
    always @(posedge clk) begin
        if (btn_in != btn_prev) begin
            debounce_counter <= 0;
            btn_prev <= btn_in;
        end
        else if (debounce_counter < 21'd2_000_000) begin  // 20ms at 100MHz
            debounce_counter <= debounce_counter + 1;
        end
        else begin
            btn_out <= btn_prev;
        end
    end
endmodule

`timescale 1ns / 1ps
module Logi(
    input rr,                 // External refresh rate input
    input clk,                // Clock input
    input btnU,               // Increment button
    input btnD,               // Decrement button
    input btnL,               // Move to the next digit
    input btnR,               // Move to the previous digit
    input btnC,               // Save or confirm input
    output reg [6:0] seg,     // 7-segment display outputs
    output reg [3:0] an,      // Enable signals for 4-digit display
    output reg [3:0] Out      // Result of the operation
);
    // State definitions
    localparam STATE_INPUT1 = 3'd0;
    localparam STATE_INPUT_OP = 3'd1;
    localparam STATE_INPUT2 = 3'd2;
    localparam STATE_COMPUTE = 3'd3;
    localparam STATE_SHOW_RESULT = 3'd4;

    // Operation definitions
    localparam OP_AND = 2'd0;
    localparam OP_OR = 2'd1;
    localparam OP_XOR = 2'd2;
    localparam OP_NOT = 2'd3;

    // Button debouncing
    wire btnU_db, btnD_db, btnL_db, btnR_db, btnC_db;
    
    button_debounce db_btnU(.clk(clk), .btn_in(btnU), .btn_out(btnU_db));
    button_debounce db_btnD(.clk(clk), .btn_in(btnD), .btn_out(btnD_db));
    button_debounce db_btnL(.clk(clk), .btn_in(btnL), .btn_out(btnL_db));
    button_debounce db_btnR(.clk(clk), .btn_in(btnR), .btn_out(btnR_db));
    button_debounce db_btnC(.clk(clk), .btn_in(btnC), .btn_out(btnC_db));

    reg [2:0] current_state = STATE_INPUT1;
    reg [1:0] selected_op = OP_AND;
    wire [3:0] bin1, bin2;
    wire [6:0] seg_bin1, seg_bin2;
    wire [3:0] an_bin1, an_bin2;
    
    // Digit selection counter - now triggered by rr
    reg [1:0] digit_select = 0;
    always @(posedge clk) begin
        if (rr) begin
            digit_select <= digit_select + 1;
        end
    end
    
    // Instantiate insertBin modules
    insertBin bin_input1(
        .clk(clk),
        .rr(rr),
        .btnU(current_state == STATE_INPUT1 ? btnU_db : 1'b0),
        .btnD(current_state == STATE_INPUT1 ? btnD_db : 1'b0),
        .btnL(current_state == STATE_INPUT1 ? btnL_db : 1'b0),
        .btnR(current_state == STATE_INPUT1 ? btnR_db : 1'b0),
        .btnC(current_state == STATE_INPUT1 ? btnC_db : 1'b0),
        .bin(bin1),
        .seg_out(seg_bin1),
        .an_out(an_bin1)
    );
    
    insertBin bin_input2(
        .clk(clk),
        .rr(rr),
        .btnU(current_state == STATE_INPUT2 ? btnU_db : 1'b0),
        .btnD(current_state == STATE_INPUT2 ? btnD_db : 1'b0),
        .btnL(current_state == STATE_INPUT2 ? btnL_db : 1'b0),
        .btnR(current_state == STATE_INPUT2 ? btnR_db : 1'b0),
        .btnC(current_state == STATE_INPUT2 ? btnC_db : 1'b0),
        .bin(bin2),
        .seg_out(seg_bin2),
        .an_out(an_bin2)
    );

    // Operation display patterns
    reg [27:0] op_display;
    always @(*) begin
        case(selected_op)
            OP_AND: op_display = 28'b0001000_0101011_0101011_1111110;  // "And"
            OP_OR:  op_display = 28'b1111111_0101111_1111110_1111111;  // "Or"
            OP_XOR: op_display = 28'b0001001_0101111_1111110_1111111;  // "XOr"
            OP_NOT: op_display = 28'b0101011_0001111_0000111_1111111;  // "not"
        endcase
    end

    // Display control logic
    always @(posedge clk) begin
        if (rr) begin  // Only update display on refresh rate pulse
            case (current_state)
                STATE_INPUT1: begin
                    seg <= seg_bin1;
                    an <= an_bin1;
                    if (btnC_db) begin
                        current_state <= STATE_INPUT_OP;
                    end
                end

                STATE_INPUT_OP: begin
                    case (digit_select)
                        2'd0: begin seg <= op_display[6:0];   an <= 4'b1110; end
                        2'd1: begin seg <= op_display[13:7];  an <= 4'b1101; end
                        2'd2: begin seg <= op_display[20:14]; an <= 4'b1011; end
                        2'd3: begin seg <= op_display[27:21]; an <= 4'b0111; end
                    endcase
                    
                    if (btnU_db && !btnD_db) begin
                        selected_op <= (selected_op + 1) % 4;
                    end
                    else if (btnD_db && !btnU_db) begin
                        selected_op <= (selected_op - 1) % 4;
                    end
                    
                    if (btnC_db) begin
                        current_state <= (selected_op == OP_NOT) ? STATE_COMPUTE : STATE_INPUT2;
                    end
                end

                STATE_INPUT2: begin
                    seg <= seg_bin2;
                    an <= an_bin2;
                    if (btnC_db) begin
                        current_state <= STATE_COMPUTE;
                    end
                end

                STATE_COMPUTE: begin
                    case (selected_op)
                        OP_AND: Out <= bin1 & bin2;
                        OP_OR:  Out <= bin1 | bin2;
                        OP_XOR: Out <= bin1 ^ bin2;
                        OP_NOT: Out <= ~bin1;
                    endcase
                    current_state <= STATE_SHOW_RESULT;
                end

                STATE_SHOW_RESULT: begin
                    case (digit_select)
                        2'd0: begin
                            seg <= Out[0] ? 7'b1111001 : 7'b1111110;
                            an <= 4'b1110;
                        end
                        2'd1: begin
                            seg <= Out[1] ? 7'b1111001 : 7'b1111110;
                            an <= 4'b1101;
                        end
                        2'd2: begin
                            seg <= Out[2] ? 7'b1111001 : 7'b1111110;
                            an <= 4'b1011;
                        end
                        2'd3: begin
                            seg <= Out[3] ? 7'b1111001 : 7'b1111110;
                            an <= 4'b0111;
                        end
                    endcase
                    
                    if (btnC_db) begin
                        current_state <= STATE_INPUT1;
                    end
                end
            endcase
        end
    end
endmodule