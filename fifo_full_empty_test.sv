class fifo_full_empty_wseqs extends fifo_base_wseqs;

   `uvm_object_utils(fifo_full_empty_wseqs)

    fifo_wtrans trans_h;
	
	bit[3:0]count;
   
    function new (string name = "fifo_full_empty_wseqs");   
       super.new(name);
    endfunction
 
 task body();
  repeat(30) begin
   //`uvm_do(trans);
   //`uvm_do_with(trans with {wr_addr<7;});
   trans_h=fifo_wtrans::type_id::create("trans_h");
   start_item(trans_h);
   //trans_h.ENB.constraint_mode(0);
   assert(trans_h.randomize() with{if(count==4'd15)
								  {wr_enb==0;}
								  else 
								  {wr_enb==1;}});
   count++;
   finish_item(trans_h);
             end
  endtask

endclass

class fifo_full_empty_rseqs extends fifo_base_rseqs;

   `uvm_object_utils(fifo_full_empty_rseqs)

    fifo_rtrans trans_h;
   
    function new (string name = "fifo_full_empty_rseqs");
       super.new(name);
    endfunction
   
    task body();
      repeat(30) begin
	    trans_h = fifo_rtrans::type_id::create("trans_h");
		start_item(trans_h);
		assert(trans_h.randomize());
		finish_item(trans_h);
		
	  end
	endtask

endclass

class fifo_full_empty_test extends fifo_test;
 
  `uvm_component_utils(fifo_full_empty_test)


  fifo_empty_wseqs wseqs_h;
  fifo_empty_rseqs rseqs_h;
  
  function new (string name = "fifo_full_empty_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction

  function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
	 wseqs_h = fifo_empty_wseqs::type_id::create("wseqs_h",this);
	 rseqs_h = fifo_empty_rseqs::type_id::create("rseqs_h",this);
	 fork
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     rseqs_h.start(env_h.ragent_h.rseqr_h);
	 wseqs_h.start(env_h.wagent_h.wseqr_h);
	 join_none
	 
	 //end
	 phase.drop_objection(this);
  endtask
  
endclass		