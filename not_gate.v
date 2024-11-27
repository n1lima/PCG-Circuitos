module not_gate(a, y);
    input [7:0] a;      
    output [7:0] y;        

    assign y = ~a;

endmodule
