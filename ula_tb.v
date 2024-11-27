`timescale 1ns/1ns
`include "ula.v"


module ula_tb;

    reg [7:0] a,b;
    reg [2:0] opcode;
    reg clk;

    wire [7:0] s;


    ula uut(a, b, opcode, s, clk);


    initial begin
        $dumpfile("ula_tb.vcd");
        $dumpvars(0, ula_tb);

        #20;
        opcode = 3'b000; // Selecionar a soma
        a = 8'd5; b = 8'd10;
        #50;
        opcode = 3'b001; // Selecionar a subtracao
        #50
        opcode = 3'b110; // Selecionar a operação de igualdade (A == B)
        a = 8'd8; b = 8'd8;  // A igual a B
        #50; 
        a = 8'd5; b = 8'd10; // A diferente de B
        #50; 

        opcode = 3'b111; // Selecionar a operação de desigualdade (A != B)
        a = 8'd8; b = 8'd8;  // A igual a B
        #50; 
        a = 8'd5; b = 8'd10; // A diferente de B
        #50; 


        $display("Teste completo");
        $finish;
    end


    initial begin
            clk = 0;
            forever #10 clk = ~ clk;
        end


endmodule