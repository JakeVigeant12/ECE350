`timescale 1ns/100ps
module cla_tb;
    //reg for inputs
    // wires for outputs
     reg[31:0] a, b;
     reg cin;
     wire [31:0] sum;
     wire p;
     wire g;
     //Instantiate the target module with inputs as regs, outputs as wire
    cla_full dut(a,b ,cin, p, g, sum)


     //Test items themselves


endmodule