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

`ifndef GUARD_SVT_GPIO_DRIVER_COMMON_SV
`define GUARD_SVT_GPIO_DRIVER_COMMON_SV

/** @cond PRIVATE */
typedef class svt_gpio_driver;
typedef class svt_gpio_driver_callback;

class svt_gpio_driver_common;

  svt_gpio_driver driver;
  `SVT_XVM(report_object) reporter;
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
fq6PXva6zVc3B09nrgpDQqwi29R9xWU51tT+Ad6k//MqPJbucqVzZ0SuMphU0Cxk
VfBYn44cwk8YHB2X7zhVDj82VX1hbcmyQk4rOSFuyXMynSVHJHbJ7wIUXBPrlHCK
CWuAbZ+AZBo+VuyrtQkB8x/YYI/qt/FvIuNhvZ/Z19b/EzNLjAR1qQ==
//pragma protect end_key_block
//pragma protect digest_block
HNGykXH9Ly6tsN5qHJr9suBsAiI=
//pragma protect end_digest_block
//pragma protect data_block
QQHKyRcvAzZUnV+LhznciESAI6jqmz3Hk/sT9mQuEymTkjjip4fUz7IBDSox1t4z
fdEUyqAqvxiPS1xluD6Fy3bUoA7yed26SlRn1KltD/DB2CFCGRKcZnDr4EMq6Of2
21y3rMbNP+H4bivz6qVharn4xpjQaTrPjiNEuC/sG6E3sqb5AwdSHQ55tBnS1tDb
hr44dLgszBxhXDeXd49p/Ya9n5L2pIT2KxZkgf9SantKE3QVbWEYuLb/eV8+sOv9
6/+syRo6OYrbtGz9LORuTWi2hrWnFVB2tO5MouwOltjqc9SlitOAQalzXXcWJV1s
ruyVEcgn3Q2V4segq4LuuZGIMkG8VkCAlnAe9hIf/vb0wuulcc6t6xdzAx3CaJTk
SwgvvJnASDTElG2NlICRUL0NaEmQuR/bEbzsL06loIR8javFgezz4voqbQ8VieKs

//pragma protect end_data_block
//pragma protect digest_block
1NLRRihdFgtLx6kFLFT2G2KUkyY=
//pragma protect end_digest_block
//pragma protect end_protected

  // ***************************************************************************
  // TYPE DEFINITIONS FOR THIS CLASS
  // ***************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  /** Agent configuration */
  protected svt_gpio_configuration m_cfg;
  
`ifdef GUARD_SVT_VIP_GPIO_IF_SVI
  /** VIP virtual interface */
  protected svt_gpio_vif m_vif;
`endif

  // ****************************************************************************
  // TIMERS
  // ****************************************************************************

  int unsigned n_iclk_since_dut_reset;
  int unsigned n_iclk_since_dut_unreset;
  int unsigned n_iclk_since_last_interrupt;

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * CONSTRUCTOR: Create a new instance of this class
   * 
   * @param cfg Required argument used to set (copy data into) cfg.
   * @param xactor Transactor instance that encapsulates this common class
   */
  extern function new (svt_gpio_configuration cfg, svt_xactor xactor);
`else
  /**
   * CONSTRUCTOR: Create a new transactor instance
   * 
   * @param cfg Required argument used to set (copy data into) cfg.
   * @param driver that encapsulates this common class
   */
  extern function new (svt_gpio_configuration cfg, svt_gpio_driver driver);
`endif

  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

  /** Main thread */
  extern virtual task main();

  /** Initialize driver */
  extern virtual task initialize();

  /** Drive the specified transaction on the interface */
  extern virtual task drive_xact(svt_gpio_transaction tr);

  //***************************************************************

endclass
/** @endcond */

// -----------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
I8DvybvAjx6hlMmjIiT+EKQYjk4TmQMcYXzDCUABqJUiAx049VdoV0S/vhnb4Amc
N1f+u7Aof5qRRub5tGsptPCH1sIRoXFJvmjT3QajHxCcj5udX3+qYCyBKuBQiGk7
eKEiIVX4pFyVV9gp31PVpwqVek0kUo6/ZbHI6qWA1CA+4S9SFwunYA==
//pragma protect end_key_block
//pragma protect digest_block
J6m3IoEjOcwiU+M21KWeRRbTJFE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
HwKCTlUHkLrWHUBmsYh8UYRuQ0M=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_DRIVER_COMMON_SV
