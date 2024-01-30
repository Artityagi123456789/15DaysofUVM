//DUT and Interface

module adder(
  input [3:0] a,b,
  output [4:0] y);
   
  assign y = a + b;
  
endmodule
  
interface adder_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] y;
  
endinterface
 


