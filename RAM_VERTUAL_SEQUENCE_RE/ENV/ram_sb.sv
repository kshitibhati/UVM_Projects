class ram_sb extends uvm_scoreboard;
	
	ram_wtrans ram_wtrans_h;
	ram_rtrans ram_rtrans_h;
	reg [7:0]rm[0:15];
	
	`uvm_component_utils(ram_sb)
	uvm_tlm_analysis_fifo #(ram_wtrans)an_wfifo;
	uvm_tlm_analysis_fifo #(ram_rtrans)an_rfifo;
	
	function new(string name = "ram_sb",uvm_component parent = null);
		super.new(name,parent);
		an_wfifo= new("an_wfifo" ,this);
		an_rfifo= new("an_rfifo" ,this);
		
	endfunction
	
	task run_phase (uvm_phase phase);
	
			super.run_phase(phase);
			forever begin
			//ram_wtrans_h=new();
			//ram_rtrans_h=new();
			an_wfifo.get(ram_wtrans_h);
			//ram_wtrans_h.print();
			//$display("ram_wtrans_h = %d ",ram_wtrans_h);
			an_rfifo.get(ram_rtrans_h);
			//ram_rtrans_h.print();			
		//	$display("ram_rtrans_h = %d ",ram_rtrans_h);
			//$display("fghj");
			
			ref_model();
			check_data();
			//`uvm_info("ram_sb",$sformatf("ram_wtrans_h =%d",ram_wtrans_h),UVM_MEDIUM)
			//`uvm_info("ram_sb",$sformatf("ram_rtrans_h =%d",ram_rtrans_h),UVM_MEDIUM)
			end
		endtask
		
	task ref_model();

	if (ram_wtrans_h.wr_enb)
	    rm[ram_wtrans_h.wr_addr] = ram_wtrans_h.wr_data;
		
		if (ram_rtrans_h.rd_enb) //
	    ram_wtrans_h.temp_data = rm[ram_rtrans_h.rd_addr];
	
  endtask
  
	task check_data();
	
	if (ram_rtrans_h.rd_data !==0 && ram_rtrans_h.rd_data !==8'dx)
	begin
	if(ram_rtrans_h.rd_data !==ram_wtrans_h.temp_data)
		$display(" DATA MISMATCH ! RD_data = %d : %d = temp_data",ram_rtrans_h.rd_data,ram_wtrans_h.temp_data);
	  else
          $display(" SUCCESS ! RD_data = %d : %d = temp_data",ram_rtrans_h.rd_data,ram_wtrans_h.temp_data);
   end
	endtask
endclass




			
	
