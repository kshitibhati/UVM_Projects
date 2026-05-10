class fifo_test extends uvm_test;
//`include "uvm_macros.svh"
 
  `uvm_component_utils(fifo_test)

  fifo_env env_h;

  fifo_base_wrseqs wseqs_h;
  fifo_base_rdseqs rseqs_h;
  
  function new (string name = "fifo_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
    
	function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
	endfunction
   
  function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 env_h = fifo_env::type_id::create("env_h",this);
	 wseqs_h = fifo_base_wrseqs::type_id::create("wseqs_h",this);
	 rseqs_h = fifo_base_rdseqs::type_id::create("rseqs_h",this);
   endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
	 fork
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     rseqs_h.start(env_h.ragent_h.rseqr_h);	
     join	 
	 phase.drop_objection(this);
  endtask
  
endclass