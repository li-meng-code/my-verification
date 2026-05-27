//=======================================================================
// COPYRIGHT (C) 2007-2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_XACTOR_BFM_SV
`define GUARD_SVT_XACTOR_BFM_SV

`include "VmtDefines.inc"

// Kind used for byte_size, byte_pack, byte_unpack, and compare
`define DW_VIP_VMT_LOGICAL  9        

// is_valid return value which indicates "ok" or "valid"
`define DW_VIP_XACT_OK 0

// Backwards compatibility macros used to bridge a couple of VMT versions
`ifndef VMT_MSG_EVENT_ARG_TEXT_SIZE
`define VMT_MSG_EVENT_ARG_TEXT_SIZE `VMT_MSG_EVENT_TEXT_SIZE
`define SVT_XACTOR_BFM_MSG_ID_DISABLED
`endif
`ifndef VMT_MSG_EVENT_ARG_TEXT
`define VMT_MSG_EVENT_ARG_TEXT `VMT_MSG_EVENT_TEXT
`endif

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT BFM transactors.
 */
virtual class svt_xactor_bfm extends svt_xactor;

  /**
   * Transactor id used to associate this transactor with a VMT Verilog VIP
   * instance.
   */
  int xactor_id;

  /**
   * ON_OFF notification that is set to ON when the reconfigure() method is
   * completed.
   */
  int NOTIFY_RECONFIGURE_DONE;

  /**
   * ON_OFF notification that is set to ON when the get_xactor_cfg() method is
   * completed.
   */
  int NOTIFY_GET_XACTOR_CFG_DONE;

  /**
   * ON_OFF notification that is set to ON when the reset_xactor() method is
   * completed.
   */
  int NOTIFY_RESET_XACTOR_DONE;

  /**
   * ON_OFF noticiation that is set ot ON when the VMT model has been started.
   * It is reset during the stop_xactor() and reset_xactor() methods.
   */
  int NOTIFY_VMT_MODEL_STARTED;

  /** Controls whether VMT notify messages result in display messages. */
  bit enable_vmt_notify_display = 0;

  /** Controls whether VMT messages include the MSG_ID information. */
  bit enable_vmt_msg_id_display = 0;

// From dw_vip_transactor_rvm
// ----------------------------------------------------------------------------
/** @cond PRIVATE */
  int msg_to_notify_id_map[]; 
  int msg_to_notify_type_map[]; 

  // Vmt Suite Level messages
  //DEFINE_NOTIFY_MSG_TYPES_DW_VIP
  //DEFINE_NOTIFY_MSG_IDS_VMTBASE
  //DEFINE_NOTIFY_MSG_IDS_VMTCOMMON
  //DEFINE_NOTIFY_MSG_IDS_VMTCOMMANDMANAGER
  //DEFINE_NOTIFY_MSG_IDS_VMTCOVERAGE
  //DEFINE_NOTIFY_MSG_IDS_VMTMEM
  //DEFINE_NOTIFY_MSG_IDS_VMTMESSAGESERVICE
  //DEFINE_NOTIFY_MSG_IDS_VMTCOMMONCOMMANDS
  //DEFINE_NOTIFY_MSG_IDS_VMTTRANSACTION


// From dw_vip_gasket_rvm
// ----------------------------------------------------------------------------
  protected svt_data xacts [*];
  protected int cmd_handles [*];
  protected int xact_cnt = 0;

  protected int out_in_xact_map [*];

  protected int max_active_chan_mgr [];


// New for the BFM xactor
// ----------------------------------------------------------------------------
  /**
   * Handshake from the derived transactor that indicates that
   * change_static_cfg() is done.
   */
  protected event change_static_cfg_done;
  /**
   * Handshake from the derived transactor that indicates that
   * get_static_cfg() is done.
   */
  protected event get_static_cfg_done;

  /**
   * Counter needed because the methods used to set the configuration are all
   * void functions, but the VMT method set_config_param() is a task.  Since
   * tasks can not be called from functions, then all of the calls to
   * set_config_param() must be placed within a fork/join_none structure.
   * 
   * Since the set_config_param() methods are in a seperate thread, then there
   * is the possibility that the reconfigure() method could return before the
   * VMT model is fully configured.  Therefore, this counter is initialized
   * with a value of 2 when the reconfigure() method is called, and a thread
   * is started that monitors the value of the counter, and the
   * NOTIFY_RECONFIGURE_DONE notification is reset (set to OFF).  When all of
   * the calls to set_config_param() are completed in change_static_cfg() and
   * change_dynamic_cfg() in the derived transactor, then this counter is
   * decremented.  Once this counter reaches zero, then the
   * NOTIFY_RECONFIGURE_DONE notification is triggered (set to ON).
   */
  protected int config_set_threads;

  /**
   * Counter needed because the methods used to get the configuration are all
   * void functions, but the VMT method get_config_param() is a task.  Since
   * tasks can not be called from functions, then all of the calls to
   * get_config_param() must be placed within a fork/join_none structure.
   * 
   * Since the get_config_param() methods are in a seperate thread, then there
   * is the possibility that the get_xactor_config() method could return before
   * the configuration object is fully populated.  Therefore, this counter is
   * initialized with a value of 2 when the get_xactor_config() method is
   * called, and a thread is started that monitors the value of the counter,
   * and the NOTIFY_GET_XACTOR_CFG_DONE notification is reset (set to OFF).
   * When all of the calls to get_config_param() are completed in
   * get_static_cfg() and get_dynamic_cfg() in the derived transactor, then
   * this counter is decremented.  Once this counter reaches zero, then the
   * NOTIFY_GET_XACTOR_CFG_DONE notification is triggered (set to ON).
   */
  protected int config_get_threads;

/** @endcond */


  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor instance, passing the appropriate argument
   * values to the svt_xactor parent class.
   *
   * @param suite_name Identifies the product suite to which the xactor object belongs.
   * 
   * @param class_name Sets the class name, which will be returned by the
   * <i>get_name()</i> function (provided by vmm_xactor).
   * 
   * @param cfg A configuration data object that specifies the initial configuration
   * in use by a derived transactor. At a minimum the <b>inst</b> and <b>stream_id</b>
   * properties of this argument are used in the call to <i>super.new()</i> (i.e. in
   * the call that this class makes to vmm_xactor::new()).
   */
  extern function new(string suite_name,
                      string class_name,
                      svt_configuration cfg,
                      int xactor_id = -1);

  /**
   * Sets the value of the transactor ID.  This is only needed when using IUS.
   */
  extern function void set_xactor_id(int id);

  /**
   * Gets the value of the transactor ID.  This is only needed when using IUS.
   */
  extern function int get_xactor_id();

// From dw_vip_transactor_rvm
// ----------------------------------------------------------------------------
  extern protected function bit[15:0] map_vmm_to_vmt_reset_types( int rst_type );

  extern virtual protected function int map_msg_type_to_vmm_type( int msg_type );
  extern virtual protected function int map_msg_type_to_vmm_severity( int msg_type );

  extern function void process_internal_messages();


// From dw_vip_gasket_rvm
// ----------------------------------------------------------------------------
  // Functions provided by the different model transactors to create model xacts of
  // proper type
  extern virtual task new_typed_xact_handle ( int chan_id, ref int handle );
  extern virtual task new_xact_specific_handle ( int chan_id, svt_data svt_xact, ref int handle );
  extern virtual protected function svt_data new_typed_out_xact ( int chan_id );

  // rvm methods
  extern virtual function void start_xactor();
  extern virtual function void stop_xactor();
`ifdef SVT_MULTI_SIM_ENUM_SCOPE_IN_EXTERN_METHOD_ARG
  extern virtual function void reset_xactor(vmm_xactor::reset_e rst_typ = SOFT_RST);
