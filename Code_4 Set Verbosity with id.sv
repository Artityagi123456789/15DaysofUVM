`include "uvm_macros.svh"
import uvm_pkg::*;
 
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
//we are calling explacitly task  
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
    `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
  endtask
  
endclass
 
//////////////////// 
module tb;  
 driver drv;

 initial begin
   drv = new("DRV", null);
   drv.set_report_id_verbosity("DRV1",UVM_HIGH);
   //drv.set_report_id_verbosity("DRV2",UVM_HIGH);   
   drv.run();    
  end 

endmodule
