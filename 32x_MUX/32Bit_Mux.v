`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 10:21:01 AM
// Design Name: 
// Module Name: 32Bit_Mux
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
module mux2to1(
input wire in0, in1, sel,
output wire out
);
assign out = sel? in1:in0;
endmodule

module mux4to1(
input wire[3:0] in,
input wire[1:0] sel,
output wire out
);
assign out = sel[1] ?(sel[0]?in[3]:in[2] ):(sel[0]?in[1]:in[0]);
endmodule

module mux8to1(
input wire [7:0] in,
input wire [2:0] sel,
output wire out
);
wire out_low, out_high;

mux4to1 m0(.in(in[3:0]),.sel(sel[1:0]),.out(out_low));
mux4to1 m1(.in(in[7:4]),.sel(sel[1:0]),.out(out_high));
mux2to1 m2(.in0(out_low),.in1(out_high),.sel(sel[2]),.out(out));
endmodule

module mux16to1(
input wire[15:0] in,
input wire[3:0] sel,
output wire out
);
wire low, high;

mux8to1 m0(.in(in[7:0]),.sel(sel[2:0]),.out(low));
mux8to1 m1(.in(in[15:8]),.sel(sel[2:0]),.out(high));
mux2to1 m2(.in0(low),.in1(high),.sel(sel[3]),.out(out));

endmodule


module mux32to1(
input wire[31:0] in,
input wire[4:0] sel,
output wire out
);

wire low, high;

mux16to1 m0(.in(in[15:0]), .sel(sel[3:0]), .out(low));
mux16to1 m1(.in(in[31:16]), .sel(sel[3:0]), .out(high));
mux2to1 m2(.in0(high),.in1(low), .sel(sel[4]), .out(out));
endmodule

module tb_32to1mux;
reg [31:0] in;
reg [4:0] sel;
wire out;

mux32to1 uut(
.in(in),
.sel(sel),
.out(out)
);

integer i;

initial begin
in = 32'hA5A5A5A5;
sel = 5'b00000;

$display("==== Starting 32 to 1 MUX Simulation ====");
#10;

for(i = 0; i < 32; i = i + 1)begin
sel = i;
#10;
$display("Time = %0t | sel = %0d(5'b%05b) | Expected bit = %b | Output out = %b", $time, sel, sel, in[i], out);
if(out !== in[i])begin
$display("Error: Index don't match at %0d!", i);
end
end

$display("=== Testing Walking 1 Pattern ===");
for(i = 0; i < 32; i = i + 1)begin
in = (1'b1 << i);
sel = i;
#10;

if(out === 1'b1) 
$display("SUCCESS");
else
$display("Error");
end
$display("=== Simulation Completed ===");
$finish;
end
endmodule

