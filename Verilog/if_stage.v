module if_stage #(
    parameter N = 32
) (
    input wire clk, 
    input wire rst, 
    input wire freeze, 
    input wire branch_taken,
    input wire [N-1:0] branch_addr,
    output wire [N-1:0] pc_plus4, 
    output wire [N-1:0] instruction
);

    wire [N-1:0] pc_in, pc_out;

    assign pc_plus4 = pc_out + 3'd4;

    mux_2to1 #(
        .N(N)
    ) mux_ins (
        .s(branch_taken),
        .a(pc_plus4), 
        .b(branch_addr),
        .out(pc_in)
    );
    
    instruction_memory imem (
        .pc(pc_out),
        .instruction(instruction)
    );

    pc pc_inst (
        .clk(clk), 
        .rst(rst), 
        .freeze(freeze),
        .pc_in(pc_in),
        .pc(pc_out)
    );

endmodule
