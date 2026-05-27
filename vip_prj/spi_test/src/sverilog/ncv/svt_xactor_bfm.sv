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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
p3u4F7fR9MTzG5/AD2LojXQuLY2AUNbZOcRmMAKY+tYrgNESToDowkAYWT7KcAj0
s1EEf1XFnR++SlCDPypW/S5qvxSgWhWsu7iFOB72AO/NETK6OSE1i4jy9aW8ckbQ
CaopjyiQzIHu9zhemHKMEAeB6nOieceS7JycP8brME1ikE1VpqCvYQ==
//pragma protect end_key_block
//pragma protect digest_block
WjL0U1qHIfatJgwSrgRbiLOEShU=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
kjQrvcPMUsnGzTuFrMgiFf9pMoA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_XACTOR_BFM_SV
