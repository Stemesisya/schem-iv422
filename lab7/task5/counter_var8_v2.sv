module counter_4bit(
    input logic clk,
    input logic load,
    input logic en,
    input logic [3:0] data_load,
    output logic [3:0] q,
    output logic co
);

always_ff @(posedge clk)
begin
    if (load)
        q <= data_load;
    else if (en)
        q <= q + 1;
end

assign co = en && (q == 4'd15);

endmodule


module counter_var8_v2(
    input logic clk,
    input logic reset,
    input logic en,
    output logic [11:0] q
);

logic load;
logic c1;
logic c2;

assign load = reset || (q >= 12'd304);

counter_4bit cnt0(
    .clk(clk),
    .load(load),
    .en(en),
    .data_load(4'd6),
    .q(q[3:0]),
    .co(c1)
);

counter_4bit cnt1(
    .clk(clk),
    .load(load),
    .en(c1),
    .data_load(4'd3),
    .q(q[7:4]),
    .co(c2)
);

always_ff @( posedge clk ) begin
    if(load) q[11:8] <= 4'b0;
    else if(q == 12'b000000000000) q[11:8] <= 4'b0001;
end

endmodule
