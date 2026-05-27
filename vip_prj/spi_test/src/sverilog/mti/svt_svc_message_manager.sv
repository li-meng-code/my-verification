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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
J40eDnRvhbMnAm9YBebx+qwO628zQN1PXvvNSGit3to7oO/6YfTGAC1DAAgdBAh5
oB6ei+I3yg9cF8hzaBbDn416dod4eROSmZLgLD6pLEbFpcBjj8wjTEeD7L6WAl+V
YBLukCVYsGIOrTBbKhT8TGAYcpUbr15GezunfkG7vlQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19558     )
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
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
n+hSCd9X475QFLF0XNa5pSfngPocUpXuwMmrnq7yN+g8Ki5N6IMYlolyN53kSrpp
PhWfMzkYOMZOpzzZXQMxdxcCCs4pfkL0PEQ7mL7vi3cF8WZwUuWYiNmo+g7JMEq6
wfZBYsIa3RPX2IQgcnAxehixRB38y1AbpHkZSOjN+Vk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19641     )
a1IYq2/5WolvnjqAH/GTEYsgoX3xEJfdbdEcqTwqp2ms6RvGCs/eNJpESRkMOb02
33TiLX8XM66oQtX6GLRnxJE6taOEdQydvyFv0UvzeQXejRSQGyqL7YgUQipvzeqr
`pragma protect end_protected
