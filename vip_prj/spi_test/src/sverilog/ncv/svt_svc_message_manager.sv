//=======================================================================
// COPYRIGHT (C) 2013-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_SVC_MESSAGE_MANAGER_SV
`define GUARD_SVT_SVC_MESSAGE_MANAGER_SV

`ifndef __SVDOC__
// SVDOC can't handle this many parameters to a macro...

/**
 * This macro basically just deals with the optional id value and then redirects things to the svt_message_manager macro.
 * This macro basically just drops the optional id value if it is encountered. It also only passes along the 0th arg and
 * the first 19 of 20 'other' args if no optional id value is encountered.
 */
`define SVT_SVC_MESSAGE_MANAGER_REPORT_MESSAGE(dbglvl,id_or_format,format_or_arg0=0,arg1=0,arg2=0,arg3=0,arg4=0,arg5=0,arg6=0,arg7=0,arg8=0,arg9=0,arg10=0,arg11=0,arg12=0,arg13=0,arg14=0,arg15=0,arg16=0,arg17=0,arg18=0,arg19=0,arg20=0) \
  do begin \
    bit has_obj_id; \
    has_obj_id = !svt_message_manager::is_string_var($typename(id_or_format)); \
    if (has_obj_id) begin \
      int message_id; \
      string f_or_arg0_str; \
      message_id = id_or_format; \
      f_or_arg0_str = $sformatf("%0s", format_or_arg0); \
      /* No SVC clients current rely on this feature, and its expensive, so skip it */ \
      /* If and when clients need it, they should just call sformatf at the source */ \
      /* svt_message_manager::replace_percent_m(f_or_arg0_str, DISPLAY_NAME); */ \
      `SVT_MESSAGE_MANAGER_REPORT_ID_MESSAGE(DISPLAY_NAME,`SVT_SVC_MESSAGE_MANAGER_SHARED_MSG_MGR_NAME,dbglvl,-1,f_or_arg0_str,message_id,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20); \
    end else begin \
      string id_or_f_str; \
      id_or_f_str = $sformatf("%0s", id_or_format); \
      /* No SVC clients current rely on this feature, and its expensive, so skip it */ \
      /* If and when clients need it, they should just call sformatf at the source */ \
      /* svt_message_manager::replace_percent_m(id_or_f_str, DISPLAY_NAME); */ \
`ifdef QUESTA \
      /* Questa works way too hard to try and look for format mismatches during compilation, etc. For */ \
      /* example it appears to assume 'has_obj_id' is '0', and execute the compile checking as if all */ \
      /* messages are non-ID messages. Which means ID messages are checked relative to the non-ID block. */ \
      /* This results in the ID 'format' argument being processed as the second $sformatf field. For some */ \
      /* reason Questa actually sees the argument placeholders (e.g., %0d) in this second $sformatf field, */ \
      /* and complains if there aren't subsequent arguments for all of the format argument placeholders. */ \
      /* To get past this we send the 'format_or_arg0' value into the macro selectively based */ \
      /* on the 'has_obj_id' setting. This is enough to get Questa to skip the type checking. */ \
      `SVT_MESSAGE_MANAGER_REPORT_MESSAGE(DISPLAY_NAME,`SVT_SVC_MESSAGE_MANAGER_SHARED_MSG_MGR_NAME,dbglvl,-1,id_or_f_str,(has_obj_id)?0:format_or_arg0,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19); \
