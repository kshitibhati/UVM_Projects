module analysis_fifo();

	import uvm_pkg ::*;
	
	`include "uvm_macros.svh"
	
class trans;

		rand bit[7:0] data;
		rand bit[3:0] address;
		rand bit write;
		
endclass:trans

class monitor extends uvm_monitor;
	
	trans trans_h;
	
		`uvm_component_utils(monitor)
		
		uvm_analysis_port #(trans)an_port;
		
		function new(string name= "monitor", uvm_component parent);
			super.new(name,parent);
			an_port=new("an_port",this);
		endfunction
		
		task run_phase(uvm_phase phase);
			super.run_phase(phase);
			repeat(10) begin
			trans_h=new();
			assert(trans_h.randomize());
			an_port.write(trans_h);
			`uvm_info("monitor", $sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
			end
		endtask
endclass

class sb extends uvm_scoreboard;
			
		trans trans_h;
		
		`uvm_component_utils(sb)
		uvm_tlm_analysis_fifo #(trans)an_fifo;
		
		function new(string name= "sb", uvm_component parent);
		super.new(name,parent);
		an_fifo=new("an_fifo" ,this);
		endfunction
		
		
		task run_phase (uvm_phase phase);
			super.run_phase(phase);
			repeat(10)begin
			//trans_h=new();
			an_fifo.get(trans_h);
			`uvm_info("sb",$sformatf("trans_h =%p",trans_h),UVM_MEDIUM)
			end
		endtask
endclass

class env extends uvm_env;

	`uvm_component_utils(env)
	
	monitor monitor_h;
	sb sb_h;
	
	//uvm_tlm_fifo #(trans)fifo_h;
	
	
	function new(string name="env",uvm_component parent);
	super.new(name,parent);
	//fifo_h=new("fifo_h",this);
	endfunction
	
	function void build_phase(uvm_phase phase);	
			super.build_phase(phase);
			monitor_h=monitor::type_id::create("monitor_h",this);
			sb_h     =sb     ::type_id::create("sb_h",this);
		endfunction
	
		function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
			monitor_h.an_port.connect(sb_h.an_fifo.analysis_export);
			//drv_h.get_port.connect(fifo_h.get_export);
			//fifo_h.put_export.connect(drvh.put_imp);
		endfunction
endclass

initial 
  run_test("env");
endmodule
		

			
		
		
		
			