//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DEBUG_OPTS_SV
`define GUARD_SVT_DEBUG_OPTS_SV

// -------------------------------------------------------------------------
// SVT Debug constants
// -------------------------------------------------------------------------
`define SVT_DEBUG_OPTS_FILENAME "svt_debug.out"
`define SVT_DEBUG_OPTS_TRANSCRIPT_FILENAME "svt_debug.transcript"

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

`ifndef SVT_VMM_TECHNOLOGY
typedef class svt_non_abstract_report_object;
`endif

typedef class svt_debug_opts_carrier;

// =============================================================================
/**
 * The svt_debug_opts class is a singleton class that contains the automated
 * debug options requested by users.  Options are provided through the use of
 * runtime plusarg +svt_debug_opts are used to control the behavior of this feature.
 * 
 * The +svt_debug_opts plusarg accepts a string value with the following format:
 * inst:<string>,type:<string>,feature:<string>,start_time:<longint>,end_time:<longint>,verbosity:<string>
 * 
 * - inst Instance name of the VIP to apply the debug options to.  Regular expressions
 *   can be used to identify multiple VIP instances.  If no value is supplied then the
 *   debug options are applied to all VIP instances.
 * 
 * - type Class type to apply the debug options to.
 * 
 * - feature Sub-feature name to apply the debug options to.  Regular expressions
 *   can be used to identify multiple features.  Suites must define which features to
 *   enable through this option, and implement the controls necessary to honor this.
 * 
 * - start_time Time when the debug verbosity settings are applied.  The time supplied
 *   is in terms of the timescale that the VIP is compiled in.  If no value is supplied
 *   then the debug verbosity is not removed and remains in effect until the end of the
 *   simulation.
 * 
 * - end_time Time when the debug verbosity settings are removed.  The time supplied
 *   is in terms of the timescale that the VIP is compiled in.  If no value is supplied
 *   then the debug verbosity remains in effect until the end of the simulation.
 * 
 * - verbosity Verbosity setting that is applied at the start_time.
 * .
 */
class svt_debug_opts;

  /**
   * Struct to represent debug properties that have been enabled through the auto-debug
   * infrastructure.
   */
  typedef struct {
    string package_name;
    string timeunit_value;
  } package_timeunit_struct;

  /**
   * Struct to represent phase names and start times
   */
  typedef struct {
    string name;
    realtime value;
  } phase_start_time_struct;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Static log instance */
  static vmm_log log = new("svt_debug_opts", "Log for svt_debug_opts");
`else
  /** All messages routed through `SVT_XVM(top) */
  `SVT_XVM(report_object) reporter = svt_non_abstract_report_object::create_non_abstract_report_object("svt_debug_opts_reporter");
`endif

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oqZjCsjq5bR1gqPDxnjoGD60oHoW7z3UjQhRE3xGyDr6q2gCD0LDXP45gI81RM4I
ApCCXUnlgwbK7g4ShzSIMG2OMO5L/d0OmjJlWUMxqfcRYScG1m/nL+5zuMcgaA27
SuQwwu/LDSRXHamqPEamc8PpIU601qQu6a7oFOPtdMg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 232       )
Rfq0+Y3FmDYnLSD74yoOkUtdhw8LFm/yJkRhae7kv3RyaXmt4h+IuJABdvMR5LQj
jgwVKHspfiTmVdiSFwxQ0NkXFViwznDL6Klgia4tBilEsAQ5dhbJoWRC/I4RKkt6
2KKckoB62wZDN2JoAaB5OBMoZljW66qU+0psTvufJlDO2s5vd6YCj1td3oKRRCT7
PjQo9HhF8IAr3NpjBPicokDtstEumk8MpfpnJNuBB5NyGp7zr5Nxp5j8H2RzzUn3
zj/SwMis7C/zGu1NDNxqrFQ8oKArOFn5Ba+I7+KZoT1+2/ldLuYWOJxTVCH8oXdn
`pragma protect end_protected

  // ****************************************************************************
  // Internal Data
  // ****************************************************************************

  /** Flag that gets set if the +svt_debug_opts switch is supplied */
  local bit enable_debug = 0;

  /** Singleton handle */
  static local svt_debug_opts m_inst = new();

  /** The string supplied via the +svt_debug_opts runtime switch */
  local string plusarg_value;

  /** The string supplied via the +svt_debug_opts_force_cb_types runtime switch */
  local string force_cb_types_plusarg_value;

  /** Instance name supplied via the +svt_debug_opts runtime switch */
  local string plusarg_inst = `SVT_DATA_UTIL_UNSPECIFIED;

  /** Instance name supplied via the +svt_debug_opts runtime switch */
  local string plusarg_type = `SVT_DATA_UTIL_UNSPECIFIED;

  /** Optional feature name supplied via the +svt_debug_opts runtime switch */
  local string plusarg_feature = `SVT_DATA_UTIL_UNSPECIFIED;

  /** Optional start time supplied via the +svt_debug_opts runtime switch */
  local longint plusarg_start_time = 0;

  /** Optional end time supplied via the +svt_debug_opts runtime switch */
  local longint plusarg_end_time = -1;

  /** Optional verbosity supplied via the +svt_debug_opts runtime switch */
