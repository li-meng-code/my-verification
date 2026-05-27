//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DISPATCH_SEQUENCE_SV
`define GUARD_SVT_DISPATCH_SEQUENCE_SV

// =============================================================================
/**
 * Sequence used to queue up and dispatch seqeunce items. This sequence supports
 * two basic use models, controlled by the #continuous_dispatch field.
 *
 * - continuous dispatch -- This basically loads the sequence into the provided
 *   sequencer, where it runs for the entire session. The client simply keeps a
 *   handle to the svt_dispatch_sequence, and calls dispatch() whenever they
 *   wish to send a transaction.
 * - non-continuous dispatch -- In this mode the sequence must be loaded and
 *   run on the sequencer with every use. This can be rather laborious, so
 *   the continuous dispatch is strongly recommended. 
 * .
 *
 * The client can initially create a 'non-continuous' svt_dispatch_sequence, but
 * once continuous_dispatch gets set to '1', the svt_dispatch_sequence will
 * continue to be a continuous sequence until it is deleted. It is not possible
 * move back and forth between continuous and non-continuous dispatch with an
 * individual svt_dispatch_sequence instance. 
 *
 *
 * If Sequence dispatched in continuous, it also supports multiple transactions to be
 * dispatched concurrently, without blocking, controlled by enable_multiple_tr_dispatch() method.
 */
class svt_dispatch_sequence#(type REQ=`SVT_XVM(sequence_item),
                             type RSP=REQ) extends `SVT_XVM(sequence)#(REQ,RSP);

  /**
   * Factory Registration. 
   */
  `svt_xvm_object_param_utils(svt_dispatch_sequence#(REQ,RSP))

  // ---------------------------------------------------------------------------
  // Public Data
  // ---------------------------------------------------------------------------

  /** 
   * Parent Sequencer Declaration.
   */
  `svt_xvm_declare_p_sequencer(`SVT_XVM(sequencer)#(REQ))

  /** All messages originating from data objects are routed through `SVT_XVM(root) */
  static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();

  // ---------------------------------------------------------------------------
  // Local Data
  // ---------------------------------------------------------------------------

  /** Sequencer the continuous dispatch uses to send requests. */
  local `SVT_XVM(sequencer)#(REQ) continuous_seqr = null;

  /** Next transaction to be dispatched. */
  local REQ req = null;
  local REQ reqs[$];
   
  /** Indicates whether the dispatch process is continuous. */
  local bit continuous_dispatch = 0;

  /** Indicates whether the multiple transactions to be dispatched concurrently. */
  local bit multiple_tr_dispatch = 0;

  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_dispatch_sequence class.
   *
   * @param name The sequence name.
   */
  extern function new(string name = "svt_dispatch_sequence");

  // ---------------------------------------------------------------------------
  /**
   * Method used to dispatch the request on the sequencer. The dispatch sequence
   * can move from 'single' dispatch to 'continuous' dispatch between calls.
   * It can also move between sequencers between calls while using 'single'
   * dispatch, or when moving from 'single' dispatch to 'continuous' dispatch.
   * But once 'continuous' dispatch is established, attempting to move back to
   * 'single' dispatch, or changing the sequencer, will result in a fatal error.
   *
   * @param seqr Sequencer the request is to be dispatched on.
   * @param req Request that is to be dispatched.
   * @param continuous_dispatch Indicates whether the dispatch process should be continuous.
   */
  extern virtual task dispatch(`SVT_XVM(sequencer)#(REQ) seqr, REQ req, bit continuous_dispatch = 1);

  // ---------------------------------------------------------------------------
  //
  // NOTE: This sequence should not raise/drop objections. So pre/post not
  //       implemented "by design".
  //
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  /**
   * Sequence body() implemeentation, basically sends 'req' on the sequencer.
   */
  extern virtual task body();

  // ---------------------------------------------------------------------------
  /**
   * Method used to create a forever loop to take care of the dispatch.
   */
  extern virtual task send_forever();

  // ---------------------------------------------------------------------------
  /**
   * Method used to do a single dispatch.
   */
  extern virtual task send_one();

  // ---------------------------------------------------------------------------
  /**
   * Method used to remove all the elements from the queue which are pushed for dispatch.
   */
  extern virtual function void delete_reqs();

  // ---------------------------------------------------------------------------
  /**
   * No-op which can be used to avoid clogging things up with responses and response messages.
   */
  extern virtual function void response_handler(`SVT_XVM(sequence_item) response);
  
  // ---------------------------------------------------------------------------
  /**
   * Method used to enable dispatch of multiple non blocking concurrent transactions.
   *
   */
  extern virtual function void enable_multiple_tr_dispatch();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
w2waCN1d6xqE1bnic9HBfa+JKNWLfwDpm/2HgbahZag6T2Qutp1jhNHk9aQG3NLI
GUz5UD+SvStDUWPW5vZoALigmFBbapOTuCWCtNhv51AEuaP+Css3GKFKRlwpBRBO
MuIqcmONi6lKCxaem2kWSfRF/hSDrWaVMLslN3kQIdWbj00MnxasVg==
//pragma protect end_key_block
//pragma protect digest_block
Q0SA5tZPMBdlObG+Ch7DRKTiOJ0=
//pragma protect end_digest_block
//pragma protect data_block
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
4mHs8p5lN15HcMtlaQEDnw==
//pragma protect end_data_block
//pragma protect digest_block
1LVWRNozVZ1LeYeOdjPoHQvVzVU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DISPATCH_SEQUENCE_SV
