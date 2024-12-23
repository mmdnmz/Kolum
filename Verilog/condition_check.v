module condition_check(

    input [3:0] cond_in,
    input [3:0] status_in,

    output reg cond_out
);
    wire negative, zero, carry, overflow;
    assign {negative, zero, carry, overflow} = status_in;

    always @(cond_in, negative, zero, carry, overflow) begin
        cond_out = 1'b0;
        case (cond_in)
            4'b0000: cond_out = zero;             // EQ
            4'b0001: cond_out = ~zero;            // NE
            4'b0010: cond_out = carry;            // CS/HS
            4'b0011: cond_out = ~carry;           // CC/LO
            4'b0100: cond_out = negative;         // MI
            4'b0101: cond_out = ~negative;        // PL
            4'b0110: cond_out = overflow;         // VS
            4'b0111: cond_out = ~overflow;        // VC
            4'b1000: cond_out = carry & ~zero;    // HI
            4'b1001: cond_out = ~carry | zero;    // LS
            4'b1010: cond_out = (negative == overflow);  // GE
            4'b1011: cond_out = (negative != overflow);  // LT
            4'b1100: cond_out = ~zero & (negative == overflow); // GT
            4'b1101: cond_out = zero | (negative != overflow);  // LE
            4'b1110: cond_out = 1'b1;             // AL
            default: cond_out = 1'bx;
        endcase
    end
    
endmodule