`ifndef SVT_VMM_TECHNOLOGY
  local int plusarg_verbosity = `SVT_XVM_UC(HIGH);
`else
  local int plusarg_verbosity = vmm_log::DEBUG_SEV;
`endif

  /** Verbosity value saved before the auto-debug features modify this. */
  local int original_verbosity = -1;

  /** File handle for logging auto-debug information */
  local int out_fh;

  /**
   * File handle for logging VIP transcript data when auto-debug is enabled.  Each VIP that
   * is enabled for debug will route all messages into this file.
   */
  local int transcript_fh;

  /**
   * Storage array for debug characteristics associated with each SVT VIP in the simulation
   */
  local svt_debug_vip_descriptor vip_descr[string];

  /**
   * Storage queue for pre-formatted header information
   */
  local string header[$];

  /**
   * Storage queue for timeunits associated with each package
   */
  local package_timeunit_struct package_timeunit[$];

  /**
   * Storage queue for the start time for each phase
   */
  local phase_start_time_struct phase_start_time[$];

  /**
   * Flag which indicates that the header has been logged in the
   * `SVT_DEBUG_OPTS_FILENAME.  The header section of the file contains simulator and
   * simulation mode information, VIP version information, and package timeunits.
   */
  local bit log_global_settings_done = 0;

  /**
   * Flag which indicates that VIP instance data has been logged in the
   * `SVT_DEBUG_OPTS_FILENAME file. Each VIP intance is recorded, along with whether
   * it is enabled for debug.  All VIP instances that are enabled for debug also list
   * every configuration property that is modified to enable debug features.
   */
  local bit log_instance_info_done = 0;

  /**
   * Flag which indicates that final information has been logged in the
   * `SVT_DEBUG_OPTS_FILENAME file. This section displays the start time of every phase.
   */
  local bit log_phase_times_done = 0;

  /**
   * List of object types which have been identified as types whose callbacks should
   * be force saved to fsdb when debug_opts enabled.
   */
  static local int force_cb_save_to_fsdb_type[string];

  /**
   * Flag to determine if callback execution should proceed for an individual callback
   */
  local bit is_playback_callback_available[string];

  /**
   * Mailbox to hold pattern data carrier objects associated with callbacks which are
   * used during playback.  The associative array is indexed by a string value
   * representing the callback name.  The callback name supplied is qualified with the
   * full path to the component that owns it, and so it is guaranteed to be unique.
   */
  local mailbox#(svt_debug_opts_carrier) callback_pdc[string];

  /**
   * associative array to hold pattern data carrier objects associated with callbacks
   * which are received from mailbox but values are not updated in the task 
   * update_object_prop_vals in svt_debug_opts_carrier. the associative array is 
   * indexed by a string value representing the callback name.  the callback name 
   * supplied is qualified with the full path to the component that owns it, and so
   * it is guaranteed to be unique.
   */
  svt_debug_opts_carrier playback_callback_intermediate_data_carrier[string];

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the data class.
   * 
   * Note: Should not be called directly.  Clients should instead call the static
   *       get() method to obtain a handle to the singleton.
   */
  extern function new();

  // ---------------------------------------------------------------------------
  /**
   * Obtain a handle to the singleton instance.
   * 
   * @return handle to the svt_debug_opts singleton instance
   */
  extern static function svt_debug_opts get();

  // ---------------------------------------------------------------------------
  /**
   * Obtains the plusarg value supplied via +svt_debug_opts and parses this into
   * internal control properties.
   */
  extern function void parse_plusarg();

  // ---------------------------------------------------------------------------
  /**
   * Obtains the debug_opts plusarg values supplied via keywords other than
   * +svt_debug_opts, as adjuncts to the +svt_debug_opts options. Only executed
   * if debug_opts have been enabled.
   */
  extern function void parse_secondary_plusargs();

  // ---------------------------------------------------------------------------
  /** 
   * Routine that tests whether the supplied instance name or type name matches the
   * values supplied through the +svt_debug_opts plusarg.  This method returns 0
   * if the supplied inst_name is a sub-component of a component that has been enabled
   * for debug.  The #is_parent_debug_enabled() method can be used to determine if
   * this condition was true.
   * 
   * This method also populates the #vip_descr storage array with the status of this
   * VIP instance.
   *
   * If empty inst_name and type_name values are provided this method returns the
   * an indication of whether debug is enabled for anything in the system.
   *
   * @param inst_name Instance name to check against
   * @param type_name Type name to check against
   * @return 1 if the supplied instance name was enabled for debug
   */
  extern function bit is_debug_enabled(string inst_name, string type_name);

  // ---------------------------------------------------------------------------
  /** 
   * Routine that returns true if the supplied instance name refers to a component
   * that is a sub-component of a component that has been enabled for debug.
   * 
   * @param inst_name Instance name to check against
   * @return 1 if the supplied instance name is a sub-component of a debug enabled component
   */
  extern function bit is_parent_debug_enabled(string inst_name);

  // ---------------------------------------------------------------------------
  /** 
   * Splits the leaf path from the top level instance if the component is enabled
   * for debug.
   * 
   * @param leaf_inst Full path name of a sub-component
   * @param top_level_inst Full path of the top-level component is returned
   * @param leaf_path Leaf path from the top level component is returned
   * @return 1 if the component is a sub-component of a debug enabled component.
   */
  extern function bit split_leaf_path_from_top_level(string leaf_inst, output string top_level_inst, output string leaf_path);

  // ---------------------------------------------------------------------------
  /** 
   * Marks the VIP descriptor entry for this instance as a top level component.
   * 
   * @param inst_name Instance name to update
   */
  extern function void set_top_level_component(string inst_name);

