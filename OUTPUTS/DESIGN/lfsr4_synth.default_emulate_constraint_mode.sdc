# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.10-p003_1 on Wed Oct 08 12:32:49 BST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design lfsr4

create_clock -name "clk" -period 1.0 -waveform {0.0 0.5} [get_ports clk]
set_clock_transition 0.05 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_wire_load_selection_group "WireAreaForZero" -library "tcbn65lpbwp7twc"
set_dont_use [get_lib_cells tcbn65lpbwp7twc/BHDBWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GAN2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GAN2D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GAOI21D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GAOI21D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GAOI22D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GBUFFD1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GBUFFD2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GBUFFD3BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GBUFFD8BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDCAP10BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDCAP2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDCAP3BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDCAP4BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDCAPBWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDFCNQD1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GDFQD1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GFILL10BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GFILL2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GFILL3BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GFILL4BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GFILLBWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GINVD1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GINVD2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GINVD3BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GINVD8BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GMUX2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GMUX2D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GMUX2ND1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GMUX2ND2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GND2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GND2D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GND2D3BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GND3D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GND3D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GNR2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GNR2D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GNR3D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GNR3D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GOAI21D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GOAI21D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GOR2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GOR2D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GSDFCNQD1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GTIEHBWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GTIELBWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GXNR2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GXNR2D2BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GXOR2D1BWP7T]
set_dont_use [get_lib_cells tcbn65lpbwp7twc/GXOR2D2BWP7T]
set_clock_uncertainty -setup 0.02 [get_clocks clk]
set_clock_uncertainty -hold 0.02 [get_clocks clk]
