module button_debounce(
    input clk,
    input btn_in,
    output reg btn_out
);
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
module Logi(
    input enLogi,            
    input rr,                
    input clk,               
    input btnU,              
    input btnD,              
    input btnL,              
    input btnR,              
    input btnC,              
    output reg [6:0] seg,    
    output reg [3:0] an,     
    output reg return_to_main,
    output reg [3:0] Out     
);
    // State definitions
    localparam STATE_INPUT1 = 2'd0;
    localparam STATE_INPUT_OP = 2'd1;
    localparam STATE_INPUT2 = 2'd2;
    localparam STATE_DISPLAY = 2'd3;

    // Operation definitions
    localparam OP_AND = 3'd0;
    localparam OP_OR = 3'd1;
    localparam OP_NOR = 3'd2;
    localparam OP_NAND = 3'd3;
    localparam OP_XOR = 3'd4;

    // Button debouncing
    wire btnU_db, btnD_db, btnL_db, btnR_db, btnC_db;
    
    button_debounce db_btnU(.clk(clk), .btn_in(btnU), .btn_out(btnU_db));
    button_debounce db_btnD(.clk(clk), .btn_in(btnD), .btn_out(btnD_db));
    button_debounce db_btnL(.clk(clk), .btn_in(btnL), .btn_out(btnL_db));
    button_debounce db_btnR(.clk(clk), .btn_in(btnR), .btn_out(btnR_db));
    button_debounce db_btnC(.clk(clk), .btn_in(btnC), .btn_out(btnC_db));

    // State and operation tracking
    reg [1:0] current_state = STATE_INPUT1;
    reg [2:0] selected_op = OP_AND;
    
    // Input1 related registers
    reg [3:0] current_value1 = 4'b0000;
    reg [1:0] digit_pos1 = 2'b00;
    reg [3:0] bin1 = 4'b0000;
    
    // Input2 related registers
    reg [3:0] current_value2 = 4'b0000;
    reg [1:0] digit_pos2 = 2'b00;
    reg [3:0] bin2 = 4'b0000;
    
    // Common display multiplexing register
    reg [1:0] display_pos = 2'b00;
    
    // Button state tracking
    reg btnU_prev = 0;
    reg btnD_prev = 0;
    reg btnL_prev = 0;
    reg btnR_prev = 0;
    reg btnC_prev = 0;
    
    // Edge detection
    wire btnC_posedge = (btnC_db && !btnC_prev);
    wire btnC_negedge = (!btnC_db && btnC_prev);
    
    // Display module for result
    wire [6:0] seg_display;
    wire [3:0] an_display;
    
    displayBin result_display(
        .rr(rr & enLogi),
        .clk(clk),
        .btnL(btnL_db),
        .btnR(btnR_db),
        .bDot(Out),
        .seg(seg_display),
        .an(an_display)
    );

    // Operation display patterns
    reg [6:0] op_display;
    always @(*) begin
        case(selected_op)
            OP_AND:  op_display = 7'b0001000;  // "A"
            OP_OR:   op_display = 7'b1000000;  // "O"
            OP_NOR:  op_display = 7'b0101111;  // "r"
            OP_NAND: op_display = 7'b0100001;  // "d"
            OP_XOR:  op_display = 7'b0000110;  // "E"
            default: op_display = 7'b1111111;  // Blank
        endcase
    end

    // Main state machine and input handling
    always @(posedge clk) begin
        if (!enLogi) begin
            // Reset all state
            current_state <= STATE_INPUT1;
            current_value1 <= 4'b0000;
            current_value2 <= 4'b0000;
            digit_pos1 <= 2'b00;
            digit_pos2 <= 2'b00;
            bin1 <= 4'b0000;
            bin2 <= 4'b0000;
            selected_op <= OP_AND;
            Out <= 4'b0000;
            return_to_main <= 0;
            seg <= 7'b1111111;
            an <= 4'b1111;
            btnU_prev <= 0;
            btnD_prev <= 0;
            btnL_prev <= 0;
            btnR_prev <= 0;
            btnC_prev <= 0;
        end
        else if (rr) begin
            // Update display position for multiplexing
            display_pos <= display_pos + 1;
            
            // Update button previous states
            btnU_prev <= btnU_db;
            btnD_prev <= btnD_db;
            btnL_prev <= btnL_db;
            btnR_prev <= btnR_db;
            btnC_prev <= btnC_db;
            return_to_main <= 0;

            case (current_state)
                STATE_INPUT1: begin
                    // Handle input buttons for value1
                    if (btnU_db && !btnU_prev) begin
                        if (current_value1[digit_pos1] == 0)
                            current_value1[digit_pos1] <= 1;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (current_value1[digit_pos1] == 1)
                            current_value1[digit_pos1] <= 0;
                    end
                    if (btnL_db && !btnL_prev) begin
                        if (digit_pos1 < 2'b11)
                            digit_pos1 <= digit_pos1 + 1;
                    end
                    if (btnR_db && !btnR_prev) begin
                        if (digit_pos1 > 2'b00)
                            digit_pos1 <= digit_pos1 - 1;
                    end
                    if (btnC_posedge) begin
                        bin1 <= current_value1;
                        current_state <= STATE_INPUT_OP;
                    end
                    
                    // Display multiplexing for input1
                    case (display_pos)
                        2'b00: begin
                            an <= 4'b1110;
                            seg <= current_value1[0] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos1 == 2'b00)
                                an <= rr ? 4'b1110 : 4'b1111;
                        end
                        2'b01: begin
                            an <= 4'b1101;
                            seg <= current_value1[1] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos1 == 2'b01)
                                an <= rr ? 4'b1101 : 4'b1111;
                        end
                        2'b10: begin
                            an <= 4'b1011;
                            seg <= current_value1[2] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos1 == 2'b10)
                                an <= rr ? 4'b1011 : 4'b1111;
                        end
                        2'b11: begin
                            an <= 4'b0111;
                            seg <= current_value1[3] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos1 == 2'b11)
                                an <= rr ? 4'b0111 : 4'b1111;
                        end
                    endcase
                end

                STATE_INPUT_OP: begin
                    seg <= op_display;
                    an <= 4'b1110;
                    
                    if (btnU_db && !btnU_prev) begin
                        selected_op <= (selected_op == 3'd4) ? 3'd0 : selected_op + 1;
                    end
                    else if (btnD_db && !btnD_prev) begin
                        selected_op <= (selected_op == 3'd0) ? 3'd4 : selected_op - 1;
                    end
                    else if (btnC_posedge) begin
                        current_state <= STATE_INPUT2;
                    end
                end

                STATE_INPUT2: begin
                    // Handle input buttons for value2
                    if (btnU_db && !btnU_prev) begin
                        if (current_value2[digit_pos2] == 0)
                            current_value2[digit_pos2] <= 1;
                    end
                    if (btnD_db && !btnD_prev) begin
                        if (current_value2[digit_pos2] == 1)
                            current_value2[digit_pos2] <= 0;
                    end
                    if (btnL_db && !btnL_prev) begin
                        if (digit_pos2 < 2'b11)
                            digit_pos2 <= digit_pos2 + 1;
                    end
                    if (btnR_db && !btnR_prev) begin
                        if (digit_pos2 > 2'b00)
                            digit_pos2 <= digit_pos2 - 1;
                    end
                    if (btnC_posedge) begin
                        bin2 <= current_value2;
                        case (selected_op)
                            OP_AND:  Out <= bin1 & current_value2;
                            OP_OR:   Out <= bin1 | current_value2;
                            OP_NOR:  Out <= ~(bin1 | current_value2);
                            OP_NAND: Out <= ~(bin1 & current_value2);
                            OP_XOR:  Out <= bin1 ^ current_value2;
                            default: Out <= 4'b0000;
                        endcase
                        current_state <= STATE_DISPLAY;
                    end
                    
                    // Display multiplexing for input2
                    case (display_pos)
                        2'b00: begin
                            an <= 4'b1110;
                            seg <= current_value2[0] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos2 == 2'b00)
                                an <= rr ? 4'b1110 : 4'b1111;
                        end
                        2'b01: begin
                            an <= 4'b1101;
                            seg <= current_value2[1] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos2 == 2'b01)
                                an <= rr ? 4'b1101 : 4'b1111;
                        end
                        2'b10: begin
                            an <= 4'b1011;
                            seg <= current_value2[2] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos2 == 2'b10)
                                an <= rr ? 4'b1011 : 4'b1111;
                        end
                        2'b11: begin
                            an <= 4'b0111;
                            seg <= current_value2[3] ? 7'b1111001 : 7'b1000000;
                            if (digit_pos2 == 2'b11)
                                an <= rr ? 4'b0111 : 4'b1111;
                        end
                    endcase
                end

                STATE_DISPLAY: begin
                    seg <= seg_display;
                    an <= an_display;
                    
                    if (btnC_posedge) begin
                        return_to_main <= 1;
                    end
                end
            endcase
        end
    end
endmodule