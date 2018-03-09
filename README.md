XLR8BuildTemplate library
=========================

Provides a template for the directory structure used to synthesize
custom designs for XLR8. The steps included below can be used to build
an OpenXLR8 design. 

Additional information and support is available on
the [Alorium Website](http://aloriumtech.com) 

TOOLS
-----

1. Download and install Quartus Tool available from Intel by goggling
   for "Intel Quartus"
    1. This should include Modelsim-Altera Starter Edition and Max 10
       FPGA support
    2. The current version, 17.7, is supported. Older versions will
       fail due to library incompatibilities.
    3. Quartus tools are only available for Windows and Linux. On Mac,
       you'll need to run a VM or some other method to get either a
       Windows or Linux operating system.

Prep
----

1. Install OpenXLR8 libraries in Arduino IDE
   1. Sketch->Include Library->Manage Libraries
   2. Filter your search for XLR8
   3. Install XLR8Core, XLR8BuildTemplate, and any other desired libraries
2. Create a copy of the build template in the working location
   1. In your Operating System's File Explorer
   2. Goto your Arduino/libraries folder
   3. Make a copy of the XLR8BuildTemplate folder and name the copy
      XLR8Build. 
      - (The library may have been downloaded as XLR8_Build. Still
        make a copy named XLR8Build) 
  4. The XLR8Core library may have been downloaded as XLR8_Core. If
     so, rename it to XLR8Core. 
3. Modify the XLR8Build with your custimizations
    1. For a minimal build (no XBs), nothing needs to be done here
    2. To use a single XB (The following steps assume the name of your
       custom logic is "myLogic")
       - Rename xlr8_wrap_template.v to xlr8_myLogic.v
       - Instantiate your "myLogic.v" into xlr8_myLogic.v, creating the
         config/data regs needed as well.
       - Instantiate xlr8_myLogic in openxlr8.v, making changes as
         directed by the comments
       - Modify xb_adr_pack.vh to define the addresses of the
         registers you have added in xlr8_myLogic
    3. For more complex cases such as multiple XBs
        - Create a xlr8_foo.v wrapper for each of you logic blocks
        - Instantiate all of your wrapper blocks in openxlr8.v
4. Building in Quartus
   1. Modify the quartus/openxlr8.qsf file to specify you rtl source
   files
   2. Open XLR8Build/extras/quartus/xlr8_top.qpf with the Altera
      Quartus software (in windows you can simply double-click on
      xlr8_top.qpf in Windows Explorer) 
      
      

Simulation
----------

(Available on Windows. Linux coming soon. Not available on Mac)

1. In Arduino, select
    1. Board = Open XLR8
    2. Floating Point XB = Enabled (Can set to disabled if you have
       the Floating Point XB but want to use software floating point
       anyway for some reason). 
    3. FPGA Image = choose AVR frequency that matches the rtl and sdc
       file (16MHz if you haven't changed the rtl) 
    4. Upload Action = Send Sketch to Quartus-Modelsim directory
    5. Port = doesn't matter for this step
    6. Sketch->Upload (or hit the Upload button)
2. In Quartus
    1. Processing->Start->Start Analysis and Elaboration
    2. Tools->Run Simulation Tool->RTL Simulation
3. In Modelsim
    1. The simulation starts running with the top level inputs and
       outputs logged to the wave window. 
    2. You may want to stop the simulation, add additional signals to
       the wave window, and then run-continue 
    3. You may want to stop the simulation, add some breakpoints or
       enter a number milli-seconds you would like to simulate, and
       then run-continue. 
        - It is also possible for a sketch to control when the
       simulation finishes. The testbench watches the AVR's GPIOR1
       register and if bit 7 is set, it will end the simulation at
       that point (and by convention report a passing status if bit 6
       is also set). If your sketch doesn't set GPIOR1 (most sketches
       don't), the simulation will run until you hit the stop button.

Synthesis
---------

(Available on Windows and Linux (Linux untested). Not available on Mac)

1. In Quartus, do Processing->Start Compilation (or simply click the
   blue triangle icon) 
2. In Quartus, do File->Convert Programming Files
    1. Open Conversion Setup Data->xlr8_16MHz.cof
       - Pick the .cof file that matches your Board/Clock
    2. Generate. Ok. Close.


Burning the FPGA Image
----------------------

1. In Arduino, select
    1. Board = Open XLR8
    2. "Floating Point XB" and "Upload Action" setting don't matter
       for this step 
    3. FPGA Image = choose AVR frequency that matches the rtl and sdc
       file (16MHz if you haven't changed the rtl) 
    4. Port = Serial Port that XLR8 board is connected to
    5. Burn Bootloader (takes about a minute)
    6. Copy the URL that is printed at the end of the status message,
       paste it into a web browser, and leave us any comments you may
       have. 


More Help
---------

1. Issues? Check the forums at http://forums.aloriumtech.com/
2. Altera has both paid and free on-line training
   at [Intel FPGA Technical Training](https://goo.gl/H9gftH), or
   simply google for "Intel FPGA Technical Training"
3. An overview of the ModelSim HDL simulator is also available from
   Intel at [Intel Modelsim Overview](https://goo.gl/TcBhXP), or
   simply google for "Intel Modelsim Overview"
   

