vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_splitter_0_0/sim/design_1_splitter_0_0.v" \
"../../../bd/design_1/ip/design_1_REG_0_0/sim/design_1_REG_0_0.v" \
"../../../bd/design_1/ip/design_1_MC68230_0_0/sim/design_1_MC68230_0_0.v" \
"../../../bd/design_1/ip/design_1_Decadd_0_0/sim/design_1_Decadd_0_0.v" \
"../../../bd/design_1/ip/design_1_MC68000_0_1/sim/design_1_MC68000_0_1.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

