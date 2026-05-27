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

`ifndef GUARD_SVT_XACTOR_CALLBACK_SV
`define GUARD_SVT_XACTOR_CALLBACK_SV

typedef class svt_xactor;

// =============================================================================
/**
 * Provides a layer of insulation between the vmm_xactor_callbacks
 * class and the callback facade classes used by SVT models. All callbacks in SVT
 * model components should be extended from this class.
 * 
 * At this time, this class does not add any additional functionality to
 * vmm_xactor_callbacks, but it is anticipated that in the future new
 * functionality (e.g. support for record/playback) <i>will</i> be added.
 */
//svt_vipdk_exclude
`ifdef SVT_VMM_TECHNOLOGY
//svt_vipdk_end_exclude
virtual class svt_xactor_callback extends vmm_xactor_callbacks;
//svt_vipdk_exclude
`elsif SVT_OVM_TECHNOLOGY
class svt_xactor_callback extends svt_callback; // OVM cannot handle this being virtual
`else
virtual class svt_xactor_callback extends svt_callback;
`endif
//svt_vipdk_end_exclude

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** 
   * A pointer to the transactor with which this class is associated, only valid
   * once 'start' has been called. 
   */
  protected svt_xactor xactor = null;

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

//svt_vipdk_exclude
`ifdef SVT_VMM_TECHNOLOGY
//svt_vipdk_end_exclude
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor callback instance, passing the appropriate
   * argument values to the vmm_xactor_callbacks parent class.
   *
   * @param suite_name Identifies the product suite to which the xactor callback
   * object belongs.
   * 
   * @param name Identifies the callback instance.
   */
  extern function new(string suite_name="", string name = "svt_callback");
//svt_vipdk_exclude
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor callback instance, passing the appropriate
   * argument values to the ovm/uvm_callback parent class.
   *
   * @param suite_name Identifies the product suite to which the xactor callback
   * object belongs.
   * 
   * @param name Identifies the callback instance.
   */
  extern function new(string suite_name = "", string name = "svt_xactor_callback_inst"); 
`endif
//svt_vipdk_end_exclude

//svt_vipdk_exclude
  //----------------------------------------------------------------------------
  /**
   * Method implemented to provide access to the callback type name.
   *
   * @return The type name for the callback class.
   */
  extern virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();

//svt_vipdk_end_exclude
  //----------------------------------------------------------------------------
  /**
   * Callback issued by transactor to allow callbacks to initiate activities.
   * This callback is issued during svt_xactor::main() so that any processes
   * initiated by this callback will be torn down if svt_xactor::reset_xactor()
   * is called. This method sets the svt_xactor_callback::xactor data member.
   *
   * @param xactor A reference to the transactor object issuing this callback.
   */
  extern virtual function void start(svt_xactor xactor);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by transactor to allow callbacks to suspend activities.
   *
   * @param xactor A reference to the transactor object issuing this callback.
   */
  extern virtual function void stop(svt_xactor xactor);

  // ---------------------------------------------------------------------------
  /**
   * Provides access to an svt_notify instance, or in the case of the vmm_xactor
   * notify field, the handle to the transactor. In the latter case the transactor
   * can be used to access the associated vmm_notify instance stored in notify.
   * The extended class can use this method to setup a reliance on the notify
   * instance.
   *
   * @param xactor A reference to the transactor object issuing this callback.
   *
   * @param name Name identifying the svt_notify if provide, or identifying
   * the transactor if the inform_notify is being issued for the 'notify' field on
   * the transactor.
   *
   * @param notify The svt_notify instance that is being provided for use. This
   * field is set to null if the inform_notify is being issued for the 'notify'
   * field on the transactor.
   */
  extern virtual function void inform_notify(svt_xactor xactor, string name, svt_notify notify);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by transactor to pull together current functional coverage information.
   *
   * @param xactor A reference to the transactor object issuing this callback.
   * @param prefix Prefix that should be included in each line of the returned 'report' string.
   * @param kind The kind of report being requested. -1 reserved for 'generic' report.
   * @param met_goals Indicates status relative to current coverage goals.
   * @param report Short textual report describing coverage status.
   */
  extern virtual function void report_cov(svt_xactor xactor, string prefix, int kind, ref bit met_goals, ref string report);

  // ---------------------------------------------------------------------------
endclass

/** The following is defined in all methodologies for backwards compatibility purposes. */
typedef svt_xactor_callback svt_xactor_callbacks;

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
GL4kR0o8zsl84uZ9mK8rDkAKGosVALxgB0NAZtlVPIoxsuMxWCOQVA3TIGe2zJj+
UolNCtLA/irMtVqhkohp7w2BFTlzepzcQmcdjdx0BVe+Q5aW2uQdIdun6oeEqK/W
Kle74cDCsSK5sbWAlp+3nVNf5GwjaW8WO/nvDSc1l50=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1916      )
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
`pragma protect end_protected

`endif // GUARD_SVT_XACTOR_CALLBACK_SV









`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BiGh8b3LlIStIdOenClRvWhGyYpkP71hN4aX8i1nN1jtlzrebappPCMUrTk/Imnl
k1AjdlywgvXnBlcdqPe5BjImYfmvLDd9A8c/9nIilF5dbsba6LSyPwGRsSA9ogbv
RG5mu7+ohzKdoHSZgGjcHtcdYlnvVKg3FD4vZ0ekRNU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1999      )
YGfzYX3EQ7mPliypRZliuWbe44ydmFc1xMi94pTx8nPv4bvbovi55j+fhAaKfeEo
ukvMOJvwDpAW7whbLiDNNyftwakW0sPi8Z7vcQnUxpnRv7YErecLI9G0OsBBU7d4
`pragma protect end_protected
