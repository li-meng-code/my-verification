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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
v/RW8Pl9+EPGMPcKmF6nc0kk88JECvvuUr5C7ifUspzDCIQrHkuybNum/T0Hz0ac
/Ay28f/R8dtsL0VxA2aUR4dQIuKAh1JuKWoTU5Kl6maEqrvRUT+17yrmimT4wDBH
HiomFWhb2tZlgIVk4bhCwzWYcX5198hX3yeyhdmrKD82ccXyTxnR2A==
//pragma protect end_key_block
//pragma protect digest_block
5p0xOXi3QeU0zeZ1WdEPYT9fUho=
//pragma protect end_digest_block
//pragma protect data_block
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
8m0WNBZ4IHc8uVKEw78MlA==
//pragma protect end_data_block
//pragma protect digest_block
SYZHEsJ84I21Lw/MWXfxKApprNA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TOGGLE_COV_BIT_VECTOR_SV
