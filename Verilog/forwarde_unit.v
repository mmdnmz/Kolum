module forward_unit(
    input forward_en_in,
    input [3:0] src1_in, src2_in,
    input mem_memr_wb_en_in, wb_id_wb_en_in,
    input [3:0] mem_memr_dest_in, wb_id_wb_dest_in,
    output reg [1:0] sel_src1_out, sel_src2_out
);

    // Control selection for src1
    always @(*) begin
        sel_src1_out = 2'b00;
        if (forward_en_in) begin
            if (mem_memr_wb_en_in && (mem_memr_dest_in == src1_in)) 
                sel_src1_out = 2'b01;
            else if (wb_id_wb_en_in && (wb_id_wb_dest_in == src1_in)) 
                sel_src1_out = 2'b10;
        end
    end

    // Control selection for src2
    always @(*) begin
        sel_src2_out = 2'b00;
        if (forward_en_in) begin
            if (mem_memr_wb_en_in && (mem_memr_dest_in == src2_in))
                sel_src2_out = 2'b01;
            else if (wb_id_wb_en_in && (wb_id_wb_dest_in == src2_in))
                sel_src2_out = 2'b10;
        end
    end

endmodule
