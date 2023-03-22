module lvl2pulse
(
	input reset,
	input clk,
	input lvl,
	output reg pulse
);
parameter LOW = 2'b00;
parameter EDGE = 2'b01;
parameter HIGH = 2'b11;
reg [1:0] state;
reg [1:0] next_state;

always @ (posedge clk or posedge reset)
begin:sync_proc
	if (reset) begin
		state <= LOW;
	end	else begin
		state <= next_state;
	end
end
always @(*)
begin
	next_state = state;
	casex(state)
	LOW:
		if (lvl)
			next_state = EDGE;
	EDGE:
		if (lvl)
			next_state = HIGH;
		else
			next_state = LOW;
	HIGH:
		if (!lvl)
			next_state = LOW;
	endcase
end
always @(*)
begin
	casex (state)
	EDGE:
		pulse = 1'b1;
	default:
		pulse = 1'b0;
	endcase
end
endmodule