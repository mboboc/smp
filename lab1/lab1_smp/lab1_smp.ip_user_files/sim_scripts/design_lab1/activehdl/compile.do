vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_lab1/ip/design_lab1_bus_0_0/sim/design_lab1_bus_0_0.v" \
"../../../bd/design_lab1/ip/design_lab1_i21143_0_0/sim/design_lab1_i21143_0_0.v" \
"../../../bd/design_lab1/sim/design_lab1.v" \


vlog -work xil_defaultlib \
"glbl.v"

