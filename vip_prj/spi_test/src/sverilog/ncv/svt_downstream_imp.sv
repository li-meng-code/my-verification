//--------------------------------------------------------------------------
// COPYRIGHT (C) 2014-2015 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------

`ifndef GUARD_SVT_DOWNSTREAM_IMP_SV
`define GUARD_SVT_DOWNSTREAM_IMP_SV 

// =============================================================================
/**
 * This class defines a component which can be used to translate input
 * from a downstream 'put' or 'analysis' port. 
 */
class svt_downstream_imp#(type T =`SVT_TRANSACTION_TYPE) extends `SVT_XVM(component);

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  /** Queue for next incoming transaction coming in from the downstream provider. */ 
  protected T next_xact_q[$];

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new downstream implementor instance.
   */
  extern function new(string name = "svt_downstream_imp", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /**
   * Method designed to make it easy to wait for the arrival of the next incoming
   * transaction.
   */
  extern virtual task get_next_xact(ref T next_xact);

  //----------------------------------------------------------------------------
  /**
   * Analysis port 'write' method implementation.
   *
   * @param arg The transaction that is being submitted.
   */
  extern virtual function void write(input T arg); 

  //----------------------------------------------------------------------------
  /**
   * Put port 'put' method implementation. Note that any previous 'put'
   * transaction will not be lost if there has not been an intervening 'get'.
   *
   * @param t The transaction that is being submitted.
   */
  extern virtual task put(T t);

  //----------------------------------------------------------------------------
  /**
   * Put port 'try_put' method implementation.
   *
   * @param t The transaction that is being submitted.
   * @return Indicates whether the put was accomplished (1) or not (0).
   */
  extern virtual function bit try_put(input T t);

  //----------------------------------------------------------------------------
  /**
   * Put port 'can_put' method implementation.
   *
   * @return Indicates whether a put is safe (1) or will result in a loss of
   * previous values (0).
   */
  extern virtual function bit can_put();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
C9NoMMGkqaQ3krP6brdKRP/KrJeUNDITgI8Gb79BY7szjWXB7rxf+gw4graiTbBD
TyfwZz7dI0+QE6LQyPiKarS9kvcC+KAcTTGGzy4stFC6HjK5FL6M4U9db9/dPDIb
V98DiJGyR+1yC3T9ElcPqkjqn6vD2h6F9pQLRPdz7xjs54tRIZi5pg==
//pragma protect end_key_block
//pragma protect digest_block
09utMIplVCu+cVBggx3x9lhNFYQ=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
X2gKaF9ex+tUr46hxfsMFc51N2U=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DOWNSTREAM_IMP_SV
