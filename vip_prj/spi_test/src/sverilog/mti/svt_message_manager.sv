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

`ifndef GUARD_SVT_MESSAGE_MANAGER_SV
`define GUARD_SVT_MESSAGE_MANAGER_SV

`ifndef __SVDOC__
// SVDOC can't handle this many parameters to a macro...

/**
 * Macro to get the indicated message manager to report the provided message.
 */
`define SVT_MESSAGE_MANAGER_FORMAT_MESSAGE(msginout,arg1=0,arg2=0,arg3=0,arg4=0,arg5=0,arg6=0,arg7=0,arg8=0,arg9=0,arg10=0,arg11=0,arg12=0,arg13=0,arg14=0,arg15=0,arg16=0,arg17=0,arg18=0,arg19=0,arg20=0) \
  begin \
    /* Use a local string, with the assignment and format calculations done using this local string. */ \
    /* Fill the string in a separate statement, as otherwise compilers seem to make assumptions about */ \
    /* whats in the string and get themselves in trouble. */ \
    string format_msg; \
    int format_cnt; \
    format_msg = msginout; \
    format_cnt = svt_message_manager::calc_format_count(format_msg); \
 \
    if (format_cnt == 1) begin \
      format_msg = $sformatf(format_msg, arg1); \
    end else if (format_cnt == 2) begin \
      format_msg = $sformatf(format_msg, arg1, arg2); \
    end else if (format_cnt == 3) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3); \
    end else if (format_cnt == 4) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4); \
    end else if (format_cnt == 5) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5); \
    end else if (format_cnt == 6) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6); \
    end else if (format_cnt == 7) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7); \
    end else if (format_cnt == 8) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8); \
    end else if (format_cnt == 9) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9); \
    end else if (format_cnt == 10) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10); \
    end else if (format_cnt == 11) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11); \
    end else if (format_cnt == 12) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12); \
    end else if (format_cnt == 13) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13); \
    end else if (format_cnt == 14) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14); \
    end else if (format_cnt == 15) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15); \
    end else if (format_cnt == 16) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16); \
    end else if (format_cnt == 17) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17); \
    end else if (format_cnt == 18) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18); \
    end else if (format_cnt == 19) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19); \
    end else if (format_cnt == 20) begin \
      format_msg = $sformatf(format_msg, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20); \
    end \
 \
    msginout = format_msg; \
  end

/**
 * Macro to get the indicated message manager to report the provided message.
 */
`define SVT_MESSAGE_MANAGER_REPORT_MESSAGE(prefmgrid,defmgrid,clvrb,clsev,format,arg1=0,arg2=0,arg3=0,arg4=0,arg5=0,arg6=0,arg7=0,arg8=0,arg9=0,arg10=0,arg11=0,arg12=0,arg13=0,arg14=0,arg15=0,arg16=0,arg17=0,arg18=0,arg19=0,arg20=0) \
  do begin \
    string report_msg; \
    report_msg = format; \
 \
    `SVT_MESSAGE_MANAGER_FORMAT_MESSAGE(report_msg,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20) \
 \
    svt_message_manager::facilitate_report_message(prefmgrid,defmgrid,clvrb,clsev,report_msg); \
  end while (0)

/**
 * Macro to get the indicated message manager to report the provided message.
 */
`define SVT_MESSAGE_MANAGER_REPORT_ID_MESSAGE(prefmgrid,defmgrid,clvrb,clsev,format,msgid,arg1=0,arg2=0,arg3=0,arg4=0,arg5=0,arg6=0,arg7=0,arg8=0,arg9=0,arg10=0,arg11=0,arg12=0,arg13=0,arg14=0,arg15=0,arg16=0,arg17=0,arg18=0,arg19=0,arg20=0) \
  do begin \
    string report_msg; \
    report_msg = format; \
 \
    `SVT_MESSAGE_MANAGER_FORMAT_MESSAGE(report_msg,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20) \
 \
    svt_message_manager::facilitate_report_message(prefmgrid,defmgrid,clvrb,clsev,report_msg,msgid); \
  end while (0)

`endif // __SVDOC__

/**
 * Macro used to get the verbosity for the associated message manager.
 */
`define SVT_MESSAGE_MANAGER_GET_CLIENT_VERBOSITY_LEVEL(prefmgrid,defmgrid) \
  svt_message_manager::facilitate_get_client_verbosity_level(prefmgrid,defmgrid)

/** Simple defines to make it easier to write portable FATAL/ERROR/WARNING requests. */
`ifdef SVT_VMM_TECHNOLOGY
`define SVT_MESSAGE_MANAGER_FATAL_SEVERITY -1
`define SVT_MESSAGE_MANAGER_ERROR_SEVERITY -1
`define SVT_MESSAGE_MANAGER_NOTE_SEVERITY  -1
`else
`define SVT_MESSAGE_MANAGER_FATAL_SEVERITY `SVT_XVM_UC(FATAL)
`define SVT_MESSAGE_MANAGER_ERROR_SEVERITY `SVT_XVM_UC(ERROR)
`define SVT_MESSAGE_MANAGER_NOTE_SEVERITY  `SVT_XVM_UC(WARNING)
`endif

