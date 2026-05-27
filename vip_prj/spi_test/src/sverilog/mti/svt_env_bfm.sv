//=======================================================================
// COPYRIGHT (C) 2011-2015 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_ENV_BFM_SV
`define GUARD_SVT_ENV_BFM_SV

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT ENV components.
 */
class svt_env_bfm extends `SVT_XVM(env);

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

  /** Flag to track when the model is running */
  local bit is_running = 0;

  /** Flag to detect when the model is configured */
  local bit is_configured = 0;

/** @cond PRIVATE */
  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  /** Identifies the product suite with which a derivative class is associated. */
  local string  suite_name;

  /** Identifies the product suite with which a derivative class is associated, including licensing. */
  local string  suite_spec;

  /** Special data instance used solely for licensing. */
  local svt_license_data license = null;

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
`ifdef SVT_UVM_TECHNOLOGY
  `uvm_component_utils(svt_env_bfm)
`else
  `ovm_component_utils(svt_env_bfm)
`endif

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new component instance, passing the appropriate argument
   * values to the component parent class.
   * 
   * @param name Name assigned to this agent.
   * 
   * @param parent Component which contains this agent
   *
   * @param suite_name Identifies the product suite to which the agent object belongs.
   */
  extern function new(string name = "", `SVT_XVM(component) parent = null, string suite_name = "");

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nEcsVU7yjWzAB78o74OTs3EWpSUafdMBirzdD4n1bM0wsQ2dSLG0wSUx4AOzcbUM
n+MoufbPPFYZ+nGG4Whg4xtoS/Kj+l+o0UoqlbWhcFi659Y32M6cLac0URhG55H3
rlnDXcFpr2giQiQVdWidjmUWgFc0cT41Fpoy3Tag6z4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 362       )
TlDM9NRiCwex7Xpolf4SkKlJeoBtCQ1nwxK78aYdbZPWRIp/p2axjDfWKHcvdMCo
VkrvtIoW/LnoLVHfPaefhzvWSzMKfOnT54Fzl5HqjpXjjKcMOAgMQc2wzAoqcThh
I/eIyYN+Q83BXpPSYIXXtfTjmI3nuE1NG9csNIJizzcY+H4qetsPOBeo1LrUk99I
AA5lNs46DLnW883ipVCWNBQ3K+0gb1u6nt5Laf7rin/DPy6A4M7woL2/Dz2/qHcd
9f4JmRwX4DfQqqyXdjN8rIwV6/0VlcOJJUhPPUN0KWXtsc6dmbzdaBz8oW8LuEbH
2ToSvVzFCyMZEOhuqX74eosXZEiNX1ScLxEuHRbR4D0mSMvcuEZ9DP7VqNtiMJcV
ICbbBAUbJ3egPrdBo2qSdpFl9miLni4eH4eg3RqdUZiOU0NtECtECsG58kFx1VHn
AcTnfg/FyFxb0SXeQDu45SzzzlAvyC74B5ofl6OUQQ0=
`pragma protect end_protected

  /* --------------------------------------------------------------------------- */
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CQ1qnX/rt1F65maunRkCTtJXb9w5JSHge1lpodgT+LilextfgAkxzy4yGUF4647C
EdUF3eP5GPX5xcVWgK6frgfHAITIY1uRis1GqEFSSTMWEzQ+zl3oWCwfI92nM4IM
8pgJO8q9qG2b3RE/HxYI5Mm1TPCSgpf4GxxsXehd9rk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 686       )
XDQV1TmCdcy6z6vFDawjmLrJA32nYiXXd/KaSxQWuE/eHLEf6U+tgXeFb2vYjv6s
YYvfuStlCBNsrkP/qKftAfo+slyCdDMFPUJTZ87IrceLRTwixfEryHmRt+NgNAfO
duIT0wKHmf0T6yjERy4jzOMCme06DCjpzj1Lm54F3E6DoVNOTtx2VQ3EFlLwJkuv
75BuElBufjNEjgf8BWHnjo0XYoYnmvmq9/BKmgOi0N7TV90IOwxvTHLCJf/JR1gO
KKgcRbZjhDUQoM8aQ+ympAaMbWIDK3cL4XQUmUmJTZmSfh/6CHXzzEDl4Fl6fL/M
bqiaPZGYAEyKAC2iA9uBbNhgbkxwxOs6mJiLmISrLgxGejtDLPNmhkJUSFZrfOXn
3SvytI//fEKfNaZH88uC49ylJfOcaA9nuQBxLyAuqt4k+cmnHsIqfl6T3juzBCOu
`pragma protect end_protected
  
  /* --------------------------------------------------------------------------- */
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

  /* --------------------------------------------------------------------------- */
  /**
   * Returns the current setting of #is_running, indicating whether the component is
   * running.
   *
   * @return 1 indicates that the component is running, 0 indicates it is not.
   */
  extern virtual function bit get_is_running();

  // ****************************************************************************
  // User Interface for Configuration Management
  // ****************************************************************************

  /**
   * Updates the components configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the component
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   *
   * @param cfg Configuration to be applied
   */
  extern virtual task set_cfg(svt_configuration cfg);

  /**
   * Returns a copy of the component's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   *
   * @param cfg Configuration returned
   */
  extern virtual task get_cfg(ref svt_configuration cfg);


  // ****************************************************************************
  // Utility methods which must be implemented by extended classes
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the component. Used internally
   * by set_cfg; not to be called directly.
   *
   * @param cfg Configuration to be applied
   */
  extern virtual protected task change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the component. Used internally
   * by reconfigure; not to be called directly.
   *
   * @param cfg Configuration to be applied
   */
  extern virtual protected task change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**\
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the component into the argument. If cfg is null, creates
   * config object of appropriate type. Used internally by get_cfg; not to be called
   * directly.
   *
   * @param cfg Configuration returned
   */
  extern virtual protected task get_static_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the component into the argument. If cfg is null, creates
   * config object of appropriate type. Used internally by get_cfg; not to be called
   * directly.
   *
   * @param cfg Configuration returned
   */
  extern virtual protected task get_dynamic_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the component. Extended classes implementing specific components
   * will provide an extended version of this method and call it directly.
   * 
   * @param cfg Configuration class to test
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

