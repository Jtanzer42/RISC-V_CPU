`timescale 1ns / 1ps

module tb_top;
    logic a;
    logic b;
    logic sel;
    logic y;

    top uut (.*);

    initial begin
        $dumpfile("cpu_waves.vcd");
        $dumpvars(0, tb_top);

        a = 1;
        b = 0;
        sel = 0;
        #10;

        sel = 1; #10;

        b = 1; #10;

        $finish;
    end
endmodule
