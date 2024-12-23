module nbit_register #(
    parameter N = 8 
)(
    input clk, 
    input rst, 
    input en, 
    input [N-1:0] D, 
    output reg [N-1:0] Q
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= {N{1'b0}};
        end else if (en) begin
            Q <= D;
        end
    end

endmodule
