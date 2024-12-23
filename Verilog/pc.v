module pc #(
    parameter N = 32
) (
    input clk, rst, freeze,
    input [N-1:0] pc_in,
    output reg [N-1:0] pc
);

    always @(posedge clk or posedge rst) begin
        
        if(rst) begin
            pc   <= {N{1'b0}};
        end 

        else if(~freeze) begin
            pc   <= pc_in;
        end
        
    end
endmodule
