`timescale 1ns / 1ps

`define BINARY
// `define GRAY
// `define ONE_HOT

module elevator_controller(
    input clk,
    input rst,
    input req1,
    input req2,
    input req3,
    input door_open_sensor,

    output reg motor_up,
    output reg motor_down,
    output reg door_open,
    output reg door_close
    );

    // Decide on the number of states and the type of states
    `ifdef BINARY
        localparam IDLE       = 3'b000,
                   MOVE_UP    = 3'b001,
                   MOVE_DOWN  = 3'b010,
                   OPEN_DOOR  = 3'b011,
                   CLOSE_DOOR = 3'b100;
        localparam WIDTH = 3;
        (* fsm_encoding = "sequential" *) reg [WIDTH-1:0] current_state, next_state;
    `elsif GRAY
        localparam IDLE       = 3'b000,
                   MOVE_UP    = 3'b001,
                   MOVE_DOWN  = 3'b011,
                   OPEN_DOOR  = 3'b010,
                   CLOSE_DOOR = 3'b110;
        localparam WIDTH = 3;
        (* fsm_encoding = "gray" *) reg [WIDTH-1:0] current_state, next_state;
    `elsif ONE_HOT
        localparam IDLE       = 5'b00001,
                   MOVE_UP    = 5'b00010,
                   MOVE_DOWN  = 5'b00100,
                   OPEN_DOOR  = 5'b01000,
                   CLOSE_DOOR = 5'b10000;
        localparam WIDTH = 5;
        (* fsm_encoding = "one_hot" *) reg [WIDTH-1:0] current_state, next_state;
    `endif

    // Giving code to each floor
    localparam REQ1 = 2'd0,
               REQ2 = 2'd1,
               REQ3 = 2'd2;

    // Signals to store the current floor, target floor, and whether the request is valid or not
    reg [1:0] current_floor;
    reg [1:0] target_floor;
    reg       request_valid;

    // Logic that decides what target floor is and when the request is valid
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            target_floor <= REQ1;
            request_valid <= 1'b0;
        end
        else if (current_state == IDLE) begin
            if (req1) begin
                target_floor <= REQ1;
                request_valid <= 1'b1;
            end
            else if (req2) begin
                target_floor <= REQ2;
                request_valid <= 1'b1;
            end
            else if (req3) begin
                target_floor <= REQ3;
                request_valid <= 1'b1;
            end
        end
        else if (current_state == CLOSE_DOOR) begin
            request_valid <= 1'b0;
        end
    end

    // Logic that changes current floor
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_floor <= REQ1;
        else begin
            if (current_state == MOVE_UP && current_floor < REQ3)
                current_floor <= current_floor + 1;
            else if (current_state == MOVE_DOWN && current_floor > REQ1)
                current_floor <= current_floor - 1;
        end
    end

    // Logic that changes current state
    always @(posedge clk) begin
        if (rst) 
            current_state <= IDLE;
        else 
            current_state <= next_state;
    end

    // Logic that decides next state
    always @(*) begin
        next_state = current_state; 

        case (current_state)

            IDLE: begin
                if (request_valid) begin
                    if (target_floor > current_floor)
                        next_state = MOVE_UP;
                    else if (target_floor < current_floor)
                        next_state = MOVE_DOWN;
                    else
                        next_state = OPEN_DOOR;
                end
                else
                    next_state = IDLE;
            end

            MOVE_UP: begin
                if (current_floor == target_floor)
                    next_state = OPEN_DOOR;
                else
                    next_state = MOVE_UP;
            end

            MOVE_DOWN: begin
                if (current_floor == target_floor)
                    next_state = OPEN_DOOR;
                else 
                    next_state = MOVE_DOWN;
            end

            OPEN_DOOR: begin
                if (door_open_sensor)
                    next_state = CLOSE_DOOR;
                else
                    next_state = OPEN_DOOR;
            end

            CLOSE_DOOR: begin
                next_state = IDLE;
            end

        endcase
    end

    // Logic that decides output signals
    always @(*) begin
        {motor_up, motor_down, door_open, door_close} = 4'b0000;

        case (current_state)
            IDLE       : {motor_up, motor_down, door_open, door_close} = 4'b0000;

            MOVE_UP    : {motor_up, motor_down, door_open, door_close} = 4'b1000;

            MOVE_DOWN  : {motor_up, motor_down, door_open, door_close} = 4'b0100;

            OPEN_DOOR  : {motor_up, motor_down, door_open, door_close} = 4'b0010;
            
            CLOSE_DOOR : {motor_up, motor_down, door_open, door_close} = 4'b0001;
        endcase
    end

endmodule
