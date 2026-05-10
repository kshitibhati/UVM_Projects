class virtual_sequence_base extends uvm_sequence #(uvm_sequence_item);

`uvm_object_utils(virtual_sequence_base)

   ram_virtual_sequencer v_seqr_h;
   ram_wseqr wseqr_h; // handle of sequencer
   ram_rseqr rseqr_h;
   ram_base_wseqs wseqs_h;
   ram_base_rseqs rseqs_h;
   
   
   function new(string name = "virtual_sequence_base");
   super.new(name);
   endfunction
   task body();
   
   wseqs_h = ram_base_wseqs::type_id::create("wseqs_h");
   rseqs_h = ram_base_rseqs::type_id::create("rseqs_h");
        if(!$cast(v_seqr_h, m_sequencer))
	   begin
	   `uvm_error(get_full_name(), "Virtual Sequencer pointer cast failed");
	   end
	   
	  wseqr_h= v_seqr_h.wseqr_h;
	  rseqr_h= v_seqr_h.rseqr_h;
	   
	   
		wseqs_h.start(v_seqr_h.wseqr_h);
		rseqs_h.start(v_seqr_h.rseqr_h);
	   
	  
	endtask
endclass   
   