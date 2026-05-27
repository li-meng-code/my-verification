//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_SVC_ERR_CHECK_STATS_SV
`define GUARD_SVT_SVC_ERR_CHECK_STATS_SV

// =============================================================================
/**
 * Error Check Statistics Class extension for SVC interface 
 */
class svt_svc_err_check_stats extends svt_err_check_stats;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  /** Handle to associated svc_msg_mgr */
  svt_svc_message_manager svc_msg_mgr;

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_svc_err_check_stats)
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
  `svt_data_member_begin(svt_svc_err_check_stats)
  `svt_data_member_end(svt_svc_err_check_stats)

  // ---------------------------------------------------------------------------
  /** Returns a string giving the name of the class. */
  extern virtual function string get_class_name();

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
  
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
VXDZXuBp6/gwLQeKny5yqaFgyETdvozKJ7VmkcvudxseFzViacmwHkeksIWhUwfQ
oG/6JMQwi+is8Ie3GOvW2Tj24FDM4P9ojwCMHcSD1HjTtwRep82hY7Ja7C6hpURO
vGZhkKb89Pe6UuqbvupYhMmnK5CJX4sGc+SaNqk7UesZwzIRXXu+Bw==
//pragma protect end_key_block
//pragma protect digest_block
kC+89s5E14ocEyTR/59LNCET9jo=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
hVUsFYqhKAMlNeIvLNhgaSbEF4E=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SVC_ERR_CHECK_STATS_SV


