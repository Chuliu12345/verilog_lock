module copy_light_4lvl_top
(
    input clk,
    input  rst,
    input button_up,
    input button_down,
    output [1:0] light
);

wire up;
wire down;

lvl2pulse i_button_up
(
    .reset (rst),
    .clk (clk),
    .lvl (button_up),
    .pulse (up)
);

lvl2pulse i_buton_down
(
    .reset (rst),
    .clk (clk),
    .lvl (button_down),
    .pulse (down)
);

copy_light_4lvl i_light
(
    .rst (rst),
    .clk (clk),
    .button_up (up),
    .button_down (down),
    .light (light)
);

endmodule
