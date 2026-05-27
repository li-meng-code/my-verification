//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_LOG_CALLBACKS_SV
`define GUARD_SVT_LOG_CALLBACKS_SV

// =============================================================================
// DECLARATIONS & IMPLEMENTATIONS: svt_log_callbacks class
/**
 * This class is an extension used by the verification environment to catch the
 * pre_abort() callback before the simulator exits.  In the callback extension,
 * the vmm_env::report() method is called in order to provide context to the
 * events that lead up to the fatal error.
 */
 class svt_log_callbacks extends vmm_log_callbacks;

  /** ENV backpointer that is used used by the pre_abort() method. */
  protected vmm_env env;

  // --------------------------------------------------------------------------
  /** CONSTRUCTOR: Creates a new instance of the svt_log_callbacks class.  */
  extern function new(vmm_env env = null);

  // --------------------------------------------------------------------------
  /**
   * This virtual method is extended to catch situations when the simulator is
   * about to abort after the stop_after_n_errors limit has been reached or
   * a fatal error has been generated.  The only objective is to put out an
   * appropriate Passed/Failed message based on this event.
   */
  extern virtual function void pre_abort(vmm_log log);

endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hqokSrplgYvJkIs0HF6u8WlvrLJKa7jxXVzaIRWrMgxqDpq3n3la0SlkMyaUppVC
yXFkWOxdrAuUGX1bDUR/9F8bJ1cjP4s0xL4F2Vf7qhuAiHDoNY5dJpRLQEF8qj4H
tWPectBIN62m0Ad+mpYFBYB+9JSvggiYyfd1QZGcF88=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 762       )
Qk8mWjghNvKoD+78OWfpXqoXta/a9hvCPMI7b2xn+kb69U2JcfdM49RWf3MVODef
4nTBV5KciRv0VfGOoctL8u4houSay5L35r8sCQKOXfHgrKxMZF77clS4sHJbWqW/
aBCLto5gvIKPaXAXyuDaPfRLeJNhBNnfwT+GmYtj3iB0PBn3VdveeWGhGxQwJrV2
PTHBM7FpVNvpWtht9QpGs0/Itui4dsYCSo7Bu3MxiHKCxytFfNtd17gpFIxiaYVe
HlBfUL1ZNClegmhy8PoTKiF+457uNDHHcM+UdgOB3ATsvZw2wUVWPwOoHqNB5VRH
mL91SfqbgqFOOXINrlnHa0GXU3WncMmNcUsX4gt8XGYSny5Yz1As8mIGv5uYLfnn
tTuHStpZ8wl5UHM1yEFifpSOKZnKSamtA29Q2R+g05ZFPUGYFwtUIhwnFp/Ja1TG
pP9xydsOjI0h3VA5iRGJuqMbQezqwMLIAAywX0roWqqHQD5GfM1wWsez7qhI8MSO
lJ4unGP/vefXNWjLugJ9YON13pteeKNq/t+ddPevCdtqqU1dSfgCh85SeWy6ulcf
WAyEHVAyQ4I2AOgh/2HXpJt9wLhUAXRzIC5Z1AuyrZoPNAVcTGSQaMo3N8uLZRit
+mjYnb01dzTR1AZgUg73YrEwrWL11OrOuEngrawqcP/lJxjBsPnXJHJV9vguxPpu
1L5fxTsJvh7+3mhGAK6WqmWKgmUDQ6TOkaib/5BN3aKt8y0eBIjf613Z07C9/ina
XzwZ5O7m35RQqocUWOndB3zWF7WiiDJGzRVmDkYDGrMIeOHmGPOUtU3vVfWo4I0m
5GN1dNPbjGObSZz/hcgClKgDc/BiLRoOmxXqM3krqq/BfTUMedsfKN+9/ZSqyW5Z
ibYdNclApD5qxSNmPGvJU6FMSwzijgFnzLn/bK4VHvGZsLpK9Ht3WnlDb6mDsdTY
3V+byMHWStoz1OVRMhD7+6m+gnpbJPcRYYBpXN3wnMVOF/Ic3nAuoIJ7/IJ2UqDY
`pragma protect end_protected

`endif // GUARD_SVT_LOG_CALLBACKS_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
joaiwMSlWoVdjVxBrrvlAP4cOvYNylJUnDfJLN5DxT/sv3eXt2AE/s+my7Ub1DPq
uPEppT84FxLvLIZNaH2dDs+OWA9qAwOMbVT7TvjtqzmuqTiDlNmMeAGmx4p8JzmF
QzqseQqsEKJh6DJMAJ9uel6MZGqqU2Fqhyz3VjGZjx0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 845       )
nmvKgkUNI7wbrtVWt5+X8yvCYpk9io5Qi7EoAiOYUhZDIGnMx5nRsP/kQBzX18da
/xGAd061fVSHXLochB0mSpahddKzsZQRQFsdzAip38ijxz5Vj0M6qYV47bzy7kd3
`pragma protect end_protected
