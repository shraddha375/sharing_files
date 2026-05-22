module counter #(parameter N = 4) (
    input                  clk,
    input                  rst,    
    input                  en,       
    output reg [N - 1 : 0] out
);

    always @(posedge clk) begin
        if (rst) begin
            out <= 'b0;
        end
        else if (en) begin
            out <= out + 1'b1;
        end
    end

endmodule