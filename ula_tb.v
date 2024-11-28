`timescale 1ns/1ns
`include "ula.v"

module ula_tb;

    reg [7:0] a, b;            
    reg [2:0] opcode;          
    reg clk;                   

    wire [7:0] s;              

    ula uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .s(s),
        .clk(clk)
    );

    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

    initial begin
        $dumpfile("ula_tb.vcd"); 
        $dumpvars(0, ula_tb);    

        // Teste de soma
        opcode = 3'b000;
        a = 8'b00000101; b = 8'b00001010; // 5 e 10 em binário
        #50;            

        // Teste de subtração
        opcode = 3'b001;
        a = 8'b00001111; b = 8'b00001010; // 15 e 10 em binário
        #50;

        // Teste de AND
        opcode = 3'b010;
        a = 8'b1100_1010; b = 8'b1010_1100;
        #50;

        // Teste de OR
        opcode = 3'b011;
        a = 8'b1100_1010; b = 8'b1010_1100;
        #50;

        // Teste de XOR
        opcode = 3'b100;
        a = 8'b1100_1010; b = 8'b1010_1100;
        #50;

        // Teste de NOT
        opcode = 3'b101;
        a = 8'b1111_0000;
        #50;

        // Teste de igualdade
        opcode = 3'b110;
        a = 8'b00001010; b = 8'b00001010; // 10 em binário
        #50;

        a = 8'b00000101; b = 8'b00001010; // 5 e 10 em binário
        #50;

        // Teste de desigualdade
        opcode = 3'b111;
        a = 8'b00001010; b = 8'b00000101; // 10 e 5 em binário
        #50;

        a = 8'b00001010; b = 8'b00001010; // 10 e 10 em binário
        #50;

        // Finalizar teste
        $display("Teste completo");
        $finish;
    end

endmodule
