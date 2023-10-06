transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_3/Five_Bit_Prime/Gates.vhdl}
vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_3/Five_Bit_Prime/DUT.vhdl}
vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_3/Five_Bit_Prime/Five_Bit_Prime.vhdl}

vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_3/Five_Bit_Prime/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
