module mux_2to1 #(
	parameter N = 32
) (
    input s,
    input [N-1:0] a, b,
    output reg [N-1:0] out
);
    always @* begin
        if (~s)
            out = a;
        else
            out = b;
    end
endmodule
