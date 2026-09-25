`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 07:29:46 PM
// Design Name: 
// Module Name: FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//FSM CODE FOR 11

module fsm_adder(
input wire clk,
input wire reset,
input wire X,
output reg S,
output reg V
);
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6;
reg[2:0] state, nextstate;
always@(negedge clk or posedge reset)begin
if(reset)
state <= 0;
else
state <= nextstate;
end
always@(*)begin
nextstate = state;
S = 1'b0;
V = 1'b0;
case(state)
S0:begin
if(X)begin
nextstate = S2;
S = 1'b1;
V = 1'b0;
end else begin
nextstate = S1;
S = 1'b0;
V = 1'b0;
end
end
S1: begin
if(X) begin
nextstate = S3;
S = 1'b0;
V = 1'b0;
end else begin
nextstate = S4;
S = 1'b1;
V = 1'b0;

end
end
S2:begin
if(X)begin
nextstate = S4;
S = 1'b1;
V = 1'b0;
end else begin
nextstate = S4;
S = 1'b0;
V = 1'b0;
end
end
S3:begin
if(X)begin
nextstate = S5;
S = 1'b1;
V = 1'b0;
end else begin
nextstate = S5;
S = 1'b0;
V = 1'b0;
end
end

S4:begin
if(X)begin
nextstate = S6;
S = 1'b0;
V = 1'b0;
end else begin
nextstate = S5;
S = 1'b1;
V = 1'b0;
end
end

S5:begin
if(X)begin
nextstate = S0;
S = 1'b1;
V = 1'b0;

end else begin
nextstate = S0;
S = 1'b0;
V = 1'b0;
end
end
S6:begin
if(X)begin
nextstate = S0;
S = 1'b0;
V = 1'b1;
end else begin
nextstate = S0;
S = 1'b1;
V = 1'b0;
end
end
endcase
end
endmodule

module fsm_adder_tb;

reg clk;
reg reset;
reg X;
wire S;
wire V;

fsm_adder uut(.clk(clk),.reset(reset),.X(X),.S(S),.V(V));

always #5 clk = ~clk;
reg [11:0] test_code = 12'b1101_1100_1011;
integer i;

initial begin
clk = 0;

reset = 1;
X = 0;

#15
reset = 0;

for(i = 0; i < 12;i = i + 1)begin
@(posedge clk);
X = test_code[i];
end
end
endmodule