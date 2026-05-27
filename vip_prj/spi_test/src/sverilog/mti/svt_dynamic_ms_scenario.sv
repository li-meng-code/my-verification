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

`ifndef GUARD_SVT_DYNAMIC_MS_SCENARIO_SV
`define GUARD_SVT_DYNAMIC_MS_SCENARIO_SV

// =============================================================================
/**
 * This class defines a set of basic capabilities which can be used to implement
 * simple scenarios for distinct transaction types which can be enabled, disabled,
 * and in general controlled dynamically.
 */
`ifdef SVT_PRE_VMM_11
virtual class svt_dynamic_ms_scenario;
`else
virtual class svt_dynamic_ms_scenario extends vmm_ms_scenario;
`endif

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new dynamic multi-stream scenario.
   */
`ifdef SVT_PRE_VMM_11
  extern function new();
`else
  extern function new(`VMM_SCENARIO parent = null);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Function used to check whether the scenario is supported in the current
   * situation. This may be based on the configuration, the status, or even
   * possibly just an enabled/disabled bit. Weights, etc., to enable/disable
   * randomization must be modified within this call.
   *
   * @return Indicates whether the scenario is enabled (1) or disabled (0).
   */
  virtual function bit adjust_weights_per_cfg();
    adjust_weights_per_cfg = 0;
  endfunction

  // ---------------------------------------------------------------------------
endclass
  
// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
C7RfLx3MvfMClsrJLEG5ljeigSLeXMJTblzTc8cHwFTA3HepubZsTBlQ14GwmyfZ
JiDlF83DPQzs4u5/vFLzLqmrQh5NzTaOrUBhePz1n881UKcUDow5N1ELjx2yBRj8
IE1XGJ1U3x/0Ukw7O7moiIPFkRhaEcNyxKMQEnkVIFw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 480       )
BcBOG/e9QrEogKTu/d+I7HHCFN5GNXCS8FBxMGrpfjrHt7VhfR4H5DXwjDTYZHup
z5AYtOuK05DvYmuzyCONFwFWUXZ9JN7/GzSCJ64lXWWirDgLypVWYHus73NGuVeM
G9tjy4IOouAyoOWb00ShuCbS1Vf098bw+1fPw6maFGY5IidtDVJb4lh7Uixjbez9
kcykKnP8PzicIth87fdypBt2Fg3fqYUVHitqMRT2D78ccU2B9sHpfsAf0hX1aD7f
NOs2o/kyxVDoF+OjWfOBKKb/3gN8WFF3iJ6d/FyYi4bJIF4h/DEflJtCaOdIGnTR
JoRrz4oqOnns94RQStnztw6pMaGnVkF+50YzUM84BV0nVyjk0iAksEjHU0w6V7rn
DjNPREt0/EzoKxomBhGv9ac51RBftwA+WmEBI/keEIVL8ztwrtISG83yEKkMUfUF
YMDhxzHCvcwOclkMnD5AJZGsgy1HBlAlusT0eL4uG4cQ8FyrctvKjmaGp/nOTY8U
1tTyJzXMR1xKQzoO7cz4TsE1UbLRzKyYejpK/9XKUzjbRmJ66RJlyYhq245cCbFi
2yGYrL553sjQhza80tXz+TAD+Du/b/2IHVTygTbg4IHOoVchra1e0dQpAwK2PHur
Deij6E2oT0NFYC+UVUt5rA==
`pragma protect end_protected

`endif // GUARD_SVT_DYNAMIC_MS_SCENARIO_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MAaQ/23V5Kw+glzBN5o25rJgPKoM3gz0zBG4GjeAK7DdxJ8pYwoujnxQnMbi4MuW
rzdHMyxxhowyHQ+Da62qXcAizJA06N2LUYdgf/ZlyYncE1A6kTQbP54Us9F6Dz4d
nT8BG6kEHQjjtiqHUPZDX4C0JGDneetqtfB7KfL45A8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 563       )
HXO/tLdmeeq/BTu4ht+qQ8+APOPeTVFsVspHKTddl0f9aNMqY4K/I99bgp2WeT36
fMLoJEC/9zxLdqXzHVrtu1zVXiHz9BlHI02T1q1QYze+nEzhLTExhpl41Ssbf5TN
`pragma protect end_protected
