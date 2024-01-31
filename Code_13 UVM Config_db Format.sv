//So this is how we use an, umv_config_db to share the data between the classes.
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class env extends uvm_env;
  `uvm_component_utils(env)
  
  int data;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
    
    if(uvm_config_db#(int):: get(null, "uvm_test_top", "data", data))
      `uvm_info("ENV", $sformatf("Value of data : %0d", data), UVM_NONE)
     else
       `uvm_error("ENV", "Unable to access the Value");
     
    
  endfunction  
endclass
  
 class base_test extends uvm_test;
   `uvm_component_utils(base_test)
  
   env e;
  
   function new(string path = "base_test", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     e = env::type_id::create("e",this);
     
     uvm_config_db#(int)::set(null,"uvm_test_top", "data", 12); ////context + instance name + key + value
     
   endfunction
  
endclass 
 
///////////////////////////
 
module tb;
  
  initial begin
    run_test("base_test");
    
  end  
endmodule
 
  

