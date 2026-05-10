package ram_pkg;

   import uvm_pkg:: *;
  
  `include "uvm_macros.svh"
  

  `include "ram_wtrans.sv"
  `include "ram_rtrans.sv"
  
  `include "ram_wseqs.sv"
  `include "ram_rseqs.sv"
  `include "ram_rst_seqs.sv"
  
  `include "ram_wseqr.sv"
  `include "ram_rseqr.sv"
  
  `include "ram_wdr.sv"
  `include "ram_rdr.sv"
  
  `include "ram_wmon.sv"
  `include "ram_rmon.sv"
  
  `include "ram_wagent.sv"
  `include "ram_ragent.sv"
  
  `include "ram_sb.sv"
  
  `include "ram_env.sv"
  
  `include "ram_test.sv"
  
  //testcases
    `include "ram_even_addr_test.sv"
	`include "ram_odd_addr_test.sv"
	`include "ram_wr_ctrl_test.sv"
	`include "ram_rst_ctrl_test.sv"
  
  
endpackage