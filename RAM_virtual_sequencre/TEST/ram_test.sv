class ram_test extends uvm_test;
 
  `uvm_component_utils(ram_test)
  ram_env env_h;
  ram_base_v_seqs v_seqs_h;
  ram_v_seqr v_seqr_h;
  
  function new (string name = "ram_ragent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   function void build_phase(uvm_build_phase)
   