// =============================================================================
/**
 * This class provides access to the methodology specific reporting facility.
 * The class provides SVC specific interpretations of the reporting capabilities,
 * and provides support for SVC specific methods.
 */
class svt_message_manager;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log used if no log has been provided to the class. */
  local static vmm_log shared_log = new("svt_message_manager", "CLASS");
`else
  /** Shared reporter used if no reporter has been provided to the class. */
  local static `SVT_XVM(report_object) shared_reporter = `SVT_XVM(root)::get();
`endif

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** Name given to the message manager at construction. */
  protected string name = "";

  /**
   * Verbosity level of the associated reporter/log object.  This value is set to
   * the client's default severity when the class is constructed, and then it is
   * updated when the client's verbosity changes.
   */
  int m_client_verbosity = -1;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** The log associated with this message manager resource. Public so it can be set after message manager creation. */
  vmm_log log;
`else
  /** The reporter associated with this message manager resource. Public so it can be set after message manager creation. */
  `SVT_XVM(report_object) reporter;
`endif

  /**
   * Static default svt_message_manager which can be used when no preferred svt_message_manager is
   * available.
   */ 
`ifdef SVT_VMM_TECHNOLOGY
   static svt_message_manager shared_msg_mgr = new("shared_msg_mgr");
`else
   static svt_message_manager shared_msg_mgr = new("shared_msg_mgr", `SVT_XVM(root)::get());
`endif

  /**
   * Static svt_message_manager associative array which can be used to access
   * preferred svt_message_manager instances.
   */
  static svt_message_manager preferred_msg_mgr[string];

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new Message Manager instance.
   *
   * @param name Name associated with the message manager, used to add the message manager to the preferred_msg_mgr array.
   * @param log The log associated with this message manager resource.
   */
  extern function new(string name = "", vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new Message Log instance.
   *
   * @param name Name associated with the message manager, used to add the message manager to the preferred_msg_mgr array.
   * @param reporter The reporter associated with this message manager resource.
   */
  extern function new(string name = "", `SVT_XVM(report_object) reporter = null);
