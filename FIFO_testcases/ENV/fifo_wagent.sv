class fifo_wagent extends uvm_agent;
`uvm_component_utils(fifo_wagent)

	virtual fifo_if vif;

	fifo_wrmon wmon_h; 
	fifo_wrdrv  wdr_h;
	fifo_wrseqr wseqr_h;
	
	function new (string name="fifo_wagent",uvm_component parent=null);
	super.new(name,parent); 
	endfunction
	
	
	function void build_phase(uvm_phase phase);
	super.build_phase(phase); 
	wmon_h=fifo_wrmon::type_id::create("wmon_h",this);
	wdr_h=fifo_wrdrv::type_id::create("wdr_h",this);
	wseqr_h=fifo_wrseqr::type_id::create("wseqr_h",this);
	 if (!uvm_config_db#(virtual fifo_if)::get(this,"","vif", vif)) begin
        `uvm_fatal("FIFO_WRITE_AGENT", "The virtual interface get failed");
	end
	endfunction
	
	function void connect_phase (uvm_phase phase);
   super.connect_phase(phase);
      wdr_h.seq_item_port.connect(wseqr_h.seq_item_export);
	  wdr_h.vif = vif;
	  wmon_h.vif = vif;
   endfunction
   
endclass