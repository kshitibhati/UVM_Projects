#Makefile for UVM Testbench
INC = +incdir+../agent_top  +incdir+../TOP +incdir+../test +incdir+../../../src
SVTB1 = ../PKG/pkg.sv
SVTB =  ../TOP/top.sv 

work = work #library name
VSIMOPT= -novopt -sva -sv_seed random -l s.log work.top
VSIMBATCH= -c -do "$(VSIMCOV); run -all; exit"

run_test: lib comp0 run_sim 

lib:
	vlib $(work)
	vmap work $(work)
       
run_sim:
	vsim $(VSIMOPT) $(VSIMBATCH)    

gui:
	vsim $(VSIMOPT)
	
comp0:
	vlog -work $(work)  $(INC) $(SVTB1) $(SVTB) 

sv_cmp: lib comp0

run_gui: lib comp0 gui

set_verbosity:vsim -novopt top -c -do"run -all;exit" +uvm_set_verbosity=UVM_NONE 

