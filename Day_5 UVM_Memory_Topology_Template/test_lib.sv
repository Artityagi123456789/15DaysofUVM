class mem_test extends uvm_test;
mem_env env;

	`uvm_component_utils(mem_test)

function new(string name,uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	env= mem_env::type_id::create("env",this);
endfunction	

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

endclass

