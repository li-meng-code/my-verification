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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ENFPRUID0PoBLia6EFnoxKXel/zhtiS2qdDG8aRiXyLTon/3a+nReW/NHX+VdLEC
g/iKkckrbSHHZ9Za1DVilG0fz9C4ndby6229iP8yXiel5e/b26MIw3ce0dFVdAmt
8dJi5ymgbNq1rL+bRM6M2gRGqBHopVJfh414FT6PrdPj5gh/zsd4Zw==
//pragma protect end_key_block
//pragma protect digest_block
TB5NXV+VHml0TV4Pqh84pTlFeLI=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
ylSejRsQx9TAVXZ0t34biLzsWO4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_XACTOR_CALLBACK_SV









