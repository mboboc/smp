vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr \
"../../../bd/design_lab1/ip/design_lab1_bus_0_0/sim/design_lab1_bus_0_0.v" \
"../../../bd/design_lab1/ip/design_lab1_i21143_0_0/sim/design_lab1_i21143_0_0.v" \
"../../../bd/design_lab1/sim/design_lab1.v" \


vlog -work xil_defaultlib \
"glbl.v"

