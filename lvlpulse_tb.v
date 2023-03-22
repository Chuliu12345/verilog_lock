`timescale 1ns/1ps
module lvl2pulse_tb();

reg reset;
reg lvl;

reg clk = 1'b0;

parameter PERIOD = 10;

always
    clk = #(PERIOD/2) ~clk;

lvl2pulse i_uut
(
    .reset (reset),
    .clk (clk),
    .lvl (lvl)
);

initial 
begin
    lvl = 0;
    reset = 1;
	#21;
	reset = 0;
	#10;
	lvl = 1;
	#10;
	lvl = 0;
	#100;
	
	lvl = 1;
	#500;
	lvl = 0;
	#100;
	lvl = 1;
	#500;
	lvl = 0;
end


endmodule