endclass

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_env_bfm extends svt_env_bfm;
  `uvm_component_utils(svt_uvm_env_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
    super.new(name, parent, suite_name);
  endfunction
endclass
`endif

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TuMCvwh3lZnVENn/pfS7Z1nVvqV+2mvoSzoetm278+tqKeo33U2nzDrhPbewDMdW
2NLaAt40lfoDp7FPVMsV2liJ06C8UeejSs29WOkx20Boto6jkm5zt60ORcz0juAN
6nfoj4ybl4J1lkzajP8g7zH0fGBaauYZEFhxPgJ5Yds=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7322      )
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
WtceMKyvmPoCtt3tGqAyjw==
`pragma protect end_protected

`endif // GUARD_SVT_ENV_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
GJ1LkUgSnFgdVeyaZO+M8PpYl9TpN1l3bhDzHYLU8aqGO3zcOx9He5zZNEerIFoi
iFpJzqL4vj3Qb/ohQgWvtIpTW1CZEtsDvm5BNh3LS3JMBcb8j5SzAT6sBMNgVbYM
ugHhu4LUPvuv0vKS9I6RnIJnCbyvTAj5ITNBMr8O2YY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7405      )
EE6I+3+ztR1UOAi7Tc0ZSrw8iw2mZ8whKWppzCzDtIx/XI0uYDNjWjWDfa7IMfJQ
kIpK5t9R8T2/nyUtC37wHqDe8mX/xYLc1iTDhCkZSIkitZMyUUXnlGB1w46B9+qu
`pragma protect end_protected