`endif

  //----------------------------------------------------------------------------
  /**
   * Utility method for getting the name of the message manager.
   *
   * @return The name associated with this message manager.
   */
  extern virtual function string get_name();

  //----------------------------------------------------------------------------
  /**
   * Method used to report information to the transcript.
   *
   * @param client_verbosity Client specified verbosity which defines the output level.
   * @param client_severity Client specified severity which helps define the output level.
   * @param message Text to be reported.
   * @param message_id Optional ID associated with the text to be reported.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern virtual function void report_message(int client_verbosity, int client_severity, string message, int message_id = -1,
                                              string filename = "", int line = 0);

  //----------------------------------------------------------------------------
  /**
   * Method used to get the current client specified verbosity level. Useful for controlling output generation.
   *
   * @return The current client specified verbosity level associated with this message manager.
   */
  extern virtual function int get_client_verbosity_level();

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
  /**
   * Utility method that can be used to decide if the client verbosity can be supported.
   *
   * @param client_verbosity Client specified verbosity value that is to be evaluated.
   *
   * @return Indicates whether the client_verbosity corresponds to a support verbosity level (1) or not (0).
   */
  extern function bit is_supported_client_verbosity(int client_verbosity);

  //----------------------------------------------------------------------------
  /**
   * Utility method which calculates how many format specifiers (e.g., %s) are included in the string.
   *
   * @param message The string to be processed.
   *
   * @return Indicates how many format specifiers were found.
   */
  extern static function int calc_format_count(string message);

  //----------------------------------------------------------------------------
  /**
   * Utility method that can be used to recognize a string argument.
   *
   * @param var_typename The '$typename' value for the argument.
   *
   * @return Indicates whether the var_typename reflects the variable is of type string (1) or not (0).
   */
  extern static function bit is_string_var(string var_typename);

  //----------------------------------------------------------------------------
  /**
   * Utility method that can be used to replace all '%m' references in the string with an alternative string.
   *
   * @param message Reference to the message including the '%m' values to be replaced.
   * @param percent_m_replacement Ths string that is supposed to replace all of the '%m' values in message.
   */
  extern static function void replace_percent_m(ref string message, input string percent_m_replacement);

  //----------------------------------------------------------------------------
  /**
   * Method used to report information to the transcript through a local message manager.
   * 
   * If the supplied message manager is non-null then this method dispatches the
   * message through that. If the the supplied message manager is null then a message
   * manager is first obtained using find_message_manager, and then the message is
   * dispatched through that.
   * 
   * The message manager used is returned through the return value of the function.  This
   * can then be used to update the local reference so that the lookup does not need to
   * be performed again.
   *
   * @param msg_mgr Reference to the local message manager
   * @param pref_mgr_id ID of the preferred message manager
   * @param def_mgr_id ID of the default message manager
   * @param client_verbosity Client specified verbosity which defines the output level.
   * @param client_severity Client specified severity which helps define the output level.
   * @param message Text to be reported.
   * @param message_id Optional ID associated with the text to be reported.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern static function svt_message_manager localized_report_message(svt_message_manager msg_mgr, string pref_mgr_id, string def_mgr_id, int client_verbosity, int client_severity, string message, int message_id = -1, string filename = "", int line = 0);

  //----------------------------------------------------------------------------
  /**
   * Utility method which can be used to find the most appropriate message manager based on the pref_mgr_id and def_mgr_id.
   *
   * @param pref_mgr_id Used to find the preferred message manager.
   * @param def_mgr_id Used to find default message manager if cannot find message manager for pref_mgr_id.
   *
   * @return Handle to the message manager which was found.
   */
  extern static function svt_message_manager find_message_manager(string pref_mgr_id, string def_mgr_id);

  //----------------------------------------------------------------------------
  /**
   * Static method used to find the right message manager and report information to the transcript.
   *
   * @param pref_mgr_id Used to find the preferred message manager to report the message.
   * @param def_mgr_id Used to find default message manager if cannot find message manager for pref_mgr_id.
   * @param client_verbosity Client specified verbosity which defines the output level.
   * @param client_severity Client specified severity which helps define the output level.
   * @param message Text to be reported.
   * @param message_id Optional ID associated with the text to be reported.
   * @param filename Optional argument identifying the source file for the message.
   * @param line Optional argument identifying the source line number for the message. 
   */
  extern static function void facilitate_report_message(string pref_mgr_id, string def_mgr_id, int client_verbosity, int client_severity, string message, int message_id = -1,
                                                        string filename = "", int line = 0);

  //----------------------------------------------------------------------------
  /**
   * Static method used to get the current message level. Useful for controlling output generation.
   *
   * @param pref_mgr_id Used to find the preferred message manager to retrieve the client verbosity level from.
   * @param def_mgr_id Used to find default message manager if cannot find message manager for pref_mgr_id.
   *
   * @return The current client specified verbosity level associated with the indicated message manager.
   */
  extern static function int facilitate_get_client_verbosity_level(string pref_mgr_id, string def_mgr_id);

  //----------------------------------------------------------------------------
  /**
   * Utility method that can be used to decide if the client verbosity can be supported.
   *
   * @param client_verbosity Client specified verbosity value that is to be evaluated.
   *
   * @return Indicates whether the client_verbosity corresponds to a support verbosity level (1) or not (0).
   */
  extern static function bit facilitate_is_supported_client_verbosity(string pref_mgr_id, string def_mgr_id, int client_verbosity);

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Establishes a constantly running thread that watches for changes in the verbosity
   * level of the reporter/log associated with this message manager.
   */
  extern function void watch_for_verbosity_changes();

  //----------------------------------------------------------------------------
  /**
   * Converts the methodology verbosity into the client's representation
   */
  extern function int convert_client_verbosity();

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
nEOtWUqDda8KppQ+SYUSSL29v6+RTIQ2YRLtzV7WMhzFvom9Wh8Gyt+eTWLuAw3B
7twgSho/05d7Sk+at22rhpN5gP7dCTsdPNr8zyBPy7CGQOBCl8BwTMJYvwN1bKqY
JqS08mWbdX9EzdYD9CKgIL/1jVVZ7mWAEN4db/HfPHo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26842     )
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
SOK5nvQg6teYE6bAHyM1eQ==
`pragma protect end_protected

`endif // GUARD_SVT_MESSAGE_MANAGER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pyQbMit+svmrwjlJfCY0AK1T3MnMsZOmxFB4T8Nb/JscFA4K4XBEfyIhalrrRWCq
RM4pT4uIgFmzTAD/CthsbXYBZAoxAcGIxPxwEDQSUj1KhDTYHFTtGZA1vD6Ji1kB
6b8hSzwDRoiGPt7qnoZj2/ha148dCIEfFOpKcgo7eyo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26925     )
DU0a7dgdC4CKQb9s1TZi+eUS3zRA84mjwKVduRDwcZJLv+US5Gi+zNVgGhYPXXAU
RBEnzqUqJKdzfLeWbEVp91eM2HBRhOr2nGmFTqwBRRoL+xTLE//WueXpCyYNrqI/
`pragma protect end_protected
