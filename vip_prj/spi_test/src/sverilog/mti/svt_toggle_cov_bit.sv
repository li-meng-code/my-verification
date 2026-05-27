//=======================================================================
// COPYRIGHT (C) 2011-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_TOGGLE_COV_BIT_SV
`define GUARD_SVT_TOGGLE_COV_BIT_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Single bit coverage variable used to support coverage of individual or
 * bused signals.
 */
class svt_toggle_cov_bit;

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** The value being covered */
  protected bit bit_val;

  // ****************************************************************************
  // Coverage Groups
  // ****************************************************************************

  covergroup toggle_cov_bit;
    option.per_instance = 1;
    option.goal = 100;
    coverpoint bit_val {
      bins b0_to_b1 = (0 => 1);
      bins b1_to_b0 = (1 => 0);
    }
  endgroup

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_toggle_cov_bit class.
   */
  extern function new();

  //----------------------------------------------------------------------------
  /**
   * Provide a new bit_val to be recognized and sampled.
   */
  extern function void bit_cov(bit bit_val);

  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
a6nci1OCAbSLW8gwrU6GO2uOzeq7m78Y0GzVV1ig5s/5QwFMu1IhXOTZV2AdfmjZ
NohbxKpKE+qnnTXMyRhBkkzQE9m0WiJVJHbh1rx0woDqKyJe717ul/7nyvtsonbg
3JJGRZa4X+Azx58cDCaZ302hhwAk0qcfMGZlW7hJCrI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 682       )
E1SXRQKt7eMthwy5If1G6Aidu5VR2XFyesIq8WwkQhzQo3WzaTHKnOgfBQijgH3X
BpFGVkYCqUd00+aXUqplNELvlwxFSc89pYccx0LEmd0KMabk1faab/Bo9aTUa376
09SGZW4PC8clsV+VUgQZzU/9NjHcanNv+bjOXOyTbBywqyaTqEojnIY0T7YNf9vP
oyouw4KPAVUkz7HBMju5mtiPepMN20uuumM5QwQopGAm2d5GsmcNwvCsj9bAmKLL
npg0YIrHS+8Lt7tnKzNOIGmI/glyjBsQNhGSXcIpb8SWInKgL3RsyGdPtbXuzgWP
prry3Jw3lC4aIcXm8JBAgT9wLrU7Sk0fw4SWaZxIbewZepF93IwF0duzUbvzP559
T5uy0bpaTjSngidt+pv6JB1WvKl9MHsLRPVC6v1GEoqXGzeR3RW6yvqr43l0HUDD
V8FkRDPnns40TBmtKdZlDVA2/0AHnMOzPCnn1VF50quCESo65NaQXG8xZIck7mAH
L5XTdaTxpDSChzhMgeXJ6yq8v5Xio7WVKpHoDgaLJIpljYVOM7T6Ocg6BM9T/tzR
wWBkRdktWWj24SemrEF/jMvF42oFncnlNSQy2A/HJvdE5qATKX7uZchvCd/yhiq0
5LdWjjOh+oznU5n/YrGWRdUL9sXr77aPf73gb/ZHnzwA7HCIN0+H12mt9ia2xYJu
Kf3taqSUj3LlxAR5JYQpRPurop1YVSx4BXphSJXVLPUkayl4ocquPfFMzTqPyP9C
5663kbYP1vTzdltd9GbkxodtBR4l+WgiBxhG+Ceu5csaNEfmuwKX+2GPug71Nsfa
tEgdN3LxN+ajKB4QfqqqwrnSKCfeZM4hzzv5qF1PjmLE1JCqP5Nee4RLZyRGuFpw
RFaKpnezb7l5I0u5d5AK3Q==
`pragma protect end_protected

`endif // GUARD_SVT_TOGGLE_COV_BIT_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MBS677PB/CQROxDASnoMLOK2TafOIsAtNACMYkdLPwXEY61S0PXI6HEgq6EEHpnf
5mWzamX5q4Kcu78956Df1PU+UoQMCUJYZj2d5zzTkGRSnDZXw5bZILRIL6xA97yS
hCw6Eln69488OtqCBXTa+Ez9KfN/e2ALFYvKCHOOb+g=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 765       )
+IxiyjPe22PtrByUGLiFzEQq4c3yaKyfnfMbA14aWNCTAXOtneTOu/6vTrFhwQGo
SCYcGyf9vdGo+CnYNqblF0lde2qwscAZURlkgrsOYpMBMCOG3fnWBj/+PRQtOFcs
`pragma protect end_protected
