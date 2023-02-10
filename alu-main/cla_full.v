module cla_full_adder(x, y, c_in, s, ovf);
    input [31:0] x, y;
    input c_in;
    output [31:0] s;
    output ovf;
    
    wire [3:0] P, G;
    wire[31:0] p,g;
    wire [4:0] c;
    wire c_out;
    //first block cin line is input to cell
    assign c[0] = c_in;
    //last bit of carry line is ouput cout of block
    assign c_out = c[4];

    bitwise_or propGet(x, y, p);
    bitwise_and genget(x, y, g);

    
    cla_block b0(x[7:0], y[7:0], c[0], p[7:0], g[7:0], P[0], G[0], s[7:0]);
    cla_block b1(x[15:8], y[15:8], c[1], p[15:8], g[15:8], P[1], G[1], s[15:8]);
    cla_block b2(x[23:16], y[23:16], c[2], p[23:16], g[23:16], P[2], G[2], s[23:16]);
    cla_block b3(x[31:24], y[31:24], c[3], p[31:24], g[31:24], P[3], G[3], s[31:24]);

    // calculate carry in's
    wire w_b0;
    and b0_and1(w_b0, P[0], c[0]);
    or b0_or(c[1], G[0], w_b0);

    wire [1:0] w_b1;
    and b1_and1(w_b1[0], P[1], G[0]);
    and b1_and2(w_b1[1], P[1], P[0], c[0]);
    or b1_or(c[2], G[1], w_b1[0], w_b1[1]);

    wire [2:0] w_b2;
    and b2_and1(w_b2[0], P[2], G[1]);
    and b2_and2(w_b2[1], P[2], P[1], G[0]);
    and b2_and3(w_b2[2], P[2], P[1], P[0], c[0]);
    or b2_or(c[3], G[2], w_b2[0], w_b2[1], w_b2[2]);

    wire [3:0] w_b3;
    and b3_and1(w_b3[0], P[3], G[2]);
    and b3_and2(w_b3[1], P[3], P[2], G[1]);
    and b3_and3(w_b3[2], P[3], P[2], P[1], G[0]);
    and b3_and4(w_b3[3], P[3], P[2], P[1], P[0], c[0]);
    or b3_or(c[4], G[3], w_b3[0], w_b3[1], w_b3[2], w_b3[3]);

    wire not_msb_A, not_msb_B, not_msb_sum, pos_overflow, neg_overflow;
    not invert_msb_A(not_msb_A, x[31]);
    not invert_msb_B(not_msb_B, y[31]);
    not invert_msb_sum(not_msb_sum, s[31]);
    and check_pos_overfow(pos_overflow, not_msb_A, not_msb_B, s[31]);
    and check_neg_overflow(neg_overflow, x[31], y[31], not_msb_sum);
    or check_overflow(ovf, pos_overflow, neg_overflow);


endmodule