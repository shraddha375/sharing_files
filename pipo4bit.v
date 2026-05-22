module pipo4bit(
    input  [3:0] in,
    input        rst,
    input        clk,
    output reg [3:0] out
);

    wire rst_sync;
    reg dff0;
    reg dff1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dff0 <= 1'b1;
            dff1 <= 1'b1;
        end
        else begin
            dff0 <= rst;
            dff1 <= dff0;
        end
    end

    assign rst_sync = dff1;

    always @(posedge clk or posedge rst_sync) begin
        if (rst_sync) begin
            out <= 4'b0000;
        end
        else begin
            out <= in;
        end
    end

endmodule