`else \
      `SVT_MESSAGE_MANAGER_REPORT_MESSAGE(DISPLAY_NAME,`SVT_SVC_MESSAGE_MANAGER_SHARED_MSG_MGR_NAME,dbglvl,-1,id_or_f_str,format_or_arg0,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19); \
`endif \
    end \
  end while (0)

`endif

`define SVT_SVC_MESSAGE_MANAGER_LOG_ERR           0  // ERROR - big problem.
`define SVT_SVC_MESSAGE_MANAGER_LOG_WARN          1  // WARNINGS - some kind of problem.
`define SVT_SVC_MESSAGE_MANAGER_LOG_NOTE          2  // Notice - something that may be an issue, but not illegal
`define SVT_SVC_MESSAGE_MANAGER_LOG_INFO          3  // Informational
`define SVT_SVC_MESSAGE_MANAGER_LOG_TRANSACT      4  // Transaction level
`define SVT_SVC_MESSAGE_MANAGER_LOG_FRAME         5  // Frame level messages
`define SVT_SVC_MESSAGE_MANAGER_LOG_DWORD         6  // DWORD / PRIM debug-level messages
`define SVT_SVC_MESSAGE_MANAGER_LOG_DEBUG         7  // debug-level messages

`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_NO_TIMESTAMP   32'h0000_0100 /* Don't display the timestamp */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_NO_LOG_LEVEL   32'h0000_0200 /* Don't display the Log Level */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_NO_PREFIX      32'h0000_0300 /* Neither Timestamp nor Log Level are displayed */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_NO_NEWLINE     32'h0000_0400 /* Neither Timestamp nor Log Level are displayed */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_TRANSACTION    32'h0000_0800 /* This is a transaction msglog, write to trace file, ignoring log level */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_START_BUFFER   32'h0000_2000 /* Start Buffered Message */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_FLUSH_BUFFER   32'h0000_4000 /* Flush Buffered Message */
`define SVT_SVC_MESSAGE_MANAGER_LOG_OPT_MASK           32'h0000_FF00

`define SVT_SVC_MESSAGE_MANAGER_SHARED_MSG_MGR_NAME "shared_svc_msg_mgr"

`ifndef SVT_INCLUDE_SVC_MESSAGING
`define SVT_SVC_MESSAGE_MANAGER_USE_SVT_MESSAGING_EXCLUSIVELY
`endif

`ifdef SVT_SVC_MESSAGE_MANAGER_USE_SVC_MESSAGING_EXCLUSIVELY
`define SVT_SVC_MESSAGE_MANAGER_USE_SVC_FOR_LINE_OPT
`endif

// Unset the macro if enabled for unit testing so that the additional methods
// are tested
`ifdef SVT_SVC_MESSAGE_MANAGER_UNIT_TESTING
`undef SVT_SVC_MESSAGE_MANAGER_USE_SVT_MESSAGING_EXCLUSIVELY
`endif

// =============================================================================
/**
 * This class provides access to the methodology specific reporting facility.
 * The class provides SVC specific interpretations of the reporting capabilities,
 * and provides support for SVC specific methods.
 */
class svt_svc_message_manager extends svt_message_manager;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  /** Used to build up messages across report_message calls. */
  protected string buffered_message = "";

  /** Used to watch for client_verbosity (i.e., without OPT bits) conflicts between buffered messages. */
  protected int buffered_client_verbosity = -1;

  /** Used to watch for client_severity conflicts between buffered messages. */
  protected int buffered_client_severity = -1;

  /** Used to watch for message_id conflicts between buffered messages. */
  protected int buffered_message_id = -1;

  /** Retains the source filename for buffered messages. */
  protected string buffered_filename = "";

  /** Retains the source line number for buffered messages. */
  protected int buffered_line = 0;

  /**
   * Used to indicate that the manager is currently buffering a message. Note that we cannot rely on
   * the len method on the buffered_message field as we may be buffering but currently have an empty
   * message.
   */
  protected bit buffer_is_active = 0;

  /**
   * Indicates whether we are at the beginning of a new line in the output. This is initialized to 0 to
   * that the first line of any output buffer appears on the same line as the prefix.
   */
  protected bit buffered_line_begin = 0;

  /** Flag to indicate whether or not to extract method from SVC message
   * string.  This can be set by individual titles in extensions of 
   * this class.
   */
`ifdef SVT_SVC_MESSAGE_MANAGER_EXTRACT_MESSAGE_ID
  protected bit svc_message_manager_extract_message_id = 1;
`else
  protected bit svc_message_manager_extract_message_id = 0;
`endif
  

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Static default svt_svc_message_manager which can be used when no preferred svt_svc_message_manager is
   * available.
   */
`ifdef SVT_VMM_TECHNOLOGY
  static svt_svc_message_manager shared_svc_msg_mgr = new(`SVT_SVC_MESSAGE_MANAGER_SHARED_MSG_MGR_NAME);
