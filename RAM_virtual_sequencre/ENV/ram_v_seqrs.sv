class ram_v_seqr extends uvm_sequencer #(uvm_sequence_item);

`uvm_component_utils(ram_v_seqr) 
ram_wseqr wseqr_h;
ram_rseqr rseqr_h;

function new (string name="ram_v_seqr")
super.new(name);
endfunction

endclass