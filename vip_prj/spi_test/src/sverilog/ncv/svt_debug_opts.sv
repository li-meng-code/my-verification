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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
At8oUsDGbEIyg0tVQHrpMGeDl5uuiLkw1B4BP9I2uLGHwyzw00fHizyUWIWxbzgj
gyKhPGINrJVX1WSVUjDQKvvqHk8os5mnnWeOPUEG0W2mEL5tsn+UxaakrRevQWCq
19NvycMupD4NiZA907nsrYg5aaDKebL83K3bDC0aF4OJgYojFk2uHQ==
//pragma protect end_key_block
//pragma protect digest_block
HYfksTj5VO/ar1QmvboWD5VTopc=
//pragma protect end_digest_block
//pragma protect data_block
4J+vs9DGNsozPpJcBGA9wFD9Vd8RE40deDLjqCLTFGSaELD1BQNHj1PByJx5zXVe
KPx/xrDrLREcf1XOR7+0pXs6MDjcdE0LS+cyguLAm+RoaiqKKbdu4fXxeFRKBegm
z0ZTK0fh4a9dJamzeAC5cHnqbiuMCakUS9Blfv+6Sd6chv7xPSmN+evD3QK2d7tb
uNd6klsv0nThAe27YwbE97iWLzabWKF1i+lhZjCGEEtOYclJDyG9EcZsfMXwTjeI
Z540R3op8rkZZqpZkig+XoDi3pYkl62zbhkhvmhpuni1iKKBpuJLOdlbQPjdI9vS
2KItnFspYyWVuayku2qL6y89YkzLixStjqeymRq4wI/tMlbHysdo2oE5YIC/Tve9
D/soi2x1CIBmnsXNTeiNPLHkg1Jf4JuUEwHZiSK2QVukroIprpJ1mMJE7gjapUbJ
of72TUUBxHN+Abc/oXMQFH1yNG78TRgNrFj2rzMftpmX3rbFdtPyXRyBSCkNE38A
nepcoHm/apVsEBfH3rZ0Cw==
//pragma protect end_data_block
//pragma protect digest_block
aoJSfuM6FiU+lpwQyY4SfAFpR1Q=
//pragma protect end_digest_block
//pragma protect end_protected

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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
oPa1P95YEhmHDW+Yx69sGzYolmVZaWSfE+K20ciELBXryz6UGYAx5sojpyc/OlnL
Ayj0DnIyQpaireQVQDXza75BYv1U/eya5Do3hLbpNQ5IXAlVVfEIqw1esSHYO80W
3BPbHp0MsfYk+PRAcBLuqeTHfFeUJE2keaM80/bImDEkMPY+iGNrrA==
//pragma protect end_key_block
//pragma protect digest_block
5aokRVhQGaNVe3P0tRhfYA6h884=
//pragma protect end_digest_block
//pragma protect data_block
OkeC3oE3EGkUwjwxBt1E0sbVvtbHyueu3p6Rrwj+WRLKrvMfdnsdS67hobaEr4k1
XUob3l3hJmtr3Gdv5QxlaNNUaWVisM4B4XcEM2amYi2mpghxYUxDaYR6NPKlai1y
BcAx6jVPbnPSA4Jy3xbeLaQBn894vHrrG4/pJ91L76iikZgZD3jGmtSk+Uypk6RS
NscBtbLoAICYDUhSwPlqpt7cpX++niypdEEw4S+Rgj5ua+root9plltX4W7e6r7S
LGjDvyJKP3u8pdMNvxCrWD4kM6THbcEgrYYb15xqklUPfIGgS2bZqRzrgE/KqaNG
KDozxukOJ8ZQKip32oNefuwAbLogfIII7tSCXOq3qsc5yY7zxAvEAfMZ5SytfQuY
6AcDBb3319baS3bfzuBrNlmwe+sVQyTdqjem96arVHlM86j0hwEk5PVoGv8D3GGK
nrGgy67EseIDXVJzfSy0CHJ1xoIQDpzX/GX2/qhI34FbKk/nXuunuHtUHsubOAxj
vsXS6dvoL3naO+ksiNpE+mDEdRnY3RMeVHSLsEMbIn9z6hzV7PPNuvaZgoSuxLUi
N6W+/TIiOknBPGmvrMkcSGs0Rs6oI52EPWT2HDnBpMt/9Q6UUoOTdW2M326aLoFY
P377rDC1/qsArSj/CnL5lfswl7QTdYF5qBDGXpFmxPMkmCVF/tkZi98/4CF8ujwS
dAg5gH2W3+LHRP2xsAZFCg==
//pragma protect end_data_block
//pragma protect digest_block
f8vmH8xaBtvonsVsT6W8+pBWvOQ=
//pragma protect end_digest_block
//pragma protect end_protected

endclass: svt_debug_opts

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1Agq1N1mqMZcTq4TUAg6MdFUbxCurjSP9YCNLAWk++83iHoM0i2YOTFwSWSf4JNU
RHu26qub0ydTfvaMrA3RoMiESCTkgLVow2OtYjUSe7RD3jH8BFKVqN/MYgyqvbCn
rMOHFD2onsb1gLsi0hIcb5gxK+RoWLNUt82cbsARad+R0Kzj+PISGw==
//pragma protect end_key_block
//pragma protect digest_block
KtTAytGNU3MkbH1OEQl7tkEXNM8=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
nJPb902Izr5MadVD3a+bnjZ5tgw=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DEBUG_OPTS_SV
