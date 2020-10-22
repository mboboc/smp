vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  \
"../../../bd/design_lab1/ip/design_lab1_bus_0_0/sim/design_lab1_bus_0_0.v" \
"../../../bd/design_lab1/ip/design_lab1_i21143_0_0/sim/design_lab1_i21143_0_0.v" \
"../../../bd/design_lab1/sim/design_lab1.v" \


vlog -work xil_defaultlib \
"glbl.v"

