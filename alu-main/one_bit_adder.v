module cla_block(a,b, cin, sum)
    input a, b, cin;
    output s;
    xor sum(s, a,b,cin);

endmodule