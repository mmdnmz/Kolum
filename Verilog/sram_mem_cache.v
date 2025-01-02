module sram (
    input clk,
    input rst,
    input sram_we_n_in,
    input [17:0] sram_addr_in,
    inout [15:0] sram_dq_inout
);
    reg [15:0] memory [0:511];

    assign sram_dq_inout = (sram_we_n_in == 1'b1) ? memory[sram_addr_in] : 16'dz;

    always @(posedge clk) begin
        if (sram_we_n_in == 1'b0) 
            memory[sram_addr_in] = sram_dq_inout;
    end
endmodule



`define IDLE         6'd0
`define DATA_LOW     6'd1
`define DATA_HIGH    6'd2
`define DATA_UP_LOW  6'd3
`define DATA_UP_HIGH 6'd4
`define DONE         6'd5

module sram_controller (
    input clk,
    input rst,
    input wr_en_in,
    input rd_en_in,
    input [31:0] address_in,
    input [31:0] write_data_in,
    output reg [63:0] read_data_out,
    output reg ready_out,
    inout [15:0] sram_dq_inout,
    output reg [17:0] sram_addr_out,
    output sram_ub_n_out,
    output sram_lb_n_out,
    output reg sram_we_n_out,
    output sram_ce_n_out,
    output sram_oe_n_out
);
    assign {sram_ub_n_out, sram_lb_n_out, sram_ce_n_out, sram_oe_n_out} = 4'b0000;

    wire [31:0] mem_addr = address_in - 32'd1024;

    wire [17:0] sram_low_addr = {mem_addr[18:3], 2'd0};
    wire [17:0] sram_high_addr = sram_low_addr + 18'd1;
    wire [17:0] sram_up_low_addr = sram_low_addr + 18'd2;
    wire [17:0] sram_up_high_addr = sram_low_addr + 18'd3;

    wire [17:0] sram_low_addr_write = {mem_addr[18:2], 1'b0};
    wire [17:0] sram_high_addr_write = sram_low_addr_write + 18'd1;

    reg [15:0] dq;
    assign sram_dq_inout = wr_en_in ? dq : 16'bz;

    reg [2:0] ps, ns;

    // State Transition Logic
    always @(*) begin
        case (ps)
            `IDLE        : ns = (wr_en_in || rd_en_in) ? `DATA_LOW : `IDLE;
            `DATA_LOW    : ns = `DATA_HIGH;
            `DATA_HIGH   : ns = `DATA_UP_LOW;
            `DATA_UP_LOW : ns = `DATA_UP_HIGH;
            `DATA_UP_HIGH: ns = `DONE;
            `DONE        : ns = `IDLE;
        endcase
    end

    // Output Logic
    always @(*) begin
        sram_addr_out = 18'b0;
        sram_we_n_out = 1'b1;
        ready_out = 1'b0;

        case (ps)
            `IDLE: ready_out = ~(wr_en_in | rd_en_in);

            `DATA_LOW: begin
                if (rd_en_in) begin
                    sram_addr_out = sram_low_addr;
                    read_data_out[15:0] = sram_dq_inout;
                end else if (wr_en_in) begin
                    sram_addr_out = sram_low_addr_write;
                sram_we_n_out = ~wr_en_in;

                    dq = write_data_in[15:0];
                end
            end

            `DATA_HIGH: begin
                if (rd_en_in) begin
                    sram_addr_out = sram_high_addr;
                    read_data_out[31:16] = sram_dq_inout;
                end else if (wr_en_in) begin
                    sram_addr_out = sram_high_addr_write;
                sram_we_n_out = ~wr_en_in;
                    dq = write_data_in[31:16];
                end
            end

            `DATA_UP_LOW: begin
                sram_we_n_out = 1'b1;
                if (rd_en_in) begin
                    sram_addr_out = sram_up_low_addr;
                    read_data_out[47:32] = sram_dq_inout;
                end
            end

            `DATA_UP_HIGH: begin
                sram_we_n_out = 1'b1;
                if (rd_en_in) begin
                    sram_addr_out = sram_up_high_addr;
                    read_data_out[63:48] = sram_dq_inout;
                end
            end
            
            `DONE: ready_out = 1'b1;
        endcase
    end

    // State Update Logic
    always @(posedge clk or posedge rst) begin
        if (rst) 
            ps <= `IDLE;
        else 
            ps <= ns;
    end
endmodule

module cache_controller (
    input wire clk,
    input wire rst,
    input wire rd_en_in,
    input wire wr_en_in,
    input wire sram_ready_in,
    input wire [31:0] adr_in,
    input wire [31:0] w_data_in,
    input wire [63:0] sram_read_data_in,
    output wire sram_wr_en_out,
    output wire sram_rd_en_out,
    output wire ready_out,
    output wire [31:0] r_data_out
);
    // ------------------ Address Decode ------------------
    wire [2:0] offset = adr_in[2:0];
    wire [5:0] index = adr_in[8:3];
    wire [9:0] tag = adr_in[18:9];
    // ----------------------------------------------------

    // ------------------ Way Decode ------------------
    reg [31:0] way0_f [0:63];
    reg [31:0] way0_s [0:63];
    reg [31:0] way1_f [0:63];
    reg [31:0] way1_s [0:63];
    reg [9:0] way0_tag [0:63];
    reg [9:0] way1_tag [0:63];
    reg [63:0] index_lru;
    wire [31:0] data_way0 = (offset[2] == 1'b0) ? way0_f[index] : way0_s[index];
    wire [31:0] data_way1 = (offset[2] == 1'b0) ? way1_f[index] : way1_s[index];
    wire [9:0] tag_way0 = way0_tag[index];
    wire [9:0] tag_way1 = way1_tag[index];
    // ------------------------------------------------

    // ------------------ Valid Decode ----------------
    reg [63:0] way0_valid;
    reg [63:0] way1_valid;
    wire valid_way0 = way0_valid[index];
    wire valid_way1 = way1_valid[index];
    // ------------------------------------------------

    // ------------------ Hit Controller ------------------
    wire hit_way0 = (tag_way0 == tag && valid_way0 == 1'b1);
    wire hit_way1 = (tag_way1 == tag && valid_way1 == 1'b1);
    wire hit = hit_way0 | hit_way1;
    // ----------------------------------------------------

    // ------------------ Data Controller ------------------
    wire [31:0] data = hit_way0 ? data_way0 : 
                        hit_way1 ? data_way1 : 32'bz;
    wire [31:0] read_data_q = hit ? data :
                               sram_ready_in ? (offset[2] == 1'b0 ? sram_read_data_in[31:0] : sram_read_data_in[63:32]) : 32'bz;
    assign r_data_out = rd_en_in ? read_data_q : 32'bz;
    assign ready_out = sram_ready_in;
    // ----------------------------------------------------

    // ------------------ SRAM Controller ------------------
    assign sram_rd_en_out = ~hit & rd_en_in;
    assign sram_wr_en_out = wr_en_in;
    // -----------------------------------------------------

    // --------------------- Hit Rate ----------------------
    reg [31:0] read_cnt, hit_cnt;
    // -----------------------------------------------------

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            way0_valid <= 64'd0;
            way1_valid <= 64'd0;
            index_lru <= 64'd0;
            read_cnt <= 32'd0;
            hit_cnt <= 32'd0;
        end else begin
            if (rd_en_in) begin
                if (hit) begin
                    index_lru[index] <= hit_way1;
                    hit_cnt <= hit_cnt + 1;
                    read_cnt <= read_cnt + 1;
                end else if (sram_ready_in) begin
                    read_cnt <= read_cnt + 1;
                    if (index_lru[index]) begin
                        index_lru[index] <= 1'b0;
                        {way0_s[index], way0_f[index]} <= sram_read_data_in;
                        way0_valid[index] <= 1'b1;
                        way0_tag[index] <= tag;
                    end else begin
                        index_lru[index] <= 1'b1;
                        {way1_s[index], way1_f[index]} <= sram_read_data_in;
                        way1_valid[index] <= 1'b1;
                        way1_tag[index] <= tag;
                    end
                end
            end

            if (wr_en_in) begin
                if (hit_way0) begin
                    index_lru[index] <= 1'b0;
                    if (offset[2] == 1'b0) way0_f[index] <= w_data_in;
                    else way0_s[index] <= w_data_in;
                end else if (hit_way1) begin
                    index_lru[index] <= 1'b1;
                    if (offset[2] == 1'b0) way1_f[index] <= w_data_in;
                    else way1_s[index] <= w_data_in;
                end
            end
        end
    end

endmodule



module sram_mem_cache (
    input wire clk,
    input wire rst,
    input wire mem_w_en_in,
    input wire mem_r_en_in,
    input wire [31:0] alu_res_in,
    input wire [31:0] value_rm_in,
    output wire mem_ready_out,
    output wire [17:0] sram_addr_out,
    output wire sram_ub_n_out,
    output wire sram_lb_n_out,
    output wire sram_we_n_out,
    output wire sram_ce_n_out,
    output wire sram_oe_n_out,
    output wire [31:0] data_memory_out,
    inout wire [15:0] sram_dq_inout
);
    wire [31:0] cache_sram_rdata_out;
    wire cache_sram_ready;
    wire cache_sram_w_en;
    wire cache_sram_r_en;
    wire [63:0] sram_cache_data;

    cache_controller cachecontroller (
        .clk(clk),
        .rst(rst),
        .rd_en_in(mem_r_en_in),
        .wr_en_in(mem_w_en_in),
        .adr_in(alu_res_in),
        .w_data_in(value_rm_in),
        .r_data_out(data_memory_out),
        .ready_out(mem_ready_out),
        .sram_ready_in(cache_sram_ready),
        .sram_read_data_in(sram_cache_data),
        .sram_wr_en_out(cache_sram_w_en),
        .sram_rd_en_out(cache_sram_r_en)
    );

    wire sc_sram_we;
    wire [17:0] sc_sram_addr;
    wire [15:0] sc_sram_d;

    sram_controller sramcontroller (
        .clk(clk),
        .rst(rst),
        .wr_en_in(cache_sram_w_en),
        .rd_en_in(cache_sram_r_en),
        .address_in(alu_res_in),
        .write_data_in(value_rm_in),
        .read_data_out(sram_cache_data),
        .ready_out(cache_sram_ready),
        .sram_dq_inout(sc_sram_d),
        .sram_addr_out(sc_sram_addr),
        .sram_ub_n_out(sram_ub_n_out),
        .sram_lb_n_out(sram_lb_n_out),
        .sram_we_n_out(sc_sram_we),
        .sram_ce_n_out(sram_ce_n_out),
        .sram_oe_n_out(sram_oe_n_out)
    );

    sram sram_inst (
        .clk(clk),
        .rst(rst),
        .sram_we_n_in(sc_sram_we),
        .sram_addr_in(sc_sram_addr),
        .sram_dq_inout(sc_sram_d)
    );


endmodule
