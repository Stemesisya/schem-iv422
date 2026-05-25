// task 2 D-триггер с синхронным сбросом
// Сброс происходит только по переднему фронту clk, когда reset = 1


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
