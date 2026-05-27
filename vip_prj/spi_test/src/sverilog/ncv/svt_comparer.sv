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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
APRXsLXGYAtAhOziSxqsD4/3eAYaqUMBjpO0OHfBwP5pQMr8bmJyBYnU4z7Jz2Es
rFhfkcnedIr0cKu3WrKu3LWYc9K9VWJ6lhNxLe8dSowHdpCIppgtIZLkKoV8eKb/
dg4e6C3IjogYyGT+a8zuA9JdcQe6ivSUxIVUHX/8dA88pAB6TISfyQ==
//pragma protect end_key_block
//pragma protect digest_block
2nuiU6uXTM6WD0cUGZWEaGaIERc=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
bl0qvgxNJzkbVajiFMuL30G70l8=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_COMPARER_SV
