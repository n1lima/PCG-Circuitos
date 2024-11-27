module xor_gate(a, b, s);
    input [7:0] a;       
    input [7:0] b;       
    output [7:0] s;       

    assign s = a ^ b;

endmodule
