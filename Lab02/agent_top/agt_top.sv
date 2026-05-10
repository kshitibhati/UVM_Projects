

   // Extend agent_top from uvm_env
	class agent_top extends uvm_env;

   // Factory Registration
	`uvm_component_utils(agent_top)
	

 	ram_agent agnth;

//----------------------------------------

// Standard UVM Methods:
extern function new(string name = "agent_top",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void extract_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);
extern function void final_phase(uvm_phase phase);

endclass
	

   	function agent_top::new(string name="agent_top",uvm_component parent);
		super.new(name,parent);
   	endfunction


      	function void agent_top::build_phase(uvm_phase phase);	
		super.build_phase(phase);
		agnth=ram_agent::type_id::create("agnth",this);
	`uvm_info("Agent_Top","THIS IS BUILD PHASE OF agt_top",UVM_MEDIUM)

 	endfunction
   
	
        function void agent_top::connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	`uvm_info("Agent_Top","THIS IS CONNECT PHASE OF agt_top",UVM_MEDIUM)
   	endfunction

	function void agent_top::end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
	`uvm_info("Agent_Top","THIS IS AN END OF ELABORATION OF agt_top",UVM_MEDIUM)
   	endfunction

  
        function void agent_top::start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
	`uvm_info("Agent_Top","THIS IS START OF SIMULATION OF agt_top",UVM_MEDIUM)
   	endfunction



        task agent_top::run_phase(uvm_phase phase);
		super.run();
   // uvm_test_done.raise_objection(this);
		//#200;
		`uvm_info("Agent_Top ","THIS IS RUN PHASE OF agt_top",UVM_MEDIUM)
   // uvm_test_done.drop_objection(this);
   	endtask

 	function void agent_top::extract_phase(uvm_phase phase);
		super.extract_phase(phase);
	`uvm_info("Agent_Top","THIS IS EXTRACT PHASE OF agt_top",UVM_MEDIUM)
   	endfunction


 	function void agent_top::check_phase(uvm_phase phase);
		super.check_phase(phase);
	`uvm_info("Agent_Top","THIS IS CHECK PHASE OF agt_top",UVM_MEDIUM)
   	endfunction


	 function void agent_top::report_phase(uvm_phase phase);
		super.report_phase(phase);
	`uvm_info("Agent_Top","THIS IS REPORT PHASE OF agt_top",UVM_MEDIUM)
   	 endfunction
	 
	 function void agent_top::final_phase(uvm_phase phase);
		super.final_phase(phase);
	`uvm_info("Agent_Top","THIS IS FINAL PHASE OF agt_top",UVM_MEDIUM)
    `uvm_error("ERROR","ERROR OCCURED SO GO BACK AND CHECK")
	`uvm_warning("WARNING","WARNING!!!!WARNING!!!WARNING!!!!")
	//`uvm_fatal("FATAL","FATAL ERROR OCCURED!!BAD HANDLE AND REFERENCE")


   	 endfunction



   
  
   


