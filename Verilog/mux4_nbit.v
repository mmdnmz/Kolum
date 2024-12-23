module mux4_nbit #(
    parameter MuxWidth = 16
)(
    input wire   [1:0]          select,
    input wire   [MuxWidth-1:0] mux_in_1,
    input wire   [MuxWidth-1:0] mux_in_2,
    input wire   [MuxWidth-1:0] mux_in_3,
    input wire   [MuxWidth-1:0] mux_in_4,
    
    output wire  [MuxWidth-1:0] mux_out
);

   assign mux_out = select[1] ? (select[0] ? mux_in_4 : mux_in_3) : (select[0] ? mux_in_2 : mux_in_1);

endmodule