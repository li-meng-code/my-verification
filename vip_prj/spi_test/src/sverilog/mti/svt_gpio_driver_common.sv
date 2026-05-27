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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
C0Y3QDZoI6OHL/2ZtoIdTkdzCqIpVeWqS0dHZ8kmOSNbJQTbS/H/DwYQX4fmW6uf
daeCAVuVRIsUmiLWgFNOG47S6rppZzWE9x00td0fQaqQ1PUIWCdKd9UgXxAHaQVU
CWYWQLsAf089AFD2TMuvNv7cmQ0AwGJVKnQ5/5XV2f0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 159       )
8ZGl3R0zOvJHZENmzNhBtSnJMiy1wh4qth1GVcDnWcz4cQlEpdT6KszjXsmDJdZG
ifWD6WS97q6BsUN4O/nQk5F8E8P7CXK2hIrv1Vh5vk71YuYXW+bkeWKK3n6uIK/J
9gwKGu+e7gG+QHRy4Qa+OgGCfArDBH0m4TgDobwTLqeV+QSn7kJOdmX9d3Qvbyfi
HSLd3daQobLQxw+YaFHLKA==
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SIMsPZKT94YuzITjbASiywFsouug24plR9TF3L+QvwY+GS93tKiKx8bKw+jJXjxy
1jwF9l5bWEY5MNslh8mMQZ3ZbylRpJiymfm6k+vSffMMBI+o7Hoy56X2A3e8b0tq
KdSVcRMuS9ALz+0oS03E6icloUdebSzSOYStvduLN80=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5218      )
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
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_DRIVER_COMMON_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oFvJKCwO5Ua6e8O5R1uP32GkXSqda1/7kI4DHrbfFJ7bvR41Utmcnya462aohdXk
xTih6twID0qDTBFdPR/5AdS+mAY2s6uXRn0ic4SZURnPBBlCprkuJVz7fAZkoR8Z
1lw0lPLf7nqgt0djzdXrYgo0+EJrCfDKmqBXfTg4kEU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5301      )
cpOTa23i7AlUCRWBkYZz+w50qILeuJhHGOQYKKn1u0fwqDqTN7tOgB6ZcoAkpZ1w
TcpvHm5D4iV4J9ctnJS0bW+OXkb0Bo8s/AMzq5hTjqM8fS1sCIDMfYmUtwdKOK/e
`pragma protect end_protected
