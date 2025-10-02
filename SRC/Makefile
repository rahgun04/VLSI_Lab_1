# Directory definitions
LIB_DIR = "/ibe/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/verilog/tcbn65lpbwp7t_141a/tcbn65lpbwp7t.v" "/ibe/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/verilog/tphn65lpnv2od3_sl_200a/tphn65lpnv2od3_sl.v" 
SRC_DIR = ./
SDF_DIR = ./
WAVE_DIR = ./waves

# File definitions
TESTBENCH = SRC/lfsr4_tb.sv
DUT_SRCS = OUTPUTS/lfsr4_layout.v

# Run simulation with SDF annotation
run: 
	xmverilog $(LIB_DIR)
	xmverilog -sv $(DUT_SRCS) $(TESTBENCH) +sdf_verbose +access+rwc

# View waveforms (assuming .trn or .shm output)
waves:
	gtkwave waveform.vcd &

# Clean generated files
clean:
	rm -rf INCA_libs *.log *.trn *.shm *.history *.X $(WAVE_DIR)/* xcelium* .simvision

.PHONY: all compile elaborate run view clean