`else
  extern virtual function void reset_xactor(reset_e rst_typ = SOFT_RST);
`endif
  // common vip methods
  extern virtual protected task manage_chan ( int chan_id, int n_threads = 1, vmm_channel chan = null );
  extern virtual protected task catch_buffer_event ( int msg_id, int buf_arg_id, int chan_id );
  extern virtual protected task catch_output_transaction ( int msg_id, int arg_id, int chan_id );
  extern virtual protected task catch_out_in_transaction ( int msg_id, int out_arg_id, int in_arg_id, int chan_id );
  extern virtual protected task catch_initiation ( int msg_id, int arg_id );
  extern virtual protected task catch_completion ( int msg_id, int arg_id );

  extern virtual task catch_msg_id(int msg_id);
  extern virtual protected task catch_msg_trigger (int wp_handle, int arg_id, int arg_type, int arg_size, event watch_trigger, ref int obj_handle, ref int int_arg_data, ref string str_arg_data, ref bit [15:0] bv_arg_data, ref int status );

  // Note: getXact_t is changed from a function to a task.  Also renamed so as to not
  //       collide with getXact below.
  extern virtual task get_chan_xact ( int chan_id, ref svt_data xact );
  extern virtual task finish_xact ( int chan_id, svt_data svt_xact );
  extern virtual task garbage_collect_wp_xact ( int xact_as_handle );
  extern virtual task sneak_xact ( int chan_id, svt_data svt_xact );
  extern virtual task sync_cmd_stream ( ref int status );

  extern virtual protected task do_post_chan_get ( int chan_id, svt_data svt_xact, ref bit drop );
  extern virtual protected task do_pre_chan_put ( int chan_id, svt_data svt_xact, ref bit drop );
  extern virtual protected task do_buffer_cb ( int chan_id, int msg_id, int xact_as_handle, svt_data svt_xact, int obj_handle );
  extern virtual protected task map_transaction ( int chan_id, int xact_as_handle, svt_data svt_xact, ref int status );
  extern virtual protected task map_to_transaction ( int chan_id, int xact_as_handle, svt_data svt_xact );

  extern protected task start_command ( int cmd_handle );
  extern protected task end_command ( int cmd_handle );

  //extern protected task clear_xacts ( );
  extern protected function void clear_xacts ( );
  extern protected task set_xact ( int cmd_handle, svt_data svt_xact );
  extern protected function svt_data get_xact ( int cmd_handle );
  extern protected function int get_cmd_handle ( svt_data svt_xact );

  extern virtual protected task set_max_active_chan_mgr ( int chan_id );

