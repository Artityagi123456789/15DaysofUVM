`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
 
 
///////////////////////////////////////////////////////////////
 
class driver extends uvm_driver;
  `uvm_component_utils(driver) 
  
  
  function new(string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("driver","Driver Connect Phase Executed", UVM_NONE);
  endfunction
  
endclass
 
///////////////////////////////////////////////////////////////
 
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor) 
  
  
  function new(string path = "monitor", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("monitor","Monitor Connect Phase Executed", UVM_NONE);   
  endfunction
  
endclass
 
////////////////////////////////////////////////////////////////////////////////////
 
class env extends uvm_env;
  `uvm_component_utils(env) 
  
  driver d;
  monitor m;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    d = driver::type_id::create("d", this);
    m = monitor::type_id::create("m", this);
  endfunction
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("env","Env Connect Phase Executed", UVM_NONE);
  endfunction
  
endclass
 
 
 
////////////////////////////////////////////////////////////////////////////////////////
 
class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  
  function new(string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = env::type_id::create("e", this);
  endfunction
    
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("test","Test Connect Phase Executed", UVM_NONE);
  endfunction
  
endclass
 
///////////////////////////////////////////////////////////////////////////
module tb;
  
  initial begin
    run_test("test");
  end
  
 
endmodule

