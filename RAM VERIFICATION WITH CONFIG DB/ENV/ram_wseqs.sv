class ram_base_wseqs extends uvm_sequence #(ram_wtrans); // here we do parameterzied class because 


   `uvm_object_utils(ram_base_wseqs)

    ram_wtrans trans_h;
   
    function new (string name = "ram_base_wseqs");
       super.new(name);
    endfunction
   
    task body();
      repeat(50) begin
	    //`uvm_do(trans);
		//`uvm_do_with(trans with {wr_addr<7;});
	    trans_h = ram_wtrans::type_id::create("trans_h");
		start_item(trans_h); // to indicat that now randomization will start
		assert(trans_h.randomize());
		finish_item(trans_h);
	  end
	endtask

endclass
		