class fifo_full_empty_wrseqs extends fifo_base_wrseqs;

   `uvm_object_utils(fifo_full_empty_wrseqs)

    fifo_wrtrans trans_h;
	bit [4:0] count;
   
    function new (string name = "fifo_full_empty_wrseqs");   
       super.new(name);
    endfunction
 
 task body();
  repeat(30) 
   begin
   trans_h=fifo_wrtrans::type_id::create("trans_h");
   start_item(trans_h);
   assert(trans_h.randomize()with{if(count==4'd16)
								  {wr_enb==0;}
								  else 
								  {wr_enb==1;}});
   count++;
   finish_item(trans_h);
   end

  
 endtask

endclass

class fifo_full_empty_rdseqs extends fifo_base_rdseqs;

   `uvm_object_utils(fifo_full_empty_rdseqs)

    fifo_rdtrans trans_h;
   
    function new (string name = "fifo_full_empty_rdseqs");
       super.new(name);
    endfunction
   
    task body();
      repeat(30) 
	  begin
	    trans_h = fifo_rdtrans::type_id::create("trans_h");
		start_item(trans_h);
		//trans_h.ENB.constraint_mode(0);
		assert(trans_h.randomize());
		finish_item(trans_h);
		
	  end
	endtask

endclass
		
class fifo_full_empty_test extends fifo_test;
 
  `uvm_component_utils(fifo_full_empty_test)


  fifo_full_empty_wrseqs wseqs_h;
  fifo_full_empty_rdseqs rseqs_h;
  
  function new (string name = "fifo_full_empty_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction

  function void end_of_elaboration_phase (uvm_phase phase);
     uvm_top.print_topology();
  endfunction
  
  task run_phase (uvm_phase phase);
     phase.raise_objection(this);
	 //creates sequences
	 wseqs_h = fifo_full_empty_wrseqs::type_id::create("wseqs_h",this);
	 rseqs_h = fifo_full_empty_rdseqs::type_id::create("rseqs_h",this);
	 begin
	 
     wseqs_h.start(env_h.wagent_h.wseqr_h);
	 rseqs_h.start(env_h.ragent_h.rseqr_h);	
     wseqs_h.start(env_h.wagent_h.wseqr_h);
	 rseqs_h.start(env_h.ragent_h.rseqr_h);
	 rseqs_h.start(env_h.ragent_h.rseqr_h);
     	 
	 end
	 
	 phase.drop_objection(this);
  endtask
  
endclass