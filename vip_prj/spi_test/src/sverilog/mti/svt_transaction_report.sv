//=======================================================================
// COPYRIGHT (C) 2008-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_TRANSACTION_REPORT_SV
`define GUARD_SVT_TRANSACTION_REPORT_SV

`ifdef SVT_VMM_TECHNOLOGY
 `define SVT_TRANSACTION_REPORT_TYPE svt_transaction_report
`else
 `define SVT_TRANSACTION_REPORT_TYPE svt_sequence_item_report
`endif

// =============================================================================
/**
 * This class provides testbenches a transaction mechanism for reporting transactions.
 * It reports summary information for individual transactions that are in progress and 
 * accumulates information into a summary report.
 */
`ifndef SVT_OVM_TECHNOLOGY
class `SVT_TRANSACTION_REPORT_TYPE;
`else
// Must be an ovm_object so it can be passed via the set_config() API.
class `SVT_TRANSACTION_REPORT_TYPE extends ovm_object;
   `ovm_object_utils(`SVT_TRANSACTION_REPORT_TYPE)
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LCxAbg4MknIYoP7AOQvU3pYfSkV5Fe7t7G45GKc2EnWUgo4EXAhhScBh7Ith8X0Q
UpQI0i2e+VmHIkYyO4TsAPlgou/CpTw2Ltf2qProDEJvF6rv9wESRgoGqcF1H8mj
iRLlTAc2+EZOGWPLby72A4oB3gcx/eFuSr7DNeI+2Lc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 523       )
uxdjjBFGi/7fknHi4L8oyefY69G1ajfWt2WCdzqJGxCzcWCCxs82tE2DeLmdRtGT
LDJxbAbHC16unOnjfuzT6bfMBYUQl96caT+XLPx5JHLbmIdJhP4VtiEjxL7EoWt5
0GyLGMBXYW4Fzqqvqg+12NR06DxLdZ/qumZ51O8NOirqT1gTX/LN/91mPElAT0m/
97UpofHBmkZcF2gn4Y7Fr654VebffxE3NwkbsJFtHdI7HRqnCSrG52us4fWzbroD
P2IzPVRMHb3dfchiqZVHLG4jpX0gulOoiu4yN9paSZc782P5S40MymYL91fj8P3x
P2Ny3iIIqlRQsG4nrQT4XmdGE9ymj5vdr+HOCTd7WqoudwzbNrxJ2Y/22tm03FoR
a9TiK8SB5iGRvy35Zj7StvOwv16A4aiW4Q92pOpXF3LT8NtKDNfNIDeYvUCAFIQG
/s3mAntUUN/r/8gHCnXqVS3CRTJFN+JVkdfR3s7QjGJLLr6kOXRgAIQvoAUy6XWq
bbWWM2kFMaPPXxeCwN5sII0xFrplxDYuWCnfUonWy8JqjDOYazyVQzSG6fD5OLof
8k5SZfSJXP94M4s+XoPGxE9GOzByKm4JbEKlIx5kEv9uQmIJGqxZVuhnYcTv3mUr
BkTM9VQalh2EjepFx7MGh/OtM3y/YR1p+/XHumBxmSIDu9+gu8MvkL6RAXoKN7S4
`pragma protect end_protected

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log object that can be used for messaging, normally just used for warning/error/fatal messaging. */
  protected static vmm_log log = new("svt_transaction_report", "class");
`else
  /** Shared report object that can be used for messaging, normally just used for warning/error/fatal messaging. */
  protected static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();
