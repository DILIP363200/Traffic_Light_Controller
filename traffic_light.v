`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2025 23:03:01
// Design Name: 
// Module Name: traffic_light
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

// traffic_light.v
module traffic_light (
    input clk,
    input rst,
    output reg red,
    output reg yellow,
    output reg green
);

    reg [1:0] state;
    parameter RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= RED;
        else begin
            case (state)
                RED:    state <= GREEN;
                GREEN:  state <= YELLOW;
                YELLOW: state <= RED;
            endcase
        end
    end

    always @(*) begin
        red = (state == RED);
        green = (state == GREEN);
        yellow = (state == YELLOW);
    end
endmodule

