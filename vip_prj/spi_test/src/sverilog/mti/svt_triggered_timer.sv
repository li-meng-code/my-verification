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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Hw20yqPlkcinGkRhxbXiqNN9ANqlZBs57p2+UKeFWJ7yA+3bB7fAXZ8a1xgDsBOO
dEsjD8zdbqTFoK1WhHSHNmOoz7YHlHVegTgl5xa+rSy1KvEaupNC/SghMG3EC/tS
OfaXtNDDvPt6gcnF2xjE4MimZ9BpbeGHW1tgpS255E0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1743      )
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
pbf7Y9uGnsUC8ou6Tf/V+A==
`pragma protect end_protected

`endif // GUARD_SVT_TRIGGERED_TIMER_SV

















`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SyX+1SbYF/TF+RkklNcOB77KaQCgsPeeXmT+AdJBjukb6ILkW9BAGLSyw1sT0b1X
VnaaD7qPpTKZhNDFfGqhExuBN64W2WlWgODBEiHTiNWs+UgwL5bCXRKEU2GF7Nk8
Coi+AztbHcvnKmzCgXy8g2x9xWU5uaBv8giYbxJH/0I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1826      )
bcLN/y57g6Z+p90fhyqtzyAloSGTjcUUdT1Xhss7nIditNRHLlPM31w209wMAYct
8YI6oOXuz630mdpNB21PvFvdZWE9Jadc6P6HrxMYMR1vYF/oWTNaqAZ8yLrCiqzv
`pragma protect end_protected
