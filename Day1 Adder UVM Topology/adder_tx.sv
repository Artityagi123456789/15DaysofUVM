class adder_tx extends uvm_sequence_item;
 	rand logic [3:0]a;
 	rand logic [3:0]b;
  		logic [4:0]sum;
  
  `uvm_object_utils_begin(adder_tx)
  		`uvm_field_int(a,UVM_ALL_ON)
        `uvm_field_int(b,UVM_ALL_ON)
        `uvm_field_int(sum,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name="Adder_Tx");
    super.new(name);
  endfunction
  
endclass
