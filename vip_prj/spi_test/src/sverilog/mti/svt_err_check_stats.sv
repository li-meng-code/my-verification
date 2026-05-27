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

`ifndef GUARD_SVT_ERR_CHECK_STATS_SV
`define GUARD_SVT_ERR_CHECK_STATS_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

`ifndef SVT_ERR_CHECK_STATS_DISABLE_EXTENDED_BASE_NAME
`define SVT_ERR_CHECK_STATS_ENABLE_EXTENDED_BASE_NAME
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
doSBuLRA1VDPK6WNVsJNSFXOQ73jGKGiRkfDEuR72X+zHSpxOXkuCOdQ9vFmNmi+
kAGhoCZwAdcneAw2VAFAcL3rt2gqM6Aty1P52C283Zppe8JwsePBF9IbsMlSb+bG
Z7H14E+0RbOeAGMGYpnx27vn8KEBlDZK4QQR1COPrb4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 835       )
DloLtBjTXNXInPR2kfKc2rCgxIdGTKtvKMYQnubqM+F7Il7fVJsrFxgDJPdh7N9o
Ft7+vWjcoqYNAkVq1WIdXLmbCqC5bXmESmbO+YXyH1QeupYKKzTyE5HB2T1iZ30V
SkNzKKtDk3ZTpD2NWSqN9zk6BUgoj1N+znqSBVu7TCkezSebFjPpGqGdnX/RFX9h
Q8qmgwGcMNwTyfGbxVMKfnWbPT8uqYUj3lqMklA1NBgOKI58XcdXDpSP6XD2vppi
49fjfN7V63trUSF427Wp3twb8SRA6Ajo+qok416q/OwQ0jI2AugkwbJTfYGMiDHh
5fuFprLjGAi0xwNALz3F1Q5oucwjvoZX6bLLRGpM9gFZdoR0q+9QI/gLASlmCzrZ
Wb7f3ixBaWZ+l/Kl7z8+ExEIPZqQ2e2Y5QscJR5bLNzmdmDQOJgX/uZ5oKN9rIS4
63jb1RFOWfQGhSvYogbJ+YW5HGkOChlDdg+Wd/Rf/Wh3p7Il8jbgDvE/BBOF6kge
z3D7HVkirB84c9Y4If32DSZZ/wGShLX0O1mSIT+aP8R5uZESrQNvYPb/MYTXQglg
mUsArB4ZQ7cQbEiU5AJYd+6tjWHZC86j6r1TiDSVYBStPFA+dCdFPSYeoPDV5FF/
mNCefgKG5U0YdUXePgkz5TqhwHOR7zebYj93nUiXo1PoOUIxaRLImAMG0fYAVWkn
k9BWlHfeOdf2KyVaQPRa4FmdQg0w4hscB6GVIJ85Stj3eQjsCurKuYCuXRPCz2hU
uMoYmEkNrkhx5FW5x+6SAco+5V3KbnC6GGu8TuAb41F8ewWEcEQENYV4/MERJl/S
JOKo/5k+9NSsrbWF9f+nlceVE79K7t0yj/DkpuTBmBzKvU7X09K2/iPBRetBIKCd
wkWJxByDLHFDVYgbUQjHQDg69JH9OVZaOutJoxih9R7Fyy6xA4fEKEBX9Fu49BND
6ql4CrkyLOJu3Tf/RP0N1Pm8PJedxKqoJVLGrZsR6C60WkMDFyBs2eS9iVQLg+nT
THGA/F4DZ134G7MdInHfIV3vfB1kHzJS0W+CpM1+OFZagv+Ku9EeGHUqwrWWcNlW
o4LDub40cE6QVIOuWoyopfjhWHSrs+hMoW6E0RyTBfk=
`pragma protect end_protected

// =============================================================================
/**
 * Error Check Statistics Class - This class is simply used to encapsulate
 * statistics related to one specific error check. A queue of objects of this class
 * is used within the svt_err_check class (the <b>check</b> member
 * of the svt_xactor class), to track error checks performed by all transactors.
 */
class svt_err_check_stats extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  /** Value that is associated with a check passing or failing, which is sed to specify the desired effect when that check passes or fails. */
  typedef enum {
    IGNORE = `SVT_IGNORE_EFFECT,       /**< Ignore the pass/fail check result. */
    VERBOSE = `SVT_VERBOSE_EFFECT,     /**< Generate verbose message for the pass/fail check results. */
    DEBUG = `SVT_DEBUG_EFFECT,         /**< Generate debug message for the pass/fail check results. */
    NOTE = `SVT_NOTE_EFFECT,           /**< Generate note message for the pass/fail check results. */
    WARNING = `SVT_WARNING_EFFECT,     /**< Generate warning message for the pass/fail check results. */
    ERROR = `SVT_ERROR_EFFECT,         /**< Generate error message for the pass/fail check results. */
    EXPECTED = `SVT_EXPECTED_EFFECT,   /**< Do not generate any message as the pass/fail of the check is expected. */
    DEFAULT = `SVT_DEFAULT_EFFECT      /**< Rely on the #default_pass_effect/#default_fail_effect setting for the check to decide whether or not to generate a message for the pass/fail of the check. */
  } fail_effect_enum;

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** 
   * Instance of the svt_err_check_stats_cov class corresponding to this svt_err_check_stats instance.
   */
  svt_err_check_stats_cov err_check_stats_cov_inst;

  /**
   * Specifies the default handling of this check in the event of a pass. A value
   * of DEFAULT results in no message being generated. This value can be overridden
   * by the code implementing the check when the check is fired.
   */
  fail_effect_enum default_pass_effect = DEBUG;
  
  /**
   * Specifies the default handling of this check in the event of failure. A value
   * of DEFAULT results in no message being generated. This value can be overridden
   * by the code implementing the check when the check is fired.
   */
  fail_effect_enum default_fail_effect = ERROR;
  
  /**
   * Number of ERRORs after which the error will automatically be filtered.  If
   * this variable is set to '0', automatic filtering will be disabled.
   */
  int filter_after_count = 0; // '0' => no automatic filter

  /** Tracks the number of times that a given check has been executed. */
  int exec_count = 0;

  /** Tracks the number of times that a given check has PASSED. */
  int pass_count = 0;

  /** Tracks the number of times the check has failed, with IGNORED effect. */
  int fail_ignore_count = 0;

  /** Tracks the number of times the check has failed, with VERBOSE effect. */
  int fail_verbose_count = 0;

  /** Tracks the number of times the check has failed, with DEBUG effect. */
  int fail_debug_count = 0;

  /** Tracks the number of times the check has failed, with NOTE effect. */
  int fail_note_count = 0;

  /** Tracks the number of times the check has failed, with WARNING effect. */
  int fail_warn_count = 0;

  /** Tracks the number of times the check has failed, with ERROR or FATAL effect. */
  int fail_err_count = 0;

  /** Tracks the number of times the check has failed, with EXPECTED effect. */
  int fail_expected_count = 0;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /**
   * An optional string which identifies the svt_err_check instance that contains this
   * svt_err_check_stats instance.
   */
  protected string err_check_name = "";

  /** An ID string that identifies a unique error check. Currently supporting check_id or check_id_str. */
  protected string check_id_str = "";

  /** A string that describes what is being checked. */
  protected string description = `SVT_DATA_UTIL_UNSPECIFIED;

  /** A string that identifies a protocol specification reference, if applicable. */
  protected string reference = `SVT_DATA_UTIL_UNSPECIFIED;

  /** A string that defines the group to which the check belongs. */
  protected string group = "";

  /** A string that defines the sub-group to which the check belongs. */
  protected string sub_group = "";

  /**
   * Indicates whether or not the check is enabled.  This variable cannot be
   * acccessed directly -- the "set_is_enabled" method must be used.  
   */
  protected bit is_enabled = 1;

  /**
   * Indicates whether or not the check was enabled previously.  This variable cannot be
   * acccessed directly -- the "capture_is_enabled"  method must be used.  
   */
  protected bit last_is_enabled = 1;


`ifdef SVT_VMM_TECHNOLOGY
  svt_err_check_stats_cov cov_override = null;
