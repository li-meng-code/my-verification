//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_GPIO_XTOR_DRIVER_COMMON_SV
`define GUARD_SVT_GPIO_XTOR_DRIVER_COMMON_SV

import "DPI-C" context function chandle svt_reset_gpio__get(string path);

import "DPI-C" context task svt_reset_gpio__configure(input chandle           api,
                                                      input byte    unsigned  min_iclk_dut_reset,
                                                      input byte    unsigned  min_iclk_reset_to_reset,
                                                      input longint unsigned  enable_GPi_interrupt_on_fall,
                                                      input longint unsigned  enable_GPi_interrupt_on_rise);
  
import "DPI-C" context task svt_reset_gpio__drive_xact(input chandle          api,
                                                       input byte    unsigned cmd,
                                                       inout longint unsigned data,
                                                       input longint unsigned enabled,
                                                       input int     unsigned delay);
  
class svt_gpio_xtor_driver_common extends svt_gpio_driver_common;

  // ***************************************************************************
  // TYPE DEFINITIONS FOR THIS CLASS
  // ***************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  /** Reference to the C API if using the synthesizable VIP */
  protected chandle m_C_api;

  /** 
   * Static associative array of references to instances of this driver 
   * class, where each reference is a back-reference from the associated C++ API 
   * instance for the corresponding synthesizable BFM module instance.
   */
  static svt_gpio_xtor_driver_common back_reference [chandle];

  // ****************************************************************************
  // TIMERS
  // ****************************************************************************

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  /**
   * CONSTRUCTOR: Create a new transactor instance
   * 
   * @param cfg Required argument used to set (copy data into) cfg.
   *
   * @param reporter UVM report object used for messaging
   */
  extern function new (svt_gpio_configuration cfg, svt_gpio_driver driver);

  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

  /** Main thread */
  extern virtual task run_phase();

  /** Initialize output signals */
  extern virtual task initialize();

  /** Drive the specified transaction on the interface */
  extern virtual task drive_xact(svt_gpio_transaction tr);

  /** Eventually called by the C API::interrupt() callback */
  extern static function void route_interrupt(chandle          Capi,
                                              longint unsigned data,
                                              longint unsigned enabled,
                                              int     unsigned delay);

  extern virtual function void interrupt(longint unsigned data,
                                         longint unsigned enabled,
                                         int     unsigned delay);


endclass
/** @endcond */

// -----------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
O3rPa8LPtfDJ2M85/HwYmPAfKdd0tZh6hIezrCZcRJGDzj4Xv94tmixdFa2pyTxi
qjk+TNz13snUa1dqyKCGCSCqoWlE8hWvcN69a1CGSh27SyJEAYjSMFfE68zls8KC
UCWuEnYmrWHNLW0QcSg9lTSBw9dhFLnx3RjtBiKzwNFgvGsxCSaDUg==
//pragma protect end_key_block
//pragma protect digest_block
QAkPShtXecetCBUwze9XDoKjM3E=
//pragma protect end_digest_block
//pragma protect data_block
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
8mwGsu7c2IcgeYeBVZ4gww==
//pragma protect end_data_block
//pragma protect digest_block
LjH7DVb/AYBsB2kW4d6Ntzms8SI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif
