class fifo_rdagent extends uvm_agent;

`uvm_component_utils(fifo_rdagent)
virtual fifo_if vif;

	fifo_rdmon rmon_h;
	fifo_rdrv  rdr_h;
	fifo_rdseqr rseqr_h;
	
	function new (string name="fifo_rdagent",uvm_component parent=null);
	super.new(name,parent); 
	endfunction
	
	
	function void build_phase(uvm_phase phase);
	super.build_phase(phase); 
	rmon_h=fifo_rdmon::type_id::create("rmon_h",this);
	rdr_h=fifo_rdrv::type_id::create("rdr_h",this);
	rseqr_h=fifo_rdseqr::type_id::create("rseqr_h",this);
	 if (!uvm_config_db#(virtual fifo_if)::get(this,"","vif", vif)) begin
        `uvm_fatal("FIFO_READ_AGENT", "The virtual interface get failed");
	end
	endfunction
	
	function void connect_phase (uvm_phase phase);
   super.connect_phase(phase);
      rdr_h.seq_item_port.connect(rseqr_h.seq_item_export);
	  rdr_h.vif = vif;
	 rmon_h.vif = vif;
   endfunction
   
endclass