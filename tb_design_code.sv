`include "design_code.sv"
`timescale 1ns/1ps

import alu_pkg::*;

module tb_design_code;
    logic [DATA_WIDTH-1:0] in1_logic;
    logic [DATA_WIDTH-1:0] in2_logic;
    
    // bit [DATA_WIDTH-1:0] in1_bit;
    // bit [DATA_WIDTH-1:0] in2_bit;

    logic [DATA_WIDTH-1:0] add_out;
    logic [DATA_WIDTH-1:0] sub_out;
    logic [DATA_WIDTH-1:0] and_out;
    logic [DATA_WIDTH-1:0] or_out;

    design_code dut (
        .add_out(add_out),
        .sub_out(sub_out),
        .and_out(and_out),
        .or_out(or_out),
        .in1(in1_logic),
        .in2(in2_logic)
    );

    initial begin

        // Test Case 1
        in1_logic = 8'd10;
        in2_logic = 8'd5;

        #5;
        $display("TEST 1");
        $display("in1 = %0d, in2 = %0d", in1_logic, in2_logic);
        $display("ADD = %0d", add_out);
        $display("SUB = %0d", sub_out);
        $display("AND = %0d", and_out);
        $display("OR  = %0d", or_out);

        // Test Case 2
        in1_logic = 8'd20;
        in2_logic = 8'd15;

        #5;
        $display("\nTEST 2");
        $display("in1 = %0d, in2 = %0d", in1_logic, in2_logic);
        $display("ADD = %0d", add_out);
        $display("SUB = %0d", sub_out);
        $display("AND = %0d", and_out);
        $display("OR  = %0d", or_out);

        // Test Case 3
        in1_logic = 8'hF0;
        in2_logic = 8'h0F;

        #5;
        $display("\nTEST 3");
        $display("in1 = %0d, in2 = %0d", in1_logic, in2_logic);
        $display("ADD = %0d", add_out);
        $display("SUB = %0d", sub_out);
        $display("AND = %0d", and_out);
        $display("OR  = %0d", or_out);

        // Test Case 4
        in1_logic = 8'bxxxx1010;
        in2_logic = 8'd5;

        #5;
        $display("\nTEST 4");
        $display("in1 = %0d, in2 = %0d", in1_logic, in2_logic);
        $display("ADD = %0d", add_out);
        $display("SUB = %0d", sub_out);
        $display("AND = %0d", and_out);
        $display("OR  = %0d", or_out);

        // Test Case 5
        in1_logic = 8'bzzzz1111;
        in2_logic = 8'd3;

        #5;
        $display("\nTEST 5");
        $display("in1 = %0d, in2 = %0d", in1_logic, in2_logic);
        $display("ADD = %0d", add_out);
        $display("SUB = %0d", sub_out);
        $display("AND = %0d", and_out);
        $display("OR  = %0d", or_out);

        $finish;
    end
endmodule
