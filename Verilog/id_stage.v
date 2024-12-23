module id_stage #(
    parameter N = 32
)
(
    input wire clk, rst,
    input wire wb_enable_in, hazard_in,
    input wire [3:0] wb_dest_in, status_in,
    input wire [N-1:0] instruction_in, wb_value_in,

    output wire [N-1:0] val_rn_out, val_rm_out,
    output wire two_src_out, s_out, b_out, mem_write_enable_out,
    output wire mem_read_enable_out, wb_enable_out, i_out,
    output wire [3:0] exe_cmd_out, dest_out, src1_out, src2_out,
    output wire [11:0] shift_operand_out,
    output wire [23:0] imm24_out
);

    assign shift_operand_out = instruction_in[11:0];
    assign imm24_out = instruction_in[23:0];

    wire [3:0] rm = instruction_in[3:0];
    wire [3:0] rd = instruction_in[15:12];
    wire [3:0] rn = instruction_in[19:16];
    assign dest_out = rd;
    assign src1_out = rn;

    wire s = instruction_in[20];
    wire [3:0] opcode = instruction_in[24:21];
    wire i = instruction_in[25];
    assign i_out = i;

    wire [1:0] mode = instruction_in[27:26];
    wire [3:0] cond = instruction_in[31:28];

    // Control Unit
    wire [8:0] control_unit_out;
    
    control_unit control_unit_inst (
        .mode(mode), .op_code(opcode), .set_status(s), 
        .exe_command(control_unit_out[3:0]), .status_out(control_unit_out[4]), 
        .branch(control_unit_out[5]), .mem_write_enable(control_unit_out[6]), 
        .mem_read_enable(control_unit_out[7]), .write_back_enable(control_unit_out[8])
    );

    // Condition Check
    wire condition_check_out;
    condition_check condition_check_inst (
        .cond_in(cond), .cond_out(condition_check_out), .status_in(status_in)
    );

    // Control Signals Selector
    wire control_signals_selector = (~condition_check_out) | hazard_in;

    wire [8:0] signals;
    mux_2to1 #(9) control_signals_mux (
        .a(control_unit_out), .b(9'b0), .s(control_signals_selector), .out(signals)
    );

    assign exe_cmd_out = signals[3:0];
    assign s_out = signals[4];
    assign b_out = signals[5];
    assign mem_write_enable_out = signals[6];
    assign mem_read_enable_out = signals[7];
    assign wb_enable_out = signals[8];

    // Register File
    wire [3:0] regfile_input2;
    mux_2to1 #(4) regfile_input2_mux (
        .a(rm), .b(rd), .s(control_unit_out[6]), .out(regfile_input2)
    );
    assign src2_out = regfile_input2;

    wire not_branch = ~control_unit_out[5];

    register_file register_file_inst (
        .clk(clk), .rst(rst), 
        .reg_write(wb_enable_in), .reg_read(not_branch),
        .read_register1(rn), .read_register2(regfile_input2),
        .write_register(wb_dest_in), .write_data(wb_value_in),
        .read_data1(val_rn_out), .read_data2(val_rm_out)
    );

    // Hazard Detection
    assign two_src_out = ~i | control_unit_out[6];

endmodule
