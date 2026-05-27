//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_TOGGLE_COV_BIT_VECTOR_SV
`define GUARD_SVT_TOGGLE_COV_BIT_VECTOR_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Class used to support toggle coverage for multi-bit buses. Provides this
 * support by bundling together multiple individual svt_toggle_cov_bit instances.
 */
class svt_toggle_cov_bit_vector#(int SIZE = 64);

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** Coverage instances for the individual bits. */
  svt_toggle_cov_bit cov_bit[SIZE]; 

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
/** @cond SV_ONLY */
  /** Built-in shared log instance that will be used to report issues. */
  static vmm_log log = new("svt_toggle_cov_bit_vector", "Common log for svt_toggle_cov_bit_vector");
/** @endcond */
`else
  /** Route all messages originating from toggle cov objects through `SVT_XVM(top). */
  static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();
`endif

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_toggle_cov_bit_vector class.
   *
   * @param name The name for the cover bit vector, used as the prefix for the cov_bit covergroups.
   * @param actual_size The actual number of bits that are to be covered.
   */
  extern function new(string name, int unsigned actual_size = SIZE);

  //----------------------------------------------------------------------------
  /**
   * Provide a new bit_val to be recognized and sampled.
   *
   * @param bit_val The new value associated with the bit.
   * @param ix The index of the bit to be covered.
   */
  extern function void bit_cov(bit bit_val, int ix = 0);

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
Xu2aFHzhO1LhX6Z805dDM1oChD+RV1lR8B0dp0ruIihQQ7xBtCCzr1C5vUYzGKqu
KSHBaxpwwX/P/9YZlNJgBl37ustQ+rRa+2IxXV1W5JhHwachWBzP8LJg3Djlvn0B
UjXDoWQG+j9y073yKS4EPJ5I27FYOgndXKVtIIGwrmY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2152      )
uS4RxC51ZG+QY9R95toUCKJhIryiA978xglzemK6gAMw4o679GNV39Qqo8gmd/+Y
iVJK9C7wHqiAMyFke/vIWMJhjIfBRqy5tJQUIPCXPBCg3AIELvnud8nfJ/wXM5e+
5cEsZXdOK4aji5uqUPOUjBardpb6jccSBaFI+1pFsO1psjGV4qo7zIebQect5Vid
9X801LN09XSU+LcUkBUI5HGrLmcmW5a+fpBpry1xFxAqMW+mXoDscS+RDo+J6ZQZ
O+1IDaw6EQpmyGifrF6h/KbtwpxKvpXyG8F1EkCSek29aD+MtXCgjTMN4fdDXOVj
xq6VaRp07oGXN9Tr6TbOud8FQcsay1L7EIlaZkb7kRH1AeRHgkqZqZLV9AwThwUU
DwWN+/k2csG2uO5png8OPvEOEObxMf3w3MDmLHdswJdP8WlALyWvy5NGxdhG02bh
SwjZs/fcTJ8uIBZOwXid0ffKZAegZCaz0z/U09kpXic+Cj3BEmV+6F5ffdkLnGjc
+Kc6Peq2jFaDzAn34u/tZMdwPLnwuJGiWcRVhKt2dUj6C3O5So3A6dhnw3jKoUoE
LZ3RTD6nrzCn/LLWYMTFvgCumT1rY4xbm/QZFmCcTFrp0yr4mJakUVSAJl4pv8X8
eMt4+4njAvvWs4tbCQaAopYT6oLDLEyJeGI9qKTbEtCePN3qK/5FEtMf9eQvD2IL
1rkC8l1Y9ld4Iy+kgcWrA4lcyfWyFWRtalqVBnRpWf8t7LifNu+TeWU2vHlqn4Nt
eVNNu6LmiQCZn6NaMPRrS0S+0/SHWxKvkUj0lTk1Z/mu7cfyIR3X/yZNhIYrWl69
0E03/KCjnJUrl0x6Aog/KnfiepXVOG/f749Cdv0/pz76kzLaKSAvfEaVDb8wC/h+
kvBs3AQiCwugwT9VOtV+ln397FNinKqxg7N7LooLvFkft2Y11JcZzTrPSAENoV3U
5F8pGPULFp68Vib5bacbjk2HEOC98TbAE0lPmlCW/MzfTr5+41rOpMVBksAdwiR1
2Cx9/Mmys/3q0RsdC4wdHdUEQd5xOXH7mV2f+ELUtFfJVYOXhdjtzpd+ghEdj1io
iftqwp43bTKR7QFA2RBOHSNOn9850y+4zONVwrTkwJqtao/Kq3dd5FR/p4LQsbck
1pc7StggmHRFS3Tnn3NnL3TOL4uUDpVX3GiMhFt18CRN6blACHc9s+okSVlNqECy
/e01MOy77sqFyNV3WbxAj3YW4lQWaYRiaX1JEzPcR+JX7iiMBxoSsJKp9PuYe7qs
eRjLbhTgzSP/+rRSplW4gKoZ1037k32L9/YfwONWGsRCxP3WMN0p7jwECj7fVBee
+3UV7zMEg/McQzz34zgPvaYEPLAr64hZqSfHnYGRROavyuuAXyxZUzf8ItKFlJqI
4eX5d4jWgPb1loEFUpzGHNQ+SvuLTr1sdg0of0mNGo1iDQGu0QJ2tZ3QN+gEMgEs
SkSxMkGvJuzG9eBjW3L254+Wejv/MLOJn04OJY9cEi16dH8mxKFx483K8sR0Dm0M
4MfkmEYwVS3g4cUFWkHxEOb6A5F3lO7Onf7Qnsl4xfROw/vtmPMnl7LxzQDWBmD0
/3dmIAqOM7AwCDe1h2hf777pUWesZz31qD302nGADTOi3SZKWUs5N5Wmq7yRjUSn
XY0AH/W/lu+fkgKz+Rx+E/3MWBZlqJKNTIJj76iXMLdzMwWwPrpkwwKMxunnZaDU
+UE0ObhsmbpKUw/sTtbLfkEz+GACQvw0aRWj6blaAJ9uyh6RKSuPulnO8M81wNrS
X6Sc1SFGWEIxURoJf89gz8BKLHrkDniKJDp3gXovJxGgQowMUdwCZIMCB0h1Th6R
Km3wGqDirTRmigcFeCnBFJ2IOkl+JnT8z2Y9cR4Vu4pe26MmhfY9KVldipzzgkuG
V1vdmQ8YNbF6d6b/6aRggfr3YtQGg7cvi+RygqIsNUCnsLSMc/YB69PXERY+1tIU
jV/k5g09ld1FzC/LYKCBD1eYaEPxAKd0iNxTZ/pTf2rYn1rfI+bJpxAu37lrCQTk
E4PyoUxCmiKGAxyQdhvkgGOBdoa+8Hzaf1bOlghIYaylrbQy8So7www/XXxBLek0
JSLXsBi1TFMf0MMgCxTDj9ktABqo2FChn99FGcEcc77SZctKJ+gBokrKnbNM1i9m
Im46CACG7s/mUhPWg5PKhKw+VS03ZF/df3bI3kXbKymWYAxspLQEyUSweeM9fRX/
MAJBDY9UfFWKk+5cxW2+6P/DfmAOhKmIgDShBVb+y7oogyXNJkWe01EZ6YLcFlbR
4bQKNdqdRAXKSSJB/Ql+SvSslKbFv8lSQ0Q12M/isf/MCYjH3Uq5vWbp1HHxmTsE
7KVSNUZmsjCEMFm7XoWU8az7Zgn24+c4M2DtZK4S8K3KbmMvz7d1LFvvW/kXIpdZ
MizHv43DLpa94ZSJ7PQUu4eclm45nEfW2Un0UIXBd6qGuLyxAfFoPT50I9t1XE86
peO1n+st8wrmUCwzFWaCd4lBQj9p38RSPxf63wxlF332KeDlUzuWhAXm2SfY+pgL
vO8xC33i2aWL6TB4T3jUlQ90dpdBz6cgXjT036lK0yJmcg46cHksrr37Gu6EU9k2
2kuyGpbLtRG8al2ctFtI16V0AogNkAEC04KDpmPDn7ZiNf8nvQ5uWttQ4jY/8IYR
8yIF5KV9qbF0x1Rd6re0e1ltgOhnH67Mt36OslaPlviTI/xIxtjOQMtkbDB3uB+e
5CcnfMkOmuBHKcnL1w+oxPRFMPAawYGTW7HCU8G93Z7+0eorZ3DeqGuFoUZ3nA4u
YS7wKFHntRGQQzEJoVQcXv9U/t60eb5O9xUvwjMjjxOFKeTRXmUVnUBbBJoHvfeK
`pragma protect end_protected

`endif // GUARD_SVT_TOGGLE_COV_BIT_VECTOR_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
M0zJsQ3VhtEpARM4NoRDxb4MwD3QIzRTPSQmsW1RwoDVht4rbVisNR998amR0xF8
VQXS2DrYo62KwxskSm4mKQbwIWKpi+gGW4po/Q+DYUsFhvJGQo4x6nnlpz+7NJEv
7ENLfC1/enBWJFe/mc3WWQ6qsnYP4JjvKeoLSnrrICA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2235      )
OcX4EqImjCfY3HPz5E5pZ0ocM9PcnJ25DlH+vrPFwiADzWHMIev+8GoWg/7s8trA
e3DNKLPJpHQPFcaZo96zFHIKwYvf1lFY/I0SwL/fiI2T15VpB2Nl7ZyvpawbCjEe
`pragma protect end_protected
