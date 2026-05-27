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

`ifndef GUARD_SVT_LOG_FORMAT_SV
`define GUARD_SVT_LOG_FORMAT_SV

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
jAZluJeFKEdXOkdqdPDQpWvwxO/h1sDTyEOiOksE0boevNHmwnmpvpVHg7cu4qOS
qV0Yl+YKPzBYNgNNADVABA8aYZzHVrrczfYq8VnhB0UNDFqB6vPbVklMlCnkMNND
x6tMZF9/c40+R6AXsV5awTVElmtbcA9PqN6mI3EqDrD8bEiXJE7nlQ==
//pragma protect end_key_block
//pragma protect digest_block
L15d/lBPgK5bzvs5QA4KHMOj5Ic=
//pragma protect end_digest_block
//pragma protect data_block
MLZ/WuAsU+34lDBX9tL6W2Pdmpr8K2cneEH/UdWFmk6FXnH8ffLqct6UU4QQ8cmy
AOaSsunLA/hkrZQIEl6E5zAqcAtxkl+7BjYj0PZEZcpyyw6zqFBtsGwf+9UPKAH2
N31A4nyQVRl2usq2aP9z6CkSpG/bVODzsgP9iPJeMVF6UXpUfVmUkfLX80q2DD52
bnM7a3Jeb8v+2do7/g1hSb6hBM/QzHvG4hHq9y7thSI08GUPOWAInLuizoq1xXYb
oX3lEKVcEuWkDxvPosbj746FlbFv9XFXQ6pp/Xiy3f1KnRbWltJr4re3L0EmNq/e
z9Ong8W+LUNOgyXB/aueaSsWZjQG0JGlFpQbpZz3PT6Mv+SCOzb9ZSvgCUWlfkd1
zb/82aA/UMMA1/w+DkN/itl1G3Ia1q+Tps/S2du/eftpM1kX5dXQtGGQrwQ7rnEI
ozYVHiKXwSfRolOymF2cyjrp/Sn9t3dUy2ZnFa1SpMF4gP7PnFbVLakuePP87bE2
Sj6+pKzk2N5e73WxHtvqCIZgOPJtqqCP3wvojT8KYHKl5Pv7HtAml3eHCETKKLQC
UJH5uTKd4sNkHTRaKKvSJtQSwru/URSWjcCJvFOVh0LfK2A6n25SEk5nsam0fCVu
m2iY4Q7MMPhb7m/p0tZzTgpSXBRDMofokEVB/cy9w3sOsWWASKXu8Xj4uuJ/Bu29
LQk53BF+CFPV+I2j/bTTbJd68wh+sBYGYgbzn1ac8xUSq5eRkP8S+mZsMGSCwYy8
4l9uYrgTyAQoP6/tJVHcJS4nqDlU0Vu4zqW6vU4UlJozIZtjMdQWMhV2H5SwB/eX
YtN8QS/0PDNG+hKsAAYqiWMPm8bB3gZ7/Bv1hSprpJ3B13I7HxpwRpNOWjPV68cl
/AJvfK9Piupkb+XW5P1R+zWNzP10cIP/0Xmt0ojRz2Kb65/M6aY2PhmoWwBPZMWg
X68C+UhKnwVrrtVynq94GsNBXMutYTrkkXCHW8rFtlWQdoe7f/skzbDJ/b+yS4OX
Ow1bMmRd7dQTwQdaY37yzav2jhahOPtNPpS/E2eSpHydXGKozRzkvrsDbOR2XUn0
avXXEvz7fPmk2H856Q1lqbyjoo5VHGKwMHPWGnRBhzgh1/gBi4Qzfzsenftl7Kp7
xlD8go3sbdfJUKgqPKYYs3gtqG52JUsJlIuVcKnheo+tIF0pan31HV3MQMGt2+WB
7HcSsZacnjIRjQ567c1Uq0K+MuwN+pGl6s8B6T8VrIEl5hVN3hzaNeopLCv2gslX
uSNHgNpUV71aXibro1MdQM6NOSkcKNwDteYK96lCjzY9CW0qlY7pZ2kdzMYwpx88
+sNQZ1rZK2poVVB4XbXkxY8WKfm+ILqwaFaLg8pCSI/iy9PX54v9USTWC75GR08S
KMFhO5G5dwY7E4JUhhYXf7Ei+yqukBM/Xt0M/v7oCC78nw86VUFfW5z7qtnO36SR
Jhu7PPjmf+iG6xO2CKMUDv4G4C24qMMc1+MvCd6svns=
//pragma protect end_data_block
//pragma protect digest_block
8UxG4EtmsoFeCyyq6OpLN5S5EKM=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
// DECLARATIONS & IMPLEMENTATIONS: svt_log_format class
/**
 * This class extension is used by the verification environment to modify the
 * VMM log message format and to add expected error and warning capability to
 * the Pass or Fail calculation.
 * 
 * The message format difference relative to the default vmm_log format is that
 * the first element of each message is the timestamp, which is prefixed by the
 * '@' character. In addition, this modified format supports the ability for the
 * user to choose between the (default) two-line message format, and a
 * single-line message format (which of course results in longer lines. If
 * +single_line_msgs=1 is used on the command line, the custom single-line
 * message format will be used.
 * 
 * There are four accessor methods added to this class to set and get the number
 * of expected errors and warnings. These values, expected_err_cnt and
 * expected_warn_cnt, are used by expected_pass_or_fail() and pass_or_fail()
 * in calculating the Pass or Fail results.
 *
 * The class provides the ability to initialize the expected_err_cnt
 * and expected_warn_cnt values from the command line, via plusargs.
 *
 * If +expected_err_cnt=n is specified on the command line for some integer
 * n, then the expected_err_cnt value is initialized to n. If +expected_warn_cnt=n
 * is specified on the command line for some integer n, then the expected_warn_cnt
 * value is initialized to n.
 *
 * The class also provides an automated mechanism for watching the vmm_log error
 * count and initiating simulator exit if a client specified unexpected_err_cnt_max
 * is exceeded. Note that if used this feature supercedes the vmm
 * stop_after_n_errors feature.
 *
 * The class provides the ability to initialize the unexpected_err_cnt_max
 * value from the command line via plusargs. If +unexpected_err_cnt_max=n is
 * specified on the command line for some integer n, then the
 * +unexpected_err_cnt_max=n value is initialized to n.
 */
