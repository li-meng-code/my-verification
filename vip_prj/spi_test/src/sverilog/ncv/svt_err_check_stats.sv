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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
aS1wOWe8x8Uo2fp3uvgHnRGAJB1swvOmQwLDZMd7bk5mJb0aAmXTFrys7nFccv1X
WkOHw5j4tbfMV5VTIg2bOQxHn9FfeDP55TLpZioOoFP1oxnYwwXiGZpHPPtoqA+X
FagWUg2u2BZJEiKBtBDU5wiFhYpg6LbQyHR1s3taUGPKZdpIuEyFLQ==
//pragma protect end_key_block
//pragma protect digest_block
pDuvA+NxvM0hM2zNiStmALpAXHY=
//pragma protect end_digest_block
//pragma protect data_block
a42wDCHtf8cnYVJauaNnZLUclNqqjm/N0GrHZN6wJ/K7R6gG2i4f99GwLvdVhG85
HU7sPGx6jD3vf/5RzHMgdDQsCkql+ki1NwLGdyXzk+8asRy7pd1rWyo/AXZ+PbV/
nGQryyv4aEQ0mMxu+Caeyz9qOuqg6eQRdB2kR5zQG5m9kdUzubS/b7NDP9JpXMZh
EYPP5IqrW7CelpdOMDEw0MCZK6YImRxnysbLEkDfi3rE3RpawXMskV0MM63dd3s+
xPD/AYWitYczrtx9WHqmZO2RA+NsKdW3zwR9czRK+AyWO6l0vTAuDSzpFkS8/mbA
8SC23TVVcBDyEUJnr1OsvJYmjVKUZfIEf5lxrdR+NQf/MZzMt2JNCPtvOWGkrPHf
r0UesLopGhWfK6Xrsf+myQ3EyhK/AdHI4MXn6ZR7c6RZA+mLizqm0GFwVzsOETYF
ChAub57h2pbM/3liXI12nkTj4d7f95sN/7DiZ7faHz1IcndtcFzuz0PuwybPDBln
nZEOnXm8ys037q0QJRBU3e56/Z3C/Fk0E1491Q8L+WAsNt4Z2tfVDts1lAB28FGj
WeL88SJYdp4kMPJLGXXLFhQdd/wgxYWBKGzH6paay7mMuC/Cko9UXGXdCtBnVZpz
B6+nho447DrClURm98rZXoBU6rEYbuaShj91BC6z16jIP3vvXuMIx7gOz9oVCU4u
IVZwDMeTxZSzxHaI7rSsif4NCj+yfl7pjajsMQThXJP1fDU7LnajHjTCmtpRliQF
DUTnf+SUvG7MvEiWRo6MSp9iINlXJCxQr2hNPfy7jYDeUf/QeTjbyoEwHNF6suy+
+06tA1AM6ysIkhS8FMPH5AeyRegtqpkfqwXZDOEj4vZIBQ8EIC/fup+GlXnxYPmW
mpPLChV81OoDEzhfQo8F/tbTprbi0M+rGaAY1NtARYWweXir3N8EMBpJnwKinsM8
uWPcnTEwOPY6yAO5IrncKsckgOYgbjAYLZ80cFXeZHxcC71+g0b0hVREuwG6F6VT
eeuX02yoRLik11YCIPwadm61cVukhJlsA8J9o5UOIHfr2stl8pVqiYIqtjmunglY
ZDYfbzZQIvaQwszzcMgqsP7UBHQkru8RcgLxCB7vLVQU8Pd/QfQCof1kWy68GMTL
YtAofw78fNepcmU1mCfY6ihVbhy84lrhC63G3SeLPhHwLtrL+krCe0HWTq0PLQxS
htigQzpC99fSZDalTlISEfoqlzo/G7RBjqkPcfrpnWRKCW7DpyVR7wjTXKquAV9K
7F+zR5gCSSGuv66TfivVsTifEo7fVPbencgnBU8wrFMlZE8PA62H7hLuYkugOP9W

//pragma protect end_data_block
//pragma protect digest_block
9BQPE9ytI6S7jxX2L2BI9aF07+8=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
NDno38JZzOZnrm68FVwTIbYyon/qr1sAfUF88XoeEqB0/izifcoRXfQQNswYemS7
1uM6KyihU8YYY3wEvnkoayxCT1mc8ag2QrMuj1At/fopt17BltTKR7lJefWNIWNm
1yyyH8J+fyckg+p7wqjUape3QpAsARX79foXqpWNjAR8LG26uXmjRg==
//pragma protect end_key_block
//pragma protect digest_block
rcP9c8s5zRAeAOWw+OTrGtjJGBE=
//pragma protect end_digest_block
//pragma protect data_block
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
xNwTF8H4LkdOKzQQGI4vqQ==
//pragma protect end_data_block
//pragma protect digest_block
GaqmsaEXVjj6KiiPzy9p1D9Bw0k=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_ERR_CHECK_STATS_SV


