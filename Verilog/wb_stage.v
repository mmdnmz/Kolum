module wb_stage #(
    parameter Width = 32
) (
    input wire clk,
    input wire rst,
    input wire [Width-1:0] alu_res_in,
    input wire mem_read_enable_in,
    input wire [Width-1:0] data_memory_in,
    output wire [Width-1:0] wb_value_out
);

    mux_2to1 #(
    .N(Width)
    )
    wb_stage_mux
    (
        .a(alu_res_in), .b(data_memory_in), .s(mem_read_enable_in), .out(wb_value_out)
    );

endmodule
