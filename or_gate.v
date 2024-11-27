module or_gate(a, b, y);

    input [7:0]a;
    input [7:0]b;
    output [7:0]y;

    assign y = a|b;
    
endmodule