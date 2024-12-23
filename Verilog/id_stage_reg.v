module id_stage_reg #(
    parameter N = 32

)(
    input wire clk, rst, en, clr, status_in ,

    input wire wb_enable_in, mem_read_enable_in, mem_write_enable_in, b_in, s_in, i_in,
    output reg wb_enable_out, mem_read_enable_out, mem_write_enable_out, b_out, s_out, i_out, status_out,

    input wire [3:0] exe_cmd_in, dest_in, src1_in, src2_in,
    output reg [3:0] exe_cmd_out, dest_out, src1_out, src2_out,

    input wire [31:0] Pc_Id,
    output reg [31:0] PcExe,
    // assign PcExe <= Pc_Id,

    input wire [11:0] shift_operand_in,
    output reg [11:0] shift_operand_out,

    input wire [23:0] imm24_in,
    output reg [23:0] imm24_out,

    input wire [31:0] pc_in, val_rm_in, val_rn_in,
    output reg [31:0] pc_out, val_rm_out, val_rn_out
);




    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wb_enable_out      <= 1'b0;
            mem_read_enable_out <= 1'b0;
            mem_write_enable_out <= 1'b0;
            b_out              <= 1'b0;
            s_out              <= 1'b0;
            i_out              <= 1'b0;
            src1_out           <= 4'b0;
            src2_out           <= 4'b0;
            exe_cmd_out        <= 4'b0;
            dest_out           <= 4'b0;
            status_out         <= 1'b0;
            shift_operand_out  <= 12'b0;
            imm24_out          <= 24'b0;
            pc_out             <= 32'b0;
            val_rm_out         <= 32'b0;
            val_rn_out         <= 32'b0;
        end 
        else if (clr) begin
            wb_enable_out      <= 1'b0;
            mem_read_enable_out <= 1'b0;
            mem_write_enable_out <= 1'b0;
            b_out              <= 1'b0;
            s_out              <= 1'b0;
            i_out              <= 1'b0;
            src1_out           <= 4'b0;
            src2_out           <= 4'b0;
            exe_cmd_out        <= 4'b0;
            dest_out           <= 4'b0;
            status_out         <= 1'b0;
            shift_operand_out  <= 12'b0;
            imm24_out          <= 24'b0;
            pc_out             <= 32'b0;
            val_rm_out         <= 32'b0;
            val_rn_out         <= 32'b0;
        end
        else if (en) begin
            wb_enable_out      <= wb_enable_in;
            mem_read_enable_out <= mem_read_enable_in;
            mem_write_enable_out <= mem_write_enable_in;
            b_out              <= b_in;
            s_out              <= s_in;
            i_out              <= i_in;
            exe_cmd_out        <= exe_cmd_in;
            dest_out           <= dest_in;
            status_out         <= status_in;
            shift_operand_out  <= shift_operand_in;
            imm24_out          <= imm24_in;
            pc_out             <= pc_in;
            val_rm_out         <= val_rm_in;
            val_rn_out         <= val_rn_in;
            src1_out           <= src1_in;
            src2_out           <= src2_in;
            PcExe              <= Pc_Id;
        end
    end
endmodule
