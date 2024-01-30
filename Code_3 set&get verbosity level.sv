`include "uvm_macros.svh"
import uvm_pkg::*;
 
module top;
  
  initial begin
    uvm_top.set_report_verbosity_level(UVM_HIGH);
    $display("Default Verbosity level : %0d ", uvm_top.get_report_verbosity_level);
    `uvm_info("TB_TOP", "String", UVM_HIGH);
  
  end  
endmodule
