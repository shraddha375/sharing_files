`timescale 1ns / 1ps

//`define BINARY
`define GRAY
//`define ONE_HOT

module traffic_light_controller(
    input clk,
    input rst,

    output reg m_red,
    output reg m_yellow,
    output reg m_green,

    output reg s_red,
    output reg s_yellow,
    output reg s_green
    );

    `ifdef BINARY
        localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
        localparam WIDTH = 2;
        (* fsm_encoding = "sequential" *) reg [WIDTH-1:0] current_state, next_state;
    `elsif GRAY
        localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;
        localparam WIDTH = 2;
        (* fsm_encoding = "gray" *) reg [WIDTH-1:0] current_state, next_state;
    `elsif ONE_HOT
        localparam S0 = 4'b0001, S1 = 4'b0010, S2 = 4'b0100, S3 = 4'b1000;
        localparam WIDTH = 4;
        (* fsm_encoding = "one_hot" *) reg [WIDTH-1:0] current_state, next_state;
    `endif

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state; 
    end

    always @(*) begin
        {m_red, m_yellow, m_green} = 3'b000;
        {s_red, s_yellow, s_green} = 3'b000;

        next_state = current_state;

        case (current_state)
            S0 : begin
                next_state = S1;

                {m_red, m_yellow, m_green} = 3'b001;
                {s_red, s_yellow, s_green} = 3'b100;
            end

            S1 : begin
                next_state = S2;
                
                {m_red, m_yellow, m_green} = 3'b010;
                {s_red, s_yellow, s_green} = 3'b100;
            end

            S2 : begin
                next_state = S3;
                
                {m_red, m_yellow, m_green} = 3'b100;
                {s_red, s_yellow, s_green} = 3'b001;
            end

            S3 : begin
                next_state = S0;
                
                {m_red, m_yellow, m_green} = 3'b100;
                {s_red, s_yellow, s_green} = 3'b010;
            end

        endcase
    end

endmodule
