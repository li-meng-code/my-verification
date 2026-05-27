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

`ifndef GUARD_SVT_ERR_CHECK_SV
`define GUARD_SVT_ERR_CHECK_SV

`ifndef SVT_VMM_TECHNOLOGY
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YBMozmJshnOn7bg+Z+agWwfuDfwOGq5CuNCIGkFR/huYsc3eZExB0lydO65tnu9G
hjcMtfCTHPbIc8fADjDlthAdgaasJhBVWky0Cvt1v/pMYNi+WEfXKTrJ+KV9rsTb
4tESB5sa3e3fVRz7PMB5hBTci6JBimtxzr/ZDQvlfEc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 168       )
xdkrX6EFYHms9XMi3kEc8vuQqWb9KItzDxaOaRUVz6MYflVa0SdcELNpeyEMveiY
pMIpYAoUlTcbLqlYioi6hZiRbpvUvWLB0sqhiPHL3kbc/r/0dFfhgxtlr2mVWH4t
w1EVuGVjUmtswljgXKgJ4M3fkAw4LxpS4Pni8vSq8BcZjsRYgaF1jPSYEkRDk5nW
BiVsddI2itUPkZbkrKPxZE3pQ3/j0/evD0HOKEIwiRg=
`pragma protect end_protected
typedef class svt_non_abstract_report_object;
`endif

/** Macro that can be used to execute a check, but allows for the deferral of the formatting of 'failmsg' */
`ifdef __SVDOC__
// SVDOC seems to have an issue with the using a non-numeric optional argument. The enum and the corresponding constant
// (i.e., SVT_ERROR_FAIL_EFFECT) both result in a failure. So just use value associated with SVT_ERROR_FAIL_EFFECT.
`define SVT_ERR_CHECK_EXECUTE(errchk,chkstats,testpass,failmsg,faileffect=5) \
  if (testpass) errchk.pass(chkstats); \
  else errchk.fail(chkstats,failmsg,faileffect);
`else
`define SVT_ERR_CHECK_EXECUTE(errchk,chkstats,testpass,failmsg,faileffect=svt_err_check_stats::ERROR) \
  if (testpass) errchk.pass(chkstats); \
  else errchk.fail(chkstats,failmsg,faileffect);
`endif

`define SVT_ERR_CHECK_EXECUTE_STATS(errchk,chkstats,testpass,failmsg="") \
  `SVT_ERR_CHECK_EXECUTE(errchk,chkstats,testpass,failmsg,svt_err_check_stats::DEFAULT)

// =============================================================================
/**
 * Error Check Class - Tracks error checks performed
 * by a transactor. An object of this class is instantiated in the <b>svt_xactor</b>
 * class (the <b>m_o_err_chk</b> member of that class). Error checks performed by the
 * transactor are registered to this class, and statistic collection objects for them
 * are stored in the <b>checks[$]</b> queue of this class.
 */
class svt_err_check extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * Indicates whether this svt_err_check instance is dynamic, and should therefore
   * be destroyed and reconstructed when the associated transactor is restarted.
   */
  bit dynamic_checks = 0;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** Queue that stores statistics for registered checks.  */
  protected svt_err_check_stats checks[$];

  /**
   * Queue that stores the registered error checking instances, used to
   * build a hierarchy of svt_err_check instances.
   */
  protected svt_err_check registered_err_check[$];

  /** A string that identifies this class. */
  protected string err_check_name;
  
