

class driver extends uvm_driver;

///factory registration

  `uvm_component_utils(driver)
  
  
///standard UVM Methods
 extern function new(string name="driver",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern function void end_of_elaboration_phase(uvm_phase phase);
 extern function void start_of_simulation_phase(uvm_phase phase);
 extern task          run_phase(uvm_phase phase);
 extern function void extract_phase(uvm_phase phase);
 extern function void check_phase(uvm_phase phase);
 extern function void report_phase(uvm_phase phase);
 extern function void final_phase(uvm_phase phase);
 
 endclass:driver
 
 
    function driver::new(string name="driver",uvm_component parent);
        super.new(name,parent);
    endfunction

    function void driver::build_phase(uvm_phase phase);
        super.build_phase(phase);
		`uvm_info("DRIVER","THIS IS BUILD PHASE IN DRIVER",UVM_HIGH)
		//`uvm_fatal("FATAL","FATAL ERROR OCCURED!!BAD HANDLE AND REFERENCE")
    endfunction:build_phase

   function void driver::connect_phase(uvm_phase phase);
	    super.connect_phase(phase);
		`uvm_info("DRIVER","THIS IS CONNECT PHASE IN DRIVER",UVM_MEDIUM)
	endfunction:connect_phase
	 
	function void driver::end_of_elaboration_phase(uvm_phase phase);
	    super.end_of_elaboration_phase(phase);
		`uvm_info("DRIVER","THIS IS END OF ELABORATION PHASE IN DRIVER",UVM_MEDIUM)
	endfunction:end_of_elaboration_phase
     
    function void driver::start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info("DRIVER","THIS IS START OF SIMULATION PHASE IN DRIVER",UVM_MEDIUM)
    endfunction:start_of_simulation_phase

    task driver::run_phase(uvm_phase phase);
        super.run();
      //  uvm_test_done.raise_objection(this);
		//#10;
        `uvm_info("DRIVER","THIS IS RUN PHASE IN DRIVER",UVM_MEDIUM)
    	//uvm_test_done.drop_objection(this);	
	endtask:run_phase

 	function void driver:: extract_phase(uvm_phase phase);
		super.extract_phase(phase);
	   `uvm_info("DRIVER","THIS IS EXTRACT PHASE IN DRIVER",UVM_MEDIUM)
   	endfunction


 	function void driver::check_phase(uvm_phase phase);
		super.check_phase(phase);
	   `uvm_info("DRIVER","THIS IS CHECK PHASE IN DRIVER",UVM_MEDIUM)
   	endfunction

	function void driver::report_phase(uvm_phase phase);
		super.report_phase(phase);
	   `uvm_info("DRIVER","THIS IS REPORT PHASE IN DRIVER",UVM_MEDIUM)
   	endfunction
	
	function void driver::final_phase(uvm_phase phase);
		super.final_phase(phase);
	   `uvm_info("DRIVER","THIS IS FINAL PHASE IN DRIVER",UVM_MEDIUM)
       `uvm_error("ERROR","ERROR OCCURED SO GO BACK AND CHECK")
	   `uvm_warning("WARNING","WARNING!!!!WARNING!!!WARNING!!!!")
	   `uvm_fatal("FATAL","FATAL ERROR OCCURED!!BAD HANDLE AND REFERENCE")
    endfunction
