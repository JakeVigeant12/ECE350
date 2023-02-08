module one_bit_adder(S, Cout, A, B, Cin);
    input A, B, Cin;
    output S, Cout;
    wire w1,w2,w3;

    xor sumResult(S, A, B, Cin);
    and A_and_B(w1, A, B);
    and A_and_Cin(w2, A, Cin);
    and B_and_Cin(w3, Cin, B);
    or coutResult(Cout, w1,w2,w3);
endmodule

