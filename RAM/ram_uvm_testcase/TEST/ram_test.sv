
class ram_test extends uvm_test;
 
  `uvm_component_utils(ram_test)

  ram_env env_h;

  
  function new (string name = "ram_ragent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction

  function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
  
  
  function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 env_h = ram_env::type_id::create("env_h",this);
   endfunction
  /*
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     rseqs_h.start(env_h.ragent_h.rseqr_h);	 
	 phase.drop_objection(this);
  endtask
  */
endclass