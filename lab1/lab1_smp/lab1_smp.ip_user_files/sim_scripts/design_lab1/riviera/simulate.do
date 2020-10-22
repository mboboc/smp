onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+design_lab1 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_lab1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_lab1.udo}

run -all

endsim

quit -force
