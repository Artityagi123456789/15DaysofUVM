vlog top.sv \
+incdir+D:/uvm/uvm-1.2/uvm-1.2/src
vsim -novopt \
	-suppress 12110 top \
	-sv_lib C:/questasim64_2021.1/uvm-1.2/win64/uvm_dpi \
	+UVM_TESTNAME=base_test
add wave -position insertpoint sim:/top/pif/*


run -all
