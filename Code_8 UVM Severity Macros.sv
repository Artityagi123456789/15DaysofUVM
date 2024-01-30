`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");
     #10;
    `uvm_fatal("DRV", "Simulation cannot continue DRV1");
    #10;
    `uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
  endtask
endclass
 
module top;
  driver drv;
  
  initial begin
    drv = new("DRV", null);
   // drv.set_report_severity_override(UVM_FATAL, UVM_ERROR);
    drv.set_report_severity_id_override(UVM_FATAL, "DRV", UVM_ERROR);
    drv.run();
  end  
endmodule

