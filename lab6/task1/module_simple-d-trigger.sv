// task 1

module module_flop(
    input logic clk,
    input logic d,
    output logic q
);

always_ff @(posedge clk)
    q <= d;
endmodule
