module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire [31:0] addResult, subResult, andResult, orResult, sllResult, sraResult;
    wire doSub;

    //addition/subtraction result
    //cla_full_adder(x, y, c_in, p, g, s);
    //use cin to add on 1 if subtraction
    
    //adder cla_full_adder(data_operandA, data_operandB, doSub, p, g, addResult);

    //subtraction result


    //and result


    //or result


    //sll result


    //sra result




    // use 8 bit mux to select output based on opcode
    // mux_8(in0,in1,in2,in3,in4,in5,in6,in7, out, select);
    

endmodule