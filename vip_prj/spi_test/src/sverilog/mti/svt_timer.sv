//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_TIMER_SV
`define GUARD_SVT_TIMER_SV

`ifndef SVT_VMM_TECHNOLOGY
typedef class svt_non_abstract_report_object;
`endif

/**
 * Macro used to check the is_on state for a notification event in the current methodology.
 */
`define SVT_TIMER_EVENT_IS_ON(timername,eventname) \
`ifdef SVT_VMM_TECHNOLOGY \
  (timername.notify.is_on(timername.eventname)) \
`else \
  (timername.eventname.is_on()) \
`endif

/** Macro used to wait for a notification event in the current methodology */
`define SVT_TIMER_WAIT_FOR(timername,evname) \
`ifdef SVT_VMM_TECHNOLOGY \
  timername.notify.wait_for(timername.evname); \
`else \
  timername.evname.wait_trigger(); \
`endif

/** Macro used to wait for an 'on' notification event in the current methodology */
`define SVT_TIMER_WAIT_FOR_ON(timername,evname) \
`ifdef SVT_VMM_TECHNOLOGY \
  timername.notify.wait_for(timername.evname); \
`else \
  timername.evname.wait_on(); \
`endif

/** Macro used to wait for an 'off' a notification event in the current methodology */
`define SVT_TIMER_WAIT_FOR_OFF(timername,evname) \
`ifdef SVT_VMM_TECHNOLOGY \
  timername.notify.wait_for_off(timername.evname); \
`else \
  timername.evname.wait_off(); \
`endif

// =============================================================================
/**
 * This class provides basic timer capabilities. The client uses this
 * timer to watch for a timeout, after which a notification is generated.
 * If the specified activities occur before the timeout expiry,
 * the client can avoid the timeout by stopping the timer.
 *
 * The timer also accepts an optional svt_err_check object at construction. If
 * provided, this check instance is used to register a timeout check and to
 * flag successes and failures relative to the timeout check. 
 *
 * The timer is started by calling start_timer with timeout value. The timer is
 * started immediately, and allowed to run until the timer expires or the timer
 * is stopped.
 *
 * Once the timer has been stopped or has expired, the timer stops execution.
 * In the total absence of activity, the timer will not indicate a timeout condition.
 * The timer must be restarted by a new call to start_timer(), or by a call to
 * restart_timer().
 */
class svt_timer;

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Pre-defined notification event used to indicate whether the timer is
   * active. The event is an ON_OFF event.
   */
  int STARTED;
  /**
   * Pre-defined notification event used to indicate that the timer has
   * been stopped. The event is an ON_OFF event and is reset whenever
   * the timer is restarted.
   */
  int STOPPED;
  /**
   * Pre-defined notification event used to indicate that the timer has
   * expired. The event is an ON_OFF event and is reset whenever the
   * timer is restarted.
   */
  int EXPIRED;
  /**
   * Pre-defined notification event used to indicating a timeout event.
   * The event is a ONE_SHOT event. A message is also issued, with the
   * severity of the message controlled by the timeout_sev data field.
   */
  int TIMEOUT;

  /** Public data member which can be modified to change the severity of the timeout message */
  vmm_log::severities_e timeout_sev = vmm_log::WARNING_SEV;

  /** Log instance may be passed in via constructor. */
  vmm_log log;

  /** Notify used by the timer. */
  vmm_notify notify;
`else
  /**
   * Event used to indicate whether the timer is active. The event is an
   * ON_OFF event.
   */
  `SVT_XVM(event) STARTED;
  /**
   * Event used to indicate that the timer has been stopped. The event is an
   * ON_OFF event and is reset whenever the timer is restarted.
   */
  `SVT_XVM(event) STOPPED;
  /**
   * Event used to indicate that the timer has expired. The event is an ON_OFF
   * event and is reset whenever the timer is restarted.
   */
  `SVT_XVM(event) EXPIRED;
  /**
   * Event used to indicating a timeout event.  The event is a ONE_SHOT event.
   * A message is also issued, with the severity of the message controlled by the
   * timeout_sev data field.
   */
  `SVT_XVM(event) TIMEOUT;

  /**
   * Public data member which can be modified to change the verbosity of the timeout
   * message. Defaults to the verbosity corresponding to a 'warning' or 'note' message.
   */
  `SVT_XVM(verbosity) timeout_verb = `SVT_XVM_UC(MEDIUM);

  /**
   * Public data member which can be modified to change the severity of the timeout
   * message when timeout_verb is MEDIUM (i.e., when the timeout message is a
   * 'warning' or 'note' message. Defaults to the severity corresponding to a 'warning'
   * message.
   */
  `SVT_XVM(severity) timeout_sev = `SVT_XVM_UC(WARNING);

  /**
   * Component through which messages are routed.
   */
  `SVT_XVM(report_object) reporter;
`endif

  /**
   * Identifies the product suite with which a derivative class is associated. Can be accessed
   * through 'get_suite_name()', but cannot be altered after object creation.
   */
  protected string  suite_name = "";
  
  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VscDnAzwR47Vmm4l0lgtRd6NVCmHfg/gVwAODjBKSdToWouZ/8qW0xZJPoUR1pTE
