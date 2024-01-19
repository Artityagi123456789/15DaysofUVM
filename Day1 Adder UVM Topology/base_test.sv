class base_test extends uvm_test;
	
	adder_env env;					
  
	`uvm_component_utils(base_test)		// factory registration

	function new(input string name = "base_test",uvm_component parent = null);	// component hence two arguments	
		super.new(name,parent);
	endfunction: new


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = adder_env::type_id::create("env",this);					// creating an objects for env and generator(sequence)
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();	
	endfunction
		
   task run_phase(uvm_phase phase);
	 base_test_seq test_seq;
		test_seq = base_test_seq::type_id::create("test_seq");				    
		phase.raise_objection(this);	 	
			test_seq.start(env.agent.sqr);						
		phase.drop_objection(this);							
	endtask	
									
endclass




