module timing_recovery(
    input clk,reset,
    input signed [17:0] x_in,
    output reg trig
);
reg signed [17:0] max_hold;

always @ *
if(reset)
max_hold <= 18'sd0;
else if()

always @ (posedge clk)
if(x_in > max_hold)
trig <= 1'b1;
else
trig <= 1'b0;


endmodule