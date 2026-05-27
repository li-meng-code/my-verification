//--------------------------------------------------------------------------
// COPYRIGHT (C) 2012-2014 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DATA_STREAM_SV
`define GUARD_SVT_DATA_STREAM_SV 

/** @cond PRIVATE */

// =============================================================================
/**
  * This class defines a generic Data Stream representation, for easily managing
  * the access to the transactions flowing through this data stream. The class
  * provides for basic 'passive' and 'active' dataflow, with basic accessor
  * methods for both of these flows.
  */
class svt_data_stream#(type T=`SVT_TRANSACTION_TYPE);

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  /** Next active transaction recognized in the data stream. */ 
  protected T active_xact = null;

  /** Next passive transaction recognized in the data stream. */ 
  protected T passive_xact = null;

  //----------------------------------------------------------------------------
  // local Data Properties
  //----------------------------------------------------------------------------
   
  /** Semaphore to control simultaneous set_active_xact calls.  */ 
  local semaphore active_xact_semaphore;

  /** Semaphore to control simultaneous set_passive_xact calls.  */ 
  local semaphore passive_xact_semaphore;

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new data stream instance.
   */
  extern function new();

  //----------------------------------------------------------------------------
  /**
   * Method designed to make it easy to wait for the arrival of the 'next' active
   * transaction.
   *
   * @param xact Active transaction delivered upon arrival.
   */
  extern task get_active_xact(ref T xact);

  //----------------------------------------------------------------------------
  /**
   * Method used to set the active transaction.
   *
   * @param xact New active transaction to be associated with the stream.
   */
  extern task set_active_xact(T xact);

  //----------------------------------------------------------------------------
  /**
   * Method to make the active sets blocking. This should be used to avoid overrides on the set.
   */
  extern function void enable_blocking_set_active_xact();

  //----------------------------------------------------------------------------
  /**
   * Method designed to make it easy to wait for the arrival of the 'next' passive
   * transaction.
   *
   * @param xact Passive transaction delivered upon arrival.
   */
  extern task get_passive_xact(ref T xact);

  //----------------------------------------------------------------------------
  /**
   * Method used to set the passive transaction.
   *
   * @param xact New passive transaction to be associated with the stream.
   */
  extern task set_passive_xact(T xact);

  //----------------------------------------------------------------------------
  /**
   * Method to make the passive sets blocking. This should be used to avoid overrides on the set.
   */
  extern function void enable_blocking_set_passive_xact();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
GUb0dV0nciGm99LJAaJwWRlytFnIfpVFS22QKDkpuKrS6pCa8Y8wLhQ2iH97Ttw9
yCkHc1WjQf5VyMyfBLYWcIzoA3C1o7ZVPe7Nkn3VDvhPfPo9KIPPraFeq6S81lLW
RQNkLla3X98rlvM7Xg7R4956ASXNTvwcVbTVAjJLe2lQyHf4h8Cmhw==
//pragma protect end_key_block
//pragma protect digest_block
jBXDuxO2WvIpwxNmwdnhKReK9OU=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
uRU/fv25xbodPpahK7Ao8RjtkH0=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
/** @endcond */

`endif // GUARD_SVT_DATA_STREAM_SV
