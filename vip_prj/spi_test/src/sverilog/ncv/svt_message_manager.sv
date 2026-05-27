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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
cLxgAyLQtrsShClHaIiJWVMvOC9Uw3j5D8kl0l3FEaTQQ5O1jzWZyaFpumIvdY4s
9HLKq+b0WbjI8neqmoh4PoSw03BFGo7u0RhKB69xJSZSzdBQV7XdSJWO0mGc/YIh
pU1uY1mSakvFmYv5FYia2F2WBS7nITAK2AUJmQFqtzou9S3wWWjdaA==
//pragma protect end_key_block
//pragma protect digest_block
nRomEELQfgITGVwMAv6/cH5UVRA=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
5ossrJhRrRarVpScXLXoUcG2w8w=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MESSAGE_MANAGER_SV
