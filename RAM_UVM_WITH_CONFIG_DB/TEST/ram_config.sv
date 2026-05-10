class ram_config extends uvm_object;

   `uvm_object_utils(ram_config)
	
	virtual ram_if vif;
	uvm_active_passive_enum is_active=UVM_PASSIVE;
	bit has_functional_coverage =0;
	bit has_scoreboard =1;
	
	
	function new(string name="ram_config");
	super.new(name);
	endfunction
	
endclass
	
	