/*
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
        #50;

        opcode = 3'b010; // Selecionar and
        a = 8'd5; b = 8'd10;
        #50;

        opcode = 3'b011; // Selecionar or
        a = 8'd5; b = 8'd10;
        #50;

        opcode = 3'b100; // Selecionar xor
        a = 8'd5; b = 8'd10;
        #50;

        opcode = 3'b101; // Selecionar not
        a = 8'd5; 
        #50;

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
*/

`timescale 1ns/1ns
`include "ula.v"

module ula_tb;

    reg [7:0] a, b;            // Entradas da ULA
    reg [2:0] opcode;          // Código de operação
    reg clk;                   // Clock (se necessário)

    wire [7:0] s;              // Saída da ULA

    // Instanciação da ULA
    ula uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .s(s),
        .clk(clk)
    );

    // Geração do clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // Clock de período 20 ns
    end

    // Procedimento de teste
    initial begin
        $dumpfile("ula_tb.vcd"); // Arquivo para waveform
        $dumpvars(0, ula_tb);    // Variáveis monitoradas

        // Teste de soma
        opcode = 3'b000;
        a = 8'd5; b = 8'd10;
        #50;
        if (s !== 8'd15) $display("Erro na soma: %d + %d = %d (esperado: 15)", a, b, s);

        // Teste de subtração
        opcode = 3'b001;
        a = 8'd15; b = 8'd10;
        #50;
        if (s !== 8'd5) $display("Erro na subtração: %d - %d = %d (esperado: 5)", a, b, s);

        // Teste de AND
        opcode = 3'b010;
        a = 8'b1100_1010; b = 8'b1010_1100;
        #50;
        if (s !== 8'b1000_1000) $display("Erro no AND: %b & %b = %b (esperado: 10001000)", a, b, s);

        // Teste de OR
        opcode = 3'b011;
        a = 8'b1100_1010; b = 8'b1010_1100;
        #50;
        if (s !== 8'b1110_1110) $display("Erro no OR: %b | %b = %b (esperado: 11101110)", a, b, s);

        // Teste de XOR
        opcode = 3'b100;
        a = 8'b1100_1010; b = 8'b1010_1100;
        #50;
        if (s !== 8'b0110_0110) $display("Erro no XOR: %b ^ %b = %b (esperado: 01100110)", a, b, s);

        // Teste de NOT
        opcode = 3'b101;
        a = 8'b1111_0000;
        #50;
        if (s !== 8'b0000_1111) $display("Erro no NOT: ~%b = %b (esperado: 00001111)", a, s);

        // Teste de igualdade
        opcode = 3'b110;
        a = 8'd10; b = 8'd10;
        #50;
        if (s !== 8'd1) $display("Erro na igualdade: %d == %d = %d (esperado: 1)", a, b, s);
        a = 8'd5; b = 8'd10;
        #50;
        if (s !== 8'd0) $display("Erro na igualdade: %d == %d = %d (esperado: 0)", a, b, s);

        // Teste de desigualdade
        opcode = 3'b111;
        a = 8'd10; b = 8'd5;
        #50;
        if (s !== 8'd1) $display("Erro na desigualdade: %d != %d = %d (esperado: 1)", a, b, s);
        a = 8'd10; b = 8'd10;
        #50;
        if (s !== 8'd0) $display("Erro na desigualdade: %d != %d = %d (esperado: 0)", a, b, s);

        // Finalizar teste
        $display("Teste completo");
        $finish;
    end

endmodule
