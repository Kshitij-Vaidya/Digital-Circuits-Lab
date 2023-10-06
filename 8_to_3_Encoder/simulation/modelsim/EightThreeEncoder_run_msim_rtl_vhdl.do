transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_2/8_to_3_Encoder/Gates.vhdl}
vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_2/8_to_3_Encoder/DUT.vhdl}
vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_2/8_to_3_Encoder/4_To_2_Encoder.vhdl}
vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_2/8_to_3_Encoder/8_To_3_Encoder.vhdl}

vcom -93 -work work {C:/intelFPGA_lite/18.1/EE214_LabWork/Lab_2/8_to_3_Encoder/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
