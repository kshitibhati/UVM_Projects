
    class ram_agent extends uvm_agent;

     // Factory Registration
	 `uvm_component_utils(ram_agent)

  // Create the Driver handle
	  driver drvh;

	
//St andard UVM Methods:
extern function new(string name = "ram_agent",uvm_component parent);
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

        function ram_agent::new(string name= "ram_agent",uvm_component parent);
		  super.new(name,parent);
		endfunction

        function void ram_agent::build_phase(uvm_phase phase);
           super.build_phase(phase);
           drvh=driver::type_id::create("drvh",this);	   
            
          `uvm_info("ram_agent","THIS IS BUILD IN AGENT",UVM_MEDIUM)
 	    endfunction
  
       function void ram_agent::connect_phase(uvm_phase phase);
           super.connect_phase(phase);
           `uvm_info("ram_agent","THIS IS CONNECT PHASE IN AGENT",UVM_MEDIUM);
       endfunction


       function void ram_agent::end_of_elaboration_phase(uvm_phase phase);
          super.end_of_elaboration_phase(phase);
         `uvm_info("ram_agent","THIS IS END_OF_ELABORATION PHASE IN AGENT",UVM_MEDIUM);
       endfunction


      function void ram_agent::start_of_simulation_phase(uvm_phase phase);
          super.start_of_simulation_phase(phase);
         `uvm_info("ram_agent","THIS IS START_OF_SIMULATION PHASE IN AGENT",UVM_MEDIUM);
       endfunction

   
	   task ram_agent::run_phase(uvm_phase phase);
         // uvm_test_done.raise_objection(this);
          //#100;
          `uvm_info("ram_agent","This is Run Phase",UVM_LOW)
         // uvm_test_done.drop_objection(this);
       endtask

       function void ram_agent::extract_phase(uvm_phase phase);
          super.extract_phase(phase);
         `uvm_info("ram_agent","This is Extract Phase",UVM_MEDIUM)
       endfunction

       function void ram_agent::check_phase(uvm_phase phase);
          super.check_phase(phase);
         `uvm_info("ram_agent","This is Check Phase",UVM_MEDIUM)
       endfunction

       function void ram_agent::report_phase(uvm_phase phase);
          super.report_phase(phase);
         `uvm_info("ram_agent","This is Report Phase",UVM_MEDIUM)
       endfunction
   
       function void ram_agent::final_phase(uvm_phase phase);
          super.final_phase(phase);
         `uvm_info("ram_agent","This is FINAL Phase",UVM_MEDIUM)
	     `uvm_error("ERROR","ERROR OCCURED SO GO BACK AND CHECK")
	     `uvm_warning("WARNING","WARNING!!!!WARNING!!!WARNING!!!!")
	  //`uvm_fatal("FATAL","FATAL ERROR OCCURED!!BAD HANDLE AND REFERENCE")


       endfunction




