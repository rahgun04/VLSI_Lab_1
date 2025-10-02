#####################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 10/02/2025 15:30:02
#
#####################################################################


read_mmmc OUTPUTS/DESIGN/lfsr4_synth.mmmc.tcl

read_physical -lef {/usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tcbn65lpbwp7t_141a/lef/tcbn65lpbwp7t_9lmT2.lef}

read_netlist OUTPUTS/DESIGN/lfsr4_synth.v

init_design -skip_sdc_read
