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

`ifndef GUARD_SVT_GPIO_DRIVER_CALLBACK_SV
`define GUARD_SVT_GPIO_DRIVER_CALLBACK_SV

typedef class svt_gpio_driver;

/**
 *  Additional protocol-specific callbacks
 */
class svt_gpio_driver_callback extends svt_callback;

  //----------------------------------------------------------------------------
  /** CONSTUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new();
`else
  extern function new(string name = "svt_gpio_driver_callback");
`endif

  /** 
   * Called after the traaction has been received from the sequencer, before its execution
   * begins.
   * 
   * @param driver A reference to the svt_gpio_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param xact A reference to the descriptor for the transaction that is about to start.
   *             Modifying the transaction descriptor will modify the transaction that will be executed.
   * 
   * @param drop If set, the transaction will not be executed.
   */
  virtual task post_input_in_get(svt_gpio_driver       driver,
                                 svt_gpio_transaction  xact,
                                 ref bit               drop);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after completing a transaction or detecting an interrupt condition,
   * just prior to placing the transaction in the analysis port.
   *
   * @param driver A reference to the component object issuing this callback.
   * @param xact   A reference to the complete svt_gpio_transaction descriptor or interrupt
   *               The transaction must not be modified.
   */
  virtual function void pre_observed_out_put(svt_gpio_driver driver,
                                             svt_gpio_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /** 
   * Coverage callback method called after a transaction has completed or interrupt condition detected.
   * 
   * @param driver A reference to the svt_gpio_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param xact A reference to the descriptor for the completed transaction or interrupt.
   *             The transaction must not be modified.
   */
  virtual function void observed_out_cov(svt_gpio_driver driver,
                                         svt_gpio_transaction xact);
  endfunction
endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
GseNuKNksKXLMARZ6tC0pxBUIOKQtirHvPrN1WmsHlgUmdL4A6Ep2graS+FwSEkp
fWX+C9XRVdcmx+0Axp3ajpLVaZ1GVRnSBid24WcjCPFISY+/HK2B06Chabazq2bp
1a4yzZ9EOcYNg1oYUgFYdbK5wsaf2deAW49nVw7+TJXc40iZ6DC2vQ==
//pragma protect end_key_block
//pragma protect digest_block
u99T0TDz/vCBMF0bfjZHi9pV36U=
//pragma protect end_digest_block
//pragma protect data_block
EjiQt2lRmctpmPECLz4/rfmfBwXHTePr45/5XMjdkdv0aG/3744xTVeb+c2R/o9j
JIKpz8bRCrkU4qVdHycDgYaTvFKfUFYs1X0KeKBpYXHBDLOajUi0FAN1PtiPCWsa
VQjx3qO4N5c6vc/T2DBI3tbcxVVgaZfnPUkyJzgcaXeLEA8UUoALiptUBhW3UJGq
GV8gI6rZoRLIO+t2Nm3809/LLKUf+YvnlvTFBtfcdck0313Zt0NGULm9nQGfZ2HO
F8nx5PsmiZwsgU8UFv2kPSTm3VS8WyfDCsR9+XSWWNqJm8PdnQ7GsoUANguxG4AD
Hmtv6xFid0Dp3CQsTJmy13j7OObYA2GiN4dTAvaYt5EnnBbvSUWjp6sWKMo7sN99
FndzaoEonZpqhV2Jkx5EEVUT6S0g7bJX+xOEQHvR/HkiHJX1ECcKpZyPCSGtSLBU
qgYFFN3g9Y8uiBvmBVD2B/9WTm3SkiFRG6uzgu0nP4fQEOiFdbdu82W4hNmmKL4i
Og9neTDsjzoUwi6fMDRFXUcQnZV4iWysIdyLcgonvKO6PuaRlQY23YOjUnqqCMP3
6tcFb6GUEGYZYeoZIgqWdKbaxHUtdaPgRhLr1QTGBk/tAuYWGFhRf+Kb4TuTZXdF
ATjXvZMkmmYBVmSybpHdKyDd+ddJRiCzfk2giE5vdEObHhVmqhUu8rRBjlBxxIrr
Ken59OHhQYD7GUK1LZnKAEAf3tx+js0et8nfMPi+JqKN3QSqStFMemMh5ALAjDEs
jBxUA1Kr6ubAbRk5Yy8neqbw8sy2cpLLj6oP4anNF60=
//pragma protect end_data_block
//pragma protect digest_block
oAfDyFi1ZRjyuabBaHkEkMJqrTU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_DRIVER_CALLBACK_SV
