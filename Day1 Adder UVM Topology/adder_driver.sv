class adder_driver extends uvm_driver#(adder_tx);
  virtual adder_intf vif;
  adder_tx tx;
  `uvm_component_utils(adder_driver)
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
 //   super.build_phase(phase);
    tx=adder_tx::type_id::create("tx");    
    uvm_resource_db#(virtual adder_intf)::read_by_name("GLOBAL","VIF",vif,null);
  endfunction
    
      task run_phase(uvm_phase phase);
    	forever begin
          seq_item_port.get_next_item(tx);
          	vif.a <= tx.a;
            vif.b <= tx.b;
            tx.print();
           #10;
          seq_item_port.item_done();
 
        end
      endtask
  
endclass
