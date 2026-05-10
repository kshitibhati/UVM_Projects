
class ram_wseqr extends uvm_sequencer #(ram_wtrans);

  `uvm_component_utils(ram_wseqr)
   
   function new (string name = "ram_wseqr", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
endclass