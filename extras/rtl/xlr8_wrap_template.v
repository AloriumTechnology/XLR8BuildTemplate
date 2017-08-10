///////////////////////////////////////////////////////////////////
//=================================================================
//  Copyright (c) Alorium Technology 2016
//  ALL RIGHTS RESERVED
//  $Id:  $
//=================================================================
//
// File name:  : xlr8_xb.v
// Author      : Steve Phillips
// Description : Template for wrapping user XB in glue logic needed
//               to interface cleanly with AVR core
//
// This template module provides an starting point for the user to
// enable thier module to communicate cleanly with the AVR core. The
// AVR core provides a relatively simple, standard interface which
// must be adhered to in order to interoperate cleanly.
//
// 
//=================================================================
///////////////////////////////////////////////////////////////////

module xlr8_xb  // NOTE: Change the module name to match your design
  #(
    // Parameter definitions. The ADDR parameters will be defined when
    // this module is instantiated. These PARAMETERS are just
    // examples, you'll want to create your own as needed.
    parameter CTRL_ADDR = 0,
    parameter DATA_EX1_ADDR = 0,
    parameter DATA_EX2_ADDR = 0,
    parameter WIDTH = 8
    )
   (
    // Input/Ouput definitions for the module. These are standard and
    // while other ports could be added, these are required.
    //  
    // Clock and Reset
    input        clk,       // Clock
    input        rstn,      // Reset
    input        clken,     // Clock Enable
    // I/O 
    input [5:0]  adr,       // Reg Address
    input [7:0]  dbus_in,   // Data Bus Input
    output [7:0] dbus_out,  // Data Bus Output
    output       io_out_en, // IO Output Enable
    input        iore,      // IO Reade Enable
    input        iowe,      // IO Write Enable
    // DM
    input [7:0]  ramadr,    // RAM Address
    input        ramre,     // RAM Read Enable
    input        ramwe,     // RAM Write Enable
    input        dm_sel,    // DM Select
    );
   
   //======================================================================
   // Three example interfaces to the user module: ctrl, data_ex1, 
   // and data_ex2
   
   // The ctrl interface is an example of a R/W control register at a
   // configured address. The control register can be written or read
   // by the AVR. Specific bits or bit fields can be fed into the user
   // module to control its function.

   logic ctrl_sel;
   logic ctrl_we;
   logic ctrl_re;
   logic [WIDTH-1:0] ctrl_reg;

   // The data_ex1 interface is a write only register that can be
   // written by the AVR core. The data_ex1 value is fed into the user
   // module as a data input.
   
   logic data_ex1_sel;
   logic data_ex1_we;
   logic data_ex1_re;
   logic [WIDTH-1:0] data_ex1_reg;

   // The data_ex2 interface is a read only interface that can be read
   // by the AVR core. The data_ex2 is read from the user module.
   
   logic data_ex2_sel;
   logic data_ex2_we;
   logic data_ex2_re;
   logic [WIDTH-1:0] data_ex2;

   // End, interfaces
   //----------------------------------------------------------------------

   
   //======================================================================
   //  Control select
   //
   // For each register interface, do control select based on address
   assign ctrl_sel = (dm_sel && ramadr == CTRL_ADDR);
   assign ctrl_we  = ctrl_sel && (ramwe);
   assign ctrl_re  = ctrl_sel && (ramre);
   
   assign data_ex1_sel = (dm_sel && ramadr == DATA_EX1_ADDR);
   assign data_ex1_we  = data_ex1_sel && (ramwe);
   assign data_ex1_re  = data_ex1_sel && (ramre);

   assign data_ex2_sel = (dm_sel && ramadr == DATA_EX2_ADDR);
   assign data_ex2_we  = data_ex2_sel && (ramwe);
   assign data_ex2_re  = data_ex2_sel && (ramre);

   // Mux the data and enable outputs
   assign dbus_out =  ({8{ctrl_sel}}     & ctrl_reg)     |
                      ({8{data_ex1_sel}} & data_ex1_reg) |
                      ({8{data_ex2_sel}} & data_ex2);

   assign io_out_en = ctrl_re     ||
                      data_ex1_re ||
                      data_ex1_re;

   // End, Control Select
   //----------------------------------------------------------------------
   

   //======================================================================
   // Load write data from AVR core into registers
   //
   // For data written from the AVR core to the user module, you may
   // want to register the value here so that it is held for reference
   // until the net update in value

   // Load control register
   always @(posedge clk or negedge rstn) begin
      if (!rstn)  begin
         ctrl_reg <= {WIDTH{1'b0}};
      end else if (clken && ctrl_we) begin
         ctrl_reg <= dbus_in[WIDTH-1:0];
      end
   end // always @ (posedge clk or negedge rstn)

   // load data_ex1 register
   always @(posedge clk or negedge rstn) begin
      if (!rstn)  begin
         data_ex1_reg <= {WIDTH{1'b0}};
      end else if (clken && data_ex1_we) begin
         data_ex1_reg <= dbus_in[WIDTH-1:0];
      end
   end // always @ (posedge clk or negedge rstn)

   // End, Load write data
   //----------------------------------------------------------------------


   //======================================================================
   // Instantiate user module
   //
   // Below is an example instantiation of a simple user module. It
   // provides just enough I/O to demonstrate how the above logic is
   // connected.
   
   user_xb xb_inst (// Clock and Reset
                    .clk         (clk),
                    .reset_n     (rstn),
                    // Inputs
                    .enable      (ctrl_reg[0]),
                    .data_ex1_we (data_ex1_we),
                    .data_ex1    (data_ex1),
                    // Output
                    .data_ex2    (data_ex2)
                    );
   
   // End, Instantiate user module
   //----------------------------------------------------------------------
   
endmodule // xlr8_xb

