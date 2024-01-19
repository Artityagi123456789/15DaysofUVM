class base_test_seq extends uvm_sequence#(adder_tx);
  `uvm_object_utils(base_test_seq)
  adder_tx tx;
  function new(string name="base_test_seq");
    super.new(name);
  endfunction
  
  task body();
    tx=adder_tx::type_id::create("tx");
    
    repeat(5)begin
     // start_sequence_item(tx);
      void'(tx.randomize());
      tx.print();
     // sequence_item_done();
    end
    
  endtask
endclass
