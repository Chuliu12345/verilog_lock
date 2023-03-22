module light_bug
(
	input reset,
	input clk,
	input btn,
	output reg light
);
parameter LIGHT_ON = 2'b01;
parameter LIGHT_OFF = 2'b10;
reg [1:0] state;
reg [1:0] next_state;

always @ (posedge clk or posedge reset)
begin:sync_proc
	if (reset) begin
		state <= LIGHT_OFF;
	end	else begin
		state <= next_state;
	end
end

always @(*)
begin:next_state_decode
	next_state = state;
	casex(state)
	LIGHT_OFF:
		if (btn)
			next_state = LIGHT_ON;
	LIGHT_ON:
		if (btn)
			next_state = LIGHT_OFF;
	endcase
end
always@(*)
begin
	casex(state)
	LIGHT_OFF:
		light = 1'b0;
	LIGHT_ON:
		light = 1'b1;
	endcase
end
reg [10*8-1:0] state_name;
always@(*)
begin
	casex(state)
	LIGHT_OFF:		state_name = "LIGHT_OFF";
	LIGHT_ON:		state_name = "LIGHT_ON";
	endcase
end
endmodule