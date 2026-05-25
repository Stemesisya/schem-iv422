`timescale 1ns/1ps

module flopen_tb;

logic clk;
logic en;
logic d;
logic q;


flopen uut (
    .clk(clk),
    .en(en),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    en = 0;
    d = 0;

    #10;

    en = 1;
    d = 1;

    #10;

    d = 0;

    #10;

    en = 0;
    d = 1;

    #10;

    d = 0;

    #10;

    $stop;
end

endmodule
