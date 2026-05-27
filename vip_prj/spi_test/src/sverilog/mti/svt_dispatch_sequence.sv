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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
R6+DI5iUggV+nw5xzEOVcVC44a4/mJcAXsz2wmMssuIF5lZgY0cG3fUWL7cB8sBq
XaaBeuYFKOUETqF5FKfDvR/hLsVXN0p69xhfl2H8Oceurte9bxLET2D6LrFG3qu/
kct6DqLnQD21TaijuWP2bB2++foZe7tGCWx/mw1L0JE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4069      )
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
`pragma protect end_protected

`endif // GUARD_SVT_DISPATCH_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QMykiThZxfR41vYkNUJGeqcDr7Y+6hP7kqHx83fQUvPKIhx/KZqEvdSG69rpX7hz
GfMWmFupuK16dr/ROusfjNutTq09w/nQ42Ln+ahrHUfAXXMxlNqGJoN0/fSI/wpT
c74zghAxlkwDX3ZSncbmE2AAjyjbuhBE5O4NrXKcu04=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4152      )
BvVp+1qpsPlMRoqbqsJmbAVO9ECFgAd1TQqyqzNtUif0adYL8uYFNk7wP1WVL+rO
ubHxq5Y6f+T+SZ8W/oWO7YpkV6Bo1zCWBp44QKl7x6maoWlEFprWQtxiyNH6L8JX
`pragma protect end_protected
