module zero15filter(
input clk, reset,
input signed [17:0] x_in,
output reg signed [17:0] match_strength_i,
output reg match
);
reg signed [17:0] x[224:0];
integer i;
reg xor0,xor16,xor32,xor48,xor64,xor80,xor96,xor112,xor128,xor144,xor160,xor176,xor192,xor208,xor224;

always @ (posedge clk)
x[0] <= x_in>>>4;

always @ (posedge clk)
for(i = 1; i <225; i = i+1)
x[i] <= x[i-1];


-0,-16,-32,-48,64,-80,96,-112,-128,144,160,-176,192,208,224

always @ *
match_strength_i <= -x[0]-x[16]-x[32]-x[48]+x[64]-x[80]+x[96]-x[112]-x[128]+x[144]+x[160]-x[176]+x[192]+x[208]+x[224];

always @ *
xor0<= !(x[0]^1);
always @ *
xor16<= !(x[16]^1);
always @ *
xor32<= !(x[32]^1);
always @ *
xor48<= !(x[48]^1);
always @ *
xor64<= !(x[64]^0);
always @ *
xor80<= !(x[80]^1);
always @ *
xor96<= !(x[96]^0);
always @ *
xor112<= !(x[112]^1);
always @ *
xor128<= !(x[128]^1);
always @ *
xor144<= !(x[144]^0);
always @ *
xor160<= !(x[160]^0);
always @ *
xor176<= !(x[176]^1);
always @ *
xor192<= !(x[192]^0);
always @ *
xor208<= !(x[208]^0);
always @ *
xor224<= !(x[224]^0);


always @ *
match <= xor0&xor16&xor32&xor48&xor64&xor80&xor96&xor112&xor128&xor144&xor160&xor176&xor192&xor208&xor224;

endmodule