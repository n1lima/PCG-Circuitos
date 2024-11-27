`include "subtrator.v"
`include "subtratorCompleto.v"

module subtrator8(a, b, d);

    input [7:0] a, b;   
    output [8:0] d;      
    wire [6:0] c;        

    subtrator u1(a[0], b[0], 1'b0, d[0], c[0]);
    subtratorCompleto u2(a[1], b[1], c[0], d[1], c[1]);
    subtratorCompleto u3(a[2], b[2], c[1], d[2], c[2]);
    subtratorCompleto u4(a[3], b[3], c[2], d[3], c[3]);
    subtratorCompleto u5(a[4], b[4], c[3], d[4], c[4]);
    subtratorCompleto u6(a[5], b[5], c[4], d[5], c[5]);
    subtratorCompleto u7(a[6], b[6], c[5], d[6], c[6]);
    subtratorCompleto u8(a[7], b[7], c[6], d[7], d[8]);

endmodule