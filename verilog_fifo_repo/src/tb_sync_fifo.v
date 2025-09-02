`timescale 1ns / 1ps

module tb_sync_fifo;
    parameter DATA_WIDTH = 8;
    parameter DEPTH = 16;

    reg clk, rst, wr_en, rd_en;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;
    wire full, empty;

    sync_fifo #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH)) uut (
        .clk(clk), .rst(rst),
        .wr_en(wr_en), .rd_en(rd_en),
        .din(din), .dout(dout),
        .full(full), .empty(empty)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        $dumpfile("fifo_wave.vcd");
        $dumpvars(0, tb_sync_fifo);

        clk = 0; rst = 1; wr_en = 0; rd_en = 0; din = 0;
        #10 rst = 0;

        // Write data
        repeat(10) begin
            @(negedge clk);
            wr_en = 1; din = $random;
        end
        wr_en = 0;

        // Read data
        repeat(10) begin
            @(negedge clk);
            rd_en = 1;
        end
        rd_en = 0;

        #50 $finish;
    end
endmodule
