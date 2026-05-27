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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Ls8KcsKxB42wuJ6ACVcyPAgXjGZG1ngz7UaLWfkxnv2+evwo4p1oHr16lyJer2Rd
mNtRecqKT/a0pKO6X/6haTcPPRv750Od+I6iOdMfSIfP+/P2djDUZrNk4MLthFvh
6UQ3f5OGuNX542fd8b1FcgzUsqouKqDYD1XdnHe+wMJn2pKWY5Tq6Q==
//pragma protect end_key_block
//pragma protect digest_block
/43fimATL/MqsQpE2WcqtgZZHH8=
//pragma protect end_digest_block
//pragma protect data_block
M/vpWI8vI1SIr+8+g5Gh6Dkj8fyPan5W4FM8JMA0dMB1yrOtB6/dhUPmX9SawAYO
k+rEVBtYBSw18OCUeDiG1j2i988POicuoLHSroUCIT+ODVzjG3UG4tURaWWl9J16
HhapznmyoDpCYec34ue2l10N4a9JEUirAzdrJ9j56zRn44RUdWF6AkkirSXtf2M3
kiZEH9dV00V64Qkj3lv+lAYQGvFTZxZKByd2uN/k+d5saDD/N2/e+tnm/pnQQp1g
n8gC95WRBUxHb0pzz4LB/Gw2YHaOLpIbXcOE7kvh8wpnpQTFc0KGLAHaViiBkagV
MrQrogsAJUudORUkllBbb+WVslTHtu2pL7ydF2HfntKssS8S+4F2K0NE5NRnmY1/
lGvCSm8Y+UbNnKlhvCsgyPlJiB5TzIOoNX47nkmfl2fZEXYSmVIrX3TjnCb2bAsi

//pragma protect end_data_block
//pragma protect digest_block
1Gs4PmN0pxjEivcE1wxGDQylaok=
//pragma protect end_digest_block
//pragma protect end_protected
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
xWPNaXhAdN/cuyIJpIXfDCKp4icn513wiB1ikMyGMxOrPpPWsYDQrCcnu2XttHQo
VaKK/RY/0Duk06l7/qH3C0ffajpU4tsd4T7L6YzRNl/xBLirjJDh0SZmuDzUYNOR
1NNXDRWlfsY7bOCIM8UELlvvOuwys7SHyHR8t8B2A1/pjvA4vJGvnA==
//pragma protect end_key_block
//pragma protect digest_block
RJljJCH8ZeW4+oJzqj6lHvQvJ6Q=
//pragma protect end_digest_block
//pragma protect data_block
72fqK1PgMguNejq5F/LvwmcYcgxSoAOVHiq2Aj0posQbS9P3G134vpFv2lyloJfx
yI/0bohjNthqnQkgDowoEwGHL0v2S5mhTyqjsvB7iiP06o+LpTVuFyb7tXJ3AMMU
wdwC29A6mmhDQfbMMD+WnTUpOa8H7boHlDtse6eFOVTLEb1VUz6r5RcemFm/SUwp
L47WfE3qbtaYoAdKGE2O6haiRqC1GqQAiHhWPVnx7ETjhQzAa6gCJjsFUtTVD7hl
/rXKYcCOjCKVaQrwNxJ57TnM4Flc5uQbmzfCAhjRWK756lnkJDTELYK4NSqTd+7l
1olTQic370MHqL1QjRVpdJpCcCVe7WM41AiM1kE4QdQZ5Wy/VqRf/EP7bHdHbN6V
LckQ7rYH+QQ6h5CjNcYHtYn+duUKT8TQHUQawCzoX5X01sPKlv5574CdU8u20q4r
VziPwOxMg2J1byNDnbOppcmbXJP/rGeletLXDyQtbo24I6m0ow6jH/NavZp/FvrS
4FAi4KoEuuceGrB/PUzARO0h6/xRNCzFl/XdLX41iy8=
//pragma protect end_data_block
//pragma protect digest_block
QcCK/54clnzRayJAThnhPrzDGeQ=
//pragma protect end_digest_block
//pragma protect end_protected
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
EkpSqgvViCleuUiLb93EpH6Ad8BL8RQzWMKNeq28JHkFdlKQltwS1YjnR2toaooq
scyIeFia/CQVBSBoKeQE/mtDoIo19Cd2ypk5+UMC+Zytl9q8oKvQJqIPNmlW69Xr
CAaj6nqKcvyb/Yqi8XMsYFjQ8yO3h7tS0dlMXe5xaXGmy9BYOvJu8A==
//pragma protect end_key_block
//pragma protect digest_block
Wu0hlf1QF/H6aWjSLDuEo9b9EAI=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
Kx2EoO6gSZm6TlYsxi1ccMM1B4M=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_ERR_CHECK_SV

