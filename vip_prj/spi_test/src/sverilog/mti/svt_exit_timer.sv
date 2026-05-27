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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UW3/9Lzpj9AYbsNXsf8OX9NYzw/YZ3cXBnSN9jnP5/ObpQUyDj9NVVjHQ6VNiwqc
OfrDeGM6zz5mIfv0BRhvJ0JoYsPoySiwhIyQpOsbS98PvRnD81ybFDo9ygcjdWH/
vfdUyf24+vNeG57A6YZU9BK8KwkQz9TEOyxDyub+eSI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2895      )
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
iveYrp5qzeYOb6ll64hyqQ==
`pragma protect end_protected

`endif // GUARD_SVT_EXIT_TIMER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MR4x2dx9tckTOCkBzzJoxWHY6Iw3vgIyqwrXdONReugcs5czs+y24QHHiyXXYqJp
N9dHK+doCCzgjInm9KJoC2qdhQdh05/wvxm90CAJ2jUZcHr/SRdvqkVyn/ueSC1c
cc/js6aAFBJJ7+4b+d/Ll0jyRVfxg7ECFrRx0KiKqHA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2978      )
j68Rm9GXj9FE2Ky6lcYMuOHHX96DFYMzSf/FR8ZfANj1OGH+wPBazsxbBR7qp1T/
Ac9tv1/qXEoieQoqTArtXITsCtFh9YI1UxyN6mW9TgX+O05deiSleTJveVh5CXIC
`pragma protect end_protected
