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

`ifndef GUARD_SVT_TRIGGERED_TIMER_SV
`define GUARD_SVT_TRIGGERED_TIMER_SV

// =============================================================================
/**
 * This class implements a timer which can be shared between processes, and
 * which does not need to be started or stopped from within permanent processes.
 * This timer is extended from svt_timer and otherwise implements the same
 * basic feature set as the svt_timer.
 */
class svt_triggered_timer extends svt_timer;

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  /**
   * Specifies fuse duration, as provided by most recent start_timer call.
   */
  local real trigger_positive_fuse_value = -1;

  /**
   * Indicates whether a fuse_length of zero should be interpreted as an immediate (0)
   * or infinite (1) timeout request, as provided by most recent start_timer call.
   */
  local bit trigger_zero_is_infinite = 1;

  /**
   * String that describes the reason for the start as provided by the most recent
   * start_timer call. Used to indicate the start reason in the start messages.
   */
  local string trigger_reason = "";

  /**
   * When set to 1, allow a restart if the timer is already active. Provided by
   * the most recent start_timer call.
   */
  local bit trigger_allow_restart = 0;

  /**
   * Notification event used to indicate that a start has been requested.
   */
  local event start_requested;

  /**
   * Notification event used to kill this instance.
   */
  local event kill_requested;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Creates a new instance of this class.
   *
   * @param inst The name of the timer instance, for its logger.
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param log An vmm_log object reference used to replace the default internal
   * logger.
   */
  extern function new(string suite_name, string inst, svt_err_check check = null, vmm_log log = null);
`else
  /**
   * Creates a new instance of this class.
   *
   * @param inst The name of the timer instance, for its logger.
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param reporter An component through which messages are routed
   */
  extern function new(string suite_name, string inst, svt_err_check check = null, `SVT_XVM(report_object) reporter = null);
`endif
  //----------------------------------------------------------------------------
  /**
   * Start the timer, setting up a timeout based on positive_fuse_value. If timer is
   * already active and allow_restart is 1 then the positive_fuse_value and
   * zero_is_infinite fields are used to update the state of the timer and then a
   * restart is initiated. If timer is already active and allow_restart is 0 then a
   * warning is generated and the timer is not restarted.
   * @param positive_fuse_value The timeout time, interpreted by the do_delay()
   * method.
   * @param reason String that describes the reason for the start, and which is used to
   * indicate the start reason in the start messages.
   * @param zero_is_infinite Indicates whether a positive_fuse_value of zero should
   * be interpreted as an immediate (0) or infinite (1) timeout request.
   * @param allow_restart When set to 1, allow a restart if the timer is already active.
   */
  extern virtual function void start_timer(real positive_fuse_value, string reason = "", bit zero_is_infinite = 1, bit allow_restart = 0);
  //----------------------------------------------------------------------------
  /**
   * Function to kill the timer. Insures that all of the internal processes are stopped.
   */
  extern virtual function void kill_timer();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
5HUehzfxWQobpxBCQ92RANxwAVWKmuAtFcKXpgKjOJUPLSFhZH70btBFnmw5FiSv
Bt41r1SMQsHJBESf5NriDkpxtqjnG4BbsXyBZN7c8n+iRcRXihnHvjrpSKrEzjmI
NktKIgsDZRNsa1hlIZv9ZpENvTJI1aifpTdIlq2QAwDW2M9StyyKdw==
//pragma protect end_key_block
//pragma protect digest_block
5FceJ56yVYT7igyWJOv1yXCgv88=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
pHJVsLgQArIi9EV8g0LOK6XKF00=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TRIGGERED_TIMER_SV

















