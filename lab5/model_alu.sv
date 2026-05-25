module bit_adder (
input logic a, b, c_in,
output logic sum, c_out
);
assign sum = a ^ b ^ c_in;
assign c_out = (a & b) | (c_in & (a | b));
endmodule

module new_adder(
    input logic [3:0] a, b,
    input logic c_in,
    output logic [3:0] sum,
    output logic c_out
);
logic c_out0, c_out1, c_out2;
bit_adder a1(.sum(sum[0]), .c_out(c_out0),  .a(a[0]), .b(b[0]), .c_in(c_in));
bit_adder a2(.sum(sum[1]), .c_out(c_out1),  .a(a[1]), .b(b[1]), .c_in(c_out0));
bit_adder a3(.sum(sum[2]), .c_out(c_out2),  .a(a[2]), .b(b[2]), .c_in(c_out1));
bit_adder a4(.sum(sum[3]), .c_out(c_out),  .a(a[3]), .b(b[3]), .c_in(c_out2));
endmodule

module module_AND (
output logic out,
input logic in1,
input logic in2,
input logic c_in
);

assign out = (in1 & in2) || (c_in & (in1 || in2));
endmodule

module module_XOR (
output logic out,
input logic in1,
input logic in2,
input logic c_in
);

assign out = in1 ^ in2 ^ c_in;
endmodule

module old_adder (
input logic na, nb, c_in,
output logic nsum, nc_out
);

logic a, b, sum, c_out;

assign a = na;
assign b = nb;

module_XOR m1(.out(sum), .in1(a), .in2(b), .c_in(c_in));
module_AND m2(.out(c_out), .in1(a), .in2(b), .c_in(c_in));

assign nsum = sum;
assign nc_out = c_out;

endmodule

module alu(
    input logic [3:0] a, rawb,
    input logic [2:0] funcsel,
    output logic [3:0] result
);

logic [3:0] b;
logic [3:0] sum;
logic c_out;

assign b = rawb;

new_adder adderr(.a(a), .b(b), .sum(sum), .c_out(c_out), .c_in(1'b0));

always_comb begin
    case (funcsel[1:0])
        2'b00: result = a & b;
        2'b01: result = a | b;
        2'b10: result = sum;
        2'b11: result = 4'b0000;
        default: result = 4'b0000;
    endcase
end

endmodule