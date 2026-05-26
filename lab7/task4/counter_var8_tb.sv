`timescale 1ns/1ps

module counter_var8_tb;

logic clk;
logic reset;
logic en;
logic [11:0] q;

counter_var8 uut(
    .clk(clk),
    .reset(reset),
    .en(en),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    en = 0;

    #10;

    reset = 0;
    en = 1;

    #3000;

    en = 0;

    #20;

    $stop;
end

endmodule
