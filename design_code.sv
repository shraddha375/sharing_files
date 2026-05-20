import alu_pkg::*;

module design_code(
    output logic [DATA_WIDTH - 1:0] add_out,
    output logic [DATA_WIDTH - 1:0] sub_out,
    output logic [DATA_WIDTH - 1:0] and_out,
    output logic [DATA_WIDTH - 1:0] or_out,

    input        [DATA_WIDTH - 1:0] in1,
    input        [DATA_WIDTH - 1:0] in2
);

 
    always_comb begin
        add_out = in1 + in2;
        
        sub_out = in1 - in2;

        and_out = in1 & in2;

        or_out  = in1 | in2;
    end 
endmodule
