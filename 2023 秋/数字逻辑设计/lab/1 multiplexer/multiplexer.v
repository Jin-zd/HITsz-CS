`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/27 11:13:15
// Design Name: 
// Module Name: multiplexer
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


`timescale 1ns / 1ps

module multiplexer (
	input  wire enable,
	input  wire select,
	input  wire [3:0] input_a, input_b,
	output reg  [3:0] led
);

always @ (*) begin
    if (enable == 1) begin
        if (select== 1)
            led = input_a - input_b;
        else
            led = input_a + input_b;
     end
     else led = 4'b1111;
end
endmodule
