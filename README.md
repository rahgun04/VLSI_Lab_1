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
Copy and paste these Tcl commands directly into Genus.  Make sure that you know what they do.

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

**_Step 8: Finishing the sytnesis task_**

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
In this task, you will use Innovus, Cadence's place-and-route (PnR) tools, the produce the physical layout of your **_lfsr4_** design.  For PnR, you must have XQuartz running if you are using a Mac.

LEF (Library Exchange Format) files in Electronic Design Automation (EDA) tools are ASCII files that provide an abstract, physical description of integrated circuit (IC) components like standard cells and macro blocks. They contain essential information for place and route (P&R) tools, such as cell dimensions, pin locations, metal layers, and via definitions, enabling tools to arrange and connect components without needing the full layout details. LEF files are critical for the backend physical design process and are often used alongside Design Exchange Format (DEF) files.  

an SDC (Synopsys Design Constraints) file is an ASCII text file that defines design intent, specifying timing, power, and area constraints for a digital circuit design. It uses Tcl (Tool Command Language) to communicate parameters like clock definitions, input/output delays, and timing exceptions, which guide EDA tools during synthesis, placement, and timing analysis to ensure the design meets performance requirements. 

An MMMC (Multi-Mode, Multi-Corner) file in Electronic Design Automation (EDA) tools defines the various operating conditions for a chip design, including different modes (functional states) and corners (variations in process, voltage, and temperature). This file allows timing analysis tools to check if the chip will perform correctly under all potential operating scenarios, ensuring design stability and timing closure by verifying the chip's performance across different PVT corners and operating modes.  

Launch **Innovus** by entering:
```bash
Innovus
```

**_Step 1: Set up variables_**
Enter these Tcl command:
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
set POWER_RING_WIDTH 2                            ;# width of wire
set POWER_RING_SPACING 1                          ;# spacing between wires
set POWER_RING_OFFSET 1                           ;# distance from core boundary

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
setDesignMode -topRoutingLayer 7                  ;# TSMC 65nm LP process has 10 metal layers
```

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
sroute -nets { VSS VDD} -allowJogging true -allowLayerChange true -blockPin useLef -connect {blockPin padPin padRing cor
ePin floatingStripe }

# Insert well taps to prevent latch up
addWellTap -cell TAPCELLBWP7T -prefix welltap -cellInterval 60 -checkerBoard

timeDesign -prePlace -expandedViews -outDir ./REPORTS/prePlace -prefix prePlace
```

**_Step 3: Placement_**
Enter these Tcl command:
```tcl
# Placement 
setPlaceMode -place_global_place_io_pins true 
place_opt_design 
setTieHiLoMode -maxFanout 10 -maxDistance 50
addTieHiLo -cell "TIEHBWP7T TIELBWP7T" 
timeDesign -preCTS -outDir REPORTS/preCTS -prefix preCTS
```

