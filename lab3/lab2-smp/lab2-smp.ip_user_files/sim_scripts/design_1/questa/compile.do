vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../bd/design_1/ip/design_1_mpc106fsm_0_0_1/sim/design_1_mpc106fsm_0_0.v" \
"../../../bd/design_1/ip/design_1_powerpcfsm_0_0_1/sim/design_1_powerpcfsm_0_0.v" \
"../../../bd/design_1/ip/design_1_mx9_sdram_0_0_1/sim/design_1_mx9_sdram_0_0.v" \
"../../../bd/design_1/ip/design_1_split1_0_0_1/sim/design_1_split1_0_0.v" \
"../../../bd/design_1/ip/design_1_split2_0_0_1/sim/design_1_split2_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