`ifndef SVT_VMM_TECHNOLOGY
  /**
   * SVT message macros route messages through this reference. This overrides the shared
   * svt_sequence_item_base reporter.
   */
  protected `SVT_XVM(report_object) reporter;

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oQ+gKXZ4gh4V3c1P1W1Mk+DwR0OWUzadHVcCDBMsxY2Pj7MPGu27rlMbBRXfEGc/
FFAK6UUIfBQF/fk31yNm9wBlh2ijoSHkSy2qPTKrL8+Z071p/+ISTKGZ0FMkNHeF
Gg+uAXggNRRijzT89Am8etz2Er8pSOGAgGIvPCXFfGg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 404       )
nf3ye2sMxBppJxlhoLXf8eeNjYaf9ZwwR48l+HwUQ9Ef80LbDlC82NAA7W/A3Lby
dvqvTrqyM2fGkN8BzBHPay2me3V6OSImLwa323VrgGM4yZ2QghHK6L7O+WCxf12r
A/VTUyi62zabjoNK2rHES1yQ6tLppXtIu3ErcEONkckLEDcDZDHKaxXnjmpcpLFi
4Veeop6Arj5FF5DJ0tyIjxgRUXvmQrhOCye6HuW6Oh0ZunikSD6Q1ipZnneoIhWa
P6AosthE9YHzCGNJXp3zG4QlHWUtWheyC4Kh/v0fiJ9KacUWGwOyfszVZQPvOw/G
`pragma protect end_protected
`endif

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  /** Automatic filter activation count to be applied to all checks. */
  local int filter_all_after_count = 0;
  
  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_err_check)
  /**
   * CONSTRUCTOR: Create a new svt_err_check instance.
   *
   * @param suite_name Passed in to identify the model suite for licensing.
   *
   * @param err_check_name A string that identifies this particular
   *                       svt_err_check instance.
   * 
   * @param log Optional log object for routing messages.
   */
  extern function new(string suite_name = "", string err_check_name = "", vmm_log log = null);
