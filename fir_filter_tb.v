`timescale 1ns/1ps

module fir_filter_tb;

    reg clk;
    reg reset;
    reg [7:0] x;
    wire [15:0] y;

    fir_filter uut(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    always #5 clk = ~clk; // 10ns clock

    initial begin
        clk = 0;
        reset = 1; #10;
        reset =0;
        x = 0;

        #20 reset = 0;

        #10 x = 8'd5; #20;
        #10 x = 8'd10; #20;
        #10 x = 8'd15; #20;
        #10 x = 8'd20; #20;
        #10 x = 8'd10; #20;
        #10 x = 8'd5; #20;
        #10 x = 8'd0; #20;

        #100 $stop;
    end

    initial begin
        $monitor("t=%0t | x=%d | y=%d", $time, x, y);
    end

endmodule