`ifdef SVT_FSDB_ENABLE
  // ----------------------------------------------------------------------------
  /**
   * Creates a new svt_vip_writer and sets it up for use by this VIP instance.
   *
   * @param instance_name The name of the instance with which the writer is associated.
   *
   * @param protocol_name The name of the protocol with which the objects being written
   * are associated.
   *
   * @param protocol_version The version of the protocol.
   *
   * @param suite_name The name of the suite with which the protocol is associated.
   * This is only required for suites that support PA-style extension definitions
   * with multiple sub-protocols.
   *
   * @return The svt_vip_writer which has been created and registered with this VIP instance.
   */
  extern function svt_vip_writer create_writer(string instance_name, string protocol_name, string protocol_version, 
                                        string suite_name = "");

  // ---------------------------------------------------------------------------
  /** 
   * Creates an instance of the VIP writer and adds it to the VIP descriptor entry
   * 
   * @param inst_name Instance name to update
   * @param writer Writer class to be set
   */
  extern function void set_writer(string inst_name, svt_vip_writer writer);
`endif

  // ---------------------------------------------------------------------------
  /** 
   * Returns the VIP writer reference for the supplied instance
   * 
   * @param inst_name Instance name to update
   */
  extern function svt_vip_writer get_writer(string inst_name);

  // ---------------------------------------------------------------------------
  /**
   * Routine that tests whether the supplied feature name matches the value
   * supplied through the +svt_debug_opts plusarg.
   * 
   * @param feature Instance name to check against
   * @return 1 if the supplied feature name was matched
   */
  extern function bit is_feature_match(string feature);

  // ---------------------------------------------------------------------------
  /**
   * Obtains the start_time value supplied through the +svt_debug_opts plusarg.
   * 
   * @return Start time value obtained
   */
  extern function longint get_start_time();

  // ---------------------------------------------------------------------------
  /**
   * Obtains the end_time value supplied through the +svt_debug_opts plusarg.
   * 
   * @return End time value obtained
   */
  extern function longint get_end_time();

  // ---------------------------------------------------------------------------
  /**
   * Obtains the verbosity value supplied through the +svt_debug_opts plusarg.
   * 
   * @return Verbosity value obtained
   */
  extern function int get_verbosity();

  /**
   * Obtains the file handle for the transcript file that contains VIP messages.
   * 
   * @return file handle
   */
  extern function int get_transcript_fh();

  // ---------------------------------------------------------------------------
  /**
   * Sets the global reporter to the debug verbosity
   */
  extern function void start_debug_verbosity();

  // ---------------------------------------------------------------------------
  /**
   * Restores the global reporter's original verboisity
   */
  extern function void end_debug_verbosity();

  // ---------------------------------------------------------------------------
  /**
   * Records a line of header information.  The following data is pushed to this method:
   * - Methodology and simulator information
   * - SVT and VIP version information
   * .
   * 
   * @param line Single line of formatted header information
   */
  extern function void record_header_line(string line);

  // ---------------------------------------------------------------------------
  /**
   * Records the timeunits that have been compiled for each package
   * 
   * @param package_name Name of the package for the supplied timeunit value
   * @param timeunit_value Timeunit value for the supplied package name
   */
  extern function void record_package_timeunit(string package_name, string timeunit_value);

  // ---------------------------------------------------------------------------
  /**
   * Stores the debug feature that is enabled through the auto-debug utility
   * 
   * @param inst Instance name that the debug property is associated with
   * @param prop_name Property name being recorded
   * @param prop_val Property value being recorded, expressed as a 1024 bit quantity.
   * @param status Status that indicates whether the feature was succesfully enabled
   */
  extern function void record_debug_property(string inst, string prop_name, bit [1023:0] prop_val, bit status);

  // ---------------------------------------------------------------------------
  /**
   * Records the start time for each phase
   * 
   * @param name Full context for the phase
   */
  extern function void record_phase_start_time(string name);

  // ---------------------------------------------------------------------------
  /** Logs the recorded general header information */
  extern function void log_global_settings();

  // ---------------------------------------------------------------------------
  /** Logs the recorded VIP header information */
  extern function void log_instance_info();

  // ---------------------------------------------------------------------------
  /** Logs the last debug information and closes the file handle */
  extern function void log_phase_times();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * This method can be used in VMM when the main hierarchy has been established and the file handles, etc.,
   * have been propagated, but new log objects are added to the mix. This basically just propagates the settings.
   *
   * @param inst_name Instance name to check against.
   * @param type_name Type name to check against.
   * @param new_log The log object to be updated.
   */
  extern function void propagate_messaging(string inst_name, string type_name, vmm_log new_log);
