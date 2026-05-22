create_clock -name sys_clk -period 10 [get_ports clk]

#get pins <macros>_reg/Q
create_generated_clock -name CLKPDIV4 -source clk -divide_by 4 [get_pins cd0/clk_out_reg/Q] 
#create_generated_clock -name CLKPDIV4 -source clk -divide_by 4 [get_pins cd0/clk_out_net/Q] if its an internal signal

