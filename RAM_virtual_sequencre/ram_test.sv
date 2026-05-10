  //import ram_pkg::*;

class ram_test extends uvm_test;
 
  `uvm_component_utils(ram_test)

  ram_env env_h;

 // ram_base_wseqs wseqs_h;
 // ram_base_rseqs rseqs_h;
  virtual_sequence_base virt_h;
  ram_virtual_sequencer v_seqr_h;
  
  function new (string name = "ram_ragent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
  function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 env_h = ram_env::type_id::create("env_h",this);
	// wseqs_h = ram_base_wseqs::type_id::create("wseqs_h",this);
	// rseqs_h = ram_base_rseqs::type_id::create("rseqs_h",this);
	 virt_h = virtual_sequence_base::type_id::create("virt_h",this);
   endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
	 fork
   //  wseqs_h.start(env_h.wagent_h.wseqr_h);
   //  rseqs_h.start(env_h.ragent_h.rseqr_h);	
	 virt_h.start(env_h.v_seqr_h);	
	 join	
	 //#500; //  here in uvm we can't give delay because 
	 // in top we use ram_test using ram_test we invoke all the phases
	 // also call $finish so no need to give delay
	 phase.drop_objection(this);
  endtask
  
endclass