`else
  //----------------------------------------------------------------------------
  /**
   * Used to update the reporter messaging to go to a log file based on the debug_opts verbosity settings.
   *
   * @param set_reporter The report object to be updated with the new verbosity.
   */
  extern function void set_messaging(`SVT_XVM(report_object) set_reporter);

  //----------------------------------------------------------------------------
  /**
   * Used to restore reporter messaging to its original verbosity, and to redirect it to the display.
   *
   * @param restore_reporter The report object to be updated.
   * @param restore_verbosity The verbosity which is to be restored.
   */
  extern function void restore_messaging(`SVT_XVM(report_object) restore_reporter, int restore_verbosity);

  //----------------------------------------------------------------------------
  /**
   * Used to track the debug_opts start/end settings and update the messaging as needed.
   *
   * @param inst_name Instance name to check against.
   * @param type_name Type name to check against.
   * @param track_reporter The report object to be updated at the start and end times.
   * @param original_verbosity Verbosity value saved prior to modification by the auto-debug features.
   * Ignored if the start time has not occurred yet.
   */
  extern function void track_messaging(string inst_name, string type_name, `SVT_XVM(report_object) track_reporter, int original_verbosity);
`endif

  //----------------------------------------------------------------------------
  /**
   * Records various aspects of the VIP in the FSDB as scope attributes
   * 
   * @param inst Hierarchical name to the VIP instance
   * @param if_path Path to the interface instance
   */
  extern function void record_vip_info(string inst, string if_path);

  //----------------------------------------------------------------------------
  /**
   * Function used to add a callback method name or a list of object types to the
   * list of types identified as types whose callbacks should be force saved to
   * fsdb when debug_opts enabled.
   * 
   * @param add_type Callback method name or object type to be force logged
   */
  extern static function void add_force_cb_save_to_fsdb_type(string add_type);

  //----------------------------------------------------------------------------
  /**
   * Function used to see if any of the specified callback method names or object
   * types as callback arguments that have been identified as being needed to be
   * force saved to fsdb when debug_opts enabled.
   * 
   * @param cb_name Callback method name to force logging for
   * @param obj_type Queue of object types to force logging for
   */
  extern static function bit has_force_cb_save_to_fsdb_type(string cb_name, string obj_type[$] = '{});

  //----------------------------------------------------------------------------
  /**
   * Enables callback playback for the supplied callback name.  When playback for
   * a callback is not enabled the get_playback_callback_data_carrier() method will
   * return in zero time with a null reference for the pattern data carrier.
   * 
   * @param cb_name Full path to the callback in question
   */
  extern function void set_is_playback_callback_available(string cb_name);

  //----------------------------------------------------------------------------
  /**
   * Function used to obtain the patten data carrier object associated with a specific
   * callback name.  During playback these values are supplied via the
   * Playback Testbench after being extracted from the FSDB file.
   * 
   * @param cb_name Full path to the callback in question
   */
  extern function svt_debug_opts_carrier get_playback_callback_data_carrier(string cb_name);

  //----------------------------------------------------------------------------
  /**
   * Task used to push the pattern data carrier associated with a specific callback
   * name to the mailbox.  During playback these are are supplied by the Playback
   * Testbench after being extracted from the FSDB file.
   * 
   * @param cb_name Full path to the callback in question
   * @param pdc Pattern Data Carrier object associated with the latest callback execution
   */
  extern task put_playback_callback_data_carrier(string cb_name, svt_debug_opts_carrier pdc);

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SpF7259q32bQren+eqjJuJB0NpNUv5Q4NC5aZ9/7MG/oUi0g4plwGqO6KdyLl1cZ
Zec33E4B1mNIO4POPTbZDriUpYjzoR6lqIJi3UanYG7+HHruQD8Bp4D0Zz0tigch
Z+k5Zl53IyoycPxeeaNRX+pCLfjuRi+N/EBcAUhQaBY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 611       )
pvO7gUGE7UQNbG2swH8VzCnREt4wAJ5npeSH+8/HUwQG9tCcEwWZLBFOd44jBLHd
/aXM2oPGuRxKlXfezu9uJiM3pt92A/M+zlAl08+Wnzj2a74mAjqWsMlGY3ca9oWa
6eH4TYABLsoFrHCI4lRFswiXGZBTM27pXTfIOcbEqwcdOXBGlaUdd8IEiQbG4FYk
lWbwlmz27ap2wDvMolOuNL6KsrStftv4G8BA+PyA29gk/rqpv9BsWQBs5JiUpwl7
p+pCpjwqNDNZavUrYZ0otEy4c378x1y12TDflzZSWPL9CP80zG2uq2FWftYNPNye
dIdhfrRKFd9fGfjKw1+CbMjlYDkICvVZTqvHu6VWiLRa3pfB+VKoTBpHBUkSVDt8
CMDnhIUu34625JiJUPKbHsEFL1UE2mg5dYByFgnXABEx7FWWpXmT15XJhHzePo8i
XGJAYMjnZ8E6aJdFNe5TOtBeqoTRMXImjjyZXS2ZXnw4YGenfrdi++EIG6RZdWin
`pragma protect end_protected

