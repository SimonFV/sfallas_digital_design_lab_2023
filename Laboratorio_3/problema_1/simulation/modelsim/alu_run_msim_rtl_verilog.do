transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/right_shift_logic.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/left_shift_logic.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/right_shift_arithmetic.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/left_shift_arithmetic.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/alu.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/alu_not.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/full_adder.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/nbit_adder.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/andGate.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/orGate.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/xorGate.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/N_mux.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/n_bit_and_gate.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/n_bit_or_gate.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/n_bit_xor_gate.sv}
vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/n_bit_not_gate.sv}

vlog -sv -work work +incdir+C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1 {C:/Quartus_Projects/sfallas_digital_design_lab_2023/Laboratorio_3/problema_1/alu_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all