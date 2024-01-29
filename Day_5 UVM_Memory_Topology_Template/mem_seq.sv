class mem_seq extends uvm_sequence#(mem_tx);
//mem_tx tx;

	`uvm_object_utils(mem_seq)

function new(string name, uvm_component parent);
	super.new(name,parent);
endfunction

task body();
	`uvm_do_with(req,{req.wr_rd==1'b1;});
//	$cast(tx,req);
	`uvm_do_with(req,{req.wr_rd==1'b0;});
endtask
endclass


