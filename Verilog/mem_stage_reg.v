module mem_stage_reg #(
parameter Width = 32
) (
    input wire clk,
    input wire rst,
    input wire clr,
    input wire en,
    input wire wb_enable_in,
    input wire mem_read_enable_in,
    input wire [Width-1:0] alu_res_in,
    input wire [Width-1:0] data_memory_in,
    input wire [3:0] dest_in,
    output reg wb_enable_out,
    output reg mem_read_enable_out,
    output reg [Width-1:0] alu_res_out,
    output reg [Width-1:0] data_memory_out,
    output reg [3:0] dest_out,
    input wire [31:0] Pc_mem,
    output reg [31:0] PcWb,
    output reg [31:0] PcWb_4

);

always @(posedge clk or posedge rst) begin
    if (rst)
    begin
        wb_enable_out <= 1'b0;
        mem_read_enable_out <= 1'b0;
        alu_res_out <= {Width{1'b0}};
        data_memory_out <= {Width{1'b0}};
        dest_out <= 4'b0;
    end

    else if (en)
    begin
        wb_enable_out <= wb_enable_in;
        mem_read_enable_out <= mem_read_enable_in;
        alu_res_out <= alu_res_in;
        data_memory_out <= data_memory_in;
        dest_out <= dest_in;
        PcWb   <= Pc_mem;
        PcWb_4 <= (Pc_mem - 3'b100);
    end
end

endmodule
