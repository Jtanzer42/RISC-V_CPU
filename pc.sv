module pc (
    input logic clk,
    input logic reset,
    input logic [31:0] pc_next, // next address to jump to
    output logic [31:0] pc_out // current address output
);

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        pc_out <= 32'h0000_0000; // reset to 0 on startup
    end else begin
        pc_out <= pc_next; // update to next address on clock edge
    end
end

endmodule