module rra(
input clk, reset,
input [3:0] req,
output reg [3:0] grant
);

reg [1:0] ptr;
integer i;
reg found;

always @(posedge clk or posedge reset)
begin
 if(reset) begin
  ptr <= 0;
  grant <= 0;
 end
 else begin
  grant <= 0;
  found = 0;

  for(i=0; i<4; i=i+1)
   if(!found && req[(ptr+i)%4]) begin
    grant[(ptr+i)%4] <= 1'b1;
    ptr <= (ptr+i+1)%4;
    found = 1;
   end
 end
end
endmodule