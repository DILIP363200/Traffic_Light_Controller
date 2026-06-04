`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2025 23:04:43
// Design Name: 
// Module Name: trafficlight_test
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


// tb_traffic_light.v
module trafficlight_test;
    reg clk = 0;
    reg rst;
    wire red, yellow, green;

    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk; // 10 time unit clock

    initial begin
        $display("Time\tRed\tYellow\tGreen");
        $monitor("%0t\t%b\t%b\t%b", $time, red, yellow, green);

        rst = 1;
        #10 rst = 0;

        #100 $finish;
    end
endmodule

