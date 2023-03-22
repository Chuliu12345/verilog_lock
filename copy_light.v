/*
* 模块连线
* 和电平-脉冲模块连线
* 通过三个always代码块实现
* 第一个always是复位电路
* 第二个是根据脉冲实现的状态转化电路
* 第三个是状态的输出电路
*/
module copy_light
(
    input clk,
    input rst,
    input button,
    output reg light
);

lvl2pulse i_l2p
(
    .clk (clk),
    .reset (rst),
    .lvl (button),
    .pulse (pulse)
);

reg state;
reg next_state;
parameter LIGHT_OFF = 1'b0;
parameter LIGHT_ON = 1'b1;

always @(posedge rst or posedge clk)
begin
    if (rst)
    begin
        state <= LIGHT_OFF;
    end
    else state <= next_state;
end

always @(posedge pulse)
begin
    next_state = state;
    if (pulse)
        next_state = ~state;
end

always @(*)
light = state;
endmodule 




    