class svt_log_format extends vmm_log_format;

  /** Maximum number of 'allowed' fatals for test to still report "Passed". */
  protected int expected_fatal_cnt = 0;

  /** Maximum number of 'allowed' errors for test to still report "Passed". */
  protected int expected_err_cnt = 0;

  /** Maximum number of 'allowed' warnings for test to still report "Passed". */
  protected int expected_warn_cnt = 0;

  /** Maximum number of 'unexpected' errors to be allowed before exit. */
  protected int unexpected_err_cnt_max = 10;

  /** vmm_log that is used by the check_err_cnt_exceeded() method to recognize an error failure. */
  protected vmm_log log = null;

  /**
   * Event to indicate that the expected_err_count has been exceeded and
   * that the simulation should exit. Only supported if watch_expected_err_cnt
   * enabled in the constructor.
   */
  event expected_err_cnt_exceeded;

  // --------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_log_format class.
   *
   */
  extern function new();

  // --------------------------------------------------------------------------
  /**
   * Enables watch of error counts by the svt_log_format instance. Once enabled,
   * class will produce expected_err_cnt_exceeded event if number of errors
   * exceeds (expected_err_cnt + unexpected_err_cnt_max).
   *
   * When this feature is enabled it also bumps up the VMM stop_after_n_errs
   * value to avoid conflicts between the VMM automated exit and this automated
   * exit.
   *
   * @param log vmm_log used by the svt_log_format class to watch the error
   * counts.
   * @param unexpected_err_cnt_max Number of "unexpected" errors that should result
   * in the triggering of the expected_err_cnt_exceeded event. If set to -1 this
   * defers to the current unexpected_err_cnt_max setting, 
   */
  extern virtual function void enable_err_cnt_watch(vmm_log log, int unexpected_err_cnt_max = -1);

  // --------------------------------------------------------------------------
  /**
   * This virtual method is overloaded in this class extension to apply
   * a different format (versus the default format used by vmm_log)
   * to the first line of an output message.
   */
  extern virtual function string format_msg(string name,
                                            string inst,
                                            string msg_typ,
                                            string severity,
`ifdef VMM_LOG_FORMAT_FILE_LINE
                                            string fname,
                                            int    line,
`endif
                                            ref string lines[$]);

  // --------------------------------------------------------------------------
  /**
   * This virtual method is overloaded in this class extension to apply
   * a different format (versus the default format used by vmm_log)
   * to continuation lines of an output message.
   */
  extern virtual function string continue_msg(string name,
                                              string inst,
                                              string msg_typ,
                                              string severity,
`ifdef VMM_LOG_FORMAT_FILE_LINE
                                              string fname,
                                              int    line,
`endif
                                              ref string lines[$]) ;

  // ---------------------------------------------------------------------------
  /**
   * Method used to check whether this message will cause the number of errors
   * to exceed (expected_err_cnt + unexpected_err_cnt_max) has been exceeded.
   * If log != null and this sum has been exceeded the expected_err_cnt_exceeded
   * event is triggered. A client env, subenv, etc., can catch the event to
   * implement an orderly simulation exit.
   */
  extern virtual function void check_err_cnt_exceeded(string severity);

  // ---------------------------------------------------------------------------
  /**
   * This utility method is provided to make it easy to find out out the
   * current pass/fail situation relative to the 'expected' errors and
   * warnings.
   * @return Indicates pass (1) or fail (0) status of the call.
   */
  extern virtual function bit expected_pass_or_fail(int fatals, int errors, int warnings);

  // ---------------------------------------------------------------------------
  /**
   * This virtual method is extended to add the 'expected' error and warning
   * counts into account in Pass or Fail calculations.
   */
  extern virtual function string pass_or_fail(bit    pass,
                                      string name,
                                      string inst,
                                      int    fatals,
                                      int    errors,
                                      int    warnings,
                                      int    dem_errs,
                                      int    dem_warns);

  // ---------------------------------------------------------------------------
  /** Increments the expected error count by the number passed in. */
  extern function void incr_expected_fatal_cnt(int num = 1);

  // ---------------------------------------------------------------------------
  /** Increments the expected error count by the number passed in. */
  extern function void incr_expected_err_cnt(int num = 1);

  // ---------------------------------------------------------------------------
  /** Increments the expected warning count by the number passed in. */
  extern function void incr_expected_warn_cnt(int num = 1);

  // ---------------------------------------------------------------------------
  /** Sets the unexpected error count maximum to new_max. */
  extern function void set_unexpected_err_cnt_max(int new_max);

  // ---------------------------------------------------------------------------
  /** Returns the current expected fatal count (can only be 0 or 1). */
  extern function int get_expected_fatal_cnt();

  // ---------------------------------------------------------------------------
  /** Returns the current expected error count. */
  extern function int get_expected_err_cnt();

  // ---------------------------------------------------------------------------
  /** Returns the current expected warning count. */
  extern function int get_expected_warn_cnt();

  // ---------------------------------------------------------------------------
  /** Returns the current unexpected error count maximum. */
  extern function int get_unexpected_err_cnt_max();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
09ofC/JxIP07lil5fZ8NDIgzghFWG1FL4/rym0W1LPagWYTlahThJzcQPz/SeNhM
rngK93fgd03TiJ2MxY/b4K2rCeFyGpFfk7f3qdglSajiT/FY4jERn8qqO772Uurp
Tsr5wVAAOIxYAN4tpEOovIVxitgWynBSCfPvfNIGmjdA9/xbPSn5Wg==
//pragma protect end_key_block
//pragma protect digest_block
vN8AS0l7VDaEJeF7zHXD7JSOAJw=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
/p9KwMFCZUXl/1zYc44iB/y+Zaw=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_LOG_FORMAT_SV
