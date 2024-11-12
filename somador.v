module somador(a,b,s,c);

    input a,b;
    output c,s;

    assign s = a ^ b;
    assign c = a & b;
    
endmodule

