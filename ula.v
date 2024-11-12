`include "registrador.v"
`include "decodificador.v"
`include "somador8.v"
`include "tristate.v"

`include "subtrator8.v"


module ula #(parameter N = 8)(a, b, opcode, s, flag,clk);
    input [7:0] a,b;
    input [2:0] opcode;
    input clk;
    output [7:0] s;
    output reg flag;

    wire [7:0] a_reg, b_reg;
    wire [8:0] sum_res, sub_res;
    wire [7:0] enable;

    wire [7:0] saida_tristate;

    // Entrada de dados
    registrador regA(clk, a, 1'b1, 1'b1, a_reg);
    registrador regB(clk, b, 1'b1, 1'b1, b_reg);

    // Seletor de Operação
    decodificador decoder(opcode, 1'b1, enable);

    // Operação Soma
    somador8 somador(a_reg,b_reg,sum_res);
    tristate tristate_soma(sum_res[7:0], saida_tristate, enable[0]); // OPCODE = 000 -> FAZ enable[0] = 1

    // Operação Subtração
    subtrator8 subtrator(a_reg,b_reg,sub_res);
    tristate tristate_subtracao(sub_res[7:0], saida_tristate, enable[1]); // OPCODE = 001 -> FAZ enable[1] = 1

    // Saída de dados
    registrador regS(clk, saida_tristate, 1'b1, 1'b1, s);

    always @(*) begin
        case (opcode)
            3'b000: flag = sum_res[8] ;
            default: flag = 1'b0;
        endcase
        
    end
endmodule