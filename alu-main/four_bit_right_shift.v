module four_bit_right_shift(data, out);
input [31:0] data;
output [31:0] out;
assign out[0] = data[4];
assign out[1] = data[5];
assign out[2] = data[6];
assign out[3] = data[7];
assign out[4] = data[8];
assign out[5] = data[9];
assign out[6] = data[10];
assign out[7] = data[11];
assign out[8] = data[12];
assign out[9] = data[13];
assign out[10] = data[14];
assign out[11] = data[15];
assign out[12] = data[16];
assign out[13] = data[17];
assign out[14] = data[18];
assign out[15] = data[19];
assign out[16] = data[20];
assign out[17] = data[21];
assign out[18] = data[22];
assign out[19] = data[23];
assign out[20] = data[24];
assign out[21] = data[25];
assign out[22] = data[26];
assign out[23] = data[27];
assign out[24] = data[28];
assign out[25] = data[29];
assign out[26] = data[30];
assign out[27] = data[31];
assign out[28] = 1'b0;
assign out[29] = 1'b0;
assign out[30] = 1'b0;
assign out[31] = 1'b0;
endmodule