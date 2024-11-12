module somadorCompleto(a, b, c_in, s, c_out);

    input a, b, c_in;
    output s, c_out;

    assign s = a ^ b ^ c_in;
    assign c_out = b&c_in | a&c_in | a&b;

endmodule