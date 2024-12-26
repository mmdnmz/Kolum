module sram_mem (
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

// module cache_controller (
//     input wire clk,
//     input wire rst,
//     input wire rd_en_in,
//     input wire wr_en_in,
//     input wire sram_ready_in,
//     input wire [31:0] adr_in,
//     input wire [31:0] w_data_in,
//     input wire [63:0] sram_read_data_in,
//     output wire sram_wr_en_out,
//     output wire sram_rd_en_out,
//     output wire ready_out,
//     output wire [31:0] r_data_out
// );




    // reg [15:0] s_temp_a [0:1023];
    // reg [15:0] s_temp_b [0:511];

    // wire [31:0] s_temp = {s_temp_a{address_s}, s_temp_a{address_s - 1'b1}};

    wire sc_sram_we;
    wire [17:0] sc_sram_addr;
    wire [15:0] sc_sram_d;
    // assign sc_sram_d = sram_dq_inout;

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


    // always @(posedge clk ) begin
    //     if (conditions) begin
            
    //     end
    //     s_temp_a [address_s] <= 
    // end

endmodule
