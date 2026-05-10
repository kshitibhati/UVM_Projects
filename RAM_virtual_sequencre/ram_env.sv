
class ram_env extends uvm_env;

    `uvm_component_utils(ram_env)
	
	ram_wagent wagent_h;
	ram_ragent ragent_h;
	ram_wmon wmon_h;
	ram_rmon rmon_h;
	ram_sb     sb_h;
	ram_virtual_sequencer v_seqr_h;
	ram_wseqr wseqr_h;
	ram_rseqr rseqr_h;
	
	
   function new (string name = "ram_env",uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
   function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 wagent_h = ram_wagent::type_id::create("wagent_h",this);
	 ragent_h = ram_ragent::type_id::create("ragent_h",this);
	 sb_h     = ram_sb::type_id::create("sb_h",this);
	 v_seqr_h = ram_virtual_sequencer::type_id::create("v_seqr_h",this);
   endfunction
   
   function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		wagent_h.wmon_h.an_wport.connect(sb_h.an_wfifo.analysis_export);
		ragent_h.rmon_h.an_rport.connect(sb_h.an_rfifo.analysis_export);

	v_seqr_h.wseqr_h= wagent_h.wseqr_h;
	v_seqr_h.rseqr_h= ragent_h.rseqr_h;
	endfunction
	
   
   
   
endclass