`else
  /**
   * CONSTRUCTOR: Create a new svt_err_check instance.
   *
   * @param suite_name Passed in to identify the model suite for licensing.
   *
   * @param err_check_name A string that identifies this particular
   *                       svt_err_check instance.
   * 
   * @param reporter Optional reporter object for routing messages.
   */
  extern function new(string suite_name = "", string err_check_name = "", `SVT_XVM(report_object) reporter = null);
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_err_check)
  `svt_data_member_end(svt_err_check)

  // ---------------------------------------------------------------------------
  /**
   * Creates a new <i>registered</i> check.
   * After this method is called, the unique check description is stored for future reference.
   * Calling this method multiple times with the same <b>description</b> argument has no
   * further effect (i.e. the existing registration stays intact, and a new one is not created).
   *
   * @param description Describes (briefly) a unique check performed by a transactor.
   * @param reference (Optional) Text to reference protocol spec requirement associated with the check.
   * @param default_fail_effect (Optional: Default = ERROR) Sets the default handling of a failed check.
   * @param filter_after_count (Optional) Sets the number of fails before automatic filtering is applied.
   * @return A handle to the check constructed to implement the check indicated by the description.
   */
  extern virtual function svt_err_check_stats register(string description,
                            input string reference = "",
                            svt_err_check_stats::fail_effect_enum default_fail_effect = svt_err_check_stats::ERROR,
                            int filter_after_count = 0 );

  // ---------------------------------------------------------------------------
  /**
   * Registers an svt_err_check_stats instance with this class.
   *
   * @param new_err_check_stats The svt_err_check_stats to register.
   */
  extern virtual function void register_err_check_stats(svt_err_check_stats new_err_check_stats);

  // ---------------------------------------------------------------------------
  /**
   * DEPRECATED -- USE 'register_err_check_stats'
   */
  extern virtual function void register_check( svt_err_check_stats check_stats );

  // ---------------------------------------------------------------------------
  /**
   * Unregisters an svt_err_check_stats instance previously registered with this class.
   *
   * @param err_check_stats The svt_err_check_stats to unregister.
   * @param silent Indicates whether an error should be generated if the check cannot be found.
   */
  extern virtual function void unregister_err_check_stats(svt_err_check_stats err_check_stats, bit silent = 1 );

  // ---------------------------------------------------------------------------
  /**
   * DEPRECATED -- USE 'unregister_err_check_stats'
   */
  extern virtual function void unregister_check( svt_err_check_stats check_stats, bit silent = 1 );

  // ---------------------------------------------------------------------------
  /**
   * Registers an svt_err_check instance with this class.
   *
   * @param new_err_check The svt_err_check to register.
   */
  extern function void register_err_check( svt_err_check new_err_check );

  // ---------------------------------------------------------------------------
  /**
   * Clears out the dynamic svt_err_check instances registered with this class.
   */
  extern function void clear_dynamic_err_checks();

  // ---------------------------------------------------------------------------
  /**
   * This method is called to enable a check. This allows the svt_err_check
   * class to start any threads needed to perform this check.
   *
   * This method must be implemented by the derived svt_err_check class.
   *
   * @param check_stats The registered check to enable.
   */
  extern virtual function void enable_check(svt_err_check_stats check_stats);
  
  // ---------------------------------------------------------------------------
  /**
   * Enables checks that match specified group and sub-group criteria.  Checks
   * that are already enabled will not be effected and will not be included in
   * the count that is returned.
   *
   * @param enable_group      Regular expression string used to search for groups associated
   *                          with the checks to enable. The empty string can be used
   *                          to do a wildcard match against all group values.
   *
   * @param enable_sub_group  Regular expression string used to search for sub-groups associated
   *                          with the checks to enable. The empty string can be used to
   *                          do a wildcard match against all sub-group values.
   * 
   * @param enable_unique_id  Regular expression string used to search for the unique_id associated
   *                          with the checks to find.  The empty string can be used
   *                          to do a wildcard match against all unique_id values.
   *
   * @return                  The number of checks that were enabled.
   */
  extern virtual function int enable_checks(string enable_group = "",
                                            string enable_sub_group = "",
                                            string enable_unique_id = "");
  
  // ---------------------------------------------------------------------------
  /**
   * Enables checks that match specified group and sub-group criteria AND were
   * captured as enabled using capture_and_disable_checks API. Checks that are 
   * already enabled will not be effected and will not be included in the count 
   * that is returned.
   *
   * @param enable_group      Regular expression string used to search for groups associated
   *                          with the checks to enable. The empty string can be used
   *                          to do a wildcard match against all group values.
   *
   * @param enable_sub_group  Regular expression string used to search for sub-groups associated
   *                          with the checks to enable. The empty string can be used to
   *                          do a wildcard match against all sub-group values.
   * 
   * @param enable_unique_id  Regular expression string used to search for the unique_id associated
   *                          with the checks to find.  The empty string can be used
   *                          to do a wildcard match against all unique_id values.
   *
   * @return                  The number of checks that were enabled.
   */
  extern virtual function int restore_enable_last_disabled_checks(string enable_group = "",
                                                     string enable_sub_group = "",
                                                     string enable_unique_id = "");

  // ---------------------------------------------------------------------------
  /**
   * This method is called to disable a check. This allows the svt_err_check
   * class to stop check-related threads that are currently running.
   *
   * This method must be implemented by the derived svt_err_check class.
   *
   * @param check_stats The registered check to disable.
   */
  extern virtual function void disable_check(svt_err_check_stats check_stats);
  
  // ---------------------------------------------------------------------------
  /**
   * Disables checks that match specified group and sub-group criteria.  Checks
   * that are already disabled will not be effected and will not be included in
   * the count that is returned.
   *
   * @param disable_group     Regular expression string used to search for groups associated
   *                          with the checks to disable. The empty string can be used
   *                          to do a wildcard match against all group values.
   *
   * @param disable_sub_group Regular expression string used to search for sub-groups associated
   *                          with the checks to disable. The empty string can be used to
   *                          do a wildcard match against all sub-group values.
   *
   * @param disable_unique_id Regular expression string used to search for the unique_id associated
   *                          with the checks to find.  The empty string can be used
   *                          to do a wildcard match against all unique_id values.
   *
   * @return                  The number of checks that were disabled.
   */
  extern virtual function int disable_checks(string disable_group = "",
                                             string disable_sub_group = "",
                                             string disable_unique_id = "");

  // ---------------------------------------------------------------------------
  /**
   * Disables checks that match specified group and sub-group criteria. Checks
   * that are already disabled will not be effected and will not be included in
   * the count that is returned. It internally captures current is_enabled state 
   * prior to disabling a check.
   *
   * @param disable_group     Regular expression string used to search for groups associated
   *                          with the checks to disable. The empty string can be used
   *                          to do a wildcard match against all group values.
   *
   * @param disable_sub_group Regular expression string used to search for sub-groups associated
   *                          with the checks to disable. The empty string can be used to
   *                          do a wildcard match against all sub-group values.
   *
   * @param disable_unique_id Regular expression string used to search for the unique_id associated
   *                          with the checks to find.  The empty string can be used
   *                          to do a wildcard match against all unique_id values.
   *
   * @return                  The number of checks that were disabled.
   */
  extern virtual function int capture_and_disable_checks(string disable_group = "",
                                                         string disable_sub_group = "",
                                                         string disable_unique_id = ""); 

  // ---------------------------------------------------------------------------
  /**
   * Modifies the default handling in the event of 'pass' of checks that match
   * specified group and sub-group criteria. Checks that already have the indicated
   * default handling will not be effected and will not be included in the count that
   * is returned.
   *
   * @param pass_effect_group
   *                          Regular expression string used to search for groups associated
   *                          with the checks to modify. The empty string can be used
   *                          to do a wildcard match against all group values.
   *
   * @param pass_effect_sub_group
   *                          Regular expression string used to search for sub-groups associated
   *                          with the checks to modify. The empty string can be used to
   *                          do a wildcard match against all sub-group values.
   * 
   * @param new_default_pass_effect The new pass effect.
   *
   * @param pass_effect_unique_id
   *                          Regular expression string used to search for the unique_id associated
   *                          with the checks to find.  The empty string can be used
   *                          to do a wildcard match against all unique_id values.
   *
   * @return                  The number of checks that were modified.
   */
  extern virtual function int set_default_pass_effects(string pass_effect_group = "",
                                                       string pass_effect_sub_group = "",
                                                       svt_err_check_stats::fail_effect_enum new_default_pass_effect,
                                                       string pass_effect_unique_id = "" );


  // ---------------------------------------------------------------------------
  /**
   * Modifies the default handling in the event of 'fail' of checks that match
   * specified group and sub-group criteria. Checks that already have the indicated
   * default handling will not be effected and will not be included in the count that
   * is returned.
   *
   * @param fail_effect_group
   *                          Regular expression string used to search for groups associated
   *                          with the checks to modify. The empty string can be used
   *                          to do a wildcard match against all group values.
   *
   * @param fail_effect_sub_group
   *                          Regular expression string used to search for sub-groups associated
   *                          with the checks to modify. The empty string can be used to
   *                          do a wildcard match against all sub-group values.
   * 
   * @param new_default_fail_effect The new fail effect.
   *
   * @param fail_effect_unique_id
   *                          Regular expression string used to search for the unique_id associated
   *                          with the checks to find.  The empty string can be used
   *                          to do a wildcard match against all unique_id values.
   *
   * @return                  The number of checks that were modified.
   */
  extern virtual function int set_default_fail_effects(string fail_effect_group = "",
                                                       string fail_effect_sub_group = "",
                                                       svt_err_check_stats::fail_effect_enum new_default_fail_effect,
                                                       string fail_effect_unique_id = "" );

  // ---------------------------------------------------------------------------
  /**
   * Add covergroups for all registered checks that match the specified group and
   * sub-group criteria utilizing the provided pass/fail settings.
   *
   * @param enable_cov_group      Regular expression used to search for groups associated
   *                              with the checks to cover.  The empty string can be used
   *                              to do a wildcard match against all group values.
   *
   * @param enable_cov_sub_group  Regular expression used to search for sub-groups associated
   *                              with the checks to cover.  The empty string can be used to
   *                              do a wildcard match against all sub-group values.
   *
   * @param enable_pass_cov       Enables the "pass" bins on all of the the check coverage
   *                              instances.
   *
   * @param enable_fail_cov       Enables the "fail" bins on all of the the check coverage
   *                              instances.
   *
   * @return                      The number of checks that were enabled for coverage.
   */
  extern virtual function int enable_checks_cov( string enable_cov_group = "",
                                                 string enable_cov_sub_group = "",
                                                 bit enable_pass_cov = 0,
                                                 bit enable_fail_cov = 1);

  // ---------------------------------------------------------------------------
  /**
   * Deletes the coverage for the checks that match specified group and sub-group criteria.
   *
   * @param disable_cov_group     Regular expression used to search for groups for coverage
   *                              deletion.  The empty string can be used to do a wildcard
   *                              match against all group values.
   *
   * @param disable_cov_sub_group Regular expression used to search for sub-groups for coverage
   *                              deletion.  The empty string can be used to do a wildcard
   *                              match against all sub-group values.
   *
   * @return                      The number of checks that were disabled for coverage.
   */
  extern virtual function int disable_checks_cov(string disable_cov_group = "",
                                                 string disable_cov_sub_group = "");

  // ---------------------------------------------------------------------------
  /**
   * Enables the "pass" bins of the "status" covergroup associated with the all the registered checks.
   * This method would set the "enable_pass_cov" bit of the coverage class, if coverage is enabled on the 
   * checks identified by the group and sub_group. If coverage is disabled, it would 
   * not set the "enable_pass_cov" bit.
   *  
   * @param set_pass_cov_group      The group associated with the checks for coverage.
   *
   * @param set_pass_cov_sub_group  The sub-group associated with the checks for coverage.
   *                                If no sub-group is specified, all registered checks
   *                                associated with the specified group will have coverage
   *                                bins "pass" added to them.
   *
   * @param enable_pass_cov         Bit indicates, whether the "pass" bins are enabled or disabled.
   *                                Default value is '1' which enables the "pass" bins by default.    
   */
  extern virtual function void set_checks_cov_pass(string set_pass_cov_group, 
                                                   string set_pass_cov_sub_group = "",
                                                   bit enable_pass_cov = 1); 

  // ---------------------------------------------------------------------------
  /**
   * Enables the "fail" bins of the "status" covergroup associated with the all the registered checks.
   * This method would set the "enable_fail_cov" bit of the coverage class, if coverage is enabled on the 
   * checks identified by the group and sub_group. If coverage is disabled, it would 
   * not set the "enable_fail_cov" bit.
   * 
   * @param set_fail_cov_group      The group associated with the checks for coverage.
   *
   * @param set_fail_cov_sub_group  The sub-group associated with the checks for coverage.
   *                                If no sub-group is specified, all registered checks
   *                                associated with the specified group will have coverage
   *                                bins "fail" added to them.
   *
   * @param enable_fail_cov         Bit indicates, whether the "fail" bins are enabled or disabled.
   *                                Default value is '1' which enables the "fail" bins by default.    
   */
  extern virtual function void set_checks_cov_fail(string set_fail_cov_group, 
                                                   string set_fail_cov_sub_group = "",
                                                   bit enable_fail_cov = 1);

  // ---------------------------------------------------------------------------
  /**
   * Returns a registered check, given a unique string which identifies
   * the check.
   *
   * @param unique_id The identifier of the check to retrieve. This is
   * based on how the check was constructed, using the check_id_str or
   * the description as its unique identifier. The check_id_str is given
   * precedence over the description.
   *
   * @return The registered check, or null if the check wasn't found.
   */
  extern virtual function svt_err_check_stats find( string unique_id );
  
  // ---------------------------------------------------------------------------
  /**
   * Looks for the indicated check, returning a bit indicating whether
   * it was found.
   *
   * @param check_stats The check to look for.
   *
   * @return Indication of whether the check was found (1) or not found (0).
   */
  extern virtual function bit find_check( svt_err_check_stats check_stats );
  
  // ---------------------------------------------------------------------------
  /**
   * Finds checks that match specified group, sub-group, and unique_id criteria.
   *
   * @param find_group      Regular expression string used to search for groups associated with
   *                        the checks to find.  The empty string can be used to do
   *                        a wildcard match against all group values.
   *
   * @param find_sub_group  Regular expression string used to search for sub-groups associated
   *                        with the checks to find.  The empty string can be used
   *                        to do a wildcard match against all sub-group values.
   *
   * @param found_checks    A queue that stores the checks that were found as
   *                        a result of the find operation.
   *
   * @param find_unique_id  Regular expression string used to search for the unique_id associated
   *                        with the checks to find.  The empty string can be used
   *                        to do a wildcard match against all unique_id values.
   *
   * The find_group, find_sub_group, and find_unique_id string arguments are compared with captured groups/sub-groups/unique-ids 
   * through a SystemVerilog DPI uvm_re_match. The UVM_NO_DPI option prevents compilation of UVM C code that uses the SystemVerilog DPI.
   * This option is only there for some environments that do not have their C compilers installed. 
   *
   * In SystemVerilog characters [ and ] is not recognized as strings. So these special characters has to be escaped according to following options-
   * With UVM_NO_DPI : In SystemVerilog the [ character needs to be escaped inside a string. 
   *                   Therefore need to escape this character with \ character as \[0\].
   * Without UVM_NO_DPI : uvm_re_match uses the POSIX function regexec to perform a match. Special character [] is not recognized as strings 
   *                   in POSIX function. According to POSIX regex the [0] will try to match the character found between the brackets,
   *                   and no matching is performed for the bracket characters [ and ] themselves. 
   *                   The bracket characters are escaped using \ [ and \ ]. In SystemVerilog the \ character also needs to be escaped
   *                   because it is itself the escape character used inside a string. 
   *                   Therefore need to escape this escape character with another \ character as \\[0\\].
   * 
   */
  extern virtual function void find_checks(string find_group = "",
                                           string find_sub_group = "",
                                           ref svt_err_check_stats found_checks[$],
                                           input string find_unique_id = "" );

  // ---------------------------------------------------------------------------
  /**
   * Called by transactor to execute a DUT Error Check with a default severity
   * of ERROR.
   *
   * @param check_stats Handle to the check being executed
   * @param test_pass Represents the outcome of the check (PASS = 1, FAIL = 0).
   * @param fail_msg (Optional) Contains more data about a check that failed.
   * @param fail_effect (Optional: Default=ERROR) Determines how a failure should be counted
   * (as IGNORE, WARNING, ERROR, EXPECTED, or DEFAULT).
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern function void execute(svt_err_check_stats check_stats,
                               bit test_pass,
                               string fail_msg = "",
                               svt_err_check_stats::fail_effect_enum fail_effect = svt_err_check_stats::ERROR,
                               string filename = "", int line = 0);

  // ---------------------------------------------------------------------------
  /**
   * Called by transactor to execute a DUT Error Check with the configured default
   * severity for the svt_err_check_stats instance.
   *
   * @param check_stats Handle to the check being executed
   * @param test_pass Represents the outcome of the check (PASS = 1, FAIL = 0).
   * @param fail_msg (Optional) Contains more data about a check that failed.
   */
  extern function void execute_stats(svt_err_check_stats check_stats,
                                     bit test_pass,
                                     string fail_msg = "");

  // ---------------------------------------------------------------------------
  /** 
   * Returns a string with the name of the svt_err_check instance. 
   *
   * @return the name of the svt_err_check instance.
   */
  extern function string get_err_check_name();
  
  // ---------------------------------------------------------------------------
  /**
   * Returns a handle to the svt_err_check_stats class object that contains
   * the statistics associated with the given unique_id.
   *
   * @param unique_id The identifier of the svt_err_check_stats instance to
   * retrieve. This is based on how the check was constructed, using the check_id_str
   * or the description as its unique identifier. When doing the match the
   * check_id_str value in the svt_err_check_stats object is given
   * precedence over the description in the object.
   * @param silent Indicates whether a failure to find the svt_err_check_stats instance
   * should result in an error.
   */
  extern function svt_err_check_stats get_err_check_stats(string unique_id, bit silent = 0);

  // ---------------------------------------------------------------------------
  /**
   * DEPRECATED -- USE 'get_err_check_stats'
   */
  extern function svt_err_check_stats get_check_stats(string unique_id);

  // ---------------------------------------------------------------------------
  /**
   * Returns a handle to the svt_err_check class object that has the indicated
   * name value.
   *
   * @param err_check_name The identifier of the check to retrieve.
   * @param silent Indicates whether a failure to find the svt_err_check_stats instance
   * should result in an error.
   */
  extern function svt_err_check get_err_check(string err_check_name, bit silent = 0);

  // ---------------------------------------------------------------------------
  /**
   * Registers a PASSED check with this class.
   * If the verbosity of this class's log object is TRACE or higher,
   * this method produce slog output indicating the name of the check,
   * and the fact that it has PASSED.
   *
   * @param check_stats The check performed by a transactor.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern function void pass(svt_err_check_stats check_stats,
                            string filename = "", int line = 0);
  // ---------------------------------------------------------------------------
  /**
   * Registers a FAILED check with this class.
   * As long as the error has not been filtered, this method produces log
   * output with the description of the check, and the fact that it has FAILED,
   * and what the corresponding failure effect is.
   *
   * @param check_stats Check performed by a transactor.
   * @param fail_msg (Optional) Additional output that will be printed along with
   * the basic failure message.
   * @param fail_effect (Optional: Default=ERROR) Determines how a failure should be counted
   * (as IGNORE, WARNING, ERROR, EXPECTED, or DEFAULT).
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern function void fail(svt_err_check_stats check_stats, string fail_msg = "",
                   svt_err_check_stats::fail_effect_enum fail_effect = svt_err_check_stats::ERROR,
                   string filename = "", int line = 0);
`ifndef SVT_VMM_TECHNOLOGY
  /** Method insures the catcher has been setup. */
  extern function void check_catcher_exists();
  // ---------------------------------------------------------------------------
  /** Method which deletes the catcher if it is no longer needed. */
  extern function void check_catcher_needed();
