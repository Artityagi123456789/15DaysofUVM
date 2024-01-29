class mem_env extends uvm_env;
mem_agent agent;

	`uvm_component_utils(mem_env)

function new(string name ,uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	agent = mem_agent::type_id::create("agent",this);
endfunction
endclass
