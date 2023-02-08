`timescale 1ns / 100ps
module one_bit_adder_nand_tb;

    reg A, B, Cin; 
    wire S,Cout; 

    one_bit_adder_nand adder_nand(.A(A),.B(B),.Cin(Cin),.Cout(Cout),.S(S));  

    initial begin   

        //This intializes the values of the gates
        A = 0; 
        B = 0; 
        Cin =0;  

        // After 80ns, end the test
        #80;
        $finish;
    end 

    always   
    //these show the time offsets of each of the inputs 
        #10 A = ~A;

    always 
        #20 B = ~B;  

    always 
        #40 Cin = ~Cin; 

    always @(A,B,Cin) begin 
        #1; 
        $display("A:%b,B:%b,Cin:%b => S:%b,Cout:%b",A,B,Cin,S,Cout); 
    end  
    initial begin 
        $dumpfile("one_bit_adder_nand.vcd"); 

        $dumpvars(0,one_bit_adder_nand_tb); 
    end
endmodule 








