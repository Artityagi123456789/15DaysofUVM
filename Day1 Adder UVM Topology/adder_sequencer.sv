class adder_sequencer extends uvm_sequencer#(adder_tx);
  `uvm_component_utils(adder_sequencer)
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction
endclass
