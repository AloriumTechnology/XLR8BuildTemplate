//======================================================================
// Filename    : xb_adr_pack.vh
// Author      : Steve Phillips
// Description : AVR address constants (localparams) for registers 
//               used by Xcelerator Blocks (XBs) 
//
// When allocating register addresses for your XBs, you need to know
// what addresses are available for use by XBs. The reg addresses used
// by XBs should be unused by other functions. The register address
// range is 0x00 thru 0xFF. There are no available addresses in the
// lower half of the range (0x00 - 0x7F), but there are many scattered
// thru the upper half of the address range.
//
// The list below details the allocation of addresses in the upper
// half of the reg address range (0x80 - 0xFF). The addresses listed
// as --UNUSED-- are safe to use for your OpenXLR8 modules. It is
// recommended to use addresses in the big block of --UNUSED-- reg
// address at 0xDE - 0xF3. If that is not enough then other --UNUSED--
// addresses could be used.
//
// Addresses marked as ALLOCATED are actively used by the base AVR
// design. DO NOT USE ALLOCATED Addresses. Use of ALLOCATED addresses
// will cause XLR8 errors.
//
// Some addresses are used by what we call "Builtin" XBs. These are
// XBs that can be included in a design without incorporating them
// into the OpenXLR8 module. The addresses for the Builtin XBs are
// hardwired to specific locations that must be avoided if one of
// those builtins is present. Those addresses are in the 0xE0-0xFF
// range and are noted as UNUSED unless the XB is present. Note that
// when using OpenXLR8, no Builtin XBs are included unless the user
// specifically enables them.
//
// Some addresses that are unused by the XLR8 or the Sno boards are
// used on the Hinj board, which uses many more addresses than the
// first two boards. Those that are used by the Hinj bord are marked
// as such and should not be used if you are targeting the hinj board.
//
// Copyright 2017, Superion Technology Group. All Rights Reserved
//----------------------------------------------------------------------

//======================================================================
// Enter your allocations here, for example:
//
// localparam XB_CTRL_ADDR    = 8'hE0; // Address of XB Control Reg
// localparam XB_DATA_ADDR    = 8'hE1; // Address of XB Data Reg

//
//----------------------------------------------------------------------

