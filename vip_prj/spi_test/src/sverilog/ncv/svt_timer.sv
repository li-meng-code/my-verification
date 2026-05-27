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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
85tlrhsMmXJ1s+vObbqyHhj2TN1YksrjCMAV3OZiF5g8flsvOsU2g4yYp9DgKkqN
JNZamIa1cunC9hxxx3ao12CDI3dxoqlk1zUJiQIPkicXaFc6eyUg9CNwy00qmF3e
2McAylQWaXpW1kge6I4QDyOXRNjsoL/tGFzMcAyonEMTAJr1bn0IJA==
//pragma protect end_key_block
//pragma protect digest_block
a3/twfUidHyVmxrKjJ65jwDWAaE=
//pragma protect end_digest_block
//pragma protect data_block
3ypPtgrb5W/Npyk4w3PbEmoWwYLufjSNkDpOGCKtp3leqOo2KujxuzMKxI1gzHYX
Qcc05nzOlxY6EjuS/LhrgPU3bMTb8mKF3a+3n30u5MuyvCmkPfskx26x2yAYV8Cj
ylBWMMGU0H6VkYi/G0hnsRNo89cDA8GR00WQLQPrYtzZT9txRZ8spCyH3Lg8UlQW
SMUuFuKAmC6+ZjyvsuiiMT85DJP3rgY14/LsGRpEBpU9SsDl40v0siH/0Bakb+Zl
2jqoZzGRCViPiO2ShxKJ1aj6fc7ILzc5lUnD0Jkkb1p8fFmnipqCb0xwElp+DFJE
Mcyerd70svMaAHjgrMafbIJWFUG5WUJTHdz7qvRq8eSQXhfwEcbZxlMGJoRJcRyt
pqMr1m28WCj69coJQ2QpH5ShGzjVeaadVAwz7pEEljv7/2+Arri9mGaOrWTEYAZ4
wxNUqruM7tpVhnTJbDOkiXhyOXcsCCi1skLKkgmy21yIK2fgxXDMQMnCbzk0OBiK
v9p+UOxVMv9wPYTKl+g3E8Ou4tW7F+EFQTjr5kegZ7X7qBoRY2tgEzFn06K0uuBA
Bbq1g4Xq8Z6EX0Jx69dpgBFvjw8q2BOFvPMrtBRqv8LWj0s5mgfdGvqVDvMKXwcV
czHwSUko5+CL2uAPSvFy5GFkRZNWtHSGc6fZvPkbv5R332+Tdq9OMXBBzR4xTHkI
gO6lrjOFY1Jn9KdqvfRBqlmJkSL42X5KC1zF6KQty/4oyO6gFA5joVBePmVhv32n
WRfmHPw+fXyGwqjWUFVyhJts+HV/HwxCqJntLifq9rxjzTKAhrFgk7v/jLD32cno
c/cUboeKuLFavvt3lNXqdoCa06YyvKcHGYJlt1TXjWIZvDgF9wfTXFLShRinrR0W
5PjDHIKEw681h0sGDOGA1VHa1k6J2qmM82W7aOCV6+n3hyWyW7+dnNbNq7vb5Owd
HyfQ2gQD9h51bvTazeuqXRP8nKsPfmq8DjW0/r2bN+GmdPWqjfCK9pD4wKBusLXN
B/A0AFWyw0LSKKwABkx+GMX+DAD6sjtO0bvux8FwEPqnPxlo3pvQDSls2Pk+7XAu
xjl3cbWuU04lt6fgs+3MBPvjaL56E5/tmj8nab5E+D8ocNA+loq3L6eq8Nb4oMWu
Wb9WjQ7B51fP5/Ot60JVmEkyz35fGnZtakHobJRSYtUuqWXhby5Ka+126iI/nkkj
z3KbA9Tttp4OBLO/ilFa6fLxgk3PGzGinV6KFjqcb/MxpvrtimfOFkSFoVDlTGJH
RL74kdreRWkjmfiioAnw+Cz5KP9qUh3CyAUl9qdp+NaHjy/5CgD4FwbEOCDDTtPh
Ht4PSouV9wh1KkhBIC+tXWcBBPUOLiY2nvgmnZlqvJLo6vjxoDARcQpthB8fYUwd
ZiU5dUgQie8vhbDReBTg/K7LRaDaC2YaU9w+LMcFrhEf/DhexT5tZFhVeLJcdd6c
RRPCDFUAsCMi0j52xd59gj9YBT0GFQpFP8hKA9Uu9ugEZceQ/IFFskxkGZzR5/Vp
9CY74maFVooAmZXZMUw46yXWRjlOtNNlVcrBCEdaD+uLCrYSaQVB3p4Bw/sagxdJ
zLtNfwJlDp/HegB3J9b3qsbacaa4Q3yiBqE+W03sAES1xAoYDUFz59fHH0fvKYMf
Wkxh5REA8QC+cuIOr1KijeTiiN/4bcs2WlfxO7CCqjgB4YcXsmQFZzTw5JgFuhaW
XquUDI34M5ptaQcFHoYU6oQ6Gx3vbj5R98WL5Ski0a1yTP7m5+gZuvrLfDnG1Qm3
GIEDKBW91JI5ClTxEt8w7MT5LNouOI/xZir8CeUanWzmbgL62trjzPkcXXJhc7kt
GriGTo3fDwXC36YC9FOva1SaA6+8yOII/sXZhFvejrRSudtMJkKecyfnpQpkNmkz
ZwSijuQfpC/MyIu+1rEvHuOxw+hfwehfYe7ULKn+abj8YscoJPPvq5wDVT865bpk
K61gzLkxQR5QjtaDzt/KvCWYXxiWlAnvsHdv2QIT2fMwrwgI9s+i2UxjibPAoESd
ojx7wE343WFJyp/qsa+Q7zF5/nah3b0+EZbk5WiXc8so+bGzL44BQZn6Q6+0C4Pu
VbtNiB4E99nvE5atbw6dj/2y4rZ6ZZ5mH2OrREvLRz+EQdVjlb2LVsB/w1LaYz7K
t2gbZfkJt2C2SgdF7bNyj0rm/t3YbttGPSEVWoWGyF5GMTUwyb4794yP2lnrJiRf
fWVEhuE5hmvOG7CvA/+fqLsxIbs/Uf3Yg+aP2AqUQpgDCHrAMXb2hsfLaxqMMHkh
orCB6O/VyS866/V1MSXYyPB5lAcOvvrq4/J74Gv1eZhEiiDGTSltfrBW/FhwTCnL
3xcePDsoav4f0iiibyY1uEPQ8exQ74Gh/k/6gE1yXcA9pKAApSSQ8CjbugEPYjSL
vjXn83kK0fn43wmX9IvgcUTc3PAr+33Obh3FGdiu/gsCqaEAVCuTD9g5y+vZVnm1
0SvHM9oOSkmuAVE7P4KUjH31ZD6PHKnxX9P/s1A5pOoplelGjnGbQhlu0d7Tj/GP
Qy0U2942dI92+hfmbFFubrOgaYGEKdJVDnP2+tGNzJ1/wRjjFjewxul40hkDGIp7
TMcsSQISr4BYiEb1RqR1tY2dSJFiySWW+yVT56gLavMhpTPjei/3tiDtv1845fkM
pUQGY2QGxKcKhYDdHnjWteZj0+wgNCwIFnVxq1YUXeWq4YoZd3mtKxeLvS/Srfk7
9JQCuIEWRVcVdZVw5r5UCAgrExmOpx9CFFmc+DJ4r4jwFx6Gzaes7kDkOuYwEo8o
Vv3Kc8cQFpVRw8kcFWsqEZkvjvKWVOSWzi+cyfI3jFMFFpc3psQg1CKnM8SPnMuQ
bP/5KgvoyjDUiNocipAk36bogBg4boqisgC4hLCsSa/nU/RowSU9+RLCgZFulGri
qkxkOFf/ehl1BMcbF8wWqlGKMdtMZGPweV8UY/1BvkcAoRJ8DQGcOtG/1L68cvQX
Q6f/jBE2EpdSBWuerVa5pwxMjj8INNPnwe8Vk116yl/Vv84YerLOD5h16G39Q/v4
dB3baDyCQdFhycNGikrZX6baRfK3kubalQ8LLfkdEqNVl7VcWmHUy50nWi3FtrYY
Q5ro5nki2HgkmtPOzehAX/Ag68j6Yw6bkrYVr60jf3tgkH0Tv5qGs76oK6IWJO3p
RKTkq+c1hFlBMgMhvqPn7uw+3GT3uWfDmKTOBhJ4jTWHCmWnaRQgM+QaI36VLxZr
V6jn3UIXO44K8RlndKjv/cjUr+AD1HWx0l82a1MLiujC8rlMce3NzCre/AdOvIsK
JTjIkt9V8/WRTlk/HcNPL+GhLksgZ30SMKcLKCwKOpndRk8t6NumPvDkYYUCNy5a
lo8CbMwneD8S7lI5jxwMnIw8KpQIGc+CKLriFKvHD1aNJCSTOqC7rK+/YpL/WDHL
jp5aZotzdOgvQo03acfmFGaoNx2Lm3+CgVhFuYslagBTWtThTxga5aviVpFk/pI7
LLbPFQ8t5iFOCZwKWAQ7k+nprXvP0BheJpYY4Sv/SZzfQQtPeeGWqCo+ITInu5DF
U8zLWU1fi+pJ2WkWeB+Suap2f5dnKmHMFEjLQ2fOHk4=
//pragma protect end_data_block
//pragma protect digest_block
78XaY/xOWE3ztYbEqdhnl4DOPaU=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
unuiznSN/c2V9Y5bAU4DGN8KdAQ8kT78kqfCOLLvRL0CeLwSQKiHOSEQqZt4+EvU
EXNVxsKDRwiMXn4cU+0qQ4B3e60p6xNRuu1KOvCzWh+IOrI0SLmcgWBLrTaxc5Hq
GqAO3kBEWn2fcd6FKvone6w1nSOJxDbjDpLjY+x0V/LHhGTFzE+dhQ==
//pragma protect end_key_block
//pragma protect digest_block
TfXhDqqOscweKzmDJsfudyXg5Zo=
//pragma protect end_digest_block
//pragma protect data_block
ycs3QqdShX4szafnYIPdH3ESCSPp3YhmmndiKpuCNaa1g/B76kdisieY3xNKYmG7
+6XfxGiElmGO0u0i/SQMnhPSd4R9IkujGl7yyZ3tK/JyZsKd+iaPaxO/5P2FL9Zp
rx1AecyrV7k0aDl8P0gsxbgEPcdgeRMmyIskfBdbwj4+kJgG6RrRgqESPXtNb+wZ
FGGCk4btz1heoFqyAerN79MLfwikvJZ9TmGNf+M3OcZ1axS601DUhuIJLSlyzx2N
jY1Pv7h6vJKIm5YKPXdUCi1ZA7UcboDCCHwzXnXyk6b+ECcK7BtfMbgE2GIlVKfU
he4x9uQO7Y/poPCu7bGt/JO+FFXebaiq+RTSWbjCd5oJLU+IpeKda5Kk4K5S2Uwq
ewH7iDa1SkYNmIHkEsh7VTNtVX2iX4jbc5gZgJgLH3kI19EFqiKXEvXkN3FiSq/9
rAS+zgAWtEXi3IorejxhHJuJ04yHupq8crTIc2Jby+XasweZgNWc0web40QoBOqs
nPd92FHRCnGIeLcmgmv/DwuxINiBIZ2CpRHJ+GtVfu+5qC3/JhQz6C/gwDbJgB09
6+Vnw5sLKdtDvoxcBLU4Nm/VbZF/QDtnDW2Hm+NoDYVk2Xp2bQ0GJcVzXZk9T0bB
P9r+4wgqpWlbt74vdpu0Nysp5d8942bxdmL4AgJ/N4cs2i0z1M47GOKgZRLnzFVI
58+5EMDPQ0cSDAYG/Ojrql5CQc8mJLWwnwMOGUba1uYA7eborr2t5dqB9m72TnH+
vm1g2aWDg8vqnihotsZtTWjYu+Bc3ZJSdOSLK68Ey1xv9ROliY3kow7OxAMyQAI+
FA9eEb9oICSmLqrTkiUeZA5CXZDvu7RactmMmKtq8soRny8U5JaYE2BuARiRtWdZ
NCID/IKOo4lk/zpKnhLxmqq/QXx2NKkbT5XrNe3o2uJMxDxHC8Mb58HWQHyQaj+C
bqDtG+fB0IApruY/e2vG/HomxaK1xz44kNhcRfuczD+eZuZ9XJX7Ky8RQiFC6NSM
Wl8x+R8p7Y0k1Tas11zVI+0kn3V6DhUIgGPxtEtIQ5B1aQt7KA08fL4qW4oU7LHn
/eaMtJM7ClXG5acSHT6W1yUCd+9N8H7JljUK+boeHjmP0xP9Hl5bMeNYbvEJvzSK
1w3Q3cHN/ULPBxZVJtHbNcSTjHv8Z9YepExiI2GrbGEVuawyjVy9yjKOn0Wey2GF
CImp+SDBp6Z8nfuS50tKlNotb4S9uYhMYMVu+AJBF/RmoAWyKGyfLT32PuMculBz
Mh6FoZ/C2C57BAsy1bcfQwFlak5zfyZloVXyLBr0UEzmwGdLrYiGN277vZ3ARYfY
tISZFaGPwp5Ea8lBJ4HSsKN6dXHGzJmJYMocB8qqjOcAekQI1n0ZR0Wf2C7/ZFOr
Ut4PaYXIVwn06vLA2hOrZ+OqcCKyyET5rSDwIqrqvYQEe727OTrXUHD8vigFn9kv
zfo6S+Hv0lLzH640P/yGeOuo2VoXlMKN6cAoZkedutlC2Zf+pKmNBbTN13OH5NOw
F2ra7skvXHgulwnyIUFji/MWMOFMmoWNUFqgvEJYl65CY5P/fkTTdalZTi0NHRcm
/mDx706bbHAwMbX+Pae6/1x+b5Okg+3iEMc6vW71ll+4kfbQ3FrxwY2ccgQxI0l6
r+6keykdv3u9K6rRS7Quqqr0YGy/OQPStbvfTWU18BEJnZ4juFlGnGJj7GkmjYnN
vBeix2FWTP6tx3CAECNH2RVAPQxO4F58x4Yt6tjp2Knh63FKxK9JlEfmFMC95gju
TIGyRSyyeYtQdQOVs0g6vlM4zidsqVLUSOw7LXExXBDyilQidp2VcCL07ElEkCGn
7UvJQ4a+KTud0/9i+mQtX5mmQEMJ1pU2WZAQrWIm7R5clBMYF+9hihtryOZP1G5S
Y6pS6UPSq/wJy1ZEpSaVTXw52eUvxjJWhObfahnJn7hUNoaWxGsplpE//1o9Gaff
JwlptontDCb4KfxHTgDSmtETmV0dMdhyD5kOKAvNLG6u5Upzpf2gY6MT3HvogDEh
UFAtA98Neeon03eZFFRyVOhKUnTfbxa4Fo2T5YgZ5nS0CyB9B6CX0Sxpe/M9d3PL
CAsXo95F/AZAz8DgFKrm/WJ1JEMYbSNfgw+F2yCDWsSzb5dwxSz1pcsJ1C1DnNQU
/oTjhf90Bl5oNVLu4Crql29ffC36IxovrFJAdkiI1J3xG8QtLPSoa392KoWsWSrJ
j0hNJyq5wx4XdnkFzG6OiSiy0vspAIEmLI9vo/vb7O6QQ7OHNlwi0K7o+dzperYL
Ua5jF135yY5f5LikbHMvc5y+jV6UzH1Q2YzZ7Qdn+hbX3aRWD7YRxdJbL1ehcpQ2
HakInZTNx06kwh5yAG9P7zn27bJcxYG7fzs/yoRpkgxD5K/ztN+0NVePmOenFFkE
J7AsSSWpLZ5pQYwkcTbqawWAAwDWwkk/Rw5yvzQ+6onrgcxuaYmE0mM1/SWu7HO6
7GZFm4mSYcx5wMEryxtIvZvQOc+JMnRd9BZeWaI1v7gkiqBYAXzlwr/uu2bOElrP
wS+btRmI+pQl0G3sb7CYiaBUSs1lrDw6ZOIfUDWN0/6JHzH03NAbSWlMrlwlFrqI
PQWja4xp1/gjsILTvS4Lhk9ids2657H+IeKFV2yIFkwNT/UaH03tF9neVRQXPlba
x6dVljr8tSVnyFB50ocL4Y75QA2WrmuOp60pVw4sw98oWh6vB157PnQ1192VuV62
0afNWC8zWI9n6cq14dYS0RQkD+loy1ZKmqlYghsjxUJGSpy4mYmmMHwcMUHurI1H
OyqS+nAfd2m0eN2HhjjReFTx3FAzWLIajBT3bouS1CqgWbzbjG+ebjnkmXvmNndV
v3z1iEXvC2SC8oez8+n0QI3wr+9woocKUbj+LJxCHaXpCDZiRxRvgvdUBL8hz30i
Ni6qcYtYKLgQDIDr9CrzX9Y6RCM4UJE/RnMJWVoN/uq7UetInPtDVLs3b/+S/04b
rqetKcYAEbh18u+paAIi53s/K2DlES4pW23L8TmQx1179c9djvoNgFMVwEdzC1QO
KRD+eOm+lwGrRNphzt7Y98eGEEaHZWOB22V2ulUmT6ZqCMW25d0IvlzIghSiGluI
Y1iAIynf5MkYp6y59ad6ifcbN+T3rtj+O06SDWYrKDEMVbMdrrXqKKJAd0ElyVyV
qd6r0ntu0IdK0v6LMbYThOVUch2xomEj746Dom5hErRVybPb8xBFuzRnZJmhjRTN
3YnxxWiYsyQKeOS51MJsYzBYlBY21nISv9fCNKkiadrPOGNFOPJZzmGCphQGD4sC
tG6WVPJMItdGD5QxHITwAQFTWwPsNUlAMzceGoZK6kQWo5OxC0FC+91NiuWLfugF
53Rx89hFygK51zjoyxnIMOwX22ufW2oz+h5O0sKrXwNbFOEEn4ELCpGjiWHAXAqq
yET5UTfAvjRgvbI+P9I6qbZS73OHV+nZJkWaqjZeCbNWu2L01dT0kHNIsnoZ1WXt
9eUSsVHHcuNC6kIpS/U+lXAT5ycU0yDbSRlssWDpDms69Y2CVffDVYm/B18ccFMn
jOi/XJJQiy9g3wlbm+VquemAx2SYyMFVSH50pfnnLooORGtjG+o5HK2v8TZs43v+
MRy3a8M1KueAEaRyVhyCOAROYiXUOSfhTwRzdtP3scXV3QH08PGm8jtex/tXyAm5
GIdTRWPMgxwESfOrp56WhFZ379B1k59+HmQYyr8+6RH0kHZ3RsacWaDzTeu0Q7+T
is4+hPUI9WFOpDE8hUFLzllaDb3P/f1wqKKxWLfMeHz72ZfrOiVUegoww1dirmuU
xYrMIMeJ+JJ4Qoe1qjptJDVbV+8w6deHGIaTFrRjZRjMSBer1G3wDbOt2kX25Dj1
61VgV3Rvp4gpZw5t7Ti3T83yjZAiN3aBqFSBbZpK8KaYcqEZ/3+HLDyVArFk5gen
Y4rv/8l34vVsave2bqgchVUp3K3y4g5W1n4zmAAnP8f5fIXCuTbcAj0P9VKCEZDg
YaFQfRhgg41/ueFrFH0Qvs9nFtVo34ManDTjDSZ8odCdyNpt2+Cgu13WFm8Nu050
oQ7CiikcGgFEaQUAuapoC/iCkgD1bg3tXHN7GorRhag/QCCAWeqE1LRLmDTersG5
mTQlMl7cVZtzHL4/XU0XNcLR7h/PDdFNxH2icg8XuDhs9sjI9FQn9xRq0RylMyL2
SaqykyYopl46b8A6P4EkDy+jTk19ZpZ4lhei21hWeebfotJLOZ+JhUPiuCqyLX+f
RUclkrpKQvi9pBSMX3sNuRjuV4aGTHpX586GIaVkLXSdU0gYDtHOtkFWrabfAz3k
U9OZ4RzEW5FDOOpjxiumMug096Kf2rJ2UIkeYr+D56BKA0W59hllLvuNQLVd17LS
wUXP/mArtktNl96MYzioT2p4guFod6xU/fjcgvo3hxdugOvXZ6diMyatCjrUhrDs
czwigdZqvnOjOJamdlxX3MMzrSKVFnvLRd5BFqj1lFzWrlVsoP5W5hCIcBE0f0HS
0cw6OKxn1ZMt6OLbsygnoRh2983WUJJSFjM1tusZbyIicziV2828PRw2MQLN2Dxv
t3BN4OakjzHONE8hIHe6ebvWH1V9s2w6jSIu40DlCE7WBdIMk0KZYTaoNv5Fhf1D
EtUSCMtsoN+Rvcc5XgWRQyk2dBaVgb6iwRZEmb/XcAFk2Q1iM+5Giq2oWuaLTJWS
5w7yjP4O4w7KnUyj9BVZ2E7Gnf76mVRxOgEEsjqgXVA5g1VIewippWSUiKd/XlIl
4/ClaPxc0GIFfl3wvEWvIaNW+vEIAusKYZY4l6M5pJ9n5w0Zb+FldS6i0vb6/+EI
QdGJ5LPY+6z4X+M7HNH7CcTlEtMcW7H7+kUDAf6CYN+uk1NuBeG6ZS5Ze/FKsVPv
Kh+GL8eiVm24OtMVkQUJAX/apK8I7PjQvKtbcq7ghH462AjYqN/2Zr19r6GJzxCf
qvB8zDcc4rRCx+gWXm/eAxVI9VIAA836G+RN/FvTzxSOJGhrLbr9WMpqCQgXdSd2
Tjnqoo0icneo0nHG/HeuxCh1Wklhv5R22uSBWkpM68gDxbsEUW57+M8VnVmnx3Ao
zgM6YCPYnLah0gYs5y8svRibo1f+RR4yCATEI+Iei5YfY4T58Fho+veZdzLxHX7z
oFYoc6fLJagzbYk64Z5c/bWXgnIxuK0PSEDqiyMicmiQ+MrrrXuDigEKZb/R8Ayb
AJNa2dOxf01xj7dUF6WmD7HQnqOAcwPh7ixe2FSGKa+0Oqlnf7XAaWXDskJYjTsR
EFyfkvQstY67nQa0NdqxdZYjCGP6nnZrJVA58j4g9xXTpe4nSK19XjX6Z6Tl8bAT
lQ/WOzGhm5JbcXTL3ijJXKLegYUDS5+1iyY6zfwgzn+IcAwSvv93z1E7Ozx+WgDm
xgvzuvGr1d1fCD7rQgX8y4vFq89zsllUiuFqlM5rlElyoEvWbU8gRyMc8kmdweUT
mD3lCbcfS9Iuox1fzJjXdH/CnxivuwuuX3KtWMC/qlBh7V092QzI7KRElidlcyHW
TK/WvQGEPXIf2sYTIUwS2Ia3bbIA5avn3tQ5HzgzwUA2mNP8e2zVeO+NVRNLzkZh
kwAiqjxW2bVrXC1Iy0a8LN3vAbFsVF1WHe39hRLIlMeZxvbQipt4Fq6tV9ApiUK1
jRCv6Q1228tuMgqwxAH2VSZJwJZEo0Eb/bzmG15mx9ZO01JFg+v/fxoqEzEaEUIJ
kQrIxklfE4BuPVmnK+P6IcPoK/X+UXWvykkNX4i+BnrWUwTWd5vsLv/CbkDMPRVB
EezaA2gvx4BMRp0czyaZLeMMTklnYSphAqlDstHlt/QuQs2TO+uFQFxKOIBmgaUy
FxFRcO3FpeCGglHrFH8cDylxdbgmLM903NtdBotxE7Gfu1D6iiQbZUugNiJrjuIt
yLR00Glv9oDCrdJpj0Hk+Ijly3UM9dQkR3kqoGj/ypKvTu8LwuoQxqF+TlJMMigP
51v81XG1Ep8GbwcDtRoOFlyLeqWtfobIXOkNkai7v5hNPK8W6bYci3MtAmmOuyL5
kI+6MRrECijD0lIW54omoxMGLndl6hGDJnxWrOQH3QBAwXnlksWV2A60qzEK0Hgc
Rlbwc10Bc46mesOXV0xuSwSHHROOdkWq8wSVR1UCk7HiqbfbYd2HdQuQDMPUEvL9
N2Jn3qWoi9/HdZWFXbXRnXtBuLxfeUVqIWjRu/TLIJf7txYv00HKbzQELE7fP3nH
51AlSVyZUq/6HY3yIQMkM4+axcXOxq12x5J/hUqKIh5Sk0oo4iu1SVcvM7Jgi7xB
VQgLzGcPkxPCzax/MrsAA+loGBEYKTlAh5/0Dq8zYlQtrBioNK2r+IdIXDoSeA2U
bzbtvy+/kcAjvOL4w3VJr48vvHgcSjiOpla1fYYGDfKfScf32oEWEZs5pawjZ4ol
Mv+7DVWwm18UD2a/PmhwLiiy+f+aYzdjpGhfGIxaqDefzYn+bfSbnAA0Geu3b2Yq
piTcgyed4Ni8U1XZl6t9Lt71a6JDHAaIueNT6lm/b0aIzgA6a7ug7jiORHarIyQN
gWsIoVpW8oDUYT/YGdwrpVyWAEHnX28bsi1XU4odevTIgxj5MlY4BrRfJeunLqHN
IGDWZxMZlfjBEdB8z94vTSjvh76Jajfhsu8N2xPyh47KMxzvc0aOJOq3ILxjyxUu
amqobXQ1fE0CghKnuEumUBiR9/LoK9c43QlJKPZBgS0vuYV92jUbBt0hc1uUXVyv
xnVcplx2x8LZrA1rIlqg68rxzBK3D/7lpVTQI7ppCanxiJR1MXgsInB6VXL0J88+
EGQQsKfv1ZigYdxdOGDoGxTwZHBBq6KnhIQZmWHKPOGpCWER7WIO7HnFhoq92qA0
AvObarY83XVX/VUcqxyyy8vQpovZrhtkflC+vBIUiCLSuVybn9xyS4tGzm8ebuzr
W3tAao70GUz8dcy/96kcEUynEDO5FKwUUeHT/Gs0KIYhoQa9LNEuwCy4U3fnoy1I
HME+JWgkLXHciUtEuxDpG59nk+FTrqfQQQYmhtBoaVUCWIUgbbFRvzEI+ur8oqI6
EN/OY//xJYyVYCLHVi9ELfhQ58KJWn+or+oddQNHwKBLkfqWaXPJyJceVvKcioMk
L5M1h5bWXPlNFC8Kh2ZIRcaxE7dwpMzR/AZLkTTRkrXqdLsQshWUVudPIbNcPQT3
FDVgjuAttIpXNJ9fK7j2XupKRXOlUHUOTQapVzES72RRXvR5+xCLCjZiVMzoYkIP
p8nagPIkVPkpyf2KPXiYJk6MMvyFNAL//U1e9D5CIy4BhUZOvwuep3bBMQCnKLEA
gGxlDxPJsXhBvHuJPvCNOCv/exfIg+Q6c7xRkLMqHAB74LAZ4+nuFCY6VnAMK+Mh
JFH6SaYiZD85dWeIIaPYe83wyzOyy+lPB9/VuFEnZ7mnSjBOlzrS30Pn0r4uKKAB
LSe2DR2K8TLR94mqEbIWy8IbVbRInx5xWqMbQSIn4e9dTBNDHDnkUEv9MzDdIVzl
W6+3rf4h2RiKGAY90Qc9UL+tZEqCM9kTi04oJ2I1wlJQcE0QlvkZlkdy0+N2U+lc
1u1PYpu3fF+nrZ2ntAVSV9laVAFEXDAHpByqwnVfRyNlnczYFZvSZKLLlWxFwkgf
Og4c3FYHDfscjPaE3c3mK+DIoKXzzK/5C+4xMQfxEUWCv9AFiAG+464q3d+SEl6J
7NGQsEPZFZV5ONUYP24IT/NQoDlQAjQAZrQwEQkic0TwmZ4e80FU3MFkdaNltsHl
v9vpZu+tWY5EG00jaOep45L/Zc1oWw8ltD2kCAF7vazpxEQcpKj7ULtmnN7vbIBD
oyUbEBrkDgvBnj1mr5c/7/7O0OvJ4cUz1k8/KNKnN715qPEQcM6VroMGuySu8Uej
VhRIiEBAXUvs8794UCl57O7KduTFev7iFnkuwO3FRcx+ljJcTzmPYLPrFqge1zI9
G7mgFpVQ1RxwKR/QaKX0eR9VVOy4WcuR2BmALQwYV5A1Kq8k8gEU9QELkkeGuc7L
Ek/GJC4nEj0YVjgpM76EqJH/vj9Y1jZ6ATIWlBX5FzxkVkGn+TOSJpt0b0MTFSSM
L47IUmsBYw88lrtxn3zOHx7/HvEq4exlLRd5EKkJ8lFaS2r7a4ye8L7OB6UMalGG
dWsYGs0baVnedgWBZ1D5Km5hgI6oSEf5/n0pLEtLlA8vEm1opvENINq9vhwFaqQo
Pe4KfIMNQjNmUogt1zDJ9vwf/bDRUYDGlIhuSocfD/FZz0I5nUu7G3CBArDIlloP
4yQt4Hf4GywL4wtThu7xT23pdJLp1akQFK7SgCPvvkPR7w6HSlers+YKWdUgpap8
B9brLThlrQRbN4zqqDQc2Xa8v2lXUqyf+Ymb7fHrXTR43RqNnf0gpFU8Hm6IHtc3
Jk9nxr7uve/zT6ZHy5a4hWJQvibu7Erd87gOXLc+TOROZOVhV9KWduA1zm5Ued1Y
1tMSO57kmXpAt8a29dTN8/JUZuURbSDGGUChIYkVnUnl8VQYz1GXdnQdB3cVJ0WW
X/Pd2mGWai9xt1koqFRU+pgFaE+c2bNymanvzHK4lQlSM7K/ZDrrRGTqzl8KZi7K
cwr9P5zJ0+RXt5krWqa1GaQ05B5ArRLxGOByPhtKiTDfIwzqT1/UGzD2j0+DDf1s
XV3hXa78+yDvxxMuh2GklS+34ZR2B1+v0FP9jRPAXRu9MIsoLbVyfbiuqQicIH1H
ygoYJLsOti/mXoeFnolDhuGpa0zkbgHfhwqjopXxBk6ugp468NQnGSJHZC0cutsA
v6qyYWDZyoUrooFsYFKLI7BaaeEh9PA67CON0SGtff3vth4ZHjFPirzbDGmoEJPt
K3fHH/BWB9yn6o54YK/Xg0ebyigiOrT9H+1i1uAWEca9EmfPA+XgyFKEmZ1fsuRk
dTeYtMwn2NsLMNvlPyYR57xOFefjpi6QsjXvvCfO3bGEiWm16k/IYz0Wdopk0g3w
vloZJRjkWwkPQC+N52S4J97h/rPcCI8WqRb/DeL2FL4pCDk8PzLH+SwRw8EIzZ3q
72eTGXy+/9HBjrugVUL62K/lb4Oq/byZFxFEZqIavx55KgAiH3FjJULng4fgBED7
tMVg9LBulQnpjkFCs5l+zDmSo/TSpUjbdeEyvPJ3OHO8q/SJWus/LNxMSP20k0Kw
xRfvD20QkkVW+KhnpRV0vPuJHehcN6Mxr+9nv93U6RxLeNqWopU/+E1BQt2DLi70
RlrOpk4r7diu1ika0LaeV3uDSu9tKINvSwsdPti+3hGzlzgKdOVcQKqUNK15JsC6
yR3JTRrS9L9pMItBLNkqiuEcMo7Va+hR/QidA0/WUyNpn9f7IeyiMY1i+jHEdFMH
u5WIvNODpCAzHlkRh6Jp82KBJ9nV0EpzTATwZjLsrm+BBNxQe2dop4nvcf+479LQ
AgyPesZ1SKSXsL3A8p08JyOSPOpFSdc59gMUmNqkJnTRYHcl1lQ9MC/HfWS3vZ6s
2+t0EKWdS1pp2rintsc6byzBdmZBbr2BAwuy9r5nLsApfiN1N8OW34o0Ee/ChMwP
1Of443HJ5taOvnChAkysOklxREKrlJ9bckXT+lA7htkaLe9ewEavvo8WDpZ/v2hT
XxiSe49TMFz2jolpOufiX0g5sh9f91g94q9NCnIQJh1VapzHAsx4WFu0xXGHzZXf
EzC17z3oIVF6UezjElTaTSa2wIjgThD9nnDOlT/1X2E+buA1lTB9qIHGGiQqgul0
7RGAOMvHm310Dv+8jj7lmO3w5ogFNQwTlgg+34Mc1HbRl5lo6Pv0oACnXhUx9XYr
Xu453XoAc0Fidql5aVf3X6w2el5OiF3HpgnAK0MymHy3UtlBYOy8yVCjh2Q4scFc
Q7twyPRl1SagbAlUMptBeOuT5HIIEXbxBZ7OCASlGosZU1XZVsDLDRkdr2ERQaQT
+8YExjPUruoOW9RMwhnGS36p8Rckd7fD2Ja+RVTan+oIWAi5XnPBHQPg4wb/mZAw
8HkJNO7G8pMor2JybKak1mn3xQS/ABxhZwtDAHAuGAh4Gx6Kgh0OK3nZL/YhsDwu
muOaDqUW2249xKqCbWMh+f2mtVjIj8mJVdwDd4d4GAJWrgDOEcPx5FbPdZEIDPxS
ksssPhGEfEF6/pUxIdNhIDgzHpsrr0gtVNH/8SNIz4eEdGH18gpf4PiY8+9pTqWx
XfgmeDt07A9MKz3QidfILK182gHDS9AvY962osYLf/4+bPw4ClBBljYRi6chOIoA
9MsDLrNfXRJhVqSv84PsgS4BGJ+Wazxa9cTsHnIEMohdTlhhbfoTK4jJQvWNZ1zI
K2dGLA5ULe+w4ZUXk5OC8q2pKUPD5pnMkY4X3KUD+jhYiK46BouXf4XGiCN0SKOr
RyA942NJJ77YCpg6vW/casRFP91UcwS2MY1MGLcyrvoMrMIxldu1lWW8cZ4X71c3
ayunw8nu9ICtwQKuyyGTxcqlJSy/fzEapHOKM4A1pUXOE2NQbPaG5qNDfmfFHpwn
AvneLRV/i0qpIezn70rCR3gshQoEOiMzz9B6DVldY/1X88bE+xMY7u8Tmp31E7k8
b4tdLX7c0IXi3Oec662loP/HFGozqx+grz7hZIexYEnv58Q171aUZXr25SWvPXmY
XIw4lriDbudS9PYG91V4I+2QIgxFcJTIP25k8SQT0xD6tFmcZO6pwKVf1i0iGPlP
6JfbQlxhodqNG+r+lz+Jms4I6esM19BsX+7XOYOqrAl0OQQ78O89y9Yh9Dwv43lm
6eLv/Fastr0ZpWYn8vWY2VFI+b+jxMK0czao4ztFXGM1ADaEtNFttN125z36Uryx
jt0Yjxf7KhBZ9KYiPdkjthKhb8BtzEzRO7RsLuIFSp9G7iXzbKX/Lwmt1UhyApuA
4PcCS/Ocv+RIbfPUN+9XHgXylYNPctR9Yck1rPdG3V3QiVq2MizxIXu4/jDDkZPF
uH5azmPDIojmke+kKWXA3L1+ZBnOJpomuFlDteCLtHl4WWtS/Ox3gVJEgH74bgQp
hpKxDQNEAGYQ0zp1JPKcmm7Vcs8JuqG6VOpOBYYijSUOzDeF77xOgOH46o4nQMnR
UH4QvHdluJo0VkeFqdH7IW/FaHsrQ6sA+8aWhJVBK4BUX4pPwVXTyF31A20CbTjA
tnm1VVZIcS6HXYW4whH4GJ4bEAv1RVI6LjbAIGZMjd7V9PrA5VGT7choBTYZorQA
9A4n4bNBYYq6IZQ+4qPDuXH4/y5mQpbwj6nN79EMIzLfcObhDBhm9b6v76ysN4D6
m87oKkwXQtpHS+SWnowjPn8dImVYj9eZNcHMN60fs+BMYD3XsRBqlGk8hJQjQpyg
Ao5KtmzLQRSKjQaylaDXNYoxodhlUDGp4ypLmTQMt6OCqw6KNYSAS3xcEe7jDR98
aaMk67iWmOdJAcuQq0OQThI71C1Fek0/tY28klZUE6IO2ViIjoftPW+SOmjjfmKu
/BGMXbONw807J9za0DJVeb3iftIXmtmerbj2W2ajEWX+/zqa1A3F4NOIw+6Kf8UF
Or+odHzX4jS1H++QeK96o1SUKkjZl8A8urYbm2+T9v4fcFiyP4UKwenMWPfMNzbd
kxbdCaUXv4UlJ/dZcr1s9fpyIyVWTwvu9R+Ty1dsdWUqIZcpEBEc/acJ9EOEawV+
+lw3XTJeV+gSOa9GKyoj+uqyMZiE5fOl9+XoV38XHdYCrYqAPC3Xhh4FMhz7/WKS
i7s0/6g5Lkhq8un3GlYAzPPH0+bOTo6d/YnomqMk2Zjin0mZ7/apYNdeON8WtTdE
z3CJ6F/N2YazXs+QbrLL5QJZq6VcNBzLB8HsNEHWNFnBnXzyHWgQ/l3Zvtg8FCtp
Zfnpw0HF+iFXV5BoElGqK/JzUdnZ1Zpr5twizys6Q66dTzTQBbf/B7y0d7rHKsmx
q1y+f/KGwiXTuCGtflLKqaqxWNUJATHDjv1exeXJHZzRgRHoMTmaik8EYe5JWm6U
uHxV44QOLHLJe2w2ukxDXDI+5QF+7bKAOAzAHaJs3XixrCCGDeApD+Xk2kR2+siC
QjDvehTa1wPmSYpeTy3jrW/AFcEuaRGrv4yrI5WWVw41T720cm2IYDb9Z3SWE3X3
k9/gY42EQQxnZ7S1hgSk3q/89WuKZ8ErAcrllcAiVXJBzKj/DoMt9sJ4F54ZZb5A
973oxmbN38Tyo4Iv52Uunwj5E5zcVgM/CC8bpWglKgd0LUe/Llh8pbFe4wMLLYUA
WPS8K2kFdwzDtinwCgyShjeCsJpZL5Z0l7bWM7Trfx/83e3W6r3IgHVMm4b/efB3
Waq+MO6wba+4IdTXM/5Q7qtZJGgsUVg5GCuiW5W1IErZ+uCHu0wsre7+zDCOC7ju
2V/ydCEAXgQExWqb8tyC6rUyzcLZ3h3nKJlW97sykArPwR2sIp3+UW8+mL/T4jMl
Xt6CPUJqGG4Z2Jgu8/9B5x6WiDZ1rwZoTYL+LpQwU9KyFtitNXLBwTfhyNY3ph4E
MhOfwg3Liysd5hCRqrhLt2y1m8kf0uA+Sbn4cVqrNTkbu/GC8CoqGBcD+EGAManG
u2Ko4vO9o/BKPMFO988BEjRCjYHdmIVeFfQc4ldp5GrPfk9NtlvMi3yCwY9W1Sq7
LPdNgGXRLA+mt+k5gou7m3B1I9NG4va9XPMGnYWbIqOlwKuIfHhkKNUAp3+wgBDt
RVgpjr6Fgwx/XktS3ZRwzrKvX8jfBtRUfNAYrJQrA+cceR2HhqWre2P0y7gXFxP5
tUEe6pHmIJzSvS14STaQPsDRvKVMJhMVIkR+nfReudjdd7NJTkIGTGH0EYnxGfBT
n79AerifZ6isFA9lXSPtErBe0rqPvj5pH/WTCBXy/RJtFHU3AowrbuHbHOGfW5As
S9xl9H1RPmbT/b9VmA8DgWx6/BqTmqTNNu2a8zL+CK+KhUeMsiAq0Jqq9LQu0B4c
a9Sbtqwf+0xqad3F8eOT2tcvdk9yysKKfFGg10aH0LxWzGy3HN/TNd2XdX/mqSOS
jtQyZrlVpypox2oGNO7ttfuEioujvyiTAVPautFKMsg0ChWvYkD1SmZGXiNGdgyA
wLFdSLzCdzKhff6i+PAOa9lSY5yrlwFLAG+Q9+zP7l4KV6tv1zyOeC89soxi8Ew+
oobMwt4wTZIT7P6ssuAIN+2BUE+CA7wHndfQUePEX2tOlbdy2v3Zw+X9v4mIANml
T+swiLWlA11t4zf3ujOkm8rd6+j7v4QVDswIM+i1rfwkQYSYMbuS+iNAI4+pGnno
6keytik/lOyTcn/JXpemFW4MX4PKKfXynN1rM0pOYV2/Eq427oBo07msfkcRi/XQ
2PAhWhHP9FNMagoN39Jbi1e+5XWVgQ7KcZYfwvvB5TdLy3Hv13uDTHBbX2O7IuGl
uPVNXYx19bVy7aM9yMMBwXb+MLj/RDNFMm50Azo+GzCEOKeJShqJPOol/VKiW9Qh
grSxqgaArRMyrpTTY1FqcKAtXWLm+6sgLB6r6DK45QWgBupL/TJBKKfsj1W5lAhC
orYrKmny9LMYlkBF7sAaueaNEQd28jfqtnlnZb/jNnjlvR18nGA+G6aHGtH1Ongp
kjfoi6phjA7plhxpgBKHHToCZHfwXc7gG+9T73+MuCgOoaFVD4N1zlum5XYcg923
n9gS/RcGK1h9jAF3ZKkXzIKstY7al8g2Y9eAbFvT/OSipgP2eY+4YXCLdaQoMY/h
X+xVrzQWcLp4rnuL/hsDWp0d0OsthIntsw1vL8r05zgtXFMKhRD2824IZt8ohEXo
pL724UtsFIP0xXYCHqfgEbS21wC6H5kAOBGYS9E396uhGXI4oQJFDL+L3qNUP9jE
J2epRX1ZozIrWM0uKaN7UeOEW9cEUu05vZ7kv/RPId4f1GAZ4dboSP/3ri6SglVJ
fh1SLZ/v5qXtHFGDrANViQRasPq38d5S+NnTK7hWFdI3Ex15HlJNfuZ+bfqXNu6W
boL+8ADpqYLCWQtDS0SNg1yW3l7POKMZI6C4RyRKKKiuvzXAH98jAcewk2wH8TPd
MOVOwmEvmXMYzGuvqsTF+L8sY1xBB7Ol51hs2CwPo263nYAMEik+ISp2Dj+6FGL0
nq3+5L3pojSLuVtMcvVdq5L9BlF8IocVhVK0q35NRq6yy0u4/o2pA3B2q7iEdJWe
x6LDcB5UtG5GoDdWc0uUngqJVtuz0nBQJcBWzYJfDZxA1RZthFL4+OMouXgUs5gw
egnDOGlGQjA1olA74Hm10S1j8LNeH5xMYLkN5+xtOCjSExY9Kxitz6c1KSHD6R/J
5EcIh+5RZl3pd+xNfgiQOyLjqI0faLNCUcxNnNey5+GTz8Yz49Tg7t8mPE92I3fX
GuW9OuylE/y3LqdNs3tusgkJYPqoAK9UyR9aSozyqV3ONOMmF+6YdDcuyT+INtef
i3bBVe5eszEvrZOcKQr6s7UaUCgxsTqA1GFkUPRgP/IsCL3jv6pdImbCSEoMi4l7
GlN3oqihahPZLJh/dDweMrqbT3XtcZsLhU21AnN3WAAZEwx4mmDcZ8JCQO8sxC7D
iMHtXyimx/osnX4r/Y+eVE7x7ujv1pspDwzhUpAu8/BRQV+mhe44jVvCqLglkFLz
4mVsxi8bXxOxlLSSYHQDjcp5zuVKE2e0LslWEajxoPVHpnvdg8cd81Mx2gXLFQHk
AVoGZpeH3yjB8TvI6pxG0yzFcCzCXICRkAxeNXKJUhehxc3fhvSUGLAytoqNOKa1
1r6ccnyVFurJaxkzwoOJj6o0TafF8oGmioMM8eC7+M5pKVn9rLhhbCiAmr23BOfW
7L/bUCOj2uanyGhBMthJBkpE6Y8H+tPx+ck+QoSKCT7GEifIxC9xgYySYkr2hxGj
C/QznbxUuTg7XOfyVFYpfVikU/XeIJekxMEo0ombGNyEc506RIDP7xMF9n+VC+di
8pvqcPiJUqu83KtvpYrKC/6EyBlzGs8OlIQ3RuXJ9jG8fLoCqpwHHhiqb1A14mJT
/3dHF4mkfxyjgEj280nlz8msEC+50RY1oncdw3d9LPHrF50M6DVIc0fIkwCZNdVl
MAR0lhKVKHVDKiuyxPry8+1kb9VNBzkf0t1G4KcEixjDsZf5XZPjDJ8XZ5tQIbdd
Ecy52I5mO5UVQy9HN/BPH9RtgdmhSwjGg9MvXYICdWQL1W/ksoaNP2Ye3a9QCmPT
fqohCuY+XSG22ljRJOoBsfjmtsKPeP2tBhj/mgbQx8ddqHFTLxAge2fHlC2jaTP1
9eq4tJuK5a4yjdTUyKd71ur+qooze7l2zTTYQBvDSBIqs2wMu7k6Hrz6DJh+qoHx
lKRI0sW2so5mFaP9HGS3arHjGZUNJM0iGCHToWGKQbFA6iQ/4yBEH8XwjmZyZ4QT
YjKtz+2AG6yi3T8+VyzRUFj9JgOgYcv3uupbQ/lzzx5fi5bZZphRBjohMNKFQa1g
mVioRVbwAY+yE0m7hoxju+2ZmW4IuLQ1h6ALc6QAFEkimITALhjpL47qn3kGza07
7iJZX6YjhvVwaOE0iaat5bKNanErlT6IG8PM+3Q1Tmw3T6na7nnG7VW4kOnVb3eT
zFSdJ1ltlvSNEpy4lAW/E6iT6EKzBTiepEyyO2OHnAc5NaRYJsHfkn+JPoBN3Lcn
eXVTivXNR93Bxu4PITHq6JNDe9Fb1oTAnnCIG3mslJUFEzyMvePF+oUd2DSbZl65
/F/jNNvSEoeqofz+4wE29XrgAevJ/lkGcmOk2ac0pgIaMWj0K5nyR64NGfBiYLQ6
yJ+obDokOSCTSbDOkVrDtdlO/NWwEzrd9gZGLvPKZRaBou2QPe4NPbMmZSHz7oAM
3ed3j3BD+TsNleSec26ultgrmMV8iKzEXj3MUuXmjEr0cbkJFzZKpI7ei6R6wgKL
nBKZ8tm6nFeJrrGbc2wJP06kRJYej84S+VYTAvqiZLM4ugz7PKuVcXFmg2Y3HYsv
5dYzLa/g97ukdQzZykioiQt7JdiP1SKph0coMqSvgfxLKSlIpHHaxEuyMpSEDEN/
ameuanGR8wc7O6t0NPAienzmQeD/5yCPtpAD31RV2tnMt43msE5qy1uNNfh25HIb
Lzipna9gim6pnLyQd+eRA0tW+fS+CN1P3CMb9RqW7HLypSm2FWNPuinPxf7UGe1r
subfhmb+xR5iU7Dz+RGtqKyd0JbcAuSKEH1TX/CzJAiHcETUMuCw6uNjQMRc7zEH
rHPKjgo5zHTLqHuKihGCFCATxa31ZCmIGFgV9H0nWYzoJHnUTaeWjR9huMB3OBCj
DEZZfl5rv2N3sLUKfkcbBGwo9XyviwuZ1BSL/4ejSbVzuo5W7myYzOWXp3NcqJg/
JQzAB4MyHx3jbgnnjDjkKuqx7TAegDp4uEsrfu1Q4mfOg5u6CxZSyQ2PhyBgpIiv
z5Sb9ATa2/bMWNf/pu5ALDvlQGFuoAj1wT/MiHTpsBhcnHgnrdVfN9xfOFGK7OGA
Mj6TNaIwuKEzZIYu4rCZXBB/CT4GOhyPyxZ7BHC7jq2gNnXnjN0UBGjlfFlZ6hbw
BDy6ubyzDr/9OytUdn62rqSbRSX3fSYWClha+dzmwxQnr6Mv7BouQUiVDTFC4Y11
3+WycHDbNrzO61ZAa5tgfR5BUzMDHU5wcRVqbPsUigO/7FZYWcsx6Z+1tCkBjF1w
K2lNKQp+OIlv6O1v2vB/vMWSNaytvN/tCeWowKTBZrrDPIlxNrUee8jUzXHctOb7
cZDBX1DzzPKJYpvioH14RmAF0M+XEbylPAyGFLy5lDwz6TeNs/fago8Bw8jkVn5y
9CG6kbkF/EoPaS/5MQ0oRZQ6BSjxcdPeYpXktzOhKxn7iSnqO9oy3RuoDjGDvnZl
/SnxB/SEMz+6gNcnTr16jcF+HpjNCodtR2UvrOo15B4+qqgMLXyg7nJ+I7/kAdDv
8gJE0WLJhpmwlpZddkwMqSo9GwHQojIxUtg97qQiD+eDV6mEbbH+3vn/FVsJR1qu
/sgEFn6Cw02BrQZf2BbmygTxwFPPTWaBwonCDAuTj9kVL9pP0zdnFnFvvayM3Ns5
ofPKlgNS3qYk2lMmzHjdUOmHr04VZ9EEHn3a53r910V8g6gnz7Qn/yy3k3Xbp9SF
MX7q6Qy6MV3TdaeejAXwZ7QtP9EXAZU3WK74jBUnX2J6O+vBBpSz+oy2l0yRaeW3
c5XLWiVm7UXmfayzbewLvd4FBk+W9wxXEd4tNcq1eUfb1cAHwXmJKsbwGbEPUQCG
bXuDhu9DcmtHSzY4I/+ppPVuMLKWvr1FeCQ1jm02Y8F2XTcKSSuol2zWNJUznZgj
IPbhGCZyGxKg0GoCvXnfo5WVUlvqjGy/oSaGqHJShu1EpqEghG2bnrXyUm85oBfG
GkMAAQWrDtHZ9lFzmY+stjgCofREYSn718wPK/JX75x0akcR2YF++Or0cvUcCiO/
f/N5dJgSx8OVjcLoiM6sO3+ACGgUS5xsA2wg1jnTO8Ve7fjhHnpU8r0v/vwGI283
WzcDrNqWzUdbubSSyikuKWgXIMele3Kklp+KiITDvluUWyuPDcc4hxZA1cin/hDi
TA247NQBuXyUD9tYsS2ue55G39kOlBoTq4VAkff8xa9+plA1cwIH/kgwXBg1u1/+
p5rLrlUrZuHyrfV48AB5SgIzGKQNI71JsJURm1sWeBpnES/XZNaaGXrY1Asm/e/B
qtc7cb7aGghMegXHSATzYRN3Mo9eLCXd6lQJ22J0PNQpUDJJ0pUfJf1TWKCiUV3y
pROZN9/mw90V3GUsTpcdD/ZCbK4x3jX8uFl0d/FkxBiVIGYxXdEUhj1UJeyouUMK
TiSFh/OA1pR/YgG81GzazVHz/WGlrAompj1vy63M41mCa9UzQukYIU34HdNX6TST
rNGz4g2qd5ssNJmGOU8tanHzzH8WmZIsqDha0Wu0VHa8tODwewLhyVRirptijJqm
iMrE6EMOPyYSnpCygVjkPANN9hzUNEcJurL40A6qW6U44KM/v2Agh7/eF7Rz8zZ8
c4q7SyYgWFRd6YOTE+0WRg56ETLUUM+HCnrs0TkO4/44m6Wyp2naM+Sj+DHVJgpm
5Hc4a0X6ehyWRpM90sh0oOfCbLd+e02lxC19kFzKZgBVujnX0BotGqsF5W6WnmEN
nKKPomgEh/Cc4FwtBOlsHKHlef7T5I1XcMxd2oXf0a8wR3bqEeR5CyJZhx5iwktD
CMgp1HQA/G/c10AlDY2QTplQkd4paf8YKTGLGvN7QaJPBRQtOf+8Ur1FuXYpTOL1
YAaWQJSDzNHVRFivcxklTdoSVD4AJQiNsM6TdLfoXmky2Xo4+vHJtDyXx81co3ex
RH3VPwnoV0DcUQy9m9nHDdETtSgv/M+tyQYjsGfYI6k5riE2NskVLxlu35rPYuDy
6KmJtCb1TPCEQwv+LI10g/PMGJebunejQ8IIxu3zDuOHiBny/aA45XaYDFCBsLgb
JyDFufmbJiStUh5Zx43t7m6FfBSFjQBAQ2WCLw6gD4ZzAaA4H3QK2Sahz37/+JZY
O+h8bUXD9BCMFhbK5rR+TvuvTW8v33NQ67qoQSC5QlbtgjViImyh3RFwQTme5mmD
t/xbAqJd5crMQ8gtFNtadr26QwLLgBcAtHUww8udZ1/tIwXzQCreFqaiM7MGD5c1
srsOw4EoRg8pB7TSY+9t+rLRiZoxuLeN8E2lpkGgQKlO14p3gDy2BkWdJPIHt2vL
B3KOszM8Rg4JL9SM5E9Bdcv+Qz5YAps3J59N7DqMKLybOoM408+8CRU/3HM4pxiP
L6DGvyODS/ZZ0dRvGSEltB1VqJFlxMYZ2LPVo1HY/Tr1ejqIppunGMTfOpmT1DLj
cR8cOo/mcAoafdyvBnr6O0gPhfeE+c5TeptsmP22MhCajyMXt/mnHfJfihEjIVTz
mfjLE1mSFSJFX5cDkamMmLpjm8vUe8kvW5i7jYr5rJI5ycuHPtC3z0qKzeY0fLmK
2zA/bd6k9/ue7sWnkdfpEnfHR63vkMImvGPzcUIH8qTclvxi2dI0/QIGxNYLAapK
a24sUKq5h+bUC5uGrTySZpLYVZk1FAlAU8t+ELj8jL/vOcWGId75eNr4MVLL6OKv
8lrCBjWcEX/fXXyEf9eNcgeHRW8czAZ3b1BkKv4+OYREjYe5nSFLlkIQBmmGt2NQ
kTlAYW+t7UmN/4GLVQ13DFfGX3GCzT3hNvz9xMzGuMcBGn+Mtw8kE86ejTvOgyK8
7sJ6UGWxp8IqXu+LPjQsu/qZMpGRye4QXfOXoTgCoWHAMpwFDX6zuShyqbdQni9d
rBC4kBvNgDQpXgnJ5Mh4/A4zY4CNmvtYIDok4oiljT9Ungo/U/HTX8cc2zBCfY4d
EZLqdHVYt9GugG3LcBQDL030riq8vq8PDMNEt5nGqUgXU+9ijhiIwQR+15QtkIUi
yICIqiDT/1+XP73+cxtdjFiro97WN8K00Et+rtmhHxYyn3M8ME2pmb0mJnajKHs0
l30KfP8uWEJnbDoWWBWr0waJ1dJhehiA2SAKDZ2QoWzoTrFB1KO6mqqNjJZQ5DHF
NvtzFz/w/50ec/smCf1brJ0fI2der31HhQFqsRsWC1fHR8cvsmPEVZci73evc4uK
dSsfJM+hpOk+cP0atQNXthkQaYqktX06umsja+iQDszvBGC6HQh/FPOX0jRFt2hP
jkViBSjFalfvClf1sj79vZ5ULy0xkx9y+sCZC111NJVMbdAyVhTaNin2M5Y7x6cW
Nzl4owfPHZ1e2UKPcdBTnzgXjAhhErZRQWg9jNnev7I3WLr4Fnu2j9wZxXBOnj+U
AlstWiUCk9J5lQa0j8ZDSLDKDQdXTt0gokbDjwgh7U7WDeFZlrP8jYF1Pf171A9Q
0tUumqmzO6Zkg71ObgfosaQU2HRc/wtS67JDoq58suPHUE/HgrOAf6LzdEsdQL6r
vK7F6Erep6BGqgC+Jp9mo+tdp3OyxoM5Sjg2As2tQKdioeuQulFw3n+aoEl+T5JY
syBPm5yLwdXyOfiX8l68oDilrTnVo9d0uf1r24g8n6msp7V84jZrNCNWCOnW1BCI
ydxt2M1dcBJuOdjV3kkry8ZfsS8nXyULy9s35ZOiu4/MfxfwyLH1ffngkXOqDogK
CU807vq2x6150gM1t979m2/Jbghf+4HxUZt35FO9znB5qHrpuVUwasjw1kT0zw4U
lf0mUBFRxoezwqeCOuBpoQ8PwAh3k7JOQgT81iaQVTH7Z/wdxL3WCZ9mSxrblZJA
zukJtj+iJX+umdIGnNto7yjkvXlDb4lRZOLF66luCLCwXbfNsI72YLso7P8JUvkY
T6/e5OiTsVnJKkg+pbebDNL/3RbTtLOPGvXiXkzwATnJHjcnQOiw3rtKbgitiF9g
9SfNAAWaGyhoS5iKVRMytVYLtm33UxSJ+BISZ8LDer+SOX/EmbT1uF8ZwAFW9l5n
/IvBHrJ2tvMLnl8vdAoIRbHjSmoW4haI1dHjIyq3yTTUiSLd3OayDCLRsQk480Zg
L1Jjw5RIWc61T10LM7Og524nqYrlUP8vGwVKPPErg31dluhI56wwQBy99cG+l3uA
wd67r73lclGch32oFHryFcEObrIj3/Ts5DX47RBWKkuOie31lH1AFx9heYM95tlx
+NOCSOS1C0MKmPC8iCmfSWc5wmbDqBOavhGiNtpLmmPK8FDuoPcT7DotPy1QL3Qu
lWzf4p97rubExPik8IhxzYGqM+Y22bcCsL7PqMGvtgOK/zLqaBb1VG3pM1hXJgXu
ciaz7W3HOP0G181FZGNq/GzgO0IxPtGPty/DM3Jx32Wcg5EaxASsv9VfaenQWUjU
N1tHyT91zkyqRsall2Tb2055WNo9dVIGOtC6R2jp2eifl/bgDcM6pda3t8+QPsff
d/SK0JqHwthA3ztc9CMQrlvZrQrv4ZoFvgE2eZ1xhJN4oHz3i8Sm//2KVIY4b7Xk
jQBhQmbOp6z2WiUdyCqoqdjLxnNFEEia/B+8NE6Z08aQMrfMt7YmqJVFXOaAdjz5
Nvbetsd5fZoJDZB2uBPyu0TVk+6wLOb18YufCL1gIR2hz4qISIvo5XfHHVOJP67a
OE2S+GFlNsFf3tx7aboJA5/tMGzq/rDDysuDJWcadzYCR0bjZn83/xMirEtApq7e
68KJizooZABg15MclFLd9dr4mhx2HBpu3h8zUyW54DoDSYsZdMYJXcL9XupYy+Lm
OGfLf8M/CHSJ9YdvcVY+PRLcpeFr6psHHxORrLFp8PJzmQnNHO/hIoGtwCj74D4b
UGu5JGLUL8uuJWMUp+Cnr0TGYCqHHlZqVFE8cm+Yv/zXSjYndu1dfSD97k+Vf3Oy
Ste0cgknveKt9k26OpVoEVbKcHBp7eizgVMfxSTz/wjo2TBUY35Zli6ZtV0kxxnW
2sen4URLBqnVAp8JdrisRLJyCe6CbSp6P4P5ECNfQvKBjseO2es7ePbb5SeiXJp6
wVLZAHpANy64+2/z2dVDQBuhJX9ZQJp2d7OAtlltesF7LPTT+V+irNV7D9QQA3Ac
0+1ahL/RXS7NC/oIlZktsCQSV9KLau7o/asyZlWHxUKnbs551wutNqaQQ4HeeAzz
3H8uKIwFgAYP3VpqqCnXJSlkEV+Mw7YSAexz0yQhfPRlYFV1sS94UZN747Rco4sI
2aC6Vf/KKH4l3wb0xdcNre5x9RaTF9frfnlRD2a9cdgcBev4t9Yk5LT1lyGNMmeB
lsm0E3lWv7Wg7Qi3z0+gnul7Fe34wsZzsqd64pGi7L0SjXU5yTxVK6mSWnRjlH9F
PTbvfUhbiRmCX0SEkHhscxEbtHf3VQTlZuB86Fvq6mEVIoy9lfPkuoRYOuQFIryY
DWY4wqvA5mLOKkAkICafssa9bmk6f2+Fko7x0YFMkTb9wk7oEWCuksaOR58Bvnlk
6Y1EXBkvs0+klMcjOJxE6urgLSSx2K5xjHSRVFvXO3aFx4OOBxYQWMUlZ64kCcme
NKTinO/4gdlgMqpItaQKEQLMc+C83DmHTNMIj7Xi85L8l2k4lDgf7t8p2UnfPIMc
zXyrki0HGbZHjSTyrpN+Z2rWVNgR9gRbK3c6HQLc41TXREK4nGEevz1qM7Zp3Rsq
IQgymIINNgFaL1r3Ko7fmfw2Lqv+SVTWPq6CRRXFJXUGIxgmIq0GGjkffdrx1y7P
f1Jj4uRun0ROL897fPnQHC0IvB/Si98Kj7uqL+2W4bxQ2cC+7NcMBeUOFDMuSCgz
YMjea7KjKXILU6qoUSaaa5W2kCy+7VnnVUooBgJigPhl5R9SC+eiIYDjnHEFxDFF
2ENWzgh2Bi3rkhM6Gzh/4eMYBg/XwsZyDI9iFF+h1j0m3EcaBiAhpoDZcAPZODCX
A4eVH6hptW2QYmeE8X3OCu8yqXxkig27YpfJlkHF4IVP+rE21+MTfyDftaCRh4uU
AyQss1LJyTgDHTu18ngKXmA/rH9yk/WsTGnKCj14gg8f+/G9QrQ4rj4nz5I37cum
ivMxAqeLqk8FJ/D7q4MRB+WUgVLLODM3vfpVypQaOvekBTk0mjqeaSQ+iCGVX4zL
wgB6Y6oxMdeQYV3bJZkb3p3EPmB0FL1LJ4hqJSpv2i6izxZV9aVc392u0dUYrIvb
waSkvxJpd+Pk3P1Bba61vqB3ryxmYPMMUy6aPpXcYRdJe5H4nVMxs9bYRrZXJvzP
UF9NX8wBiHyUEI2rCjecLEnQmQjts3cj7bKRn5OObjPOwQVR56aqhxHzcDwRsz5k
W03rzeqc+fw9WTHB2s7aDOGIhWF62PmFSMOyV+xHYmFLrstTJc6b06FMTGhPJFRt
lsaxVQ0of6IZtCqx0JeQjlOA8IWScX+bA619XI6sextFaYwWlSj70DNlbqcpcvHQ
xhShF2wK2HvUWU4J7puaZC33YuqmbTajLU50OOP96hAsx9XdUAkf6b1ZPphD/pKZ
OuLGTlm2m39+i6ukQfTgCCSORy9qKwAq5SRvZpugwCV8koYOBO245kGZbtGlXcyL
KUtjQ/weuGpLa7uBISQIKFLg1u4lMa54sxXPUBhgeh1+kTlKqT09kopvt2e8rU3c
OTaM84KnohpvSHH3Kd9h+Nr7bNdr9XUtvjk2mwWolrZpm5r1r1u/bp4/HbZTGyiD
OmPYrmQ5ihvwyQca0CEyo+kRRyxmMV1tuglEt/FqHTrBtCu8ZG33T9YoToiYtwWg
SihYTg9t5BnN+EzhbxRrQ8npI1R9YaXDXRgIcrim+sfzClo088Q/AhMALOp5NBz0
PpQZISTJMgCcKsOH0yUwRgqoOw+H8MexNd4fFYFHxqSDU256ccCzhGZurhAeRquB
t7+/mJ1JW3Yuj2pA1cBief664bDv9iFrYn4GQu1dQcLtpuZr+h2wbMCLaplr4TqU
lIctAKi3ni6ue8CSxhF4MErGFrm3C72etuFywjGq6+92XuK8VNGALMb+yFsuZk6S
HrUo8UTpv5k0Bvrreu/FK3sP45L8s7zPNrUA3BHBrqBpU3aApauJ578e0/bvHr35
NqW1NR0nlks3Z3TF9CpOunrfH8g65r9Dd/A7rq0Uj/lA2uv4mcPWLFJkeqlVxpaO
iWiaAs/w6qCrKaiapfy8nS5lmseWMFQsERuN9wqw3/iDkyATxdQQ38sM7pAzC0v7
z1e1LVO76fTOTxAWk9NFT2Gmn+/4nM8eRjwY8ly7BxYgEUoXHx5win89HSY3JFRj
iPaSOGJZIQghAA3MzfXiK9EqVP5pvvnwGA6TIkgKPL+SYFqq9rRhDn44dy3QLNk8
Q6OiMZzwu+fpG6b1r4S2/4YmPZgww3190jOcC3tQ8u8ZF6zS7rW5UefI2ag5Yz/J
ECVpNdPgh1xN1wdxHoy+QjD0wUSQ06AtraVEL3K7KyYrrl0o0T0id7N+S6qqaqpO
qVDJmiyQm5Dl43hyRE4BfvaxBv9GI4zkXQGwgPdNDvYzzCuXynU4+9jNn6F4v4zt
1t3AJTo4ST8RS0blOavEDDT+wRgOaifTSTyEkCBDvBva9BRPNPr5/QDlmB8NJrNP
CVr16I4QWRDprK6wwwHLYPAq2RGa1tu2zm97IrYplYuVX2D3OqdQtrpdmav/lMaQ
ZtqCRi3/v/pX8oOPYa7Bf/wvvWJRe2GmhvOaCrS3KElgEm1AwORv3m0pk+SNkAzz
nMASWlfjsWRuU9HaEspDYABrbsVsuIn4G6Mh84NDpUlmW2eEYt4LDB4d4okav5JX
1KleQ89sRrc09/am4Vc97vO9cvqz5mh/Qlq6JvMYQygFKPh9fAT5+t2POvazihH+
oEfLcjw0p7cgGjdUIPK9dfJFsUP9e3G4gXTNgQznjaj7z8UouSH2d1n6kpVMxHk5
ehSx0LL3LlJUCunEw3TOOBCxaHgYUh8ByrTnIuMejg5vuK8BmCe4WW5qZ77QvPcA
rRAd4mJvMQo1Pba+zHRr93XZEgFKj7/ccDwCHLJ1oWQnrNTvGe1S8mAiQu98n9MY
SIgDOPRo+T65wCLhf6QFLRoVSHbXfiSTuRCNl9BRN50bGUjGoqAo0v+oKhsu9YUb
qD9Uo7v+LBWzfoEME/O2jMSSWjoU+u16So7XaaEbPMIq1PyAtlWu7TKJ6ogkLMMx
WacRVBKRJfjLofroI1INUxhsunJ5mHWd47Zm3pJiqxb5EkH9irzeZa7SNa08Pc1h
O7JPcHus2krEyA2VlLFsYo28tHeDqXFzQOJBAHNvZxxwnj+7Mqf4569y4R3UCuNI
gmg1pn1ttS1+k/HZmSar8tR3jDldt4U8IVbz/s4Rr0MlMlWfEPGgyCpOGYOwxPSv
a+IEx3aPma9xTwU3DVAHe9pcUETQQyypo78Uts93jkAX+7nWNoKZzhhGYEPmVYqN
6dO89Ol9oq8uRAh0Ewq30O50L/ezQGepIf/2QQXGm20ixlwB6PXEWhKrpD8bnutM
iT8zMpTeXbITWgMoFaWivbwT8WX1j3b3WWDcNXXGIhUgwXcLDxFh9wwpN7HatqkM
mP0Yuow1hRWLd2o0cqDYPjlQzI9cvbuOniJOXG/EnKxjqwqWkDuRJU/rOkwDjoJn
WK5nXludwqPKDbAAkH/YzUgkABp+MDRow73odgTWdYTKLALe52Q3CdSp3myEBwLb
XorIV4Uq3AD55fSDB5Dg3Lq/8PzrFWu0fMoEhVcXn+37wyJpXDvVt9Mg3F6UcfgF
NAu6xHSfcF/UTTw4BwWJMxvBD1n5Ve5v7qG/D4iTSpVbcRKjM1PF6YOtL9BYB29h
6l1dcvPFP+/mVy3UlqPShl5zrj8BSLySDT2iw7UIqDSykcLG2F2loc9akBjUxtPa
EMUxIuUMn8xaleDiWdP///UwUf6dwr22B5Md+/B3vHxPaRtjqBNQF8EFxowHdWb6
DYMi/l4Oc9bTEra5uHItFYvjNhYCmUTr9GdvojtdBe4+hNlUjnMirbGCRjhcPZ0h
xiiLW0n2s4nY39jN14ehNB9xFhfekEs3yGQNO0mb6IPF1IC4WKQHZJoU+Gsh1FrH
KXq+RIoELheBn80TEgJemnPaJCECLESCkNl/mFxjGF182V6o3TwtAGyrq68T1QQn
j72xCU3VymRQ5mhKggyXbHmbm7M6eU3CNq0a3eMdGnGNeNGC7xQljx7G8eRYPJAO
NTYMQuE6PMFV1QDUd1ryQw52/O4I83ZNQLNoiPiTVgoLqYs15mtjhAycZhLFxyUR
NJVb6OfuWhb292AW+47Aq45BK+/ZcxE6FyYAnn6AfnaP1qq8v4yMIspQK07msg11
Xte6J0oi0hYWviXScZGinDYoDBEA8EyzFDg18Q3zeKZDcY12/tjU5Msd4xHnkt2o
8rToaNWjGOdyga2hsajlWDNsC8VZukMO26g4sKFbMHDO9ghTBKT3xiobhVKChYNa
weeAQX0zsAN20EVvCJvkIaW5qs8nQUWUYOvgZMfOAQmQ/WHrXKw8p8jS9QnVWawi
JbnWacftf6eI1SHfvehDGQ7yn5fYfGtw69vY2GxedbjzU/WPRA0te8Dr5ZekYXTy
IZ1Pf6LMKN0fH4FGbM53WrQd8rp47hosSjHJSUllMRnSQy1JWGXZSHECSgwPgtDH
trS+/xKUGztxkmiqZ1wXj3Nv0gQvFYUGbzYKY1BLrcUqNdCYOfa0MYWOjp+0aMyC
i5U5fOh7gv3bOji3H73fJYavt3FQbDEKT4aW9xNUwh0nICOIUIG1hQPYvJ5eVGug
LVw9eQ4aUHl7pF46G0pIvLD1P5CS6AHRzsFdNDeCaCm31NAE/KQQbKIu2RCGBDVl
7T4XUEy9YrTCqwAdAYZsshfcEwC3iRliV4SKhf6zfxqSMSbZ37rWZyw81S1IXSCJ
O3mvYx7IXx3dydQpT4/i0Mu2myFeqs2MKGhsdceiq9ilB2V2AXzffA4Vm1CfYJoK
/4SGQ74eojcBu9wBNsGXtWo4IvWyEH/aYAzs5yJkaCPOYzQTG3wcFxKgN7Irod5n
LCJOqEuFY7QEWao/1+BWv8cW50CD+0IlvG9SsW1If51+T386tVbgHTL8asBZe4TB
MdpkgYtpQeqOsHpvvwf4vxZT6n9hYkeZ6qggXpMM/HvJEo1ufPTBJDO+7Ou48DnS
6X8GSeFyye8a75NPL09TOC3PYiJCtQDkHcJ9zvgJwYZA89A1cITkTTszBuhz8how
y0V7DR8zzgg9yeVaPLWACI4bLL7MsZdaem8D1q5UXUtUZnLbQeVXoOTOyIvE4NZQ
42snxDgb5jkErjDjnZ9+nT2V4RVAazhTtp1EY13L58yFk82BajFFULIyDG3d6c6d
9JONBy92P/YS0iuefZ3GHhx+H2KHfJwUj88YjNsX/7Da2ctEAGRXyOnRdBa2uusa
zba2DxK9SjSmoCgjsY82VsDxCoAWhZZsKp9RzO3HV1XlhBppa0TzceiE9OSCnehq
IYEnMT5s1KzX4ETVKTPjkszMOnWdJC1KLltTteNJf+DBcq408HSrSk/qulzH0bK7
6j2R2tiVOgZSmCDrIt6Qbj5z8NU6xvpoDTTnUZka+10orpClIpX2+U+33mJwYIDV
DzuCwUu1/NDB8Jznd0k0OO3lMLmEa91QArRYDlVmHV2zrhymTE86vppVhq4RlbYg
DHhOSc8im4I4VDt5oe74HPwSaarXkADylbLfjWANTAjYOJaMiGwi5wujf9B3uT3A
dadRjzoOuFM7VkoA6ZXo50YPuyMx5J/+GX5oqnhp/mJtNNwbPn28zN+DBydQzdTU
YKtjh/XifuoCd1kIAwWlOMHBOmHv430VnlyjXlUS01jPmXbKWSHX3faDEC2lO5q2
lYV/50yMVDVey4d8rFPYQderjKY07vznkovEhVVjfyK9eCPgwqb8Ppj5LhlVxSYP
F88+N5oqOeycfhJ7AW61kWMfvhpDduo2A3qRnVEOfx7mUUhVPGCLxaJngYW85Gan
ekOZVzTOKWmB0HjoYLqdmp77zbHhJYZWHCFeXL2Iv5RBDJ9w3CqvR3up9xVBaKXQ
v/Ht7Qq5qXdFdnsvNwj+YUs0kF5hKcUx/uhhRCQ2M6Mh7O1OYng5VnE7JI/rsDIG
AbEuU9MsIP4rgCdhD6NiRwvpnMlKMI0qLJY6a97RwOLzPoG+slu3vHDv5ym3Ub5j
peBm0KXRRceuSBSY7SrYsnLomw4SNuk1fmRD+uaycuHzW1Alzg7cU3X8DzvzULGY
LQRztTbH0NzNMSZMqcC44uHz1/n9htK71c/1uxL2Uyb/f6QnAKoJO7d9VmDFl9VK
5+iv7vV16EUrrWwQGpBI70ayJTmh7Jk9PYmGeq5aFIVo98Eh7gPNIWzaU0/dvw6Z
8ZyqmqZQsqxkIr2b9PEfkZZpwNFsr43ABx7vJgcuZXv0AXFhVHDAM4bQDhWbkwCB
PdKLBv0plnooVSKWA9LSoQ==
//pragma protect end_data_block
//pragma protect digest_block
Kq7dcGz7Z9ByXzqeSYvd1ZPBuIE=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TIMER_SV
