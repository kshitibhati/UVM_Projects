
class ram_ragent extends uvm_agent;

    `uvm_component_utils(ram_ragent)
	
    virtual ram_if vif;
	
	ram_rmon  rmon_h;
	ram_rdr   rdr_h;
	ram_rseqr rseqr_h;
	ram_config cfg_h;
   
   function new (string name = "ram_ragent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
   function void build_phase (uvm_phase phase);
    if (!uvm_config_db#(ram_config)::get(this,"","ram_config", cfg_h))
       `uvm_fatal("CONFIG", "cannot get() cfg_h from uvm_config ");
     super.build_phase(phase);
	 rmon_h = ram_rmon::type_id::create("rmon_h",this);
	 if(cfg_h.is_active==UVM_ACTIVE)
	  begin
	 rdr_h = ram_rdr::type_id::create("rdr_h",this);
	 rseqr_h = ram_rseqr::type_id::create("rseqr_h",this);
	  end
	 if (!uvm_config_db#(virtual ram_if)::get(this,"","vif", vif)) begin
        `uvm_fatal("RAM_READ_AGENT", "The virtual interface get failed");
		end
		endfunction
   
   function void connect_phase (uvm_phase phase);
      super.connect_phase(phase);
	  if(cfg_h.is_active==UVM_ACTIVE)
	  begin
      rdr_h.seq_item_port.connect(rseqr_h.seq_item_export);
	  rdr_h.vif = vif;
	  end
	  rmon_h.vif = vif;
   endfunction
   
endclass