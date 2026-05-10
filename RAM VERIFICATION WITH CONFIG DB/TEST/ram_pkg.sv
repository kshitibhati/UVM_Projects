
package ram_pkg;
   import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  `include "ram_wtrans.sv"
  `include "ram_rtrans.sv"
  `include "ram_wdr.sv"
  `include "ram_rdr.sv"
  `include "ram_wmon.sv"
  `include "ram_rmon.sv" 
  `include "ram_wseqr.sv"
  `include "ram_rseqr.sv"
  `include "ram_wseqs.sv"
  `include "ram_rseqs.sv"


  `include "ram_config.sv"
  `include "ram_wagent.sv"
  `include "ram_ragent.sv"
  
  `include "ram_sb.sv"
  `include "ram_env.sv"
  `include "ram_test.sv"
  
  // here in uvm we call test file in pkg because using run_test it invokes all the phases 
  //`include "ram_top.sv"  
  
endpackage