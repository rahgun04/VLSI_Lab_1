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
  
Using your favourite editor, create the following SystemVerilog source file *_lfsr4.sv_*, a 4-bit linear feedback register (something you did in your 2nd year with me).

```systemverilog
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

