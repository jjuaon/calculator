module displayBin(
    input rr,
    input clk, 
    input btnL, 
    input btnR,                
    input [3:0] bDot,         // Changed to 4 bits
    output reg [6:0] seg,      
    output reg [3:0] an      
);
    reg [1:0] refresh_counter; // Only need 2 bits for 4 positions
    
    // Refresh counter for digit multiplexing
    always @(posedge rr) begin
        refresh_counter <= refresh_counter + 1;
    end
    
    // Select the current digit and encode for display
    always @(*) begin
        case (refresh_counter)
            2'b00: begin
                // Display bit 3 (MSB)
                an <= 4'b1110;
                seg <= bDot[0] ? 7'b1111001 : 7'b1000000; // 1 : 0
            end
            2'b01: begin
                // Display bit 2
                an <= 4'b1101;
                seg <= bDot[1] ? 7'b1111001 : 7'b1000000; // 1 : 0
            end
            2'b10: begin
                // Display bit 1
                an <= 4'b1011;
                seg <= bDot[2] ? 7'b1111001 : 7'b1000000; // 1 : 0
            end
            2'b11: begin
                // Display bit 0 (LSB)
                an <= 4'b0111;
                seg <= bDot[3] ? 7'b1111001 : 7'b1000000; // 1 : 0
            end
        endcase
    end

endmodule