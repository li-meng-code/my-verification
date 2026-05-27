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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FVi0HBvBb2oizw/POWdASkB6hqvHfn32mStzYlowzyrwje5rWHy+HX2Rk4Be4iV5
wGMfLIa83RxnTVUzNnKmmYM1So41cnOvPZAovcRCsW6EeBL66AawH62nIiyBvRbA
xkkdNxuefbEJnNH0NDdZAWVOpnyBk7Hp0UqQ7oxltJ0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 957       )
ta3dNfsP7PAAhfxbAL/1+/H4ZvUkqdGAg/pujemEvvqANMEYEeIp+mtdg4GqQg0I
2ZcMc5z6dSSje0pSYsaH0Zk/Ov77Yt/F7hT5gtMgUzChWfXTmp1/7Xy6+WBQdoWu
ivslNXp80ErMWRBGZndmVv9wVOy8VSfw3Tcstb3w96uwR0Wnr78MTdmwr3VQHaoN
grlaIawW7UfsZkZlBStIUbbfzy25nvk1dzg4PP69V6VAOJ34NDyMsGfTWM+MjYAn
SjwxX+USo7nVRK5ve7Ncb2gHNDsv7tbnC8Eq7JogPFE6dfv3FoyfYjgV71tPxxN7
c9UyxCgXx0KG0TK2ax3SK3tNVO5Y5FoOxN6MDvv0m09SGJdeHw2nJw/BCdvbqJkB
v0VOyamjSHGi0MlbC0kHhNVVU3vlutB0PrrqiBHSvDvwayEtzQdLGNPZ4eR9wBS/
P/jC5VvdvfmWSU4uMxls2wkqtMKGea5sIlPmiJqfMVSBQP/m/iVOOqE0+PdZYCFe
ek0d750HmtpT7vlIRJRMB2bsslhKaoMn+++TGxEJv374rFP0Jq5G5vKxbAPhC1xN
waqSBU7l5+UcI/6+ao8uKOJf6RfLKj4DjuISf07nQuSfi2RQob4phY0duec7vCe8
7zuK0Twkx+oGNW3UA9NhzwCGa9/j6J/cTKxbCeyztOcxAvRao6ZwQdA0BbJeWNoR
mKiPtSNEKNjpMCKIQg/B2ri+hhEaPmErhqqTRkWFzV2KQgY99ozUZ/M90BUQ7z9z
UZaMq6OXlse2Gw6tWjbAa+MpLPDchndmEQrnuFJv6iXrtGuPXRVV2pbZYXBg5LpL
ILgF55udhxsVMbwtXkZGz0VMWF3W4ACVnyxmya4jOI4nShcKrDTpdpxisJEicbVE
ewP57KPpaX9XprcMU136Cj4+yEwxa3KjmVKiR7REhxmNuBZ/9H/QRuDnnaTDGLLJ
xJoC5GZbvWGEpXAGThJGZHzRI5d59hyKJbYrXm22vnj+SDDscpIKsRHSLvbI+Zqg
IL6XYnOt3Qh8xKnlqyz901QP7YdS5ac9ayps6CWl76BApBfDTZxAsn565rVVcJ3A
qU4JiE/FhDL3NxYDxLNLBFHnOooQbnPxG0Lh/ihtQyQ1rzUzLmuNUXdSL7Xm0Nvp
tGqIZXiHdssh5+LRHhviejOpDivKL7QKxgnIse+2SHyxcL3e9treP29orG8XlEcn
//mfA6uG/wfJvbwWc3XQEPFwitvAG+Oj306UAsrf+BIdg8RlWoB9xLAukKoGorOb
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NJ6iNdfm1Num3MF+Zu3pZMAk5+UM9jASJODYt9MP+h2ZerV/Ftnogh/JtYJEXpfi
vTwsvAUWF1NkWcs+gm0AjMoSdq5Bjlr2FRGhT2EEKLmS3JgS2GBlAVl4b41GHMFk
sA6gHPONhN4dW/uBXCUBg8mm3sHNwAbaBkrDp5pnfqg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 9641      )
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
`pragma protect end_protected

`endif // GUARD_SVT_LOG_FORMAT_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cYqSy/6iHRtVeQCz7MK5lGgwHtAKk0Kww3Iq8nAn0I3koNAWazgLnCPjWxTngwp7
bBES4R5+Rqrha+cau/hhlbJcASb6MZejZwa1FMP1Za5XsfQxMEx9jeQvRNIpWvT7
A02keukzR1f6t9d1QXCBSfprxFznO5LRJXWIPJOlmyc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 9724      )
v2Nq9q7zvT40PmgxwRd59XaQ++MFZBnaAFIQ+7WoFKsT+h9yJgVgpn/AkFANTyHq
NzxYipVhKwSp5ARMeDacHfOcbaUm+iRai7IdgEu5VVuJ7b+zbPyxt5gy2mM2HpJn
`pragma protect end_protected
