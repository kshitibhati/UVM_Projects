class ram_odd_wseqs extends ram_base_wseqs;

   `uvm_object_utils(ram_odd_wseqs)

    ram_wtrans trans_h;
   
    function new (string name = "ram_odd_wseqs");
       super.new(name);
    endfunction
 
 task body();
  repeat(30) begin
   //`uvm_do(trans);
   //`uvm_do_with(trans with {wr_addr<7;});
   trans_h=ram_wtrans::type_id::create("trans_h");
   start_item(trans_h);
   assert(trans_h.randomize() with  {wr_addr%2==1 -> wr_data > 150;});
   finish_item(trans_h);
  end
 endtask

endclass

class ram_odd_rseqs extends ram_base_rseqs;

   `uvm_object_utils(ram_odd_rseqs)

    ram_rtrans trans_h;
   
    function new (string name = "ram_odd_rseqs");
       super.new(name);
    endfunction
   
    task body();
      repeat(30) begin
	    trans_h = ram_rtrans::type_id::create("trans_h");
		start_item(trans_h);
		assert(trans_h.randomize());
		finish_item(trans_h);
		
	  end
	endtask

endclass
		
		
		

class ram_odd_addr_test extends ram_test;
 
  `uvm_component_utils(ram_odd_addr_test)


  ram_odd_wseqs wseqs_h;
  ram_odd_rseqs rseqs_h;
  
  function new (string name = "ram_odd_addr_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction

  function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
	 wseqs_h = ram_odd_wseqs::type_id::create("wseqs_h",this);
	 rseqs_h = ram_odd_rseqs::type_id::create("rseqs_h",this);
	 fork
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     rseqs_h.start(env_h.ragent_h.rseqr_h);	 
	 join
	 phase.drop_objection(this);
  endtask
  
endclass
		
		