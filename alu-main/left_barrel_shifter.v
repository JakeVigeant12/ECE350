module left_barrel_shifter (data, amt, out);
    input [32:0] data;
    input amt [4:0];
    output [32:0] out;

    //for each mux, input both the shifted and unshifted versions, let amt act as select bits to choose
    //if this shift occurs
    assign out[31:1] = x[30:0];

    assign out[0] = 1'b0; 


endmodule