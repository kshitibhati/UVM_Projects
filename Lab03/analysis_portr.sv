/* we can write drv or gen insted of monitor or sb */
module analysis_port();

	import uvm_pkg ::*;
	
	`include "uvm_macros.svh"
	
class trans;

		rand bit[7:0] data;
		rand bit[3:0] address;
		rand bit write;
		
endclass:trans

class monitor extends uvm_monitor;//insted of writing uvm_monitor you can also write uvm_component
	
	trans trans_h;
	
		`uvm_component_utils(monitor)
		
		uvm_analysis_port #(trans)an_port; //uvm_analysis_port will be fixed for any analysis communiaction
		
		function new(string name= "monitor", uvm_component parent);
			super.new(name,parent);
			an_port=new("an_port",this);
		endfunction
		
		task run_phase(uvm_phase phase);
			super.run_phase(phase);
			repeat(10) begin
			trans_h=new();
			assert(trans_h.randomize());
			`uvm_info("monitor", $sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
			an_por t.write(trans_h);
			end
		endtask
endclass

class sb extends uvm_scoreboard;// you can write uvm_component also
			
		trans trans_h;
		
		`uvm_component_utils(sb)
		//uvm_tlm_analysis_fifo #(trans)an_fifo;
		uvm_analysis_imp#(trans,sb)sb_an_imp;// 
		
		function new(string name= "sb", uvm_component parent);
		super.new(name,parent);
		sb_an_imp=new("sb_an_imp" ,this);
		endfunction
		
		
		/*task run_phase (uvm_phase phase);
			super.run_phase(phase);
			repeat(10)begin
			trans_h=new();
			an_fifo.get(trans_h);
			`uvm_info("sb",$sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
			end
		endtask*/
		function void write(trans trans_h);
		`uvm_info("sb",$sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
		endfunction
endclass


class sub_comp extends uvm_component; // it's a sub component
			
		trans trans_h;
		
		`uvm_component_utils(sub_comp)
		//uvm_tlm_analysis_fifo #(trans)an_fifo;
		uvm_analysis_imp#(trans,sub_comp)sub_comp_an_imp;
		
		function new(string name= "sub_comp", uvm_component parent);
		super.new(name,parent);
		sub_comp_an_imp=new("sub_comp_an_imp" ,this);
		endfunction
		
		
		/*task run_phase (uvm_phase phase);
			super.run_phase(phase);
			repeat(10)begin
			trans_h=new();
			an_fifo.get(trans_h);
			`uvm_info("sb",$sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
			end
		endtask*/
		function void write(trans trans_h);
		`uvm_info("sub_comp",$sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
		endfunction
endclass

class top extends uvm_component;

	`uvm_component_utils(top)
	
	monitor monitor_h;
	sb sb_h;
	sub_comp sub_comp_h;
	
	//uvm_tlm_fifo #(trans)fifo_h;
	
	
	function new(string name="top",uvm_component parent);
	super.new(name,parent);
	//fifo_h=new("fifo_h",this);
	endfunction
	
	function void build_phase(uvm_phase phase);	
			super.build_phase(phase);
			monitor_h=monitor::type_id::create("monitor_h",this);
			sb_h     =sb     ::type_id::create("sb_h",this);
			sub_comp_h=sub_comp::type_id::create("sub_comp",this);
		endfunction
	
		function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
			monitor_h.an_port.connect(sb_h.sb_an_imp);
			monitor_h.an_port.connect(sub_comp_h.sub_comp_an_imp);
			//monitor_h.an_port.connect(sb_h.an_fifo.analysis_export);
			//drv_h.get_port.connect(fifo_h.get_export);
			//fifo_h.put_export.connect(drvh.put_imp);
		endfunction
endclass

initial 
  run_test("top");
endmodule
		

			
		
		
		
			