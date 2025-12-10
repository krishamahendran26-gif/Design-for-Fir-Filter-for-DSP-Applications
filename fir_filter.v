`timescale 1ns/1ps

module fir_filter(
    input  wire        clk,
    input  wire        reset,
    input  wire [7:0]  x,
    output reg  [15:0] y
);

    // 8 delay registers (shift register)
    reg [7:0] d0, d1, d2, d3, d4, d5, d6, d7;

    // 8 coefficients (constant)
    // You can modify these values
    parameter c0 = 8'd1,
              c1 = 8'd2,
              c2 = 8'd3,
              c3 = 8'd4,
              c4 = 8'd4,
              c5 = 8'd3,
              c6 = 8'd2,
              c7 = 8'd1;

    reg [15:0] acc;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            d0 <= 0; d1 <= 0; d2 <= 0; d3 <= 0;
            d4 <= 0; d5 <= 0; d6 <= 0; d7 <= 0;
            y  <= 0;
        end else begin
            // ---- Shift Register ----
            d7 <= d6;
            d6 <= d5;
            d5 <= d4;
            d4 <= d3;
            d3 <= d2;
            d2 <= d1;
            d1 <= d0;
            d0 <= x;

            // ---- Multiply & Accumulate ----
            acc = 0;
            acc = acc + d0 * c0;
            acc = acc + d1 * c1;
            acc = acc + d2 * c2;
            acc = acc + d3 * c3;
            acc = acc + d4 * c4;
            acc = acc + d5 * c5;
            acc = acc + d6 * c6;
            acc = acc + d7 * c7;

            y <= acc;   // output result
        end
    end

endmodule

