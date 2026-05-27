`timescale 1ns/1ps

module counter_var8_v2_tb;

logic clk;
logic reset;
logic en;
logic [11:0] q;

counter_var8_v2 uut(
    .clk(clk),
    .reset(reset),
    .en(en),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    en = 1;

    #30;

    reset = 0;
    en = 1;

    #300000;

    $stop;
end

endmodule
