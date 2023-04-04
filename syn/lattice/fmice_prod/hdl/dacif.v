/*
MIT License

Copyright (c) 2022 Frank van den Hoef

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

//`default_nettype none

module dacif(
    input  wire        rst,
    input  wire        clk,

    // Sample input
    output wire        next_sample,
    input  wire [15:0] left_data,       // 2's complement signed left data
    input  wire [15:0] right_data,      // 2's complement signed right data

    // Left-justified serial audio output
    output reg         dac_lrck,
    output wire        dac_bck,
    output wire        dac_data);

    // Generate LRCK
    reg  [4:0] div_r;
    wire [4:0] div_max = 5'd31;         // 64 clk cycles per sample

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            div_r    <= 'd0;
            dac_lrck <= 0;
        end else begin
            if (div_r == div_max) begin
                dac_lrck <= !dac_lrck;
                div_r    <= 0;
            end else begin
                div_r <= div_r + 5'd1;
            end
        end
    end

    reg lrck_r;
    always @(posedge clk) lrck_r <= dac_lrck;

    // Generate BCK
    reg bck_r;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bck_r <= 0;
        end else begin
            bck_r <= !bck_r;
        end
    end

    assign dac_bck = bck_r;

    // Generate start signals
    wire start_left  = lrck_r  && !dac_lrck;
    wire start_right = !lrck_r && dac_lrck;
    assign next_sample = start_left;

    // Shift register and sample buffer
    reg [15:0] right_sample_r;
    reg [15:0] shiftreg_r;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shiftreg_r     <= 0;
            right_sample_r <= 0;
        end else begin
            if (bck_r) begin
                shiftreg_r <= {shiftreg_r[14:0], 1'b0};
            end

            if (start_left) begin
                shiftreg_r     <= left_data;
                right_sample_r <= right_data;
            end
            if (start_right) begin
                shiftreg_r     <= right_sample_r;
            end
        end
    end

    assign dac_data  = shiftreg_r[15];

endmodule
