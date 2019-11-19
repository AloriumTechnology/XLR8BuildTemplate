XLR8 Pin Mapping
==============================================================================


Introduction
------------------------------------------------------------------------------

The OpenXLR8 methodology works for multiple boards, each of which have
different numbers of pins. This README documents the pin mapping
between the board pins and the ddoe/ddov/pvoe/pvov busses that are
found in the openxlr8.v module


XLR8 Board
------------------------------------------------------------------------------

The XLR8 board is compatible with the Arduino UNO board and has the
most straitforward pin mapping

      Board Pin    Port Pin   ddoe/ddov/pvoe/pvov 
    =============  ========   ===================
    D19/A5-D14/A0   C[5:0]         [19:14]
        A5-A0       C[5:0]         [19:14]
       D13-D8       B[5:0]         [13:08]
        D7-D2       D[7:2]         [07:02]
        TX/D1        D[1]             [01]
        RX/D1        D[0]             [00]
        
The following board pins are not port of the normal ports and cannot
be controlled via the ddoe/ddov/pvoe/pvov busses in OpenXLR8:

* SDA, SCL 
* SOIC1, SOIC2, SOIC3, SOIC5, SOIC6, SOIC7
* TCK, TDI, TDO, TMS, JTAGEN
        
        
Sno Board
------------------------------------------------------------------------------

The Sno board adds three additional ports to the standard XLR8
Uno. Due to the way SDA/SCL were handled on Sno, there is an apparent
two pin gap between D19/A5 and D22, which causes the numbering for the
D pins and the ddoe/ddov/pvoe/pvov busses to be off by two, for the
three additional ports.

      Board Pin    Port Pin   ddoe/ddov/pvoe/pvov 
    =============  ========   ===================
       D39-D34      G[5:0]         [37:32]
       D33-D28      E[5:0]         [31:26]
       D27-D22      A[5:0]         [25:20]
    D19/A5-D14/A0   C[5:0]         [19:14]
       D13-D8       B[5:0]         [13:08]
        D7-D0       D[7:0]         [07:00]
    
The following board pins are not port of the normal ports and cannot
be controlled via the ddoe/ddov/pvoe/pvov busses in OpenXLR8:

* SDA, SCL
* TX, RX
* X0, X1
* TCK, TDI, TDO, TMS, JTAGEN


Hinj Board
------------------------------------------------------------------------------

The Hinj board adds many new ports due to all the additional
connectors it has. The additional ports are named to correspond to the
type of connector.

      Board Pin    Port Pin   ddoe/ddov/pvoe/pvov  Connector Type
    =============  ========   ===================  ==============
       BT1-BT0      BT[1:0]      [121:120]         Button
       X17-X10      X1[7:0]      [119:112]         XBEE
       X07-X00      X0[7:0]      [111:104]         XBEE
       SW7-SW0      SW[7:0]       [103:96]         Switch
       LD7-LD0      LD[7:0]        [95:88]         LED
       G47-G40      G4[7:0]        [87:84]         GPIO 40 Pin
       G37-G30      G3[7:0]        [83:76]         GPIO 40 Pin
       G27-G20      G2[7:0]        [75:68]         GPIO 40 Pin
       G17-G10      G1[7:0]        [67:60]         GPIO 40 Pin
       G07-G00      G0[7:0]        [59:52]         GPIO 40 Pin
       PD7-PD0      PD[7:0]        [51:44]         PMOD
       PC7-PC0      PC[7:0]        [43:36]         PMOD
       PB7-PB0      PB[7:0]        [35:28]         PMOD
       PA7-PA0      PA[7:0]        [27:20]         PMOD
    D19/A5-D14/A0    C[5:0]        [19:14]         Arduino Header
       D13-D8        B[5:0]        [13:08]         Arduino Header
        D7-D0        D[7:0]        [07:00]         Arduino Header

The following board pins are not port of the normal ports and cannot
be controlled via the ddoe/ddov/pvoe/pvov busses in OpenXLR8:

* SDA, SCL
* TCK, TDI, TDO, TMS, JTAGEN

      
