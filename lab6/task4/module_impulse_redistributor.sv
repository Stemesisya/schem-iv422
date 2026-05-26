// task 5

module module_flop_r(
    input logic clk,
    input logic reset,
    input logic d,
    output logic q
);

always_ff @(posedge clk) begin
    if (reset) q <=0;
    else q <= d;
end

endmodule

module module_impulse_redistributor(
    input logic clk,
    input logic reset,
    output logic [3:0] out
);

logic d;
assign d = ~out[0] & ~out[1] & ~out[2] & ~out[3];

module_flop_r f1(.clk(clk), .reset(reset), .d(  d   ), .q(out[3]));
module_flop_r f2(.clk(clk), .reset(reset), .d(out[3]), .q(out[2]));
module_flop_r f3(.clk(clk), .reset(reset), .d(out[2]), .q(out[1]));
module_flop_r f4(.clk(clk), .reset(reset), .d(out[1]), .q(out[0]));

endmodule
