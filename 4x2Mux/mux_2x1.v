`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 12:52:38 PM
// Design Name: 
// Module Name: mux_2x1
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


module mux_2x1(
input a,b,sel,
output y
    );
    assign y = sel == 0? a : b;
endmodule

module mux4x1(
input [3:0]data,
input [1:0]sel,
output y
);
assign y = sel[0] == 0?(sel[1] == 0? data[0]: data[1]):(sel[1] == 0? data[2]:data[3]); 
endmodule

module mux_4x1(
input wire [3:0]data,
input wire [1:0]sel,
output reg y
);
always@(*)begin
case(sel)
2'b00: y = data[0];
2'b01: y = data[1];
2'b10: y = data[2];
2'b11: y = data[3];
endcase
end
endmodule

module mux_tb;
reg [3:0]data;
reg [1:0]sel;
wire out;

mux4x1 uut(.data(data), .sel(sel), .y(out));

initial begin
data = 4'b1010;
#10
sel = 2'b00;
#10
sel = 2'b01;
#10
sel = 2'b10;
#10
sel = 2'b11;
end

endmodule