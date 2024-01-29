class mem_mon extends uvm_monitor;
virtual mem_intf vif;
mem_tx tx;

	`uvm_component_utils(mem_mon)

function new(string name,uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	uvm_resource_db#(virtual mem_intf)::read_by_name("GLOBAL","MEMVIF",vif,this);
endfunction

task run_phase(uvm_phase phase);
endtask
endclass
