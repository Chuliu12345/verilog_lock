`timescale 1ns/1ps
module light_tb();
reg reset;
reg btn;


reg clk = 1'b0;
parameter PERIOD = 10;
always 
	clk = #(PERIOD/2) ~clk;


light i_uut
(
	.clk	(clk),
	.reset	(reset),
	.btn	(btn),
	.light	()
);
initial
begin
	btn = 0;
	reset = 1;
	#21;
	reset = 0;
	#10;
	btn = 1;
	#10;
	btn = 0;
	#100;
	
	btn = 1;
	#500;
	btn = 0;
	#100;
	btn = 1;
	#500;
	btn = 0;
end


endmodule