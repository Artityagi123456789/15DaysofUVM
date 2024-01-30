/////////////////////////Testbench Environment

 
`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class drv extends uvm_driver;
  `uvm_component_utils(drv)
 
  virtual adder_if aif;
 
  function new(input string path = "drv", uvm_component parent = null);
    super.new(path,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    if(!uvm_config_db#(virtual adder_if)::get(this,"","aif",aif))//uvm_test_top.env.agent.drv.aif
      `uvm_error("drv","Unable to access Interface");
  endfunction
  
   virtual task run_phase(uvm_phase phase);
     phase.raise_objection(this);
     for(int i = 0; i< 10; i++)
      begin
        aif.a <= $urandom;
        aif.b <= $urandom;
        #10;
      end
     phase.drop_objection(this);
   endtask
 
endclass
  
class agent extends uvm_agent;
`uvm_component_utils(agent)
 
  function new(input string inst = "agent", uvm_component c);
super.new(inst,c);
endfunction
 
 drv d;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  d = drv::type_id::create("drv",this);
endfunction
 
endclass
 
///////////////////////////////////////////////////////////////////////
 
class env extends uvm_env;
`uvm_component_utils(env)
 
  function new(input string inst = "env", uvm_component c);
super.new(inst,c);
endfunction
 
agent a;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a = agent::type_id::create("agent",this);
endfunction
 
endclass
 
 
//////////////////////////////////////////////////////////////////
class test extends uvm_test;
`uvm_component_utils(test)
 
  function new(input string inst = "test", uvm_component c);
super.new(inst,c);
endfunction
 
env e;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  e = env::type_id::create("env",this);
endfunction
 
 
endclass
 
 
////////////////////////////////////////////////////////////////////
module tb;
 
  adder_if aif();
  
  adder dut (.a(aif.a), .b(aif.b), .y(aif.y));
 
initial 
  begin
  uvm_config_db #(virtual adder_if)::set(null, "uvm_test_top.env.agent.drv", "aif", aif);
  run_test("test"); 
  end
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
 
 
 
 
 
 
