##### Department of Electrical & Electronic Engineering, Imperial College London


#### EE4/EIE4 Lab 1 - A Quick Start with Cadence

### Lab 1 - A Quick Start with Cadence

##### *Peter Cheung, v0.1 - 17 October 2025*

---
### Objectives
---
By the end of this laboratory session, you should be able to:
* set up your personal laptop environment for **Cadence software** running on our teaching servers
* use *Genus* EDA package to synthesize a simple circuit from **HDL to standard cells**
* understand the **steps required** to take an RTL specificagtion to silicon using standard cells 
* interpret the **timing** and **size estimates** reported by Genus
* use **Innovus** EDA package to **place and route** the synthesized circuit 
* understand how to write a **Tcl script** to perform synthesis and place-and-route
* perform basic **Design Rule Check** (DRC) and **layout verification check** (LVS) on the circuit
* use **Xcelium** simulator to **verify** that synthesised and place-and-routed circuit works
* use **GTKwave** to inspect simulation results
* inspect the resulting **silicon layout** of the circuit

---
### Before you start
---

>Before you even start this laboratory session, you must have signed the TSMC's **non-disclosure agreement (NDA)**, and have return this to me.  Remember that you MUST abide by the restrictions stipulated in the NDA.

Although you could use the PCs provided by the Department in Room 507 for this lab, I recommend you to bring your own laptop with you.  There are many displays units in the room for your to plug in your laptop and use a larger screen for this lab.

