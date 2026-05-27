//--------------------------------------------------------------------------
// COPYRIGHT (C) 2013 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DISPATCH_SV
`define GUARD_SVT_DISPATCH_SV 

// =============================================================================
/**
 * This class defines a methodology independent dispatch technology for sending
 * transactions to downstream components.
 */
class svt_dispatch#(type T=`SVT_TRANSACTION_TYPE);

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Shared vmm_log used for internal messaging.
   */
  vmm_log log;

  /** Channel used to dispatch the transaction to the downstream component. */ 
  vmm_channel chan;
`else
  /**
   * Shared `SVT_XVM(report_object) used for internal messaging.
   */
  `SVT_XVM(report_object) reporter;

  /** (Optional) Sequencer used to dispatch the transaction to the downstream component. */ 
  svt_sequencer#(T) seqr;

  /** (Optional) Analysis Port used to dispatch the transaction to the downstream component. */ 
  `SVT_XVM(analysis_port)#(T) analysis_port;

`endif

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

`ifndef SVT_VMM_TECHNOLOGY
  /** Sequence used to dispatch the transaction to the downstream component via a downstream sequencer. */ 
  protected svt_dispatch_sequence#(T) dispatch_seq;
`endif

  /** Semaphore to make sure only one transaction displatch occurs at a time */
  protected semaphore dispatch_semaphore = new(1);

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * CONSTRUCTOR: Create a new svt_dispatch instance.
   * 
   * @param log vmm_log instance used for messaging.
   */
  extern function new(vmm_log log);
`else
  /**
   * CONSTRUCTOR: Create a new svt_dispatch instance.
   * 
   * @param reporter `SVT_XVM(report_object) instance used for messaging.
   */
  extern function new(`SVT_XVM(report_object) reporter);
`endif

  //----------------------------------------------------------------------------
  /**
   * Dispatch the transaction downstream.
   *
   * @param xact Transaction to be sent.
   */
  extern virtual task send_xact(T xact);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
774NSiTLM8UicpQj9UtPT9lGsj+1swmFyisGDFyzQutFWJC6aR3o6WQI1MMz43e6
byP8WnH7t5gyO0hqbXFwn2SQMEMIxapduvKOjC0Qp1/jzVKRTUsw+q4aPu5WmJnM
fOl7i/Kv5HH6sthCSbtp0wzdcH1J5fuYrRU1Q74q4y++htFna/gSIw==
//pragma protect end_key_block
//pragma protect digest_block
2/W484ardlJXwS5Itxj+V47T0dk=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
D3SA6QbWPA7g+sgtC0TDrlZHJYg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DISPATCH_SV
