module multi_mode_data_converter(
    output reg [3:0] parallel_out,
    output           serial_r_out,
    output           serial_l_out,

    input      [3:0] parallel_in,
    input            serial_r_in,
    input            serial_l_in,

    input            clk,
    input            rst,

    input      [1:0] sel
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
        if (rst_sync) 
            parallel_out <= 0;
        else begin
            case (sel)
                2'b00 : begin
                    parallel_out <= parallel_out;
                end 
                2'b01 : begin
                    parallel_out <= {serial_l_in, parallel_out[3:1]};
                end
                2'b10 : begin
                    parallel_out <= {parallel_out[2:0], serial_r_in};
                end
                2'b11 : begin
                    parallel_out <= parallel_in;
                end
            endcase
        end
    end

    assign serial_l_out = (sel == 2'b10) ? parallel_out[0] : 0;
    assign serial_r_out = (sel == 2'b10) ? parallel_out[3] : 0;

endmodule