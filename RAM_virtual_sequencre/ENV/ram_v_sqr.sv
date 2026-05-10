class ram_v_seqr extends uvm_sequencer #(uvm_sequence_item);


  `uvm_component_utils(ram_v_seqr)
   
   function new (string name = "ram_v_seqr", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
endclass 