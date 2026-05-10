class ram_base_rst_seqs extends uvm_sequence#(ram_wtrans);

   `uvm_object_utils(ram_base_rst_seqs)

    ram_wtrans trans_h;
   
    function new (string name = "ram_base_rst_seqs");
       super.new(name);
    endfunction
	
endclass	