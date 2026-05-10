package ram_pkg;
import uvm_pkg ::* ;
`include "uvm_macros.svh"


  `include "ram_wtrans.sv"
  `include "ram_rtrans.sv"
  
  `include "ram_wseqs.sv"
  `include "ram_rseqs.sv"
  
  `include "ram_wseqr.sv"
  `include "ram_rseqr.sv"
 
  `include "ram_wdrv.sv"
  `include "ram_rdrv.sv"
  
  `include "ram_wmon.sv"
  `include "ram_rmon.sv"
  
  `include "ram_wagent.sv"
  `include "ram_ragent.sv"
  
  `include "ram_sb.sv"
  
  `include "ram_env.sv"
 
  
  
endpackage