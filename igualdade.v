module igualdade (
    input [7:0] a,  
    input [7:0] b, 
    output s         // Saída: 1 se A == B, 0 caso contrário
);
    wire [7:0] xnor_out; // Fios para as saídas das portas XNOR

    // Comparação bit a bit (XNOR)
    assign xnor_out = a ~^ b;

    // AND final: Saída é 1 apenas se todas as saídas XNOR forem 1
    assign s = &xnor_out;
endmodule