`else
  static svt_svc_message_manager shared_svc_msg_mgr = new(`SVT_SVC_MESSAGE_MANAGER_SHARED_MSG_MGR_NAME, `SVT_XVM(root)::get());
`endif

  /**
   * Identifies svt_svc_message_manager which has an active message buffered. Message managers setting
   * up their own buffers must make sure active buffers are cleared before initiating their own buffer
   * activities.
   */
  static svt_svc_message_manager active_svc_msg_mgr = null;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new SVC Message Manager instance.
   *
   * @param name Name associated with the message manager, used to add the message manager to the preferred_msg_mgr array.
   * @param log The log associated with this message manager resource.
   */
  extern function new(string name = "", vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new SVC Message Manager instance.
   *
   * @param name Name associated with the message manager, used to add the message manager to the preferred_msg_mgr array.
   * @param reporter The reporter associated with this message manager resource.
   */
  extern function new(string name = "", `SVT_XVM(report_object) reporter = null);
`endif

  //----------------------------------------------------------------------------
  /**
   * Method used to report information to the transcript.
   *
   * @param client_verbosity Client specified verbosity which helps define the output level.
   * @param client_severity Client specified severity which helps define the output level.
   * @param message Text to be reported.
   * @param message_id Optional ID associated with the text to be reported.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern virtual function void report_message(int client_verbosity, int client_severity, string message, int message_id = -1,
                                              string filename = "", int line = 0);

`ifndef SVT_SVC_MESSAGE_MANAGER_USE_SVT_MESSAGING_EXCLUSIVELY
  //----------------------------------------------------------------------------
  /**
   * Method used to get the current client specified verbosity level. Useful for controlling output generation.
   *
   * @return The current client specified verbosity level associated with this message manager.
   */
  extern virtual function int get_client_verbosity_level();
`endif

  //----------------------------------------------------------------------------
  /**
   * Method used to get the current client specified verbosity via a local message manager.
   * 
   * If the supplied message manager is non-null then this method obtains the verbosity
   * level through that. If the supplied message manager is null then a message
   * manager is first obtained using find_message_manager, and then the verbosity level is
   * obtained through that.
   * 
   * The message manager that is used is returned through the provided msg_mgr argument, which
   * is a ref argument. This can then be used to update the local reference so that the lookup
   * does not need to be performed again.
   *
   * @param msg_mgr Reference to the local message manager
   * @param pref_mgr_id ID of the preferred message manager
   * @param def_mgr_id ID of the default message manager
   * @return The current client specified verbosity level associated with the local message manager.
   */
  extern static function int localized_get_client_verbosity_level(ref svt_svc_message_manager msg_mgr, input string pref_mgr_id, string def_mgr_id);

  //----------------------------------------------------------------------------
  /**
   * Method used to convert from client technology verbosity/severity to methodology verbosity/severity.
   *
   * @param client_verbosity Client specified verbosity value that is to be converted.
   * @param client_severity Client specified severity value that is to be converted.
   * @param methodology_verbosity The methodology verbosity value corresponding to the client provided technology verbosity.
   * @param methodology_severity The methodology severity value corresponding to the client provided technology severity.
   * @param include_prefix Indicates whether the resulting message should include a prefix.
   * @param include_newline Indicates whether the resulting message should be preceded by a carriage return.
   */
  extern virtual function void get_methodology_verbosity(int client_verbosity, int client_severity,
                                                         ref int methodology_verbosity, ref int methodology_severity,
                                                         ref bit include_prefix, ref bit include_newline);

  //----------------------------------------------------------------------------
  /**
   * Method used to convert from methodology verbosity/severity to client technology verbosity/severity.
   *
   * @param methodology_verbosity Methodology verbosity value that is to be converted.
   * @param methodology_severity Methodology severity value that is to be converted.
   * @param client_verbosity The client verbosity value corresponding to the methodology verbosity.
   * @param client_severity The client severity value corresponding to the methodology severity.
   */
  extern virtual function void get_client_verbosity(int methodology_verbosity, int methodology_severity, ref int client_verbosity, ref int client_severity);

  //----------------------------------------------------------------------------
  /**
   * Method used to remove client specific text or add methodology specific text to an 'in process' display message.
   *
   * @param client_message Client provided message which is to be converted to a methodology message.
   *
   * @return Message after it has been converted to the current methodology.
   */
  extern virtual function string get_methodology_message(string client_message);

  //----------------------------------------------------------------------------
  /**
   * Method used to remove client specific text or add methodology specific text to an 'in process' display message,
   * and also to pull out the messageID if provided in the message.
   *
   * @param client_message Client provided message which is to be converted to a methodology message.
   * @param message_id The ID extracted from the client message.
   * @param message The final message extracted from the client message.
   */
  extern virtual function void get_methodology_id_and_message(string client_message, ref string message_id, ref string message);

  //----------------------------------------------------------------------------
  /** Utility used to flush the current buffer contents. */
  extern virtual function void flush_buffer();

  //----------------------------------------------------------------------------
  /**
   * Method used to push a message to the transcript immediately.
   *
   * @param client_verbosity Client specified verbosity which helps define the output level.
   * @param client_severity Client specified severity which helps define the output level.
   * @param message Text to be reported.
   * @param message_id ID associated with the text to be reported.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern virtual function void flush_message(int client_verbosity, int client_severity, string message, int message_id,
                                             string filename = "", int line = 0);

  //----------------------------------------------------------------------------
  /**
   * Utility method that can be used to decide if the client verbosity can be supported.
   *
   * @param client_verbosity Client specified verbosity value that is to be evaluated.
   *
   * @return Indicates whether the client_verbosity corresponds to a support verbosity level (1) or not (0).
   */
  extern static function bit is_supported_client_verbosity(int client_verbosity);

`ifndef SVT_SVC_MESSAGE_MANAGER_USE_SVT_MESSAGING_EXCLUSIVELY
  //----------------------------------------------------------------------------
  /**
   * Method used to redirect a message back to the $msglog utility.
   *
   * @param client_verbosity Client specified verbosity which helps define the output level.
   * @param message Text to be reported.
   * @param message_id Optional ID associated with the text to be reported.
   */
  extern virtual function void msglog(int client_verbosity, string message, int message_id = -1);
`endif

  // ---------------------------------------------------------------------------

endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
EZdAzqPVuLV3qq4tYgRoMxGxmyYc0+v2xQRgt11sgeTlSd5wdDUN59qLgZGAj0Uv
4B9vSUCUQAmIkaVxvXIDZhJ698nwBypdzPtHatbB87M6w5drKoEGxiqasrkx8joo
8i2P43DfLFW4NzHoQANkLsLQBNaR6U7GHonBdQXx6HVebtttDvl2fg==
//pragma protect end_key_block
//pragma protect digest_block
tvTvhvz4TaSY+tsH/GW02l7zM5o=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
CDwUEWJb6C+e+wCRSmD9WAsM3yE=
//pragma protect end_digest_block
//pragma protect end_protected

///////////
// NOTE: After encountering encryption problems with this on some simulator versions, leaving this unencrypted
///////////

`ifndef SVT_SVC_MESSAGE_MANAGER_USE_SVT_MESSAGING_EXCLUSIVELY
//------------------------------------------------------------------------------
function void svt_svc_message_manager::msglog(int client_verbosity, string message, int message_id = -1);
`ifdef VIP_INTERNAL_BUILD
`ifndef SVT_SVC_MESSAGE_MANAGER_USE_SVC_MESSAGING_EXCLUSIVELY
    // If not relying on SVC messaging, should never have to reroute messages to $msglog
`ifdef VCS
    $stack;
`endif
    `svt_warning("msglog", $sformatf("Message manager '%0s' rerouting message '%0s' to $msglog.", this.get_name(), message));
`endif
`endif
  if (message_id == -1) begin
`ifndef SVT_SVC_MESSAGE_MANAGER_UNIT_TESTING
    $msglog(client_verbosity, message);
`endif
  end else begin
    // Need to type the message_id based on the simulator we are working in.
    // Styled after the original SVC message IDs, which are module parameters.
`ifdef VCS
    bit [31:0] sim_message_id = message_id;
`elsif QUESTA
    reg [31:0] sim_message_id = message_id;
`elsif INCA
    logic [31:0] sim_message_id = message_id;
`endif
`ifndef SVT_SVC_MESSAGE_MANAGER_UNIT_TESTING
    $msglog(client_verbosity, sim_message_id, message);
`endif
  end
endfunction
`endif

`endif // GUARD_SVT_SVC_MESSAGE_MANAGER_SV