//======================================================================
// Reference list for upper half of register address range
//
// Select --UNUSED-- addresses from below to use in your allocations 
// above
//----------------------------------------------------------------------
// localparam ALLOCATED       = 8'h80; // Used by AVR Core
// localparam ALLOCATED       = 8'h81; // Used by AVR Core
// localparam ALLOCATED       = 8'h82; // Used by AVR Core
// localparam UNUSED          = 8'h83; // --UNUSED-- ------------- Used by Hinj --
// localparam ALLOCATED       = 8'h84; // Used by AVR Core
// localparam ALLOCATED       = 8'h85; // Used by AVR Core
// localparam ALLOCATED       = 8'h86; // Used by AVR Core
// localparam ALLOCATED       = 8'h87; // Used by AVR Core
// localparam ALLOCATED       = 8'h88; // Used by AVR Core
// localparam ALLOCATED       = 8'h89; // Used by AVR Core
// localparam ALLOCATED       = 8'h8A; // Used by AVR Core
// localparam ALLOCATED       = 8'h8B; // Used by AVR Core
// localparam UNUSED          = 8'h8C; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h8D; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h8E; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h8F; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h90; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h91; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h92; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h93; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h94; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h95; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h96; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h97; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h98; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h99; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h9A; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h9B; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h9C; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h9D; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h9E; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'h9F; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA0; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA1; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA2; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA3; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA4; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA5; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA6; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA7; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA8; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hA9; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hAA; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hAB; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hAC; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hAD; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hAE; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hAF; // --UNUSED-- ------------- Used by Hinj --
// localparam ALLOCATED       = 8'hB0; // Used by AVR Core
// localparam ALLOCATED       = 8'hB1; // Used by AVR Core
// localparam ALLOCATED       = 8'hB2; // Used by AVR Core
// localparam ALLOCATED       = 8'hB3; // Used by AVR Core
// localparam ALLOCATED       = 8'hB4; // Used by AVR Core
// localparam UNUSED          = 8'hB5; // --UNUSED-- ------------- Used by Hinj --
// localparam ALLOCATED       = 8'hB6; // Used by AVR Core
// localparam UNUSED          = 8'hB7; // --UNUSED-- ------------- Used by Hinj --
// localparam ALLOCATED       = 8'hB8; // Used by AVR Core
// localparam ALLOCATED       = 8'hB9; // Used by AVR Core
// localparam ALLOCATED       = 8'hBA; // Used by AVR Core
// localparam ALLOCATED       = 8'hBB; // Used by AVR Core
// localparam ALLOCATED       = 8'hBC; // Used by AVR Core
// localparam ALLOCATED       = 8'hBD; // Used by AVR Core
// localparam UNUSED          = 8'hBE; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hBF; // --UNUSED-- ------------- Used by Hinj --
// localparam ALLOCATED       = 8'hC0; // Used by AVR Core
// localparam ALLOCATED       = 8'hC1; // Used by AVR Core
// localparam ALLOCATED       = 8'hC2; // Used by AVR Core
// localparam UNUSED          = 8'hC3; // --UNUSED-- ------------- Used by Hinj --
// localparam ALLOCATED       = 8'hC4; // Used by AVR Core
// localparam ALLOCATED       = 8'hC5; // Used by AVR Core
// localparam ALLOCATED       = 8'hC6; // Used by AVR Core
// localparam UNUSED          = 8'hC7; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hC8; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hC9; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hCA; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hCB; // --UNUSED-- ------------- Used by Hinj --
// localparam UNUSED          = 8'hCC; // --UNUSED--
// localparam UNUSED          = 8'hCD; // --UNUSED--
// localparam UNUSED          = 8'hCE; // --UNUSED--
// localparam ALLOCATED       = 8'hCF; // Used by AVR Core
// localparam ALLOCATED       = 8'hD0; // Used by AVR Core
// localparam ALLOCATED       = 8'hD1; // Used by AVR Core
// localparam ALLOCATED       = 8'hD2; // Used by AVR Core
// localparam UNUSED          = 8'hD3; // --UNUSED--
// localparam ALLOCATED       = 8'hD4; // Used by AVR Core
// localparam ALLOCATED       = 8'hD5; // Used by AVR Core
// localparam ALLOCATED       = 8'hD6; // Used by AVR Core
// localparam UNUSED          = 8'hD7; // --UNUSED--
// localparam UNUSED          = 8'hD8; // --UNUSED--
// localparam UNUSED          = 8'hD9; // --UNUSED--
// localparam UNUSED          = 8'hDA; // --UNUSED--
// localparam UNUSED          = 8'hDB; // --UNUSED--
// localparam UNUSED          = 8'hDC; // --UNUSED--
// localparam UNUSED          = 8'hDD; // --UNUSED--
// localparam UNUSED          = 8'hDE; // --UNUSED--
// localparam UNUSED          = 8'hDF; // --UNUSED--
// localparam UNUSED          = 8'hE0; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE1; // --UNUSED--
// localparam UNUSED          = 8'hE2; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE3; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE4; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE5; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE6; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE7; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE8; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hE9; // --UNUSED-- -- Unless Builtin Quad Installed --
// localparam UNUSED          = 8'hEA; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hEB; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hEC; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hED; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hEE; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hEF; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF0; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF1; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF2; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF3; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF4; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF5; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF6; // --UNUSED-- -- Unless Builtin PID Installed --
// localparam UNUSED          = 8'hF7; // --UNUSED-- -- Unless Builtin NeoPixel Installed --
// localparam UNUSED          = 8'hF8; // --UNUSED-- -- Unless Builtin NeoPixel Installed --
// localparam UNUSED          = 8'hF9; // --UNUSED-- -- Unless Builtin NeoPixel Installed --
// localparam UNUSED          = 8'hFA; // --UNUSED-- -- Unless Builtin NeoPixel Installed --
// localparam UNUSED          = 8'hFB; // --UNUSED-- -- Unless Builtin Servo Installed --
// localparam UNUSED          = 8'hFC; // --UNUSED-- -- Unless Builtin Servo Installed --
// localparam UNUSED          = 8'hFD; // --UNUSED-- -- Unless Builtin Servo Installed --
// localparam UNUSED          = 8'hFE; // --UNUSED--
// localparam UNUSED          = 8'hFF; // --UNUSED--
//----------------------------------------------------------------------
