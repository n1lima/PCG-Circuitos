module tristate (a, b, en);

input [7:0] a;
input en;
output reg [7:0] b;
always@(*) begin
    if(en)
        b = a;
    else
        b = 8'bzzzzzzzz;
end

endmodule