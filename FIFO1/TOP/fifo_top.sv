module fifo_top();

     import uvm_pkg::*;
      import fifo_pkg::*;
   `include "uvm_macros.svh"
    //`include "fifo_test.sv"
  

  bit clk,rst;
  
  fifo_if inf(clk);
  
  //dut instantiation
  fifo dut (.clk(clk),
            .rst(inf.rst),
            .wr_enb(inf.wr_enb),
            .wr_data(inf.wr_data),
            .rd_enb(inf.rd_enb),
            .rd_data(inf.rd_data),
			.full(inf.full),
			.empty(inf.empty));
   //(.wr_addr(inf.wr_addr)
  
  always
   #5 clk = ~clk;
   
   initial begin
   inf.rst = 1;
   #10 
   inf.rst = 0;
   end
   
   
   initial begin
	 uvm_config_db #(virtual fifo_if)::set(null,"*","vif",inf); //set is void type not return any 1bit value
     run_test("fifo_test");
   end
   
endmodule