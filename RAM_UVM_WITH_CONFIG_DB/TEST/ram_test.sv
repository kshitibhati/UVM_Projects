
class ram_test extends uvm_test;
 
  `uvm_component_utils(ram_test)

  ram_env env_h;
  
  ram_base_wseqs wseqs_h;
  ram_base_rseqs rseqs_h;
  ram_config cfg_h;

  
  function new (string name = "ram_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction

  function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
  
  
  function void build_phase (uvm_phase phase);
     cfg_h = ram_config::type_id::create("cfg_h",this);
	 cfg_h.is_active=UVM_PASSIVE;//IF YOU WANT TO TURN OFF/ON THE MONITOR DO IT HERE, NO NEED TO CHANGE IN CONFIG DB
	 cfg_h.has_functional_coverage=0;
	 uvm_config_db #(ram_config)::set(this,"*" ,"ram_config",cfg_h);
	 
     super.build_phase(phase);
	 env_h = ram_env::type_id::create("env_h",this);
	 wseqs_h = ram_base_wseqs::type_id::create("wseqs_h",this);
	 rseqs_h = ram_base_rseqs::type_id::create("rseqs_h",this);
	 
   endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     rseqs_h.start(env_h.ragent_h.rseqr_h);	 
	 phase.drop_objection(this);
  endtask
  
endclass