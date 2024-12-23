module nbit_adder #(
    parameter N = 32,
    parameter port_w_width = N,
    parameter port_a_width = N,
    parameter port_b_width = N
) (
    input [port_a_width-1:0] a,
    input [port_b_width-1:0] b,
    output [port_w_width-1:0] w
);

   assign w = a + b ;


endmodule
