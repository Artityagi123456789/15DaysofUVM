class mem_drv extends uvm_driver#(mem_tx);
virtual mem_intf vif;
mem_tx tx;
 
 `uvm_component_utils(mem_drv)

function new(string name,uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
//	super.build_phase(phase);
	uvm_resource_db#(virtual mem_intf)::read_by_name("GLOBAL","MEMVIF",vif,this);
endfunction

task run_phase(uvm_phase phase);
endtask
endclass
