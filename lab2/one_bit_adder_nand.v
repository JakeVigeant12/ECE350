
module one_bit_adder_nand(S,Cout,A,B,Cin);   
//intialize inputs and outputs 
input A, B, Cin;  
output S, Cout; 

//remake the diagram
wire w1, w2top, w2bottom, w3, w4, w5top, w5middle, w5bottom;
nand nand1(w1, A, B); 
nand nand2top(w2top, A, w1); 
nand nand2bottom(w2bottom, w1, B);
nand nand3(w3, w2top, w2bottom); 
nand nand4(w4, w3, Cin); 
nand nand5top(w5top, w3, w4); 
nand nand5middle(w5middle, w4, Cin); 
nand nand5bottom(Cout, w4, w1);  
nand nand6(S, w5middle, w5top); 
//measure twice cut once
//iverilog -Wimplicit -o Output_File_Name.vvp File_Name1.v File_Name2.v 
// what is at the top shows how to compile your verilog code 
//file 1 = testbench 
//file 2 = the actual .v file

endmodule