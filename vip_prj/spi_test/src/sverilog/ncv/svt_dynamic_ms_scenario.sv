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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
0Q1TBdLM6LIuC7YUH86SxEloXU7JlQCUE4R3GX7hbghO8N3bMdsJezSU1FWZtwSr
RrJOVVKeNY2eCP3blTYWPsjMPeB9mxkqmn9Vd2zoCkm1cQNhvbPhjbmNJ5XkX2j+
VAoxHpnrEqadw9Wrakw6BkogVARDvqMt854+6qLW0v+COXv/+/+arA==
//pragma protect end_key_block
//pragma protect digest_block
34vTF5uKeBvuFQGEUE53yIJ1czE=
//pragma protect end_digest_block
//pragma protect data_block
wgExu38vJN6Qf8ejq2qaJTTLqNl3fkzf16W23jabknIuXjoa3EZ2hxOAiA9OiPdh
hP3WjdK5JrZWs6ALbltYaqE/kwFtX+Wv313+pokpBLB+5YIIpONeXjGMuQ16cYV8
6x1opdDpFto4Nps/mUerI1RMUDtpAypDalwO22YD+/2i0NyZSahQe7i98y6AjJfd
tKdS6T5YtWjRqgb141MnQ78XQtNpnNBj19YYQwBSH6TEon+YrQCA7+lcpSJC624i
g+y05lW4Lm8xRlZF8IMInqdKZ5nNi5HR2LRKdP5oJnzHXZOqV9u8lsZGciynT4I1
Omzzd+kGCPx+txb8VhGrNWSIkOkjswcDTxvVABCm2SwmVJUvILCS0eZ5fP1IzZ5a
Hi/ttZD0q+4Ut1Uau/uRS7Wq/GDHxPMJJ27vYXV5gGVthWkRvlPjXfXPzardFdfn
Wi3mauPSuqCANwfobOuX26y4F8rAbdnwwmlAacUHAEdhcpIpkxSoAZQSrCipo2ef
llojC1yOFm/xlrUthF4NuNx3N8aD4S0E6G3NaHVV0ej845kqZueD/LWdGVT7U4kD
UErRMHFQ6jHMcB/l1RcwnXUZGCn8vV5cQF/HQiUH4xixIPGl/ofvGvkZS2kBhqBa
1tl+8PdYO9lN41Cl7LVCk7SQeRg+Al7B0UATEmYwvcy0pkI2T60VbY9nY9XJYKJA
FZqyRyTlWGA6vfYb2Q/GsuW++tnurb4NYyYhuqZgGl4nNCqCg5lb7y9AFPl6TeAI
FQ0Y6WYIRA0uy1U5BeIxijUTl6rxe4xeD6kDfbmQRnFY3cYueW0t0t2f2Q8fYBMD
xO7YwsuQ9xkd1rlzYIviJ7WzsZ+DmMirqoIPYYKDUQ4=
//pragma protect end_data_block
//pragma protect digest_block
2Hx2YWZs3n64a9v7bUfCVB0aHkY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DYNAMIC_MS_SCENARIO_SV
