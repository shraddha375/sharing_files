module pwm_generator #(
    parameter WIDTH = 8  // Resolution of the PWM (e.g., 8-bit gives 0-255 steps)
)(
    input  wire             clk,      // System clock
    input  wire             rst_n,    // Active-low asynchronous reset
    input  wire [WIDTH-1:0] duty,     // Input duty cycle (how long the signal stays HIGH)
    output reg              pwm_out   // The resulting PWM output signal
);

    // Internal counter variable
    reg [WIDTH-1:0] counter;

    // Counter Logic: Continuously counts up, wrapping back to 0 at max value
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    // Comparator Logic: Generates the PWM output signal
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pwm_out <= 1'b0;
        end else begin
            // If the counter is less than the target duty cycle, drive output HIGH.
            // Otherwise, drive it LOW.
            if (counter < duty) begin
                pwm_out <= 1'b1;
            end else begin
                pwm_out <= 1'b0;
            end
        end
    end

endmodule