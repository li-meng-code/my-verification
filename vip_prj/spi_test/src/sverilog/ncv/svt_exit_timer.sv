//=======================================================================
// COPYRIGHT (C) 2009-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_EXIT_TIMER_SV
`define GUARD_SVT_EXIT_TIMER_SV

//svt_vipdk_exclude
`ifndef SVT_VMM_TECHNOLOGY
  typedef class svt_voter;
`endif

//svt_vipdk_end_exclude
// =============================================================================
/**
 * This class is provides a timer which also acts as a consensus voter which
 * can force simulation exit when the timer value is reached.
 */
class svt_exit_timer extends svt_timer;

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  /**
   * Voter class registered with the consensus class that is passed into the
   * constructor.
   */
//svt_vipdk_exclude
`ifdef SVT_VMM_TECHNOLOGY
//svt_vipdk_end_exclude
  local vmm_voter voter;
//svt_vipdk_exclude
`else
  local svt_voter voter;
`endif
//svt_vipdk_end_exclude

  /**
   * Name associated with the timeout value. Used in message display.
   */
  local string timeout_name = "";

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Methods
  // ****************************************************************************

//svt_vipdk_exclude
`ifdef SVT_VMM_TECHNOLOGY
//svt_vipdk_end_exclude
  //----------------------------------------------------------------------------
  /**
   * Creates a new instance of this class.
   *
   * @param inst The name of the timer instance, for its logger.
   * @param timeout_name The name associated with the timeout value used with this timer.
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param voter Voter which the 'exit' is indicated to.
   * @param log An vmm_log object reference used to replace the default internal
   * logger.
   */
  extern function new(string suite_name, string inst, string timeout_name, svt_err_check check = null, vmm_voter voter, vmm_log log = null);
//svt_vipdk_exclude
`else
  /**
   * Creates a new instance of this class.
   *
   * @param inst The name of the timer instance, for its logger.
   * @param timeout_name The name associated with the timeout value used with this timer.
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param voter Voter which the 'exit' is indicated to.
   * @param reporter An component through which messages are routed
   */
  extern function new(string suite_name, string inst, string timeout_name, svt_err_check check = null, svt_voter voter, `SVT_XVM(report_object) reporter = null);
`endif
//svt_vipdk_end_exclude

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

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
z1CfUZ/QBMo5DvJ3RkvQ83FXktu1AmKxXpyQfZrTb7ImELBAOXD7Fg2ZbK8lehik
vOUYHSVxq93MbYh1hkGhut+5wZUTy9GAg3h0U0Jah0WMV15As8LXN0rKnR/mSyV2
QzmlJg16THMqq8mEK8xYCSJVQ5OD+5E0Ai+954KwsJaLo+DjJtibvQ==
//pragma protect end_key_block
//pragma protect digest_block
P1CMMhmyoCr3JWwM5RIfMWW1+hg=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
32JNjVCRsn8WzkqluXb46gfIL3w=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_EXIT_TIMER_SV
