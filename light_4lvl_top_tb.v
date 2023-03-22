`timescale 1ns/1ns
module light_4lvl_top_tb();
reg clk = 0;
reg rst ;
reg btn_up;
reg btn_down;
always clk = #5 ~clk;
light_4lvl_top i_uut
(
	.clk		(clk),
	.reset		(rst),
	.btn_up		(btn_up),
	.btn_down	(btn_down),
	
	.light	()
);
initial begin
	btn_up = 0;
	btn_down = 0;
	rst = 1;
	#11;
	rst = 0;
	
	#100;
	btn_up = 1;
	#100;
	btn_up = 0;
	
	#100;
	btn_up = 1;
	#100;
	btn_up = 0;
	
	#100;
	btn_up = 1;
	#100;
	btn_up = 0;
	
	#100;
	btn_up = 1;
	#100;
	btn_up = 0;
	
	#100;
	btn_up = 1;
	#100;
	btn_up = 0;
	
	#100;
	btn_down = 1;
	#100;
	btn_down = 0;
	
	#100;
	btn_down = 1;
	#100;
	btn_down = 0;
	
	#100;
	btn_down = 1;
	btn_up = 1;
	#100;
	btn_down = 0;
	btn_up = 0;
	
	#100;
	btn_down = 1;
	#100;
	btn_down = 0;
	
	#100;
	btn_down = 1;
	#100;
	btn_down = 0;
	
	#100;
	btn_down = 1;
	#100;
	btn_down = 0;
end

endmodule
