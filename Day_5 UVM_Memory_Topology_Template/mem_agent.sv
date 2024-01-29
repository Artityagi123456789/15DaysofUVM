class mem_agent extends uvm_agent;
mem_drv drv;
mem_sqr sqr;
mem_cov cov;
mem_mon mon;

	`uvm_component_utils(mem_agent)

function new(string name,uvm_component parent);
	super.new(name,parent);
endfunction 

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv=mem_drv::type_id::create("drv",this);
	sqr=mem_sqr::type_id::create("sqr",this);
	cov=mem_cov::type_id::create("cov",this);
	mon=mem_mon::type_id::create("mon",this);
endfunction
endclass
	


