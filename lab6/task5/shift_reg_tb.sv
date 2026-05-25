`timescale 1ns/1ps

module shift_reg_tb;

logic clk;
logic reset;
logic sin;
logic [3:0] q;

shift_reg uut (
    .clk(clk),
    .reset(reset),
    .sin(sin),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    reset = 1;
    sin = 0;

    #10;
    reset = 0;

    #10;
    sin = 1;

    #10;
    sin = 0;

    #10;
    sin = 1;

    #10;
    sin = 1;

    #20;

    $stop;
end

endmodule