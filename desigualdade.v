module desigualdade (
    input [7:0] a,   
    input [7:0] b,  
    output s         // Saída: 1 se A != B, 0 caso contrário
);
    wire [7:0] xor_out; // Fios para as saídas das portas XOR

    // Comparação bit a bit (XOR)
    assign xor_out = a ^ b;

    // OR final: Saída é 1 se pelo menos uma das saídas XOR for 1
    assign s = |xor_out;
endmodule

