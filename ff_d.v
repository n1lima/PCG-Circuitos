module ff_d(D,CK,PR,CLR,Q);

    input D, CK, PR, CLR;
    output reg Q;

    always @(negedge CK) begin
        if (PR == 1'b0 && CLR == 1'b1)
            Q = 1'b1;
        else if (PR == 1'b1 && CLR == 1'b0)
            Q = 1'b0;
        else if (PR == 1'b0 && CLR == 1'b0)
            Q = 1'bx;
        else begin
            case(D)
                1'b0: Q = 1'b0;
                1'b1: Q = 1'b1;
            endcase
        end
    end
endmodule