`endif
  
  /**
   * Used to store the tabular summary of null group (i.e., summary_group = "")
   * transactions as seen by all of the chosen transactors and monitors.  This
   * feature uses the `SVT_TRANSACTION_TYPE::psdisplay_short() method to create this
   * report. This is the one summary stored directly in this transaction report
   * instance. Grouped transactions are stored in their own `SVT_TRANSACTION_REPORT_TYPE
   * objects, inside the grouped_xact_summary array.
   */
  protected string                   null_group_xact_summary[$] ;

  /**
   * Used to build up additional labeled tabular summaries of transactions as seen
   * by all of the chosen transactors and monitors.  This feature uses the
   * `SVT_TRANSACTION_TYPE::psdisplay_short() method to create this report. These
   * contained transaction report objects are not provided with labels, and are
   * simply used to manage the strings that go with the labels.
   */
  protected `SVT_TRANSACTION_REPORT_TYPE   group_xact_summary[string] ;

  /**
   * File handles used to create a trace of transactions as seen by all
   * of the chosen transactors and monitors to an individual file. The
   * trace feature uses the `SVT_TRANSACTION_TYPE::psdisplay_short() method to
   * create the individual trace entries.
   */
  protected int                      trace_file[string] ;

  /**
   * File names for the trace files, indexed by the group value. If mapping
   * does not exist for a specific group, then the filename defaults to
   * the name of the group.
   */
  protected string                   trace_filename[string] ;

  /**
   * Indicates whether the header for the trace is present (1) or absent (0).
   */
  protected bit                      trace_header_present[string] ;

  /**
   * Controls the depth of the implementaion display for the the null
   * group. Defaults to 0, but can be set to include implementation
   * display to any non-negative depth. Updated via set_impl_display_depth().
   */
  protected int                      null_group_impl_display_depth ;

  /**
   * Controls the depth of the implementaion display for the the indicated
   * summary group. Defaults to 0, but can be set to include implementation
   * display to any non-negative depth. Updated via set_impl_display_depth().
   */
  protected int                      summary_impl_display_depth[string] ;

  /**
   * Controls the depth of the implementaion display for the the indicated
   * file group. Defaults to 0, but can be set to include implementation
   * display to any non-negative depth. Updated via set_impl_display_depth().
   */
  protected int                      file_impl_display_depth[string] ;

  /**
   * Controls the depth of the trace display for the the null group.
   * Defaults to 0, but can be set to include trace display
   * to any non-negative depth. Updated via set_trace_display_depth().
   */
  protected int                      null_group_trace_display_depth ;

  /**
   * Controls the depth of the trace display for the the indicated summary
   * group. Defaults to 0, but can be set to include trace display
   * to any non-negative depth. Updated via set_trace_display_depth().
   */
  protected int                      summary_trace_display_depth[string] ;

  /**
   * Controls the depth of the trace display for the the indicated file
   * group. Defaults to 0, but can be set to include trace display
   * to any non-negative depth. Updated via set_trace_display_depth().
   */
  protected int                      file_trace_display_depth[string] ;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Creates a new instance of this class.
   *
   * @param suite_name The name of the VIP suite.
   */
  extern function new(string suite_name = "");

  // ---------------------------------------------------------------------------
  /**
   * Create an individual transaction summary, with a header if requested.
   *
   * @param xact Transaction to be displayed.
   * @param reporter Identifies the client reporting the transaction, for inclusion in the message.
   * @param with_header Indicates whether the transaction display should be preceded by a header.
   */
  extern static function string psdisplay_xact(`SVT_TRANSACTION_TYPE xact, string reporter, bit with_header);

  // ---------------------------------------------------------------------------
  /**
   * Create an transaction summary for a queue of transactions.
   *
   * @param xacts Transactions to be displayed.
   * @param reporter Identifies the client reporting the transactions, for inclusion in the message.
   * @param with_header Indicates whether the transaction display should be preceded by a header.
   */
  extern virtual function string psdisplay_xact_queue(`SVT_TRANSACTION_TYPE xacts[$], string reporter, bit with_header);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Create an transaction summary for a transaction channel.
   *
   * @param chan Channel containing the transactions to be displayed.
   * @param reporter Identifies the client reporting the transactions, for inclusion in the message.
   * @param with_header Indicates whether the transaction display should be preceded by a header.
   */
  extern virtual function string psdisplay_xact_chan(vmm_channel chan, string reporter, bit with_header);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Generate the appropriate report data for the provided transaction, placing it
   * in a combined report for later access.
   *
   * @param xact Transaction that is to be added to the report.
   * @param reporter The object that is reporting this transaction.
   * @param summary_group Optional group that allows for the creation of multiple distinct summary reports.
   * @param file_group Optional group that allows for the creation of multiple distinct file reports.
   * @param runtime_trace_recording Optional allows runtime recording of data in trace file. By default data is dumped at the end of simulation.
   */
  extern virtual function void record_xact(`SVT_TRANSACTION_TYPE xact, string reporter, string summary_group = "", string file_group = "", bit runtime_trace_recording = 0);

  // ---------------------------------------------------------------------------
  /**
   * Method to record the implementation queue for a transaction
   *
   * @param xact Transaction whose implementation is to be added to the report.
   * @param prefix String placed at the beginning of each new entry.
   * @param reporter The object that is reporting this transaction.
   * @param file Indicates whether this is going to file, and if so to which file. 0 indicates no file.
   * @param depth Implementation hierarchy display depth.
   */
  extern protected function void record_xact_impl(`SVT_TRANSACTION_TYPE xact, string prefix, string reporter, int file, int depth);

  // ---------------------------------------------------------------------------
  /**
   * Method to record the trace queue for a transaction
   *
   * @param xact Transaction whose trace is to be added to the report.
   * @param prefix String placed at the beginning of each new entry.
   * @param reporter The object that is reporting this transaction.
   * @param file Indicates whether this is going to file, and if so to which file. 0 indicates no file.
   * @param depth Trace hierarchy display depth.
   */
  extern protected function void record_xact_trace(`SVT_TRANSACTION_TYPE xact, string prefix, string reporter, int file, int depth);

  // ---------------------------------------------------------------------------
  /**
   * Method to record a message in the file associated with file_group.
   *
   * @param msg The message to be reported.
   * @param file_group Group that identifies the destination file report for the message.
   */
  extern virtual function void record_message(string msg, string file_group);

  // ---------------------------------------------------------------------------
  /** Method to rollup the contents of null_group_xact_summary into a single string */
  extern virtual function string psdisplay_null_group_summary();

  // ---------------------------------------------------------------------------
  /** Return the current report in a string for use by the caller. */
  extern virtual function string psdisplay_summary();

  // ---------------------------------------------------------------------------
  /** Clear the currently stored summary report. */
  extern virtual function void clear_summary();

  // ---------------------------------------------------------------------------
  /**
   * Controls the implementation display depth for a transaction summary and/or
   * file group.
   *
   * @param impl_display_depth New implementation display depth. Can be set to any
   * any non-negative value. 
   * @param summary_group Summary group this setting is to apply to. If not set,
   * and file_group is not set, then applies to the null group.
   * @param file_group File group this setting is to apply to. If not set, and
   * summary_group is not set, then applies to the null group.
   */
  extern virtual function void set_impl_display_depth(
    int impl_display_depth, string summary_group = "", string file_group = "");

  // ---------------------------------------------------------------------------
  /**
   * Controls the trace display depth for a transaction summary and/or
   * file group.
   *
   * @param trace_display_depth New trace display depth. Can be set to any
   * non-negative value. 
   * @param summary_group Summary group this setting is to apply to. If not set,
   * and file_group is not set, then applies to the null group.
   * @param file_group File group this setting is to apply to. If not set, and
   * summary_group is not set, then applies to the null group.
   */
  extern virtual function void set_trace_display_depth(
    int trace_display_depth, string summary_group = "", string file_group = "");

  // ---------------------------------------------------------------------------
  /** Used to set the trace_header_present value for a file group. */
  extern virtual function void set_trace_header_present(string file_group, bit trace_header_present_val);

  // ---------------------------------------------------------------------------
  /**
   * Method to retrieve the filename for the indicated file group. If no
   * filename has been specified for the file group, then the original
   * file_group argument is returned. The filename returned by this method
   * is the filename that will be used to setup the output file when the first
   * call is made to record_xact() for the file group.
   *
   * @param file_group File group whose filename is being retrieved.
   * @return String that corresponds to the filename associated with file_group.
   */
  extern virtual function string get_filename(string file_group);

  // ---------------------------------------------------------------------------
  /**
   * Method to set the filename for the indicated file group. Note that if the file has
   * already been opened then the filename will not be associated with the file group.
   *
   * This basically means the filename must be setup prior to the first call to
   * record_xact() for the file group.
   *
   * @param file_group File group whose filename is being defined.
   * @param filename Filename that is to be used for the file group output.
   * @return Indicates the success (1) or failure (0) of the operation.
   */
  extern virtual function bit set_filename(string file_group, string filename);

  // ---------------------------------------------------------------------------
  /**
   * Method which can be used if there is only one file group being handled by
   * the reporter to set the filename associated with that file group. Note that
   * if the file has already been opened then the filename will not be associated
   * with the file group.
   *
   * This basically means the filename must be setup prior to the first call to
   * record_xact() for the file group.
   *
   * @param filename Filename that is to be used for the file group output.
   * @return Indicates the success (1) or failure (0) of the operation.
   */
  extern virtual function bit set_lone_filename(string filename);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AW0cysfeAsRjayc0OoabocrFyzgcxAkTPFrd66uNCjkdI5/S0oqYNA8Uanzkdz0z
Rm5QNTHFxLUMILmbTJfndFR1PTQ4KwkQafOvn9uEb3jCU7OfcB0/vut9ty0DbCkH
wS07yNZN101Id/ZbXi+x/fgO22ZYnq+Y5i1A+OwuVfw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21407     )
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
tHgQjGZVZYGFv4P1BRV/dw==
`pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_REPORT_SV

















`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dasLUpMWwQ2LI9JkXVBRAHPpI+jgs3PYuYTKWIBMr1Kr5S7UWEuItQcTSYRWWG/D
SCV8NYPUZGgAscJDCbMSbja/TBPsAr0x07dEkoTv9DNF5fO1fvlqgCg6py28FP/g
wTNR6T1PzPRWU2z41+8JBkAzFtnAqxLwZ4akUs6VlTI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21490     )
jfcqZEKEkGLZuy1kXU4nR9rrbbDzGtx0l9wLAkuNbakNGh7ojTma7YsjC8AktGyI
ogzxw3UHOxoULjg3oDaVICZ1qjv6gRr/11y6xepOw8LbGxOwr6PFb4epGYrzbMIc
`pragma protect end_protected