`endif
  // ---------------------------------------------------------------------------
  /**
   * Filters out a specified error. The argument
   * specifies the error using the same ID with which it is registered.
   *
   * @param check_stats Check performed by a transactor.
   * @return An int handle to the filter rule just created (used to later <i>unfilter</i> the error).
   */
  extern function int filter_error(svt_err_check_stats check_stats);
  // ---------------------------------------------------------------------------
  /**
   * Removes a <i>filter</i> previously set for a specified error.
   * The argument specifies the filter rule handle that was returned when the filter was set.
   *
   * @param filter_id (Optional) An int handle to the filter rule (as returned by <b>filter_error()</b>).
   * If this argument is not supplied, or the default -1 value is specified, <b>all</b> error check failure
   * message filter rules will be removed.
   */
  extern function void unfilter_error(int filter_id = -1);
  // ---------------------------------------------------------------------------
  /**
   * Activates or modifies automatic error message filtering, after
   * a specified number of failures for a given check (or all checks).
   *
   * @param threshold Specifies the allowed number of FAIL messages, before filtering is activated.
   * @param check_stats (Optional) Specifies the check to be filtered (null => all checks).
   */
  extern function void filter_after_n_fails(int threshold, svt_err_check_stats check_stats = null);
  // ---------------------------------------------------------------------------
  /**
   * Reports information about checks.
   *
   * @param checks         The checks to be reported on, or null for all  
   *                       checks that are registered with this class.
   *
   * @param omit_disabled  If this flag is set, checks that are disabled   
   *                       are skipped.
   *
   * @param prefix         The prefix string for all output.
   */
  extern function void report_check_info(svt_err_check_stats checks[$],
                                 bit omit_disabled = 1,
                                 string prefix = "    ");
  
  // ---------------------------------------------------------------------------
  /**
   * Reports the current stats for checks.
   *
   * @param checks            The checks to be reported on, or null for all 
   *                          checks that are registered with this class.
   *
   * @param prefix            The prefix string for all output.
   *
   * @param omit_unexercised  If this flag is set, checks that have not been
   *                          exercised are skipped.
   */
  extern virtual function void report_check_stats(svt_err_check_stats checks[$],
                                  bit omit_unexercised = 1,
                                  string prefix = "    ");
  
  // ---------------------------------------------------------------------------
  /**
   * Reports information about all registered checks.
   *
   * @param prefix  The prefix string for all output.
   *
   * @param include_initial_header If this flag is set and top level report header is included.
   *
   * @param include_intermediate_header If this flag is set an intermediate header for this set of checks is included.
   *
   * @param omit_disabled If this flag is set, checks that are disabled are skipped.
   */
  extern virtual function void report_all_check_info(string prefix = "    ",
                                     bit include_initial_header = 0,
                                     bit include_intermediate_header = 1,
                                     bit omit_disabled = 1);
  
  // ---------------------------------------------------------------------------
  /**
   * Formats the current stats for all registered checks so that they can be reported.
   *
   * @param prefix  The prefix string for all output.
   *
   * @param include_initial_header If this flag is set and top level report header is included.
   *
   * @param include_intermediate_header If this flag is set an intermediate header for this set of checks is included.
   *
   * @param omit_unexercised If this flag is set, checks that have not been
   *                         exercised are skipped.
   */
  extern virtual function string psdisplay_all_check_stats( string prefix, 
                                            bit include_initial_header,
                                            bit include_intermediate_header,
                                            bit omit_unexercised );

  // ---------------------------------------------------------------------------
  /**
   * Reports the current stats for all registered checks.
   *
   * @param prefix  The prefix string for all output.
   *
   * @param include_initial_header If this flag is set and top level report header is included.
   *
   * @param include_intermediate_header If this flag is set an intermediate header for this set of checks is included.
   *
   * @param omit_unexercised If this flag is set, checks that have not been
   *                         exercised are skipped.
   */
  extern virtual function void report_all_check_stats(string prefix = "    ",
                                      bit include_initial_header = 0,
                                      bit include_intermediate_header = 1,
                                      bit omit_unexercised = 1);
  
  // ---------------------------------------------------------------------------
  /**
   * Reports (to transcript) the current stats for all tracked errors.
   *
   * @param prefix  Prefix string for all output.
   */
  extern virtual function void report(string prefix = "    ");

  // ---------------------------------------------------------------------------
  /** Returns a string that provides the basic check msg (check info plus fail_msg, if provided). */
  extern function string get_check_msg(svt_err_check_stats check_stats, string fail_msg = "");

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The transactor will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * consruction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Basic report objects aren't included in the component hierarchy and
   * therefore don't respond well to verbosity modifications. I.e., verbosity
   * modifications travel the component hierarchy, and miss anything which isn't
   * in it. To deal with this we provide an easy mechanism for providing a component
   * report object.
   *
   * @param comp_reporter The new component report object.
   * @param force_override Indicates whether the setting of the reporter should be
   * forced, even if the svt_err_check instance already has a component reporter. 
   * 
   */
  extern virtual function void set_component_reporter(`SVT_XVM(component) comp_reporter, bit force_override = 0);
