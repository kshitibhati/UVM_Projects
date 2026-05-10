class ram_base_rseqs extends uvm_sequence #(ram_rtrans);//here we do parameterzied class because we have to show uvm that we just want rtrans
                                                         //property like rd_addr,rd_data,rd_enb etc. which is already declare in rtrans.

   `uvm_object_utils(ram_base_rseqs)

    ram_rtrans trans_h;
   
    function new (string name = "ram_base_rseqs");
       super.new(name);
    endfunction
   
    task body();
      repeat(20) begin
	    trans_h = ram_rtrans::type_id::create("trans_h");
		start_item(trans_h);
		assert(trans_h.randomize());
		finish_item(trans_h);
	  end
	endtask

endclass
		