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

`ifndef GUARD_SVT_COMPARER_SV
`define GUARD_SVT_COMPARER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * Used to extend the basic `SVT_XVM(comparer) abilities for use with SVT based VIP.
 */
class svt_comparer extends `SVT_XVM(comparer);

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
   * that provided by the base `SVT_XVM(comparer)::physical and `SVT_XVM(comparer)::abstract
   * flags. Setting to -1 (the default) results in the compare type being
   * completely defined by `SVT_XVM(comparer)::physical and `SVT_XVM(comparer)::abstract.
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
   * CONSTRUCTOR: Creates a new instance of the svt_comparer class.
   *
   * @param special_kind Initial value for the special_kind field.
   * @param physical Used to initialize the physical field in the comparer.
   * @param abstract Used to initialize the abstract field in the comparer.
   */
  extern function new(int special_kind, bit physical = 1, bit abstract = 0);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Method to obtain a calculated kind value based on the special_kind setting
   * as well as the `SVT_XVM(comparer)::physical and `SVT_XVM(comparer)::abstract settings.
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
QDtj/utE8nKtep/82cwn9ALKUWeu3Cminnrw4BUa8dh6SA/ASJPSEEJ9c47ZVdse
XY2wBYNVNbsbCFudZv4FvlgBHPZqeFRQVT/DIpMSFk6CpPbTrnHmLj3hFww+cVlc
iMTTN9SL04xZjYtPLIm3j+wKZW0h1MLyDnKE7YvJ1no=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1560      )
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
`pragma protect end_protected

`endif // GUARD_SVT_COMPARER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IRudckYDfzHsq8VxuEgwzhu2kRntG+nvw1i4C0bmDhcPdJYYjjAJFmHpjBkN1uC5
FKyJ5VHCzrDAl2tGxUzEMp242oZVfwSLzp6q9158HFuE9n2Etx8vV9YU3iRiojzL
+ZUJ0VbkAErnuqynblQbWfWDNN2ZDsilaesOFUuOUhI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1643      )
ZUV1J8zIg28Qrif8kHurEs1tqmwtX6fwcAEWEay2mNtRw7JWE0z5GzZh+NJcPE58
cezkWGGofKnrYr/n8/vfKML/scEXdX6gZWlC5EA1RhTNxF6w006yl4fDermfZwfO
`pragma protect end_protected
