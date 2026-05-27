//=======================================================================
// COPYRIGHT (C) 2010-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_PACKER_SV
`define GUARD_SVT_PACKER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * Used to extend the basic `SVT_XVM(packer) abilities for use with SVT based VIP.
 */
class svt_packer extends `SVT_XVM(packer);
   
  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Special kind which can be used by clients to convey kind information beyond
   * that provided by the base `SVT_XVM(packer)::physical and `SVT_XVM(packer)::abstract
   * flags. Setting to -1 (the default) results in the compare type being
   * completely defined by `SVT_XVM(packer)::physical and `SVT_XVM(packer)::abstract.
   */
  int special_kind = -1;

`ifdef SVT_UVM_1800_2_2017_OR_HIGHER
  /**
   * Added property which was removed in the IEEE 1800.2 release
   */
  bit physical = 1;

  /**
   * Added property which was removed in the IEEE 1800.2 release
   */
  bit abstract = 1;
`endif

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_packer class.
   *
   * @param special_kind Initial value for the special_kind field.
   */
  extern function new(int special_kind);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Method to obtain a calculated kind value based on the special_kind setting
   * as well as the `SVT_XVM(packer)::physical and `SVT_XVM(packer)::abstract settings.
   *
   * @return Calculated kind value.
   */
  extern virtual function int get_kind();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IhUPlFph55AlM8It0KuB9vHFkR5EG1qu0ETIxSg1wnf2GR4KJcQfL48biIVNumBx
qq/QYGyq5lMqj43D/01s344yPKomFquk4I8HMEcuyTsMrMd5B0zhczjyo8i0Vg6N
me1eAXwkdnQVuAL4i42nd7C3rudXHsB7nrMe4B4H2Cg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 814       )
FSAm1edxvPA/mgOwOPqJawE1ez4BptDfLt/686B3UcQilfoNZzo7fkZVVAarGvYJ
rL69zmhKAeUZpldT3kmSQJnDop2EwnVGctSltYus/592DgQpBRpBL03xousLI9IZ
XbMJeL5uDstCI3g6i3/AU3Zuycj/0XqnnGEGvHvL6LalH59iPsoB71VMuMxzC0ZK
fhjlTZyO6fKS8ttwNAkCbaMtYqoRwgNXmcmamCskjKrqLw1b+nBeuocNucZCZTwf
izvRJViBpVd532VLwm+1kM8XqM22RDbRkyI2SQePd96/QqkvVOVdazASr6e57tDo
i9yCNQXhFB2Xn8ppAns0zDQ+RXxcGaFi9FU0dyRUhvJsJ28W4fk9eUM3ikcsqwUP
YFmHjKNkgT8wEC/r8HmIY6gLsdGDTVeCVk/a75te3tNX9jHFGgDI1SIzGg7OE1Jm
EsvYBbMsNvtWjRxnGkRQWu69TrETzXXcCCnJQmammmR6ca/9KZlCZnCttCEHCknp
1rMLUArXq4jtRvkpzu9oCxqoIBHQj64dwvrYcZlFr2/MQ09R9wz8+RyDEMTInp5Q
3BPcWjEVGIhqvLhqdnCUWVsYP3GZLNkNDY+UcncZN/36XK+pNojTxn3zYRLZXJQj
vutFKwqRCkWHJMjvINFE2ZIZKo++pwKLp4o0x5zcI+IyPXhUe9byaAx9c1M9yUo0
GpIeyF4+QA+7ToyGWEaAsDY2mB7LWpjQYYfWPzBnoYnYL0XKkgOUi0DOx/udoKCG
zR4gjKg5ZjAYAIs0kxV94xEWuWW99e1OUmvrU7NScmXSGU+MIIEO7Nfvn5hxgEak
ieX/58AfHktrkpmefJI50eVAPUa6gBgpcVulR3iCHd6EzGbyTgxtkrQRgMknFjSR
Qe7GQJ5xB3fSH98c9+Zp0b9/cNRQlxutHwt/QdrnvKg0ovIse/wuztQN0KN/SAQ+
jofU8Y0XaAywm1cRGIgGn7J66hGqQQf03ocRdra7hp9Tss5wcKWQIgysEsypmKfb
Gf/5460abmdq/dEb1iObHJT+gXreW042KpprG9Ec8vc0YrQHTCmegCt73TxwQj0q
`pragma protect end_protected

`endif // GUARD_SVT_PACKER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FI6qN8u3EkoaWt+xByErKQQhm/Lnlmxc9p84L+pVURmIvNO8k9I8hV/q1J84nfqX
sLv8aRcvBJCT3pJTPBURKDLTn9hf3C3AmN0I/iJRIxV3OvJ8PwxB3mOJ76SkpeD9
Mv2ZskOPeEzwZSq4kLC3cTz5TnEpjjlIej0W+/9QEZo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 897       )
re4A3lhw4MIXmpQOXNwHWVu6Q9XGOoMf6s82OTf5XmmQINVd1cQMv0qp9spDa/Uz
GFF30uheYxVscMKibYVa6dmQVyPo2JlccwRV+7MC6+nRastrEEioEnSxX07ci1XX
`pragma protect end_protected
