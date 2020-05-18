`timescale 1ns / 1ps
/*
Copyright © 2020 Ali Shuja Siddiqui <asiddiq6@uncc.edu>

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in the 
Software without restriction, including without limitation the rights to use, copy,
 modify, merge, publish, distribute, sublicense, and/or sell copies of the 
 Software, and to permit persons to whom the Software is furnished to do so,
  subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
*/
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2020 12:35:57 PM
// Design Name: 
// Module Name: round
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
`include "utility.vh"

module round #(parameter n=`N, m=`M)
    (x, k, y);
    input [(2*n)-1:0] x;
    input [(n-1):0] k;
    output [(2*n)-1:0] y;
    wire [n-1:0] x_0, x_1, rol_1, rol_8, rol_2;
    
    assign x_0 = x[n-1:0];
    assign x_1 = x[(2*n)-1-:n];
    
    assign y[n-1:0] = x_1;
    
    assign rol_1 = {x_1[0+:(n-1)], x_1[n-1]};
    assign rol_2 = {x_1[0+:(n-2)], x_1[n-1-:2]};
    assign rol_8 = {x_1[0+:(n-8)], x_1[n-1-:8]};
    
    assign y[(2*n)-1-:n] = (((rol_1 & rol_8) ^ x_0) ^ rol_2) ^ k;
endmodule
