//===========================================================================
//  Copyright(c) Alorium Technology Inc., 2020
//  ALL RIGHTS RESERVED
//===========================================================================
//
// File name:  : xb_info.v
// Author      : Steve Phillips
// Contact     : support@aloriumtech.com
// Description :
//
//   This module provides a seperate info reg that the OpenXLR8 user
// can customize to provide information about thier custom XB logic.
//
//   A single CSR is defined, the XB_INFO reg. It uses indirect 
// addressing for read operations. To use the CSR, the following steps are 
// taken:
//  
//     1. The user write an address to the XB_INFO reg. This sets the 
//        value in the info_f register
//     2. The user reads the XB_INFO reg. The value in the info_f reg
//        is used to select the info value to be returned.
//
//   The value at indirect address 0 is required to be the XB_INFO_NUM_VAL, 
// which indicates the number of _additional_ info CSRs defined.
//
//   The address is auto incremented after each read, so in practice
// only a single write of 8'h0 is required, to reset the info_f
// address, followed by XB_INFO_NUM_VAL reads
//
//   The XB_INFO_VALID_ADDR is implemented to allow software to check
// to see if the xb_info module is present. Software can read
// XB_INFO_VALID_ADDR and check that the value returned is
// XB_INFO_VALID_VAL0. If it isn't, then it can be assumed the
// xb_info is not present. In fact, four reads could be done and 
// should return the sequence "X","L","R","8".
//
//===========================================================================


module xb_info
  #(
    parameter XB_INFO_ADDR        = 8'hFF,  // Address of XB_INFO CSR
    parameter XB_INFO_NUM_ADDR    = 8'h00,  // Address of XB_INFO_NUM value
    parameter XB_INFO_NUM_VAL     = 8'h03,  // Number of additional XB_INFO regs
    parameter XB_INFO_VENDOR_ADDR = 8'h01,  // Address of XB_INFO_VENDOR value
    parameter XB_INFO_VENDOR_VAL  = 8'h11,  // Vendor Code Value
    parameter XB_INFO_XBTYPE_ADDR = 8'h02,  // Address of XB_INFO_XBTYPE value
    parameter XB_INFO_XBTYPE_VAL  = 8'h12,  // XB Implementation Number
    parameter XB_INFO_XBVER_ADDR  = 8'h03,  // Address of XB_INFO_XBVER value
    parameter XB_INFO_XBVER_VAL   = 8'h13   // XB Implementation Version Number
    )
   (input        clk,
    input              rstn,
    // I/O i/f
    input [5:0]        adr,
    input              iowe,
    input              iore,
    input [7:0]        dbus_in,
    output logic [7:0] dbus_out,
    output logic       out_en,
    // DM i/f
    input [7:0]        ramadr,
    input              ramre,
    input              ramwe,
    input              dm_sel
    );

   localparam XB_INFO_VALID_ADDR = 8'hFC; // Location of validity code
   localparam XB_INFO_VALID_VAL0 = 8'h88; // ASCII 'X' at address 0xFC
   localparam XB_INFO_VALID_VAL1 = 8'h76; // ASCII 'L' at address 0xFD
   localparam XB_INFO_VALID_VAL2 = 8'h82; // ASCII 'R' at address 0xFE
   localparam XB_INFO_VALID_VAL3 = 8'h56; // ASCII '8' at address 0xFF

   logic             info_sel, info_we, info_re;
   logic [7:0]       info_f;
   logic [7:0]       info_val;

   // Normal DBUS input selection stuff
   localparam XB_INFO_DM_LOC = (XB_INFO_ADDR >= 8'h60) ? 1 : 0;
   assign info_sel = XB_INFO_DM_LOC ? (dm_sel && (ramadr[7:0] == XB_INFO_ADDR)) : 
                                      (adr[5:0] == XB_INFO_ADDR[5:0]);
   assign info_we = info_sel && (XB_INFO_DM_LOC ? ramwe : iowe);
   assign info_re = info_sel && (XB_INFO_DM_LOC ? ramre : iore);

   // The info_f register hods the current address for read
   // requests. It auto-increments after each read request so that
   // only a single write is required
   always_ff @(posedge clk or negedge rstn) begin
      info_f <=  (!rstn)   ? 8'h0       : // reset  
                 (info_we) ? dbus_in    : // load
                 (info_re) ? info_f + 1 : // Auto increment
                             info_f;      // hold
   end 

   // The info_val selection logic picks a value to be returned based
   // on the value written to the info_f reg. This part of the module
   // should be modified by the OpenXLR8 user to insert values into the
   // addresses they have defined. 
   always_comb begin
      unique case (info_f)
        // ------ Default Entries -----------------------------------
        XB_INFO_NUM_ADDR             : info_val = XB_INFO_NUM_VAL;
        XB_INFO_VENDOR_ADDR          : info_val = XB_INFO_VENDOR_VAL;
        XB_INFO_XBTYPE_ADDR          : info_val = XB_INFO_XBTYPE_VAL;
        XB_INFO_XBVER_ADDR           : info_val = XB_INFO_XBVER_VAL;
        //
        // ------ Enter your custom ADDR/VALUE pairs here -----------
        // YOUR_CUSTOM ADDR0           : info_val = YOUR_CUSTOM_VAL0;
        // YOUR_CUSTOM ADDR1           : info_val = YOUR_CUSTOM_VAL1;
        // YOUR_CUSTOM ADDR2           : info_val = YOUR_CUSTOM_VAL2;
        // YOUR_CUSTOM ADDR3           : info_val = YOUR_CUSTOM_VAL3;
        // YOUR_CUSTOM ADDR4           : info_val = YOUR_CUSTOM_VAL4;
        //
        // ------ Validity Check values - Do not change ------------
        XB_INFO_VALID_ADDR           : info_val = XB_INFO_VALID_VAL0;
        XB_INFO_VALID_ADDR+1         : info_val = XB_INFO_VALID_VAL1;
        XB_INFO_VALID_ADDR+2         : info_val = XB_INFO_VALID_VAL2;
        XB_INFO_VALID_ADDR+3         : info_val = XB_INFO_VALID_VAL3;
        default : info_val = 0;
      endcase // unique case (info_f)
   end // always_comb
   
   // Assert bus outputs
   always_comb begin
      out_en = info_re;
      dbus_out = ({8{info_sel}} & info_val);
   end
   
endmodule 


