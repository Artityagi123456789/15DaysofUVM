class adder_env extends uvm_env;  
	adder_agent	agent;
	 
  `uvm_component_utils(adder_env)						// factory registration

	function new(input string name = "env", uvm_component parent);	// component hence two arguments	
		super.new(name,parent);
	endfunction: new 

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
      agent = adder_agent::type_id::create("agent",this);		
	endfunction

	
endclass


