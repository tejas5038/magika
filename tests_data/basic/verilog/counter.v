module counter #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             reset_n,
    input  wire             enable,
    output reg [WIDTH-1:0]   count
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        count <= {WIDTH{1'b0}};
    else if (enable)
        count <= count + 1'b1;
end

endmodule
