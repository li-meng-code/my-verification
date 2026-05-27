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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Z7kEG5e32VvQ7sjURA2hwqgHooD9t0JhQgb4tkNR6I3WDKrqjnF28t9Mdkif3fKg
sBfdnSehF+za2B3DcrhMyDqBRHb6kIf9j2tvBy3Rr4MSPgrBHlotSxXL2IhrEOTC
OHelmv41lzE/ar7kpift5Zh+HtacCOCQEgEDQ37NSBw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1825      )
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
n2X7A7VD6PdkH8+op5xnbA==
`pragma protect end_protected

// =============================================================================
/** @endcond */

`endif // GUARD_SVT_DATA_STREAM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
m9FHScC4IgOyhn7iHj1LPD+eM7XCBIJIcbJXBw6KBhUj4B23eW1P5hvzMl1C1PE5
GhUAjcKNodmuBZpt0UPBsxV9DD8wLjeQVpE6RIppDB5JtrSCJeKkvL1KXBmywVRV
TFjmGBeksFK2fjtnRacSgcDG9d3YNqM7ZdkPDKG+ryA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1908      )
skztDD65BJbQfSs8yCl9c9HhGdCnxPTqikRHSdDeaAC0l1NYrloiHRj1pgLVF0gf
eWSCgdMa5KrhjoCBcFbY3hIUIrGzzE6x98yIJd0v+nU37mVmhasZDG8oKpiHNPOJ
`pragma protect end_protected
