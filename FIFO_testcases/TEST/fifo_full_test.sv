class fifo_full_wseqs extends fifo_base_wrseqs;

   `uvm_object_utils(fifo_full_wseqs)

    fifo_wrtrans trans_h;
   
    function new (string name = "fifo_full_wseqs");   
       super.new(name);
    endfunction
 
 task body();
  repeat(18) begin
   //`uvm_do(trans);
   //`uvm_do_with(trans with {wr_addr<7;});
   trans_h=fifo_wrtrans::type_id::create("trans_h");
   start_item(trans_h);
   //trans_h.ENB.constraint_mode(0);
   assert(trans_h.randomize());
   finish_item(trans_h);
  end
 endtask

endclass

class fifo_full_rseqs extends fifo_base_rdseqs;

   `uvm_object_utils(fifo_full_rseqs)

    fifo_rdtrans trans_h;
   
    function new (string name = "fifo_full_rseqs");
       super.new(name);
    endfunction
   
    task body();
      repeat(18) begin
	    trans_h = fifo_rdtrans::type_id::create("trans_h");
		start_item(trans_h);
		//trans_h.ENB.constraint_mode(0);
		assert(trans_h.randomize());
		finish_item(trans_h);
		
	  end
	endtask

endclass
		
class fifo_full_test extends fifo_test;
 
  `uvm_component_utils(fifo_full_test)


  fifo_full_wseqs wseqs_h;
  fifo_full_rseqs rseqs_h;
  
  function new (string name = "fifo_full_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction

  function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
	 wseqs_h = fifo_full_wseqs::type_id::create("wseqs_h",this);
	 rseqs_h = fifo_full_rseqs::type_id::create("rseqs_h",this);
	 begin
	 $display($time," : *start*");
     wseqs_h.start(env_h.wagent_h.wseqr_h);
	 $display($time," : *first*");
     rseqs_h.start(env_h.ragent_h.rseqr_h);	
     $display($time," : *second*");
     wseqs_h.start(env_h.wagent_h.wseqr_h);
     $display($time," : *last*");	 
	 end
	 
	 phase.drop_objection(this);
  endtask
  
endclass