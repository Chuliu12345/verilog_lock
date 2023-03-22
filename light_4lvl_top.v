module light_4lvl_top
(
	input clk,
	input reset,
	input btn_up,
	input btn_down,
	
	output [1:0] light
);
wire up;
wire down;
lvl2pulse i_btn_up
(
	.reset	(reset),
	.clk	(clk),
	.lvl	(btn_up),
	.pulse	(up)
);
lvl2pulse i_btn_down
(
	.reset	(reset),
	.clk	(clk),
	.lvl	(btn_down),
	.pulse	(down)
);
light_4lvl i_light
(
	.reset		(reset),
	.clk		(clk),
	.btn_up		(up),
	.btn_down	(down),
	.light		(light)
);
endmodule