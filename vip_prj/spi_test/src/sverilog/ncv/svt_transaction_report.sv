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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
JnGhJG3cmtTfs1QX7WLEZxB20y7n8uSuhZMqsc8N4qLrFxj+X3Ydqr6/xhur51CR
O06LKNGYnUf5RVhBnF9U9HsSIL3UeBaEXgeDNszXVVizbTdQ03hFR3Ojl4uNcTq6
+8arzzS79TrzyoQDfoRgbQV8Lt754sCdPcuv6CEMRMUFHKBGwjoM0w==
//pragma protect end_key_block
//pragma protect digest_block
JXMH8dgFBheMk3+od6uy3ROCqPM=
//pragma protect end_digest_block
//pragma protect data_block
v0hXLj7Vsjg9bi/AX8q8WhHmDOVB8kkV1qsCxCjxra3Ia2xykVrk+ev6OkPvctRC
pFhSYbDxiH29LjRC0qC/UMKRKJtKBsh4sj3j1ED4omRH0K444k4LGHGcEI23Esi+
xRdRlw7HQwHR7Fdr1M3nciUhna9FdNRf/ln0yI0PdbaqaLmYbb48m7q+vZKHGNOK
Z/S0rBX1O931RdsP98FB81tvsMlZOuys3/DZ+CcHfRFeliiHKmUrmpGhAhZ8oSvk
WhFpSSOMWLCmiAIGquaDuJlvIq7Ru56G0TQWHzYodbJZIzpvumACBIcRGvDMxwDX
KuibWC7J66yOQ03kfj4zG2nWg+sujxnn09uEfr6Wlqg+39EpYuFyXgiQw6lnbGQ8
D87uIn7CGRpC/efBKK4l/TNu+XMQefZA1f2oBL9xNH0VeDsf6Rr23+hzSpWuSbv9
lUrvSsjy3GUtzAkSN04D5sJH8pT6/PyL5Ms+8W5sPHMqAsS0aEo9BOErNgGQJ52V
d5l8ZOE3KWbmisXtxDwjkIXQFTZKmSyXfOh12vPELJI3A0l4F7KqeMObrmgP+eow
riyw6OVd94V0owK8bQtthYBjUPN4zr4YzvAnPmSULTY+dt1fY+mgIVR3aCcRZW0a
HXARAkLSIfj/QpbGaZUxu/DCJD9IVS/zO/0YcF5pkNrlujsqwoHg8Xas57jYpgWB
e765DGcMxMyzhnPzXaGmX4jewkfw74OdHTQwhIL4g8HpUL/iyoJ1YBfzJ6c4SFW7
h8ssWV6mG4/ss0BVlt3bJhFaMoM8MgYmM3qDEea3W9rmg/gBYMPglGNxHD4ROAU9
5Aagj1y1/8Hk+dWYPQKeARGYr9LFGAR9nGailRwyPv5k19S7gyrqu2sO28CqEkcP
/p0uEfejFjW8ouSkMdwtFQ==
//pragma protect end_data_block
//pragma protect digest_block
cRWOxGDZ2tgxZf9RrIIvVjPLU44=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
FwcHSmtRATRp7230t4hpdZZuQzVsJeRuCE7tptRHJqyrzDJuRBSzCkLW/KQcdiJY
HeYLmbG37jVklSZ3J/fJdZWJyPcxzNW+amOIxSy+s3DIBlTNO2TiA/Pe1eYTGuv8
wC0GVFzQHw2vUA/nWKq7OxJl2PEQLsKmd1MUhyFOD6+UVsGCHz0ILw==
//pragma protect end_key_block
//pragma protect digest_block
uD0CstzCyFsi4CiZxR8cI2amwmg=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
0HJ4kKvEtk2goCitknuWip9bfmY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_REPORT_SV

















