
class ram_env extends uvm_env;

    `uvm_component_utils(ram_env)
	
	ram_wagent wagent_h;
	ram_ragent ragent_h;
    ram_sb     sb_h;
	ram_config cfg_h;
   
   function new (string name = "ram_env", uvm_component parent=null);
    super.new(name,parent);
	cfg_h=new();
   endfunction
   
   function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 wagent_h = ram_wagent::type_id::create("wagent_h",this);
	 ragent_h = ram_ragent::type_id::create("ragent_h",this);
	 if(cfg_h.has_scoreboard)
     sb_h     = ram_sb::type_id::create("sb_h",this);    
   endfunction
   
   function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
	 if(cfg_h.has_scoreboard)begin
	 wagent_h.wmon_h.wmon_an_port.connect(sb_h.w_an_fifoh.analysis_export);
	 ragent_h.rmon_h.rmon_an_port.connect(sb_h.r_an_fifoh.analysis_export);
    end	 
   endfunction	 
  
   
endclass