// From svt_xactor
// ----------------------------------------------------------------------------
  /** Extended to update the NOTIFY_RECONFIGURE_DONE notification. */
  extern virtual function void reconfigure(svt_configuration cfg);
  extern virtual function void get_xactor_cfg(ref svt_configuration cfg);
  extern task get_xactor_bfm_cfg(ref svt_configuration cfg);

  // Declare all of the virtual methods which allow access to the base VMT commands
  `SVT_XACTOR_BFM_VMT_CMD_METHODS_DECL
endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Oc7/TKS67zdsHGq/yXZ5dPoyfz6lFGC4HPXzUST5K8DEZCjzgF8DlSX9TU5EXP8g
34ErFaZJGHXEpJuk+Xqx6Wje55HHuTYp2ZAlO5iJgWszHRsPV39SnHXWRXWroFaL
xXvStBiQrvM6EyLW2D+96QKRSpVICFS2vcvooV5AOHA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 35135     )
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
`pragma protect end_protected

`endif // GUARD_SVT_XACTOR_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bAQnCDuQMY/w8Vmf6fKsHb8frnzdArD82BHDG1RRGh6FAiPiAunVzUvOF7YZaQpq
wssiTgUaDwhEh6lGCF5nS1msMQR8BHRa7OtIe28eFLQPoTwW4alaiUUgtnVnjHo4
jxGJziToNFLkYAPfF8e4S5k9orCGW5FeEgsXDcKMtEw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 35218     )
YGNOEsg/tCHl0C/YFirq/VscvvISxP2vXPeP0W89QU9MNtXvXqV5CnS6B/+NRiB4
oObi4KyfnkeXyaitV/QEZpDZEMyPkIpcHEjecoP0VLS/mAG6uny/NZeBmCKFiG9Y
`pragma protect end_protected
