module cross2 #(parameter N = 8)(
    output [N  :0] out,
    input  [N-1:0] in
);
    assign out = {in, 1'b0};

endmodule

