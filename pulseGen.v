module pulseGen #(parameter WIDTH = 10)(
    input                     clk,
    input                     rst,
    input       [WIDTH-1:0]   N,
    output reg                out
);

    reg [WIDTH-1:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            out   <= 0;
        end 
        else begin
            if (count == N-1) begin
                count <= 0;
                out   <= 1;   
            end 
            else begin
                count <= count + 1;
                out   <= 0;
            end
        end
    end
endmodule
