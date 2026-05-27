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

`ifndef GUARD_SVT_GPIO_DRIVER_SV
`define GUARD_SVT_GPIO_DRIVER_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_event_util)

// =============================================================================
/** Driver for a master component */
class svt_gpio_driver extends svt_driver#(svt_gpio_transaction);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * Event triggers when driver consumes the transaction object. 
   * At this point, transaction object is not necessarily processed or transmitted on the bus.
   */
  `SVT_XVM(event) EVENT_XACT_CONSUMED;
  
  /**
   * Event triggers when the driver has started a transaction.
   */
  `SVT_XVM(event) EVENT_XACT_STARTED;

  /**
   * Event triggers when the driver has completed a transaction.
   */
  `SVT_XVM(event) EVENT_XACT_ENDED;

/** @cond PRIVATE */
  /** Analysis port to report completed tranasction in the absence of a monitor */
  `SVT_XVM(analysis_port)#(svt_gpio_transaction) item_executed_port;
/** @endcond */
  
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aEGC5dZNS4E/05HoCFoG6wXusWjac/HkDbC2dUr85Ie9oSpiUhnfdNJF5Unva0wT
7/TADDXOXZGmG2zMrnZ3U66NbqSIRdyB9MFHClKWN4kW6tXOrvq8Vq+GIvlIxQqz
XR7Aie4FVqVtoTjo0ntyasuVtPi/9nPjNw2TBilgMgk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 389       )
GFoNckQojBELaQ3DBmm1OLxzzADAzN7z6lruc8E/aiN/Ychceh7FZiMn+h7wdm9U
7jKG4LpHi+yCJiAIkow8TtepRVzLK+twMEOot0OGLsBhTwLZR/dMJNLnW3mzQdwt
V8qi1a17B8uI/mUcJXH0OnGrI6+Qcr5opN2RSqV3b7bCSIXtYjYNnCg903BeDZH0
lTibSTjV4OIs00MNmQX8EnvOizvh2H/EFWFIWHPpj1lQDF6yUgfEiS2ZkOQi7hXM
QJOQYm3bOIQwsJeVpcVqxJCFpKFzF+9FLz9laqmyTP4upkdev+dDGAoxGXb4vN8p
nNiXVue9c/rrNZ7aHPW9jCtwJtqIeodpxFCPnqap0Wq0GtnGQzA68Y7vCRpXXWq8
sNRG812BGyjEH7NyRlviztUaHBbPvUrV6wCMjJV57w052r5InQoKZZqI6lhdGEMK
cbJody9t/QKlrJu1/OuiInBNAg5A2MKqKe7j12c15R7B5Rvxe5vMewf/GIvZuf9Y
D8dh8I14kyj1MZX1rMoOAA==
`pragma protect end_protected

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_component_utils(svt_gpio_driver)


  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this intance.  Used to construct
   * the hierarchy.
   */
  extern function new (string name, `SVT_XVM(component) parent);

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

  // ---------------------------------------------------------------------------
  /**
   * Build Phase
   */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

  // ---------------------------------------------------------------------------
  /**
   * Run phase
   */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual task run();
`endif
  
/** @cond PRIVATE */
  //----------------------------------------------------------------------------
  /** PRIVATE METHODS */
  // ---------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
b07t6o35Ohx4ds1bGWGdWU7XqyuNYYKEkz3RSq1K44zEZI1N9MKnA/Gch+yCBpte
os9RkHeCT/NwrDU+lLC6oGJCd5qovxW/wAL3CwDs680BLfFZDCREW88Bkwuq9upf
0n36unnu+ZwqCLOqf7xh8PiPH+MgUdmUEjK8Chxcr3w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 619       )
ub7R+SdFR8Z2/KQqNnt8v5DneBpwHdbFV5zbQbq3uCZkvmWKruDqBHrp8iCBjnUX
mYhrhmTKnBmuDISX+1IEYnA0EebA+rsmPY/gBNoXBgVbi0kZ6RSuabObhUK4H1CT
GCKwm2SmjeWdQB2JW2DwmWOKQRaRlZ88E55Z5qVFXxj6ba/mi/sT8Rji2bhsv2Wu
CvGW+bfJ6sSNymC+YougQax7TlwMmVjqFdAeBPZCO1AIXxwKuKlV6/rGHex+GEww
jiSgpr9ZEby4OGkc39ftPdSTrY7AFRkiV4kYxTFjFcylSpSJKqj1ijseFSspRIsU
`pragma protect end_protected
  //----------------------------------------------------------------------------

  /** Method which manages seq_item_port */
  extern protected task consume_from_seq_item_port();

/** @endcond */

  //----------------------------------------------------------------------------
  /** OOP CALLBACK METHODS provided by this driver. */
  //----------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  /**
   * Called before a transaction begins.
   * 
   * @param xact A reference to the descriptor for the transaction that is about to start.
   *             Modifying the transaction descriptor will modify the transaction that will be executed.
   * 
   * @param drop If set, the transaction will not be executed.
   */
  virtual task post_input_in_get(svt_gpio_transaction xact,
                                 ref bit drop);
  endtask

  /** 
   * Callback method called after a transaction has completed or an interrupt has been detected
   * 
   * @param xact A reference to the descriptor for the observed transaction or interrupt
   *             The transaction must not be modified.
   */
  virtual function void pre_observed_out_put(svt_gpio_transaction xact);
  endfunction

  /** 
   * Coverage callback method called after a transaction has completed or an interrupt has been detected
   * 
   * @param xact A reference to the descriptor for the observed transaction or interrupt
   *             The transaction must not be modified.
   */
  virtual function void observed_out_cov(svt_gpio_transaction xact);
  endfunction

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XD2im3md8GvbpzCP+5GQ7QHJY0yQCXWXcyOg7QFWQntPGqXcvuaUsi0teBVBBiL1
yHhADLHidMwyTl3Dkew2vBPm21rs5ekW02YFk5JEf+48ef8OdgHMh716QthS83X+
EyyH05NaS3uQkv77to50wCWgOccTVwIPlalLjfbVYvs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3167      )
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
t17Y1IWpyW9iS9yHCxSBVQ==
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_DRIVER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MOlQ0wwPiuEfYCMBm8bzcmcxlofrtnwhuB3edD5WXhb7taLz1pE5Cklh4Tn/SxJC
VcQh8Yn5rJQma52KeajIWSSjDo+DN08gDhHouWXuKR9rMRuKFigjVAZGI1MbdoGw
dCMzrGw8NDdsZojefQ4BKguo+yVyOATw5WYb3zj8cr0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3250      )
Ra5lUeHDpd9S76VOiQ784+D/pnyBggQXli8+qMp2gWWXdlW1VEtlcMTu+TR55cui
TFNOYwdEdIZUclIn4ml8zDj4t3SGcMLCDQJLhO+FljEjgjtPcgrQsv1jcFZAUciW
`pragma protect end_protected
