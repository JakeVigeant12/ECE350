`timescale 1ns / 100ps
module eight_bit_comparator_tb;

    wire A7,A6,A5,A4,A3,A2,A1, A0, B7,B6,B5,B4,B3,B2,B1, B0, Eq, Gt; //inputs
    wire Eq1, Gt1; //outputs

    eight_bit_comparator comparator(.A7(A7),.A6(A6),.A5(A5),.A4(A4),.A3(A3),.A2(A2),.A1(A1),.A0(A0), .B7(B7),.B6(B6),.B5(B5),.B4(B4),.B3(B3),.B2(B2),.B1(B1),.B0(B0), .Gt1(Gt1), .Gt(Gt), .Eq1(Eq1), .Eq(Eq)); 
    integer i;   
    assign {Eq,Gt,A7,A6,A5,A4,A3,A2,A1, A0, B7,B6,B5,B4,B3,B2,B1,B0}  = i[19:0]; 
    initial begin
        for (i = 32;i<48;i =i+1) begin 
            
            #20; 
            $display("|%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b||%b|",Eq1,Gt1,A7,A6,A5,A4,A3,A2,A1,A0, B7,B6,B5,B4,B3,B2,B1, B0, Eq, Gt); 
        end 
        $finish;
    end
    

    initial begin 
        $dumpfile("eight_bit_comparator.vcd"); 

        $dumpvars(0,eight_bit_comparator_tb); 
    end
endmodule  










