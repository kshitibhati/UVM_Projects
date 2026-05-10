class ram_sb extends uvm_scoreboard;

  `uvm_component_utils(ram_sb)
  
  bit [7:0] rm [0:15];
  //bit [7:0] temp_data;
 
  ram_wtrans wtrans_h;
  ram_rtrans rtrans_h;
  
  uvm_tlm_analysis_fifo #(ram_wtrans)w_an_fifoh;
  uvm_tlm_analysis_fifo #(ram_rtrans)r_an_fifoh;
  
  
  function new(string name = "ram_sb",uvm_component parent = null);
    super.new(name,parent);
	w_an_fifoh = new("w_an_fifoh", this);
    r_an_fifoh = new("r_an_fifoh", this);
  endfunction 
  
task run_phase(uvm_phase phase);
   super.run_phase(phase);
   forever
        begin
		w_an_fifoh.get(wtrans_h);
		r_an_fifoh.get(rtrans_h);
		ref_model();
        check_data();
	    end
  endtask		
  
  
  
  task ref_model();
    begin
        if(rtrans_h.rd_enb)
		rtrans_h.temp_data = rm[rtrans_h.rd_addr];
		if(wtrans_h.wr_enb)
		rm[wtrans_h.wr_addr]= wtrans_h.wr_data;	
        
	end
  endtask
  
  task check_data();
  
        if (rtrans_h.rd_data!== 0 && rtrans_h.rd_data !== 8'dx)
		begin
        if (rtrans_h.rd_data !== rtrans_h.temp_data)
	      $display(" DATA MISMATCH ! RD_data = %d : %d = temp_data",rtrans_h.rd_data,rtrans_h.temp_data);
	  else
          $display(" SUCCESS ! RD_data = %d : %d = temp_data",rtrans_h.rd_data,rtrans_h.temp_data);
        end
  endtask
  
endclass
  
  
  
  
  
  
  
  
  
  
  
  