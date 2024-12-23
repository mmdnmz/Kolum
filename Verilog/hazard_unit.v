module hazard_unit (
    input wire forward_en_in,
    input wire [3:0] mem_dest,
    input wire mem_wb_en,
    input wire [3:0] exe_dest,
    input wire exe_wb_en,
    input wire [3:0] rn,
    input wire [3:0] reg_file_input2,
    input wire i,
    input wire mem_w_en,
    input wire mem_r_en_exe,
    input wire mem_r_en_mem,
    output reg hazard
);

    // reg [0:0] two_src;
    wire two_src;

    assign two_src = (~i) | mem_w_en;

    always @(*) begin
        hazard = 1'b0;


        if (forward_en_in) begin
            if (mem_r_en_mem) begin
                if (rn == exe_dest || (two_src && reg_file_input2 == exe_dest)) begin
                    hazard = 1'b1;
                end
            end
        end


        else begin
            if (exe_wb_en)
            begin
                if ((rn == exe_dest) || ((reg_file_input2 == exe_dest && two_src)))
                begin
                    hazard = 1'b1;
                end
            end
            
            if (mem_wb_en)
            begin
                if ((rn == mem_dest) || ((reg_file_input2 == mem_dest && two_src)))
                begin
                    hazard = 1'b1;
                end
            end
        end
    end

endmodule