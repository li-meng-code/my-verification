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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PNPetLNb8YMEeIQYwyyd3byv2b1RgZ5FC86n9iuq+FwEyU6TXI1CdrcMqdz4v4l+
AV4gokD6161KwbKufnZscawaZ8GOPbuWU29+OfnsyN5WXLA2ISqrM0tj8lbFnpwg
5g9CqlmtEu639pSnsDcWcItVYMAaBxjZA8irE8Q4hRg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2303      )
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
`pragma protect end_protected

`endif // GUARD_SVT_SVC_ERR_CHECK_STATS_SV


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IUq5+6U2w2JnW+teA08Iw2w0AMbWFlrKj+EmABORoCoSIopTP8iNEjxTOENY6Ly5
bEtHwOP2pyt5QKQM/Z64FIjLd6gTFlpDBrb6eMkLPsLjnx8qWEES5/IGsKTR3XCi
2Ht75i3A6ZpzsLqq5e85T7c2c7VQ+0atul8S3HxVW+w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2386      )
OoVPs2VjyciJ94jeuUW92VNwIDYIIZzlL8yw2OTwLQByZJYwlPCxhAWg6GA4qpZX
asEHBQqblwmpqeoDKrxcR8Xsu9h/QKRxbxr+zHOZe7UnsJmfjv/GKDwKMzMIzVbJ
`pragma protect end_protected