0dqhKl399JwAZP+g74SeR4U3STSUrF697IBBLLBgZXTNi878zI7zUjbWqEbT86ww
tswNwPH2oAZIK9VMlEYoYRL9yUx771o5zY+5NvqWejA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2555      )
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
aD9xbXbA4rVlWdIU2YSZjg==
`pragma protect end_protected

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Creates a new instance of this class.
   *
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
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
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   * @param inst The name of the timer instance, for its logger.
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param reporter A component through which messages are routed
   */
  extern function new(string suite_name, string inst, svt_err_check check = null, `SVT_XVM(report_object) reporter = null);
`endif

  // ---------------------------------------------------------------------------
  /** Resets the contents of the object. */
  extern function void reset();

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Initialize the contents with the provided objects.
   *
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param log An vmm_log object reference used to replace the default internal
   * logger.
   */
  extern function void init(svt_err_check check = null, vmm_log log = null);
`else
  /**
   * Initialize the contents with the provided objects.
   *
   * @param check Provides access to a checker package to track the success/failure
   * of the timer.
   * @param reporter A component through which messages are routed
   */
  extern function void init(svt_err_check check = null, `SVT_XVM(report_object) reporter = null);
`endif

  // ---------------------------------------------------------------------------
  /** Returns the suite name associated with the timer. */
  extern virtual function string get_suite_name();
  
  // ---------------------------------------------------------------------------
  /** Sets the instance name of this object. */
  extern virtual function void set_instance(string inst);

  // ---------------------------------------------------------------------------
  /** Returns the instance name of this object. */
  extern virtual function string get_instance();

  // ---------------------------------------------------------------------------
  /** Returns the current fuse_length. */
  extern virtual function real get_fuse_length();

  // ---------------------------------------------------------------------------
  /** If the timer is active, returns the current start time. Otherwise returns 0. */
  extern virtual function real get_start_time();

  // ---------------------------------------------------------------------------
  /** If the timer is active, returns the current stop time. Otherwise returns 0. */
  extern virtual function real get_stop_time();

  // ---------------------------------------------------------------------------
  /**
   * If the timer is active, returns the time delta between the current time and
   * the start time. Otherwise returns 0.
   */
  extern virtual function real get_expired_time();

  // ---------------------------------------------------------------------------
  /**
   * If the timer is active, returns the time delta between the current time and
   * the expected stop time. Otherwise returns 0.
   */
  extern virtual function real get_remaining_time();

  // ---------------------------------------------------------------------------
  /**
   * As the SVT library may be accessed by multiple VIP and testbench clients,
   * possibly with timescale settings which differ from each other and/or
   * which differ from the SVT timescale, the svt_timer includes a scaling
   * factor to convert from the client timescale to the SVT timescale.
   *
   * This method sets the scaling factor for time literal logic. All clients that
   * use svt_timer instances must call this method with a value of '1ns' before
   * using these timers. This calibrates the timers so that they can convert client
   * provided time literal values (i.e., interpreted using the client timescale)
   * into values consistent with the timescale being used by the SVT package.
   */
  extern function void calibrate(longint client_ns);

  //----------------------------------------------------------------------------
  /**
   * Watch out for the EXPIRED or STOPPED indication.
   *
   * @param timed_out Indicates whether the method is returning due to a timeout (1)
   * or due to the timer being stopped (0).
   */
  extern virtual task wait_for_timeout(output bit timed_out);

  //----------------------------------------------------------------------------
  /** Method to track a timeout forever, flagging timeouts if and when they occur. */
  extern virtual task track_timeout_forever();

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
   * Start the timer, setting up a timeout based on positive_fuse_value. For this
   * timer, a positive_fuse_value of 0 results in an infinite timeout.
   * @param positive_fuse_value The timeout time, interpreted by the do_delay()
   * method.
   * @param reason String that describes the reason for the start, and which is used to
   * indicate the start reason in the start messages.
   */
  extern virtual function void start_infinite_timer(real positive_fuse_value, string reason = "");

  //----------------------------------------------------------------------------
  /**
   * Start the timer, setting up a timeout based on positive_fuse_value. For this
   * timer, a positive_fuse_value of 0 results in an immediate timeout.
   * @param positive_fuse_value The timeout time, interpreted by the do_delay()
   * method.
   * @param reason String that describes the reason for the start, and which is used to
   * indicate the start reason in the start messages.
   */
  extern virtual function void start_finite_timer(real positive_fuse_value, string reason = "");

  //----------------------------------------------------------------------------
  /**
   * Retart the timer, using the current fuse_length, as specified by the most recent call
   * to any of the start_timer methods.
   * @param reason String that describes the reason for the restart, and which is used to
   * indicate the restart reason in the restart messages.
   */
  extern virtual function void restart_timer(string reason = "");

  //----------------------------------------------------------------------------
  /**
   * Stop the timer.
   * @param reason String that describes the reason for the stop, and which is used to
   * indicate the stop reason in the stop messages.
   */
  extern virtual function void stop_timer(string reason = "");

  //----------------------------------------------------------------------------
  /**
   * Method which actually implements the delay. By default implemented to just do a time unit based celay.
   * Extended classes could override this method to implement cycle or other types of delays.
   */
  extern virtual task do_delay(real delay_value);

  //----------------------------------------------------------------------------
  /** Block for fuse_length time delay */
  extern virtual protected task main(bit zero_is_infinite);

  // ---------------------------------------------------------------------------
  /** Returns 1 if timer is running, 0 otherwise */
  extern function bit is_active();

  // ---------------------------------------------------------------------------
  /**
   * Set the message verbosity associated with timer timeout. This method takes
   * care of the methodology specific severity settings.
   *
   * @param sev The severity level to be established.
   */
  extern function void set_timeout_sev(svt_types::severity_enum sev);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
j0AR5ZwnJy3HUS3Qw41kDI9r/NmkS6u7DUuSrMzyVYxd9blTI4E8rspCStcCCW7J
gGs4UnGchTvmzZO4tcslc89s7OhdWF2b8QMc7BwNbbkAH/6cOaOFGFm2yK7XhqkA
ZIeTCQuxNKp0m7S83QBSmfDp9sc1yUQJRsj/tZW+LZo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23330     )
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
`pragma protect end_protected

`endif // GUARD_SVT_TIMER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hIqflqjkSVcCV2px/QacaYBqbVd6ktjCFmHxmqFiQYAPXCL9u3IwYC9tIaG6LHZg
L1MMPWvrl9iSbDcgyA3ol9z3s9/B6mLttzYHUSvkhSCAltaHKDNwI3qZh0UhRzQI
nsluYA16lDcml9lNzFhqvFoeh64FqtYK0KJN2V18UsM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23413     )
CLVGq3WARBDKH90GFYiKCWvunp2Nm/H/8hhmEly09iFuJSZ6+uPASy995OCz9VjR
U2xe2oEeSgDJdYuSNHDOW0BhmaA+SuG0J75hId1KWkSKpQdgTYBRb8YsokK0QuP9
`pragma protect end_protected
