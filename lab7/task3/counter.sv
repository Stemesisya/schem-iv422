module antitinkling (
    input logic button,
    input logic clk,
    input logic reset,
    output logic out
    );

    logic c;
    logic [19:0] q;

    always_ff @(posedge clk)
        out <= button;

    always_ff @(posedge clk, posedge reset)
        if (reset) q <= 0;
        else q <= q + 1;

    assign c = (q == 20'hFFFFF);
endmodule


module counter4b (
    input logic load,
    input logic [3:0] data_load,
    input logic clk,
    input logic reset,
    input logic rawButton,
    output logic [3:0] q,
    output logic ol
);
    logic button;

    antitinkling at(.button(rawButton), .clk(clk), .reset(reset), .out(button));

    always_ff @(posedge button, posedge reset) begin
        if (reset)q <= 0;
        else if (load) q <= data_load;
        else q <= q + 1;
    end

    assign ol = (q==4'b1111);

endmodule
