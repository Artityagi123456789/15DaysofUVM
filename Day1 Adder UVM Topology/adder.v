module adder(a,b,sum);
  input logic[3:0]a,b;
  output logic [4:0]sum;
  
  always_comb begin
    sum = a+b;
  end
endmodule



