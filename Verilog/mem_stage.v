module mem_stage(
    input wire clk,
    input wire rst,
    input wire [31:0] alu_res_in,
    input wire [31:0] val_rm_in,
    output wire [31:0] data_memory_out,
    input wire wb_enable_in,
    output wire wb_enable_out,
    output wire mem_write_enable_in,
    output wire mem_read_enable_in,
    output wire mem_read_enable_out
);



data_memory memory_data (
    .clk(clk),
    .rst(rst),
    .alu_res_in(alu_res_in),
    .val_rm_in(val_rm_in),
    .mem_write_enable_in(mem_write_enable_in),
    .mem_read_enable_in(mem_read_enable_in),
    .result_out(data_memory_out)
);


assign wb_enable_out = wb_enable_in;

assign mem_read_enable_out = mem_read_enable_in;

endmodule