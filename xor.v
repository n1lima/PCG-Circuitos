module xor (a, b, s);
    input [7:0] a;       
    input [7:0] b;       
    output [7:0] y;       

    assign s = a ^ b;

endmodule
