module mux_2(out, select, in0, in1);
    input select;
    input [31:0] in0, in1;
    output [31:0] out;
    assign out = select ? in1 : in0;
endmodule

module mux_4(in0, in1, in2, in3, out, select);
    input select[1:0];
    input [31:0] in0, in1, in2, in3;
    output [31:0] out;
    wire [31:0] w1, w2;
    mux_2 layer1_1(.in0(in0), .in1(in1), .out(w1), .select(select[0]));
    mux_2 layer1_2(.in0(in3), .in1(in4), .out(w2), .select(select[0]));
    mux_2 layer2(.in0(pick1), .in1(pick2), .out(out), .select(select[1]));

endmodule

module mux_8(in0,in1,in2,in3,in4,in5,in6,in7, out, select);
    input select[2:0];
    input [31:0] in0, in1, in2, in3,in4,in5,in6,in7;
    output [31:0] out;
    wire [31:0] pick1, pick2;
    mux_4 layer1_1(.in0(in0), .in1(in1), .in2(in2), .in3(in3), .out(pick1), .select(select[1:0]));
    mux_4 layer1_2(.in4(in4), .in5(in5), .in6(in6), .in7(in7), .out(pick2), .select(select[1:0]));
    mux_2 finalSelect(.in0(pick1), .in1(pick2), .select(select[2]), .out(out));
endmodule

module mux_32(out, select, in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,
            in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31);
    input select[4:0];
    input [31:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31;
    output [31:0] out;
    wire [31:0] pick1,pick2,pick3, pick4;
    mux_8 layer_1_1(in0,in1,in2,in3,in4,in5,in6,in7,pick1,select[2:0]);
    mux_8 layer_1_2(in8,in9,in10,in11,in12,in13,in14,in15,pick2,select[2:0]);
    mux_8 layer_1_3(in16,in17,in18,in19,in20,in21,in22,in23,pick3,select[2:0]);
    mux_8 layer_1_4(in24,in25,in26,in27,in28,in29,in30,in31, pick4, select[2:0]);
    mux_4 layer_2(pick1,pick2,pick3,pick4,out,select[4:3]);
endmodule