`else
  `SVT_XVM(object_wrapper) cov_override = null;
`endif
  
  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log used if no log has been provided to the class. */
  local static vmm_log shared_log = new ( "svt_err_check_stats", "CLASS" );
`else
  /** Shared reporter used if no reporter has been provided to the class. */
  static `SVT_XVM(report_object) shared_reporter = svt_non_abstract_report_object::create_non_abstract_report_object({"svt_err_check_stats", ".class"});

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_err_check_stats)
`endif
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new svt_err_check_stats instance, passing the appropriate
   *             argument values to the svt_data parent class.
   *
   * @param suite_name Passed in by transactor, to identify the model suite.
   *
   * @param check_id_str Unique string identifier.
   *
   * @param group The group to which the check belongs.
   *
   * @param sub_group The sub-group to which the check belongs.
   *
   * @param description Text description of the check.
   *
   * @param reference (Optional) Text to reference protocol spec requirement
   *        associated with the check.
   *
   * @param default_fail_effect (Optional: Default = ERROR) Sets the default handling
   *        of a failed check.
   *
   * @param filter_after_count (Optional) Sets the number of fails before automatic
   *        filtering is applied.
   *
   * @param is_enabled (Optional) The default enabled setting for the check.
   */
  extern function new(string suite_name="", string check_id_str="",
                      string group="", string sub_group="", string description="",
                      string reference = "", svt_err_check_stats::fail_effect_enum default_fail_effect = svt_err_check_stats::ERROR,
                      int filter_after_count = 0, 
                      bit is_enabled = 1);

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_err_check_stats)
  `svt_data_member_end(svt_err_check_stats)

  // ---------------------------------------------------------------------------
  /** Returns a string giving the name of the class. */
  extern virtual function string get_class_name();

  // ---------------------------------------------------------------------------
  /** 
   * Returns the ID string of a check statistics object. 
   *
   * @return The check identifier string.
   */
  extern virtual function string get_check_id_str();

  // ---------------------------------------------------------------------------
  /** 
   * Returns a string with the check group. 
   *
   * @return the check group.
   */
  extern virtual function string get_group();
  
  // ---------------------------------------------------------------------------
  /** 
   * Returns a string with the check sub-group. 
   *
   * @return the check sub-group.
   */
  extern virtual function string get_sub_group();
  
  // ---------------------------------------------------------------------------
  /** 
   * Returns a value indicating whether the check is enabled (1) or disabled (0).
   *
   * @return The enabled (1) or disabled (0) value.
   */
  extern virtual function bit get_is_enabled();
  
  // ---------------------------------------------------------------------------
  /** 
   * Returns a value indicating whether the check was last enabled (1) or disabled (0).
   *
   * @return The enabled (1) or disabled (0) value.
   */
  extern virtual function bit get_last_is_enabled();

  // ---------------------------------------------------------------------------
  /** 
   * Captures whether the check is enabled (1) or disabled (0).
   */
  extern virtual function void capture_is_enabled();

  // ---------------------------------------------------------------------------
  /** Returns a string that provides only the check's description. */
  extern function string get_description();

  // ---------------------------------------------------------------------------
  /** Returns a string that provides only the check's reference. */
  extern virtual function string get_reference();

  // ---------------------------------------------------------------------------
  /** Modifies the default handling of this check in the event of pass. 
   *
   * @param new_default_pass_effect the new pass effect.
   */
  extern virtual function void set_default_pass_effect( fail_effect_enum new_default_pass_effect);

  // ---------------------------------------------------------------------------
  /** Modifies the default handling of this check in the event of failure. 
   *
   * @param new_default_fail_effect the new fail effect.
   */
  extern virtual function void set_default_fail_effect( fail_effect_enum new_default_fail_effect);

  // ---------------------------------------------------------------------------
  /** 
   * Modifies whether the check is enabled (1) or disabled (0).
   *
   * @param new_is_enabled the new enabled setting.
   */
  extern virtual function void set_is_enabled( bit new_is_enabled );

  // ---------------------------------------------------------------------------
  /**
   * Registers a PASSED check with this class. As long as the pass has not been
   * filtered, this method produces log output with information about the check,
   * and the fact that it has PASSED.
   *
   * @param override_pass_effect (Optional: Default=DEFAULT) Allows the pass
   *                             to be overridden for this particular pass.
   *                             Most values correspond to the corresponding message
   *                             levels. The exceptions are
   *                             - IGNORE - No message is generated.
   *                             - EXPECTED - The message is generated as verbose.
   *                             .    
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern virtual function void register_pass(svt_err_check_stats::fail_effect_enum override_pass_effect = svt_err_check_stats::DEFAULT,
                                             string filename = "", int line = 0);
  
  // ---------------------------------------------------------------------------
  /**
   * Registers a FAILED check with this class.  As long as the failure has not 
   * been filtered, this method produces log output with information about the 
   * check, and the fact that it has FAILED, along with a message (if specified).
   *
   * @param message               (Optional) Additional output that will be 
   *                              printed along with the basic failure message.
   *
   * @param override_fail_effect  (Optional: Default=DEFAULT) Allows the failure
   *                              to be overridden for this particular failure.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern virtual function void register_fail(string message = "", 
                                             svt_err_check_stats::fail_effect_enum override_fail_effect = svt_err_check_stats::DEFAULT,
                                             string filename = "", int line = 0);

  // ---------------------------------------------------------------------------
  /**
   * Resets all counters.
   */
  extern virtual function void reset_counters();

//svt_vipdk_exclude
`ifdef SVT_VMM_TECHNOLOGY
`ifdef SVT_PRE_VMM_12 
  // ---------------------------------------------------------------------------
  /** 
   * Method which returns a string for the instance path of the err_check_stats 
   * instance for VMM 1.1.
   */
    extern function string get_object_hiername(); 
`endif 
`endif

//svt_vipdk_end_exclude
  // ---------------------------------------------------------------------------
  /** 
   * Technology independent method which returns the full instance path for the
   * err_check_stats instance.
   */
  extern virtual function string get_full_name();

  // ---------------------------------------------------------------------------
  /** 
   * Method which registers a coverage override class to be used when creating
   * coverage for this class.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern virtual function void register_cov_override(svt_err_check_stats_cov cov_override);
`else
  extern virtual function void register_cov_override(`SVT_XVM(object_wrapper) cov_override);
`endif

  // ---------------------------------------------------------------------------
  /** 
   * Method which creates an #svt_err_check_stats_cov instance for this #svt_err_check_stats
   * instance. The default implementation uses the'type' override facilities provided by
   * the verification methodology.
   */
  extern virtual function svt_err_check_stats_cov create_cov();

  // ---------------------------------------------------------------------------
  /** 
   * Method which establishes the err_check_stats_cov_inst. This object is created 
   * using the create_cov() method.
   *
   * @param enable_pass_cov Enables the "pass" bins of the status covergroup.
   * @param enable_fail_cov Enables the "fail" bins of the status covergroup.
   */
  extern virtual function void add_cov(bit enable_pass_cov = 0, bit enable_fail_cov = 1);

  // ---------------------------------------------------------------------------
  /** 
   * Method which deletes the #err_check_stats_cov_inst field, assigning it to 'null'.
   */
  extern virtual function void delete_cov();

  // ---------------------------------------------------------------------------
  /**
   * Returns the unique identifier which is used to register and retrieve this
   * check in check containers. This method returns check_id_str if it set, but
   * if it is not set it returns the description.
   */
  extern virtual function string get_unique_id();

  // ---------------------------------------------------------------------------
  /**
   * Returns a formatted string that provides the basic information about the
   * check: the description and the reference.
   */
  extern virtual function string get_basic_check_info();

  // ---------------------------------------------------------------------------
  /**
   * Returns a formatted string that provides the general information about the
   * check including suite, check identifier, group, sub-group, description, and
   * reference.
   */
  extern virtual function string get_check_info();

  // ---------------------------------------------------------------------------
  /**
   * Returns a formatted string that provides the statistics (counts) about the
   * check.
   */
  extern virtual function string get_check_stats();

  // ---------------------------------------------------------------------------
  /**
   * Reports the basic information about the check: check identifier, group, 
   * sub-group, description, and reference.
   *
   * @param prefix         The prefix string for all output.
   *
   * @param omit_disabled  If this flag is set, and the check is not enabled,
   *                       this method does nothing.
   */
  extern virtual function void report_info(string prefix = "", bit omit_disabled = 0);

  // ---------------------------------------------------------------------------
  /**
   * Formats the statistics (counts) about the check.
   *
   * @param prefix            The prefix string for all output.
   */
  extern virtual function string psdisplay_stats(string prefix = "");

  // ---------------------------------------------------------------------------
  /**
   * Reports the statistics (counts) about the check.
   *
   * @param prefix            The prefix string for all output.
   *
   * @param omit_unexercised  If this flag is set, and the check has not been
   *                          exercised, this method does nothing.
   */
  extern virtual function void report_stats(string prefix = "", bit omit_unexercised = 0);

  // ---------------------------------------------------------------------------
  /** 
   * Returns a string that provides the basic check message (basic check info plus 
   * message, if provided). 
   *
   * @param message the message to be appended to the basic check info.
   *
   * @return the complete string.
   */
  extern virtual function string get_basic_check_message(string message = "");

  // ---------------------------------------------------------------------------
  /** 
   * Returns a string that provides the general check message (check info plus 
   * message, if provided). 
   *
   * @param message the message to be appended to the check info.
   *
   * @return the complete string.
   */
  extern virtual function string get_check_message(string message = "");

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

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return Status indicating the success/failure of the encode.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return Status indicating the success/failure of the decode.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);  
  
  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
  /** 
   * Returns the err_check_name field identifying the svt_err_check instance that contains
   * this svt_err_check_stats instance (if available). 
   *
   * @return The name of the svt_err_check instance.
   */
  extern function string get_err_check_name();
  
  // ---------------------------------------------------------------------------
  /** 
   * Sets the err_check_name field identifying the svt_err_check instance that contains
   * this svt_err_check_stats instance. 
   */
  extern function void set_err_check_name(string err_check_name);
  
  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nDV5bieWBgc7qJkHeW5PznPAjNldz060RGMCjf9SFqPMlYucVpARun2p5mI1lPvr
HogUlKlGmbt/PI6XnX+58cuIEi204HRsrJ0m8hsDVg6rdum4v9mGvUg0yk8mfqL3
yKmP2qZjqAiCwMvpPW1pvi92vVafP5cso3FJrdLMXAo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 33023     )
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
`pragma protect end_protected

`endif // GUARD_SVT_ERR_CHECK_STATS_SV


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lC+ne4GS5dJwPr3m4WLKtvPXUhbxu0LyVsNcsVXvzQsNKnkLsQn8295ohHL0dQzG
SNBRtbkw9FnwUtb6me9EqQLN7LkscujEkAQ8VHoZr4O8X0GF/aiIi1AWZQSrS0kY
73/aM00lCeyToP2uaYvbGkIEvoah1mgPg/tCeAv5fLo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 33106     )
p5laCr0y0TZjDqPR8NphFG5oCgh1uUY9x/ggSdyRvcv4J3zgXXxMMPWosCk/VWNM
/U2J04oasC/ZnzQrFic5zPRzR6bRcp1Edvn7wy/MJep+/QXJa0QqXGXijZj8DQ2l
`pragma protect end_protected
