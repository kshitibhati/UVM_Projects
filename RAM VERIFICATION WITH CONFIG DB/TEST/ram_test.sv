  //import ram_pkg::*;
  import ram_pkg::*;
  import uvm_pkg::*;
	 

   `include "uvm_macros.svh"

class ram_test extends uvm_test;
 
  `uvm_component_utils (ram_test)

  ram_env env_h;
  ram_config tb_cfg;

  ram_base_wseqs wseqs_h;
  ram_base_rseqs rseqs_h;
  
  function new (string name = "ram_ragent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
   
  function void build_phase (uvm_phase phase);
     tb_cfg =ram_config::type_id::create("tb_cfg");
	 tb_cfg.is_active= UVM_ACTIVE;
	 tb_cfg.has_functional_coverage =0;
	 tb_cfg.has_scoreboard          =0;
	 uvm_config_db #(ram_config)::set(this,"*" ,"ram_config",tb_cfg);
	 
     super.build_phase(phase);
	 env_h = ram_env::type_id::create("env_h",this);
	 wseqs_h = ram_base_wseqs::type_id::create("wseqs_h");
	 rseqs_h = ram_base_rseqs::type_id::create("rseqs_h");
   endfunction
  
  task run_phase (uvm_phase phase);  
     phase.raise_objection(this);
	 //creates sequences
	 //fork
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     rseqs_h.start(env_h.ragent_h.rseqr_h);	 
	 //join	
	 //#500; //  here in uvm we can't give delay because 
	 // in top we use ram_test using ram_test we invoke all the phases
	 // also call $finish so no need to give delay
	 phase.drop_objection(this);
  endtask
  
endclass