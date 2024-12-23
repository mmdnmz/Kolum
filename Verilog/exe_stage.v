module exe_stage(

    input wire clk, rst, mem_read_enable_in, mem_write_enable_in, i_in, status_in,
    input wire [1:0] sel_src1_in, sel_src2_in,
    input wire [3:0] exe_cmd_in,
    input wire [11:0] shift_operand_in,
    input wire [23:0] imm24_in,
    input wire [31:0] pc_in, val_rn_in, val_rm_in, wb_value_in, alu_res_in,

    output wire [3:0] status_out,
    output wire [31:0] alu_res_out, branch_address_out
);
    


    wire s_type_signal = mem_read_enable_in | mem_write_enable_in;
    wire [31:0] val1, val2, val2_generator_in;

    mux4to1 # (
        .Width(32) )
    mux1 (
        .a(val_rn_in), .b(alu_res_in), .c(wb_value_in), 
        .d(32'bz), .s(sel_src1_in), .out(val1)
    );

    mux4to1 # (
        .Width(32) )
    mux2 (
        .a(val_rm_in), .b(alu_res_in), .c(wb_value_in), 
        .d(32'bz), .s(sel_src2_in), .out(val2_generator_in)
    );

    val2_generator val2_generator(
        .operand_in(val2_generator_in), .shift_operand(shift_operand_in), 
        .is_immediate(i_in), .sign_extend(s_type_signal), 
        .operand_out(val2)
    );

    alu alu_inst(
        .input_a(val1), .input_b(val2), 
        .command(exe_cmd_in), .carry_in(status_in), 
        .status_out(status_out), .result(alu_res_out)
    );


    nbit_adder #(
        .N(32)
    ) branch_address_adder(
        .a(pc_in), .b({{6{imm24_in[23]}}, imm24_in, 2'b00}), .w(branch_address_out)
    );

endmodule
