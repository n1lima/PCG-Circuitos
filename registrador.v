`include "ff_d.v"


module registrador#(parameter N = 8)(CK, D, PR, CLR, Q);


    input CK,  PR, CLR;
    input [N-1:0] D;
    output [N-1:0] Q;


    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin
            ff_d ff (D[i], CK , PR , CLR , Q[i]);
        end
    endgenerate


endmodule

