module exe_stage_reg(
    input wire clk, rst, en, clr,
    
    input wire wb_enable_in, mem_read_enable_in, mem_write_enable_in,
    output reg wb_enable_out, mem_read_enable_out, mem_write_enable_out,
    
    input wire [3:0] dest_in,
    output reg [3:0] dest_out,
    input wire [31:0] Pc_exe,
    output reg [31:0] PcMem,

    input wire [31:0] alu_res_in, val_rm_in,
    output reg [31:0] alu_res_out, val_rm_out

);



    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wb_enable_out      <= 1'b0;
            mem_read_enable_out   <= 1'b0;
            mem_write_enable_out   <= 1'b0;
            dest_out       <= 4'b0;
            val_rm_out     <= 32'b0;
            alu_res_out    <= 32'b0;
        end 
        else if (clr) begin
            wb_enable_out      <= 1'b0;
            mem_read_enable_out   <= 1'b0;
            mem_write_enable_out   <= 1'b0;
            dest_out       <= 4'b0;
            val_rm_out     <= 32'b0;
            alu_res_out    <= 32'b0;
        end
        else if (en) begin
            wb_enable_out      <= wb_enable_in;
            mem_read_enable_out   <= mem_read_enable_in;
            mem_write_enable_out   <= mem_write_enable_in;
            dest_out       <= dest_in;
            val_rm_out     <= val_rm_in;
            alu_res_out    <= alu_res_in;
            PcMem          <= Pc_exe;
        end
    end
endmodule
