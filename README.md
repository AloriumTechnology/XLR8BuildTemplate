# XLR8BuildTemplate library
Provides a template for the directory structure used to synthesize custom
 designs for XLR8
The following steps can be used to build an OpenXLR8 design.

TOOLS
1. Download and install Quartus Tool available from Altera at http://dl.altera.com/?edition=lite
    1. This should include Modelsim-Altera Starter Edition and Max 10 FPGA support
    2. We've been using release 15.1. We'll move to 16.0 soon
    3. Quartus tools are only available for Windows and Linux. On Mac, you'll need to run a VM or some other method to get either a Windows or Linux operating system.

PREP
1. In Arduino IDE
    1. Sketch->Include Library->Manage Libraries
    2. Filter your search for XLR8
    3. Install XLR8Core, XLR8BuildTemplate, and any other desired libraries
2. In your Operating System's File Explorer
    1. Goto your Arduino/libraries folder
    2. Make a copy of the XLR8BuildTemplate folder and name the copy XLR8Build.
3. Customize the project
    1. For a minimal build (no XBs), nothing needs to be done here
    2. To use a single XB (The following steps use XLR8Servo as the example XB to instantiate)
        - Copy XLR8Servo/extras/rtl/xlr8_top.v to XLR8Build/extras/rtl/xlr8_top.v
        - Copy XLR8Servo/extras/rtl/xb_adr_pack.vh to XLR8Build/extras/rtl/xb_adr_pack.vh
        - Copy XLR8Servo/extras/quartus/xlr8_top.qsf to XLR8Build/extras/quartus/xlr8_top.qsf
    3. For more complex cases such as multiple XBs
        - Modify XLR8Build/extras/rtl/xlr8_top.v directly to instantiate the desired XBs
        - Modify XLR8Build/extras/rtl/xb_adr_pack.vh to specify addresses of the XB control/status registers
        - Modify XLR8Build/extras/quartus/xlr8_top.qsf to read XB rtl files, and, if needed, XB sdc files
4. Open XLR8Build/extras/quartus/xlr8_top.qpf with the Altera Quartus software

SIMULATION (Not yet fully implemented. Windows and Linux in the future. Not available on Mac)
0. Simulation flow is not yet fully implemented, but will be something like this
1. In Arduino, select
    1. Board = Open XLR8
    2. Floating Point XB is used if you have the Floating Point XB but want to use software floating point anyway (for performance comparison perhaps). If you don't have the Floating Point XB, this setting don't matter.
    3. FPGA Image = choose AVR frequency that matches the rtl and sdc file (16MHz if you haven't changed the rtl)
    4. Upload Action = Send Sketch to Quartus-Modelsim directory
    5. Port = doesn't matter for this step
    6. Sketch->Upload (or hit the Upload button)
2. In your Operating System's File Explorer (still step is a temporary workaround)
    1. Copy XLR8Core/extras/rtl/avr_adr_pack.vh to XLR8Build/extras/rtl/avr_adr_pack.vh
2. In Quartus
    1. Processing->Start->Start Analysis and Elaboration
    2. Tools->Run Simulation Tool->RTL Simulation
3. In Modelsim

SYNTHESIS (Available on Windows and Linux (Linux untested). Not available on Mac)
1. In Quartus, do Processing->Start Compilation (or simply click the blue triangle icon)
2. In Quartus, do File->Convert Programming Files (This step will become automated, but for now it is a manual step)
    1. Open Conversion Setup Data->openxlr8.cof 
    2. Generate. Ok. Close.


BURNING the FPGA IMAGE
1. In Arduino, select
    1. Board = Open XLR8
    2. "Floating Point XB" and "Upload Action" setting don't matter for this step
    3. FPGA Image = choose AVR frequency that matches the rtl and sdc file (16MHz if you haven't changed the rtl)
    4. Port = Serial Port that XLR8 board is connected to
    5. Burn Bootloader (takes about a minute)
    6. Copy the URL that is printed at the end of the status message, paste it into a web browser, and leave us any comments you may have.


MORE HELP
1. Issues? Check the forums at http://forums.aloriumtech.com/

