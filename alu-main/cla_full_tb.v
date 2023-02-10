`timescale 1 ns/10 ps

module cla_full_tb;
//cla_full_adder(a, b, cin, s);
    reg [31:0]a,b,p,g;
    reg cin;
    wire [31:0] s;

    cla_full_adder testUnit(a,b,cin,s);

    initial // initial block executes only once
        begin
            // values for a and b
            a = 50;
            b = 27;
            cin = 0;
            #80; // wait for period 

            $display("a:%d, b:%d, cin:%d => result:%d",a,b,cin,s);
            $finish;

        end


endmodule