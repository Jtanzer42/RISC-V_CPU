module top (
    input logic a,
    input logic b,
    input logic sel,
    output logic y
);

    always_comb begin
        case (sel)
            0: y = a;
            1: y = b;
            default: y = 0;
        endcase
    end
    
endmodule
