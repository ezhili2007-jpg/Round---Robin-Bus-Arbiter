`timescale 1ns/1ps

module tb;

reg clk, reset;
reg [3:0] req;
wire [3:0] grant;

rra uut(clk, reset, req, grant);

always #5 clk = ~clk;

initial begin
 $dumpfile("wave.vcd");
 $dumpvars(0,tb);

 $monitor("Time=%0t req=%b grant=%b",
          $time,req,grant);

 clk=0;
 reset=1;
 req=0;

 #10 reset=0;
 #10 req=4'b1111;
 #80 req=4'b0101;
 #80 req=4'b1010;
 #80 req=4'b0000;

 #20 $finish;
end

endmodule