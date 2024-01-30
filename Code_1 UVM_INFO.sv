`include "uvm_macros.svh" //`uvm_info
import uvm_pkg::*;
 
 
 
module top;
  
  initial begin
    #50;
    `uvm_info("TB_TOP","Hello World", UVM_LOW); 
     $display("Hello World with Display");
  end  
endmodule