`endif

  // ---------------------------------------------------------------------------
endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
RLS9iS7HGFAIf+N2tSgFv6MCXT8v5MNvB3dz7hrheyxrKBIzSrPz2hR6qbQHIRYb
OGPyT9xc3zfqeU0Dfri0vPkL3YBsjU8hRCKSqgGuT4BfqU4DIsxLyBv6v1Qyous9
cnjiUowRb12yFCvZEy5QmsAr1u3lBVOLPiLe8vzZcAM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 51925     )
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
`pragma protect end_protected

`endif // GUARD_SVT_ERR_CHECK_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NelcMSNZSXlNEUDUA9I8+uBt7JP2kSfXtBirkuIIEieyXTOEwSwQB6GUNEHBngIB
5XRk7hfQ3SHDf1Pnuq75l1G5qWuaAfAreD6I37WeneLuCVGpQF8QDXStjm0UVN6V
rpPfkFxXHd5F0yihj7tRkJtefFVhei5vDNfwPC8Rvds=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 52008     )
cmXhuf4ugSBZJupp+8pZd8vyrnNY1a0Y1dz4zgmIHEHLXv1K53+/vAIAhBpPQzOJ
eV14x51mlFvEJUxX7acBd9b3sagNO5h7E7sME7Czj2mE1Ihryj9vJ3nNRJ+mFX3i
`pragma protect end_protected
