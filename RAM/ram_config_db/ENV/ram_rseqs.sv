class ram_base_rseqs extends uvm_sequence #(ram_rtrans);

   `uvm_object_utils(ram_base_rseqs)

    ram_rtrans trans_h;

//--------------------------------------------------------//   
    function new (string name = "ram_base_rseqs");
       super.new(name);
    endfunction

//--------------------------------------------------------//   
    task body();
      repeat(50) begin
	    trans_h = ram_rtrans::type_id::create("trans_h");
		start_item(trans_h);
		assert(trans_h.randomize());
		finish_item(trans_h);
	  end
	endtask:body

endclass:ram_base_rseqs
		