module two_bit_adder(A,B,S,Cin,Cout);
    input [1:0] A, B;
    input Cin;
    output [1:0] S;
    output Cout;
    wire bothAdders;
    one_bit_adder adder1(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(bothAdders));
    one_bit_adder adder2(.A(A[1]), .B(B[1]), .Cin(bothAdders), .S(S[1]), .Cout(Cout));

endmodule