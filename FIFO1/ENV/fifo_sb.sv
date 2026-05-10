class fifo_sb extends uvm_scoreboard;
`uvm_component_utils(fifo_sb)

//bit [7:0] rm [0:15];

fifo_wrtrans wrtrans_h;
fifo_rdtrans rdtrans_h;

    uvm_tlm_analysis_fifo#(fifo_wrtrans)wmon_an;
    uvm_tlm_analysis_fifo#(fifo_rdtrans)rmon_an;
	int queue [$];
 
  function new (string name = "fifo_sb", uvm_component parent=null);
       super.new(name,parent);
	   wmon_an= new ("wmon_an", this);
	   rmon_an=new("rmon_an",this);
   endfunction
   
     task run_phase(uvm_phase phase);
	 super.run_phase(phase);
     forever
     begin
	 
	 wmon_an.get(wrtrans_h);
	 rmon_an.get(rdtrans_h);
	 ref_model();
	 check_data();
	 end
   endtask
   
   /* task ref_model();
    begin
	 if (wrtrans_h.rd_enb)
	    rdtrans_h.temp_data = rm[rdtrans_h.rd_addr];
	 if (wtrans_h.wr_enb)
	    rm[wrtrans_h.wr_addr] = wrtrans_h.wr_data;
	end
    endtask*/
	  task ref_model();
begin  
 if(wrtrans_h.wr_enb && !rdtrans_h.empty)
  queue.push_back(wrtrans_h.wr_data);
  if(rdtrans_h.rd_enb && !rdtrans_h.full && queue.size()!==0)
  rdtrans_h.temp_data=queue.pop_front();
 
  end 
  endtask
  
  task check_data();
  
        if (rdtrans_h.rd_data !== 0 && rdtrans_h.rd_data !== 8'dx)
		begin
      if (rdtrans_h.rd_data !== rdtrans_h.temp_data)
	      $display(" DATA MISMATCH ! RD_data = %d : %d = temp_data",rdtrans_h.rd_data,rdtrans_h.temp_data);
	  else
          $display(" SUCCESS ! RD_data = %d : %d = temp_data",rdtrans_h.rd_data,rdtrans_h.temp_data);
   end
  endtask
  

  endclass