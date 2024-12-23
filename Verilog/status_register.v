module status_register(
    input wire clk, rst, enable,
    input wire [3:0] status_in,

    output reg [3:0] status_out
);



    always @(negedge clk or posedge rst) begin
        if (rst) 
            status_out <= 4'b0;
        else if (enable) 
            status_out <= status_in;
    end

endmodule
