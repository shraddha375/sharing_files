module clock_divider #(parameter N = 4)(
    input      clk,
    input      rst,
    output reg clk_out
    );

    reg [31:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_out <= 0;
            count   <= 0;
        end
        else begin
            if (count == (N/2 - 1)) begin
                clk_out <= ~clk_out; 
                count   <= 0;
            end
            else begin
                count <= count + 1 ;
            end
        end
    end
    
endmodule