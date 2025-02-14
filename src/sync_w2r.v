`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2025 21:19:15
// Design Name: 
// Module Name: sync_w2r
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

module sync_w2r #(parameter DEPTH = 8) (
    input wire r_clk,               
    input wire rst_n,              
    input wire [$clog2(DEPTH):0] wptr,  
    output reg [$clog2(DEPTH):0] rsync_ptr2 
);

    
    reg [$clog2(DEPTH):0] rsync_ptr1;

    
    always @(posedge r_clk or negedge rst_n) begin
        if (!rst_n) begin
            rsync_ptr1 <= 'd0;
            rsync_ptr2 <= 'd0;
        end else begin
            rsync_ptr1 <= wptr;
            rsync_ptr2 <= rsync_ptr1;
        end
    end

endmodule
