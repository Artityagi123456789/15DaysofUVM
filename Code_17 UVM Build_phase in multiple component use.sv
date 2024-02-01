`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
 
class driver extends uvm_driver;
  `uvm_component_utils(driver) 
  
  
  function new(string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("driver","Driver Build Phase Executed", UVM_NONE);  
  endfunction
  
endclass
 
///////////////////////////////////////////////////////////////
 
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor) 
  
  
  function new(string path = "monitor", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("monitor","Monitor Build Phase Executed", UVM_NONE); 
  endfunction
  
endclass
 
////////////////////////////////////////////////////////////////////////////////////
 
class env extends uvm_env;
  `uvm_component_utils(env) 
  
  driver drv;
  monitor mon;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("env","Env Build Phase Executed", UVM_NONE);
    drv = driver::type_id::create("drv", this);
    mon = monitor::type_id::create("mon", this);
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
    `uvm_info("test","Test Build Phase Executed", UVM_NONE);
    e = env::type_id::create("e", this);
  endfunction
  
endclass
 
///////////////////////////////////////////////////////////////////////////
module tb;
  
  initial begin
    run_test("test");
  end
  
 
endmodule