endclass: svt_debug_opts

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fuHlM6+JB4NP7aY0tq7tfw3zGIhGJn4I5RJG6XA5cm6P+ezA+gTWz9CHmPNZxAYj
hnuULRZPPYBPGfwEfeKOQZyTd/Ig3OeaTlWxizBJa2CdvjVwFofrSyZu4WgjTyEe
zeNdDhKjZW/AeAetUNqFB+1l5QuIAzcp2pqULgygOoE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29367     )
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
DhKxJfb74e0CY6z8XeZSXA==
`pragma protect end_protected

`endif // GUARD_SVT_DEBUG_OPTS_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
W9cFJBjERdtfu4iwiIMCT3LM/1Gwo+lAJ5Uv9iM4vkAv0veYDtb1CgRT5mBUazUg
C+pzZ2cvHgvJQXBZaM805zKV3F2Fi2lhme8cFc9PrEsg34ud5IBsc1e3k2z4Rr+t
/Jz84nuEVfqjHcyQzUS8IA2DLYhvLk3kfJtyEG/2mRQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29450     )
CV+MRZ5WDYpnQJwBhh+PVnLOXJHh/6h43SQ9u0RrVNDulGo993p183n5DI3MKGs8
dh7hPFSybWI2O1gMuDkl/3iUfkM4IU8PcTCQXM8RH6XU2aipUN86NsxOwg5Vsg+J
`pragma protect end_protected
