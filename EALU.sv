module ALU (
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [3:0] control,
    output logic [31:0] result,
    output logic zero
);

    always_comb begin
        case (control)
            4'b0000: result = a & b; // and case
            4'b0001: result = a | b; // or case
            4'b0010: result = a + b; // add case
            4'b0110: result = a - b; // subtract case
            4'b0111: result = (a < b) ? 32'b1 : 32'b0; // SLT (set less than)
            4'b1100: result = ~(a | b); // nor case
            default: result = 32'b0; // default case
        endcase

        zero = (result == 32'b0) ? 1'b1 : 1'b0; // set zero flag
    end

endmodule