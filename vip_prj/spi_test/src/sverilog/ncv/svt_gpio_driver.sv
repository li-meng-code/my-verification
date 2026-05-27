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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zrI/e3VpIcfFaTTuxo1VwutVaRHCq0fp6f9h/8OOEBml+Tsi/t1xhdLcZlOC10Yj
+EzWgTq6Cx/F2dOVGA5F6FW9xKjhFxY/hrKeaBjIiGb62sw4v9af/6V0bQAJtZZJ
oZ6alOV8/i+d0G+5A3DGlbyrZ73JSbryEbUOcbBUIaI9eJxvgzuO9w==
//pragma protect end_key_block
//pragma protect digest_block
hq8qR8cysmHevSJj9QXxNn3wLpw=
//pragma protect end_digest_block
//pragma protect data_block
mxR3Z+zH2HV4Au9FdplMCD7nkYqaVglJboXnqF3UDo1/MJi6GDJyeRfuRcmZqpkl
4UoABw8IUkzQ0H7BfWJ19AHY18uGrGFJZAYAkJ1Z/8bebw6B7zeU/d020Mlt5y/F
p6Y97YZj318JMt7NwOUUkCqwRsDJ1oP6IMIjq42j01myskLV5+VsWqth4+Fl6/N1
C9PrfFDNVN1aVO50VbJNsxqzaFxGZpbFj1MkjqsAI2n0fNQh6sXAuMhp7LOF4RbG
4sz825dr98pPy8/GKn/ZW21JBl8NUEikvCLEOttHYBuY5mgGA7BefLId7bL3G1TB
Sds3mflMgTeKP4REgchK9xey6+JdEnHDyrSbKxv9S4k+MdFiNoBbpFMfX7xfIpVb
bwfbwG1ZEjV2f6LnNxPI6IpePUBemV0idTZB7+302GO0e6IIOb1dHRx0JvmBGTNB
MsVe9nlVRb3WT7l3ZGvzpHjw4kFJKt3x0H3yFhkbuI2BudzxMlVnxN3JhkvlvgGj
cJxixhUK9mh6S+0/gdliXzxV5CAaslI5L0ukzuaP+SXN3CVk4JrL22QavvOqg4lK
+xaFlcOwZhYPYypCdG0xE9dgXuAt/EUSGkC00Ve6szs4hInAi7jqoJwFzkbCDaQi
h28X1KCLKK3fHPqqa9jSM6EJXRbEqozgztKMjBqVfkXmsD8e9iKYDLZI+m33lRPE
Qik2cZu1h4nZrFtq03fphgWLyYxyO74TO/MzXUzV7/o=
//pragma protect end_data_block
//pragma protect digest_block
7Pr6ZLnOBU+zbY9QGitPdF/m00k=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
uNuWbEmeRGdC3wE1SCPfVnpSYuvvx9ncsqVWY81+q/UVrWUI6uJb12YK8kqMTsPx
MjkImH+CqV9Y4B3R+pTC4BFrWcKuk+iICTvJn1+F/ZHY2n9pUEAx23N12v1UBMU6
cus9svytANuiL3o6+CE9iujxg4Gc8bYqBMDrQCPyQvZ6bHlMQClyPg==
//pragma protect end_key_block
//pragma protect digest_block
wDJC1LB7f0hKSTUGqwPpe68uJ48=
//pragma protect end_digest_block
//pragma protect data_block
qd5qz2Ib/B1aq4JP5xnk+H4cRz+CIoZbLM8ClSyJRDSJ+TkHoe4XXuGJcuA9d45W
qH7eShKFoqvVWg+nkf14aqEKKxRSIKnKNjSBMzgf+OhEX37iFe9ERqZkPziA9jNj
umVhRehBOwqq+LmpfyadS235jOTLE5/3lmN2s8jJnRP/pZ5oX9aDKTrQ5Twc38HA
fWvlIUrqhY2urfUeDFzTHzrtFAuWDWkdMM1/fBcGstYgvT+b7jbuMVOp03naRz8q
S7GtF5XuJIvBkfVzQV6+s3L3kcEfS5phj9Tn3Lza+Itra4oyAmGwaBVGR5QRFLjH
zyVD0GAgyB4bz7WAHVvo2Ov1LK4n6Gbnc8JXGTqMDG+eh311Zni0kNNfZNxhtv/i
R1wZfvFLnXXfaUU747PvAlekmLRLEIUbPP8OlIrm6f1s+X0ILmLXGEWpiBYCuhbY
nvUGr4k1U1i/6XewaxWCdtwjuIekYDhcn2DeP+evVbvz34mxmwv1/82iL8b7Aw6Y
2GtmcPRPsSX3Zi99ZRceMA==
//pragma protect end_data_block
//pragma protect digest_block
ITIifBikVAB02rN1S7lsHnzWeIw=
//pragma protect end_digest_block
//pragma protect end_protected
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
cqhXMl1T8rQyiRGVfhFn3w+zAXbuy2H13QyEWNfMy81OB7SYkvKDAWkr/r0H49tu
UOK51K8Y7XVJuYy4RwXANpATQcowIC08vtSfw/ZZ8SzGjN5DxHT8ZVbRV8hAda/m
0W0S0RL1RSEzXnZfJzOSYEjm0laSPin0RKOMOX5ZMNb/C3BjGt6gpA==
//pragma protect end_key_block
//pragma protect digest_block
UqS4KEXSramh6xfznEQsl/abzac=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
jtsLGpjgMEeMVIOLOsvqF41hZKM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_DRIVER_SV
