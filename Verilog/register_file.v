module register_file #(
    parameter N = 32
) (
    input clk, rst, reg_read,
    input [3:0] read_register1, read_register2, write_register,
    input [N-1:0] write_data,
    input reg_write,
    output [N-1:0] read_data1, read_data2
);

    reg [31:0] registers [15:0] /* synthesis keep */;

    assign read_data1 = registers[read_register1];
    assign read_data2 = registers[read_register2];
    // assign registers [4'b1011] = 32'd8192;


    integer i;
    // initial begin
    //     for (i = 0; i < 16; i = i + 1)
    //         registers[i] <= i;
    // end


 
    always @(negedge clk)
        begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1) begin
                registers[i] <= i;
            end
        end
        else if (reg_write == 1'b1)
                begin
                    registers[write_register] <= write_data;
                end
        end

endmodule



/*
        if (rst) begin
            for (i = 0; i < 16; i = i + 1) begin
                registers[i] <= i;
            end
        end
        else 
        */