//`ifndef ram_wagent
//typedef ram_wagent
class ram_wagent extends uvm_agent;

    `uvm_component_utils(ram_wagent)
	
	virtual ram_if vif;
	
	ram_wmon wmon_h;
	ram_wdr  wdr_h;
	ram_wseqr wseqr_h;
	ram_config cfg_h;
   
   function new (string name = "ram_wagent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
   function void build_phase (uvm_phase phase);
    if (!uvm_config_db#(ram_config)::get(this,"","ram_config", cfg_h))
       `uvm_fatal("CONFIG", "cannot get() cfg_h from uvm_config ");
     super.build_phase(phase);
	 wmon_h = ram_wmon::type_id::create("wmon_h",this);
	 if(cfg_h.is_active==UVM_ACTIVE)
	  begin
	 wdr_h = ram_wdr::type_id::create("wdr_h",this);
	 wseqr_h = ram_wseqr::type_id::create("wseqr_h",this);
	end
	  if (!uvm_config_db#(virtual ram_if)::get(this,"","vif", vif)) begin
        `uvm_fatal("RAM_WRITE_AGENT", "The virtual interface get failed");
		end


   endfunction
   
   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
	  if(cfg_h.is_active==UVM_ACTIVE)
	  begin
      wdr_h.seq_item_port.connect(wseqr_h.seq_item_export);
	  wdr_h.vif = vif;
	  end
	  wmon_h.vif = vif;
   endfunction
   
endclass