module if_stage_reg #(
    parameter N = 32
) (
    input wire clk, 
    input wire rst, 
    input wire freeze, 
    input wire flush, 
    input wire [N-1:0] pc_in, 
    input wire [N-1:0] instruction_in, 
    output reg [N-1:0] pc, 
    output reg [N-1:0] PcId, 
    output reg [N-1:0] instruction
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= {N{1'b0}};
            PcId <= {N{1'b0}};
            
            instruction <= {N{1'b0}};
        end else if (flush) begin
            pc <= {N{1'b0}};
            PcId <= {N{1'b0}};
            
            instruction <= {N{1'b0}};
        end else if (~freeze) begin
            pc <= pc_in;
            PcId <= pc_in;
            
            instruction <= instruction_in;
        end
    end

endmodule
