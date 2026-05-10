
	class test extends uvm_test;

   // Factory Registration
	`uvm_component_utils(test)

   // Create the agent_top handle
	agent_top agnt_top_h;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
extern function new(string name = "test",uvm_component parent);
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


	function test::new(string name="test", uvm_component parent );
   		super.new(name,parent);
	endfunction

	function void test::build_phase(uvm_phase phase);
		super.build_phase(phase);
		agnt_top_h=agent_top::type_id::create("agnt_top_h",this);
		`uvm_info("test","THIS IS BUILD PHASE IN TEST",UVM_LOW)
	endfunction

	function void test::connect_phase(uvm_phase phase);
      `uvm_info("test","THIS IS CONNECT PHASE IN TEST",UVM_LOW);
   endfunction
 
   function void test::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
	  uvm_top.print_topology();
      `uvm_info("test","THIS IS END_OF_ELABORATION PHASE IN TEST",UVM_LOW);
	  
   endfunction
 
   function void test::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      `uvm_info("test","THIS IS START_OF_SIMULATION PHASE IN TEST",UVM_LOW);
   endfunction

   task test::run_phase(uvm_phase phase);
    uvm_test_done.raise_objection(this);
      #10;
      `uvm_info("test","THIS IS RUN PHASE IN TEST",UVM_LOW)
    uvm_test_done.drop_objection(this);
   endtask


   function void test::extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info("test","THIS IS EXTRACT PHASE IN TEST",UVM_LOW)
   endfunction

   function void test::check_phase(uvm_phase phase);
      super.check_phase(phase);
      `uvm_info("test","THIS IS CHECK PHASE IN TEST",UVM_LOW)
   endfunction

   function void test::report_phase(uvm_phase phase);
      super.report_phase(phase);
      `uvm_info("test","THIS IS REPORT PHASE IN TEST",UVM_LOW)
   endfunction
   
    function void test::final_phase(uvm_phase phase);
      super.final_phase(phase);
      `uvm_info("test","THIS IS FINAL PHASE IN TEST",UVM_LOW)
	  `uvm_error("ERROR","ERROR OCCURED SO GO BACK AND CHECK")
	  `uvm_warning("WARNING","WARNING!!!!WARNING!!!WARNING!!!!")
	  //`uvm_fatal("FATAL","FATAL ERROR OCCURED!!BAD HANDLE AND REFERENCE")


   endfunction



   


   


