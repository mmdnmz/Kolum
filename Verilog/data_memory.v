module data_memory(

    input wire clk, rst,
    input wire [31:0] alu_res_in, val_rm_in,
    input wire mem_read_enable_in, mem_write_enable_in,

    output reg [31:0] result_out
);
    localparam WordCount = 64;
    localparam OffSet = 1024;

    reg [31:0] data_memory_array [0:WordCount - 1];
    wire [31:0] data_address, address;
    

    assign data_address = alu_res_in - 32'd1024;

    assign address = { 2'b00, data_address[31:2]};

    

    integer i;

    always @(posedge clk) begin
        if (mem_write_enable_in) begin
            data_memory_array[address] <= val_rm_in;
        end
    end

    always @(mem_read_enable_in or address) begin
        if (mem_read_enable_in) begin
            result_out = data_memory_array[address];
        end
    end

endmodule