If you are using a Windows PC, you will need to have [MobaXterm]([https://mobaxterm.mobatek.net) installed. This provides a feature-rich terminal environment with built-in X server and ssh client.

If you are a MacBook user, you already have the Terminal application in Mac OSX. You also need to install [XQuartz](https://www.xquartz.org) X server to run Cadence.

---
### Task 1 - Connect to the Teaching Server
---

To access Imperial College's resources from your personal laptop, you will need to connect to the Universal Access provision after running [Zscaler](https://uafiles.cc.ic.ac.uk/). After authentication, you will be able to access file systems and computer servers.

Cadence is installed and runs on the EEE servers, which you access via SSH. There are two
 servers available:

* ee-mill1.ee.ic.ac.uk
* ee-mill2.ee.ic.ac.uk

For **Windows**: Use [MobaXterm]([https://mobaxterm.mobatek.net) to create a new sesion by entering the server address with your username and password.

For **Mac**: Use [XQuartz](https://www.xquartz.org). After installation and opening XQuartz, enter:
```bash
ssh -Y <username>@ee-mill1.ee.ic.ac.uk
```
or
```bash
ssh -Y <username>@ee-mill2.ee.ic.ac.uk
```
Once you have logon, create your directory structure for this module's coursework, e.g. Lab_1, Lab_2 etc..   Within Lab_1, create the following folders to store the various types of files created or generated for this lab:
* **SRC** - where you put the HDL sources
* **OUTPUTS** - where all generated files from sythesis are stored
* **REPORTS** - where all reports are stored
* **SAVES** - where incomplete designs are saved for incremental development
  
Using your favourite editor, create the following SystemVerilog HDL source *_lfsr4.sv_* in the **SRC** folder. This is a 4-bit linear feedback register used in 2nd year labs.

```v
module lfsr4 (
    // simple 4-bit linear feedback shift register.
    // primitive polynomial is x^4 + x^3 + 1
    // Author: Peter YK Cheung
    // Version: 1.0, 17-9-25

  input logic clk,        // clock
  input logic rst,        // reset
  output logic [3:0]  data_out    // pseudo-random output
);

  logic [4:1]     sreg;

  always_ff @ (posedge clk, posedge rst)
    if (rst)
      sreg <= 4'b1;
    else 
	    sreg <= {sreg[3:1], sreg[3] ^ sreg[4]};

  assign data_out = sreg;
endmodule 
```

---
### Task 2 - Sythesis RTL to Standard Cells
---

**_Step 1: Specify the PDK for your design_**

In this task, you will learn how to implement the LFSR circuit using TSMC 65nm standard cells.  Before you start, you need to specify which *process design kit (PDK)** you will be using. 

Change to the Lab 1 directory and enter:

```bash
pdk
```
This will show you all the PDK installed on the server.  Choose the TSMC 65nm low power process PDK by enter:
```bash
pdk tsmc65LP
```

**_Step 2: Launching the Genus tool_**

Cadence Genus tool synthesizes your RTL specification in SystemVerilog into optimized gate-level netlist. The output is a Verilog specifications of gates (in our case, standard cells) which can be implemented as silicon layout.

Launch Genus by typeing:
```bash
genus
```

When you see the prompt **_@genus:rool: 1\>_**, you are inside the Genus tool environment.  

Genus accepts Tcl scripts (**T**ool **C**ommand **L**anguage).  While you may want to learn Tcl for personal interest, you are not going to use any complex syntax of Tcl in this lab.  Here are some resources:

* a [tutorial video](https://www.youtube.com/watch?v=o_mhSa5HQCc) on Tcl
* an 3-page [online tutorial](https://www.asic-world.com/scripting/tcl1.html)
* a comprehensive [cheatsheet](https://cheatography.com/aha/cheat-sheets/tcl-language/)
  
**_Step 3: Set various environment variables and design name_**

Enter these Tcl commands in Genus:
```tcl
# Variable setup
set _HDL_DIRECTORY ./SRC
set HDL_FILES [list lfsr4.sv]
set DESIGN lfsr4

# Clock name should match the clock signal name in HDL (i.e. clk, CLK, ...)
set CLOCK_NAME clk
set CLOCK_PERIOD_ps 1000

set GEN_EFF medium    ;# synthesis effort
set MAP_OPT_EFF high  ;# mapping and optimization effort

set _OUTPUTS_PATH OUTPUTS   ;# where to store output files
set _REPORTS_PATH REPORTS   ;# where to store synthesis reports
```
Copy and paste these Tcl commands directly into Genus. (copy icon on top right corner of code.)  Make sure that you know what each Tcl command does.

**_Step 4: Specify where the standard cell libraries can be found_**

Enter these Tcl commands in Genus:

```tcl
set_db init_hdl_search_path $_HDL_DIRECTORY;
set_db library "/usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lpbwp7t_220a/tcbn65lpbwp7twc.lib";
set_db lef_library "/usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tcbn65lpbwp7t_141a/lef/tcbn65lpbwp7t_9lmT2.lef";
set_db cap_table_file "/usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tcbn65lpbwp7t_141a/techfiles/captable/cln65lp_1p09m+alrdl_top2_rcworst.captable";
set_db information_level 4;       # Output verbosity level - 1 (default) to 11
set_db use_tiehilo_for_const duplicate;
```

**_Step 5: Load the design and specify the clock signal & constraints_**
Enter these Tcl commands in Genus:

```tcl
# Load the design and check basic syntax
read_hdl -sv ${HDL_FILES}
elaborate ${DESIGN}
check_design -unresolved
check_design -unloaded

# Tell Genus about the clock signal
create_clock -domain domain1 -name ${CLOCK_NAME} -period ${CLOCK_PERIOD_ps} [get_db ports ${CLOCK_NAME}]
set_db clock:${DESIGN}/${CLOCK_NAME} .setup_uncertainty [expr 0.02 * ${CLOCK_PERIOD_ps}]
set_clock_uncertainty -hold  [expr 0.02 * ${CLOCK_PERIOD_ps}] ${CLOCK_NAME} 
set_clock_uncertainty -setup [expr 0.02 * ${CLOCK_PERIOD_ps}] ${CLOCK_NAME} 
set_clock_transition -rise  50 ${CLOCK_NAME}
set_clock_transition -fall  50 ${CLOCK_NAME}

# Set time units for SDC commands to be consistent with Genus commands
set_time_unit -picoseconds
set_load_unit -femtofarads

# Define the system clock constraints
create_clock -domain domain1 -name ${CLOCK_NAME} -period ${CLOCK_PERIOD_ps} [get_db ports ${CLOCK_NAME}]
set_db clock:${DESIGN}/${CLOCK_NAME} .setup_uncertainty [expr 0.02 * ${CLOCK_PERIOD_ps}]
set_clock_uncertainty -hold  [expr 0.02 * ${CLOCK_PERIOD_ps}] ${CLOCK_NAME} 
set_clock_uncertainty -setup [expr 0.02 * ${CLOCK_PERIOD_ps}] ${CLOCK_NAME} 
set_clock_transition -rise  50 ${CLOCK_NAME}
set_clock_transition -fall  50 ${CLOCK_NAME}
```
These clock specifications are necessary for Genus' synthesis and optimization algorithm to try meet the timing requirements.

**_Step 6: Synthesis to gates_**
Enter these Tcl commands in Genus:
```tcl
# First to generic gates
set_db syn_generic_effort $GEN_EFF
syn_generic

# Then to TSMC gates
set_db syn_map_effort $MAP_OPT_EFF
syn_map

write_snapshot -directory ${_REPORTS_PATH}/map -tag map
report_dp > ${_REPORTS_PATH}/map/${DESIGN}_datapath.rpt
report_summary -directory ${_REPORTS_PATH}
```
When you copy and paste these commands to Genus, you may also want to examine the ./OUTPUTS and ./REPORTS folder to see what have been generated.

**_Step 7: Optimize the netlist and write all reports and output files_**
Enter these Tcl commands in Genus:
```tcl
# Optimize netlist
set_db syn_opt_effort $MAP_OPT_EFF
syn_opt
write_snapshot -directory ${_REPORTS_PATH}/opt -tag syn_opt
report_dp > ${_REPORTS_PATH}/opt/${DESIGN}_datapath.rpt
report_summary -directory ${_REPORTS_PATH}

# Export Design Files
write_snapshot -directory ${_REPORTS_PATH}/final -tag final
report_summary -directory ${_REPORTS_PATH}
write_hdl > ${_OUTPUTS_PATH}/${DESIGN}_synth.v
write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_synth.sdc
write_sdf > ${_OUTPUTS_PATH}/${DESIGN}_synth.sdf
write_script > ${_OUTPUTS_PATH}/${DESIGN}.script
write_design -base_name ${_OUTPUTS_PATH}/DESIGN/${DESIGN}_synth
write_db -all_root_attributes -script ${_OUTPUTS_PATH}/DESIGN/${DESIGN}_synth.tcl    

# Write reports
report_qor > ${_REPORTS_PATH}/${DESIGN}_qor.rpt
report_area > ${_REPORTS_PATH}/${DESIGN}_area.rpt
report_dp > ${_REPORTS_PATH}/${DESIGN}_datapath_incr.rpt
report_messages > ${_REPORTS_PATH}/${DESIGN}_messages.rpt
report_gates > ${_REPORTS_PATH}/${DESIGN}_gates.rpt
report_timing > ${_REPORTS_PATH}/${DESIGN}_timing.rpt
report_power > ${_REPORTS_PATH}/${DESIGN}_power.rpt
```
Congratulations!  You have managed to sytnesize your HDL design into gates.

> * Identify the synthesized circuit from the OUTPUTS directory.
> * Examine the sytnesized Verilog file and be satisfied that it is what you expected.
> * What are the standard cells used?

**_Step 8: Finishing the synthesis task_**

* Use the exit command to leave Genus tool.

* Create in the Lab 1 folder the Tcl script **_synth.tcl_** that combines ALL the Tcl commands above. 
* Launch Genus again and re-run the synthesis process with the *_synth.tcl_* script as one command:
```tcl
source synth.tcl
```
You should produce the same result at the end of step 7.

> From now on, you just need to modify this script slightly and run the script to synthesize other new designs.

---
### Task 3 - Place and Route the standard cells
---
In this task, you will use Innovus, Cadence's place-and-route (PnR) tools, the produce the physical layout of your **_lfsr4_** design.  For PnRa, and if you are using a Mac, you must have XQuartz running.

Place and route procedure consists of many steps.  After each step, Innovus displays the latest progress in the form of chip layout in a separate window.  To understand what each fo the PnR steps does, you are recommended to perform each step, one at a time, and record what you discover from both the layout window and from the terminal window.  This will help you debug problems when you design a complex circuit later.

Launch **Innovus** by entering:
```bash
innovus
```

**_Step 1: Set up variables_**

We first set up the relevent variables for Innovus.  The key parameters here are those that define properties of the standard cell core and the power ring sizes.

```tcl
#Top-level module name
set DESIGN lfsr4                                  ;# top-level module name            
set VERILOG_FILES [list OUTPUTS/lfsr4_synth.v]    ;# output synthsis task
set SDC_FILE OUTPUTS/lfsr4_synth.sdc              ;# specify constraints for PnR

# Set Floorplan parameters (unit in um)
set CORE_ASPECT_RATIO 1.0                         ;# square layout
set CORE_UTILIZATION 0.6                          ;# 40% for routing of signal & power
set COREGAP 5                                     ;# gap from power ring to core

# Set Power Ring parameters (in um)
# The power ring is a rectangular area around the core that provides power and ground connections.
set POWER_RING_WIDTH 1                            ;# width of wire
set POWER_RING_SPACING 0.5                         ;# spacing between wires
set POWER_RING_OFFSET 0.5                          ;# distance from core boundary

# Setup PnR environment and say where library can be found
set init_verilog ${VERILOG_FILES}
set init_top_cell ${DESIGN}
set init_lef_file { \
    /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tcbn65lpbwp7t_141a/lef/tcbn65lpbwp7t_9lmT2.lef \
    /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tphn65lpnv2od3_sl_200b/mt_2/9lm/lef/tphn65lpnv2od3_sl_9lm.lef \
    /usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Back_End/lef/tpbn65v_200b/wb/9m/9M_6X2Z/lef/tpbn65v_9lm.lef \
    }                                             ;# use these abstract standard cell for PnR
set init_mmmc_file "./mmmc_timing.tcl"            ;# specify corner conditions the chip operates under (i.e. temperature, voltages etc.)
set init_gnd_net {VSS}
set init_pwr_net {VDD}

setDesignMode -process 65
init_design
```
> What is the result of this PnR step?


**_Step 2: Floor Planning_**
Enter these Tcl command:
```tcl
# Plan how the overall layout, particularly where power wires go
floorplan -r ${CORE_ASPECT_RATIO} ${CORE_UTILIZATION} ${COREGAP} ${COREGAP} ${COREGAP} ${COREGAP} 
globalNetConnect VSS -type pgpin -pin VSS -all -override
globalNetConnect VDD -type pgpin -pin VDD -all -override
globalNetConnect VDD -type tiehi -pin VDD -all -override
globalNetConnect VSS -type tielo -pin VSS -all -override

# Add power ring
addRing -width ${POWER_RING_WIDTH} -spacing ${POWER_RING_SPACING} -offset ${POWER_RING_OFFSET} -layer {top M1 bottom M1 
left M2 right M2} -center 1 -nets { VSS VDD }

# Special routing for power and ground nets
sroute -nets { VSS VDD} -allowJogging true -allowLayerChange true -blockPin useLef -connect {blockPin padPin padRing corePin floatingStripe }

# Insert well taps to prevent latch up
addWellTap -cell TAPCELLBWP7T -prefix welltap -cellInterval 60 -checkerBoard

timeDesign -prePlace -expandedViews -outDir ./REPORTS/prePlace -prefix prePlace
```
> What is the result of this floorplanning step?

**_Step 3: Placement_**

This step places the standard cells specified in the synthesized netlist sucn that various constraints such as aspect ratio and how much of the core area is used up are met.  This step also perform preliminary check on timing constraints sepcified earlier based on the timing properties of the standard cells used.

```tcl
# Placement 
setPlaceMode -place_global_place_io_pins true 
place_opt_design 
setTieHiLoMode -maxFanout 10 -maxDistance 50
addTieHiLo -cell "TIEHBWP7T TIELBWP7T" 
timeDesign -preCTS -outDir REPORTS/preCTS -prefix preCTS
```
> What is the results of this placement step?

**_Step 4: Clock tree insertion_**

To meet the timing requirements of a synchronous circuit, a well designed clock tree circuit is vital.  Details of clock tree design will be covered in a later lecture.  Innovus provides an automatic clock tree insertion tool. Routing and buffer sizing of the clock tree is done before the finally routing.  This is achieve by the following.

```tcl
set_ccopt_property buffer_cells {CKBD0BWP7T CKBD1BWP7T CKBD2BWP7T CKBD3BWP7T CKBD4BWP7T CKBD6BWP7T CKBD8BWP7T CKBD10BWP7T CKBD12BWP7T}
set_ccopt_property inverter_cells {CKND0BWP7T CKND1BWP7T CKND2BWP7T CKND3BWP7T CKND4BWP7T CKND6BWP7T CKND8BWP7T CKND10BWP7T CKND12BWP7T}
setOptMode -usefulSkew true
setOptMode -usefulSkewCCOpt extreme
create_ccopt_clock_tree_spec -file REPORTS/ctsspec.tcl
source REPORTS/ctsspec.tcl
ccopt_design -check_prerequisites
ccopt_design

optDesign -postCTS -setup -hold -outDir REPORTS/postCTSOptTiming
timeDesign -postCTS -expandedViews -outDir REPORTS/postCTS -prefix postCTS
report_ccopt_clock_trees -file REPORTS/postCTS/clock_trees.rpt
report_ccopt_skew_groups -file REPORTS/postCTS/skew_groups.rpt
```
> What is the result of clock tree insertion?

**_Step 5: Routing_**
```tcl
routeDesign                         ;# this does the routing
## Set analysis on on-chip variation (OCV) mode 
setAnalysisMode -analysisType onChipVariation -skew true -clockPropagation sdcControl
optDesign -postRoute -setup
optDesign -postRoute -hold
```

Congratulations!  You should now see the completed layout of the lfsr4 circuit as shown below.  

<p align="center"> <img src="diagrams/lfsr4_layout.jpg" /> </p><BR>

> Compare the circuit produced by Genus after synthesize to that produced by Innovus after PnR.  Comment on how PnR optimization has modified the original circuit.
> Examine what files are generated by Innovus in the OUTPUTS and REPORTS folders.

Again, you should combine the Tcl scripts for all the PnR steps as a single PnR.tcl file.
Exit from Innovus and launch this again so that you flush out all internal state of the program.  Relaunch Innovus and run the entire PnR process by:
```tcl
source PnR.tcl
```
Both synth.tcl and PnR.tcl scripts will now serve as template for your future design.

---
### Task 4 - Simulation
---

The place and routed result will now be simulated to make sure that the layout version of the circuit is working as expected using Cadence's XCelium simulator.  

**_Step 1: Create the testbench _**

To do this, we must first provide a testbench.  Create in SRC folder the file **_lfsr4_tb.sv_** which contains:

```v
`timescale 1ns/1ps
module lfsr4_tb;
    logic rst;
    logic clk;
    logic [3:0] data_out;

    // instantiate the DUT
    lfsr4 dut (
        .clk(clk),
        .rst(rst),
        .data_out(data_out)
    );

    initial begin
        $display("Start lfsr4 testbench ....");
        clk = 1'b0;
        rst = 1'b1;
        #1 clk = 1'b1;
        #1 clk = 1'b0;
	#1 rst = 1'b0;

	// clock generator
    	for (int i=0; i<20; i++) begin
        	#1 clk = 1'b1;
        	#1 clk = 1'b0;
	end
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, lfsr4_tb, dut);
    end
endmodule
```
>Note that the first line specifies the time unit and resolution.  This timescale statement must also be manually edited into all the layout Verilog file generated by PnR.  In this case, the file is **_./OUTPUT/lfsr4.layout.v_-_**.

**_Step 2: Create a Makefile to run the simulator_**

Create at the Lab_1 directory a Makefile with the follow:

```make
# Directory definitions
LIB_DIR = "/usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/verilog/tcbn65lpbwp7t_141a/tcbn65lpbwp7t.v" "/usr/local/cadence/kits/tsmc/beLibs/65nm/TSMCHOME/digital/Front_End/verilog/tphn65lpnv2od3_sl_200a/tphn65lpnv2od3_sl.v" 
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
```

**_Step 3: Generate simulation output and view waveforms_**

Make sure that you have the following in place:
* the testbench file lfsr4_tb.sv is in ./SRC
* the layout Verilog file lfsr4_layout.v has the timescale statement added
* the Makefile available in your design folder 

Then enter:
```bash
# run Xcelium to generate simulation output ain waveform.vcd
make run
# launch GTKwave and plot waveforms
make waves
```

You should see the signal waveforms of the simple "chip" you have created as shown in the diagram below.

<p align="center"> <img src="diagrams/lfsr4_waveforms.jpg" /> </p><BR>

>Check that the output of the LFSR is as you expected.  

---
### Test yourself challenge
---
If you have time, you may want to try to create your own circuit and go through the process of synthesis, place and route and simulation.  One suggestio is to design a 16-bit or 4 hexadecimal digital signature analyzer for fault detection and idenfication.

(A circuit diagram to follow.)

---
### File Formats used in this Lab
---

**LEF (Library Exchange Format)** 
A readable text file that provides an abstract, physical description of standard cell or predesigned IP block. It contains essential information for PnR tools, such as cell dimensions, pin locations, metal layers, and via definitions allowing PnR tools to perform appropriate optimizations.  

**SDC (Synopsys Design Constraints)** 
A readable text file that specifies timing, power, and area constraints for a digital circuit design. It uses Tcl statements to specify parameters such as clock definitions, input/output delays, and timing constraints etc.. These information is used by EDA tools during synthesis, placement, and timing analysis to ensure the design meets performance requirements. 

**MMMC (Multi-Mode, Multi-Corner)** 
Thi is text file that defines the various operating conditions for a chip design, including different modes (functional states) and operating corners (variations in process, voltage, and temperature). This file allows timing analysis tools to check if the chip will perform correctly under all potential operating scenarios, ensuring design stability and timing closure by verifying the chip's performance across different PVT corners and operating modes.  
