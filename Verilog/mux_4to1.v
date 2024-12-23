module mux4to1(a, b, c, d, s, out);
    parameter Width = 32;
    input [Width - 1:0] a, b, c, d;
    input [1:0] s;

    output [Width - 1:0] out;

    assign out = (s == 2'b00) ? a :
                 (s == 2'b01) ? b :
                 (s == 2'b10) ? c : d;
endmodule
