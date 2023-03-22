module light_4lvl
(
	input clk,
	input reset,
	input btn_up,
	input btn_down,
	
	output reg [1:0] light
);
parameter S00 = 4'd1;
parameter S01 = 4'd2;
parameter S10 = 4'd4;
parameter S11 = 4'd8;
reg [3:0] state;
reg [3:0] next_state;

always@(posedge clk or posedge reset)
begin
	if (reset)begin
		state <= S00;
	end else begin
		state <= next_state;
	end
end

always@(*)
begin
	next_state = state;
	case(state)
	S00:
		if (btn_up & !btn_down)
			next_state = S01;
	S01:begin
		if (btn_up & !btn_down)
			next_state = S10;
		if (!btn_up & btn_down)
			next_state = S00;
	end
	S10:begin
		if (btn_up & !btn_down)
			next_state = S11;
		if (!btn_up & btn_down)
			next_state = S01;
	end
	S11:
		if (!btn_up & btn_down)
			next_state = S10;
	endcase
end
always@(*)begin
	case(state)
	S00:light = 2'b00;
	S01:light = 2'b01;
	S10:light = 2'b10;
	S11:light = 2'b11;
	endcase
end

endmodule
	
	