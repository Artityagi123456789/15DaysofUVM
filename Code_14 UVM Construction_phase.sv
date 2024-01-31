//now understand the typical format of how you will be overriding the phases which do not consume time.
//as well as the phases which consumer time.So all the phases which consume a time will be implemented with the task.
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class test extends uvm_test;
  `uvm_component_utils(test)
  
  function new(string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  
 //Construction Phases
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    
    `uvm_info("test","Build Phase Executed", UVM_NONE);
  endfunction
   
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("test","Connect Phase Executed", UVM_NONE);
  endfunction
 
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("test","End of Elaboration Phase Executed", UVM_NONE);
  endfunction
 
    function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("test","Start of Simulation Phase Executed", UVM_NONE);
  endfunction
 
  
  //Main Phases
  
  task run_phase(uvm_phase phase);
    `uvm_info("test", "Run Phase", UVM_NONE);   
  endtask
  
  
  //Cleanup Phases
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    `uvm_info("test", "Extract Phase", UVM_NONE); 
  endfunction
    
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info("test", "Check Phase", UVM_NONE); 
  endfunction
   
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("test", "Report Phase", UVM_NONE); 
  endfunction
  
  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
      `uvm_info("test", "Final Phase", UVM_NONE); 
  endfunction  
endclass
 
module tb;
  
  initial begin
    run_test("test");
  end
endmodule

