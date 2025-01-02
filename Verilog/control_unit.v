module control_unit(
    input [1:0] mode,
    input [3:0] op_code,
    input set_status,

    output reg [3:0] exe_command,
    output reg mem_read_enable, mem_write_enable,
    output reg write_back_enable, branch, status_out
);
    always @(mode, op_code, set_status) begin
        exe_command = 4'd0;
        {mem_read_enable, mem_write_enable} = 2'd0;
        {write_back_enable, branch, status_out} = 3'd0;

        case (op_code)
            4'b1101: exe_command = 4'b0001; // MOV
            4'b1111: exe_command = 4'b1001; // MVN
            4'b0100: exe_command = 4'b0010; // ADD, LDR, STR
            4'b0101: exe_command = 4'b0011; // ADC
            4'b0010: exe_command = 4'b0100; // SUB
            4'b0110: exe_command = 4'b0101; // SBC
            4'b0000: exe_command = 4'b0110; // AND
            4'b1100: exe_command = 4'b0111; // ORR
            4'b0001: exe_command = 4'b1000; // EOR
            4'b1010: exe_command = 4'b0100; // CMP
            4'b1000: exe_command = 4'b0110; // TST
            default: exe_command = 4'b0001;
        endcase

        case (mode)
            2'b00: begin
                status_out = set_status; // no write-back for CMP and TST
                write_back_enable = (op_code == 4'b1010 || op_code == 4'b1000) ? 1'b0 : 1'b1;
            end

            2'b01: begin
                write_back_enable = set_status;
                mem_read_enable = set_status;
                mem_write_enable = ~set_status;
            end

            2'b10: 
                branch = 1'b1;
            default: begin
                 status_out = 1'b0;
                 write_back_enable = 1'b0;
                 mem_read_enable = 1'b0;
                 mem_write_enable = 1'b0;
            end
        endcase
    end
endmodule
