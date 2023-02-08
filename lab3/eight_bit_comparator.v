 
module mux_2(out,select,in0,in1);   
    input select; 
    input in0, in1; 
    output  out; 
    assign out = select ? in1: in0;     
endmodule 
module mux_4(out,A,B,in0,in1,in2,in3); 
    input A,B; 
    input in0,in1,in2,in3; 
    output out; 
    wire  w1,w2;  
    mux_2 first_top(w1,B,in0,in1);
    mux_2 first_bottom(w2,B,in2,in3); 
    mux_2 second(out,A,w1,w2); 
endmodule
module mux_8(out,A,B,C,in0,in1,in2,in3,in4,in5,in6,in7);
    input A,B,C; 
    input  in0,in1,in2,in3,in4,in5,in6,in7; 
    output  out;  
    wire  w1,w2; 
    mux_4 first_top(w1,C,B,in0,in1,in2,in3); 
    mux_4 first_bottom(w2,B,C,in4,in5,in6,in7); 
    mux_2 second(out,A,w1,w2);
endmodule 
module  two_bit_comparator(Eq, Gt, A1, A0, B1, B0, Eq2, Gt2); 
    input A1, A0, B1, B0, Eq2, Gt2;
    output Eq, Gt;  
    wire wt, wb, wb2, notEG, EnotG; 
    // These are the wiring for the muxes for the 2 bit comparator  
    and enotg(EnotG,Eq2,~Gt2);  //Eq2!Gt2
    and noteg(notEG,~Eq2,Gt2); // !Eq2Gt 


    //top and bottom muxes top = eq and bottom =  gt
    mux_8 top_mux(wt, A1, A0, B1, ~B0, 1'b0, B0, 1'b0, 1'b0, ~B0, 1'b0, B0); 
    and EQ(Eq, wt, EnotG); //(mux eq2!gt2)=gt   

    mux_8 bottom_mux(wb, A1, A0, B1, 1'b0, 1'b0, ~B0, 1'b0, 1'b1, 1'b0, 1'b1, ~B0);   
    and mux_and_not(wb2,wb,EnotG); 
    or GT(Gt, wb2, notEG);   
    //assign Gt = 1'b1;

endmodule 
module  eight_bit_comparator(Eq1,Gt1,A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0,Eq,Gt);   
    input A7,A6,A5,A4,A3,A2,A1,A0; 
    input B7,B6,B5,B4,B3,B2,B1,B0; 
    input Eq, Gt;  
    output Eq1, Gt1;  
    wire  Eq3, Gt3,Eq2, Gt2,Eq4, Gt4;

    two_bit_comparator comp1(Eq4, Gt4, A7, A6, B7, B6, Eq, Gt);
    two_bit_comparator comp2(Eq3, Gt3, A5 , A4, B5, B4, Eq4, Gt4);
    two_bit_comparator comp3(Eq2, Gt2, A3, A2, B3, B2, Eq3, Gt3); 
    two_bit_comparator comp4(Eq1, Gt1, A1, A0, B1, B0, Eq2, Gt2); 

endmodule