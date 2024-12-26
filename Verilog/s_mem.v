// module s_mem(

//     input wire clk,
//     input wire rst,
//     inout wire [15:0] DQ_mem,
//     input wire [17:0] ADDR_mem,
//     input wire UB_N_mem,
//     input wire LB_N_mem,
//     input wire WE_N_mem,
//     input wire CE_N_mem,
//     input wire OE_N_mem
// );



//     reg s_select = 1'b1;

//     reg [15:0] s_memory [0:17];

//     reg [15:0] s_out;
//     wire [15:0] w_s_out;
//     assign w_s_out = s_out;

//     always @(posedge clk) begin
//         if ((~WE_N_mem)) begin
//             s_select <= 1'b1;
//             s_memory [ADDR_mem] <= DQ_mem;
//         end
//         else if (WE_N_mem) begin
//             s_select <= 1'b0;
//             s_out <= s_memory [ADDR_mem];
//         end
//     end

//     mux_2to1 #(16) control_signals_mux (
//         .a(w_s_out), .b(16'bz), .s(s_select), .out(DQ_mem)
//     );



// endmodule
