module copy_light_4lvl
(
    input button_up,
    input button_down,
    input clk,
    input rst,
    output reg [1:0] light
);

reg [1:0] state;
reg [1:0] next_state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b11;
parameter S3 = 2'b10;

always @(posedge rst or posedge clk)
begin
    if (rst)
    state <= S0;
    else state <= next_state;
end

always@(*)
begin
	next_state = state;
    case (state)
	S0:begin
		if (button_up & !button_down)
			next_state = S1;
    end
	S1:begin
		if (button_up & !button_down)
			next_state = S2;
		if (!button_up & button_down)
			next_state = S0;
	end
	S2:begin
		if (button_up & !button_down)
			next_state = S3;
		if (!button_up & button_down)
			next_state = S1;
	end
	S3:
		if (!button_up & button_down)
			next_state = S2;
    endcase
end

always @(*)
    case (state)
    S0 : light = 2'b00;
    S1 : light = 2'b01;
    S2 : light = 2'b10;
    S3 : light = 2'b11;
    endcase

endmodule



