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
uTH1WCXonnd6tagcfIRfCeLCySMv5J+MZ6grbTwGDJeUdMBwshvFK3hwgF5dxR2R
EHWym1R5yliaYMv6L1DWrPn9Y0MvNtKT77o2UfqKBgjFFrQxA9G+ehGgiHEk1o+p
W7u8LeRqPtb4w4pUHlG1Q8KU+oqFha3cUvoNeFtBRspeN/LJ4p5llw==
//pragma protect end_key_block
//pragma protect digest_block
vTrq8+OUFQ+0/tKEOAgzpI3ZUw4=
//pragma protect end_digest_block
//pragma protect data_block
3/VzBoPyscrWprD75IyQGkCRVvAlb/KA/IWTkdriIXvU1mIP9P9ugv2UyqLfLcKt
wgLT7yEUF8juPnH7faXgVNpqId0YN0Bx+puThsrWu4prtNrYUnxRn0k8hr0fyVzn
OpRIWzzSpEO8usPmzxkUcn4I+wUJlS8vS96pSdz03ykGHgMFA7ijrqzlXLXVIlz2
4nDBq4sNqPmRAFPb6sxpey42xqb/68ZaL07M0WmVsDnvSw6eTHrVg9GtXYPIHQ6W
gjQXw+odnrtkdkQasx0VGW6aA3aI0vB7Wvgj9rZG+F3j+HGWxUhf4Iape/Z1/RzE
fpB2HoIFzDzouyuZCWl9DH4BFV5LhE/qNWouJIfQbElyQSXucPgIHn8JsEKVIxI9
AErK+uiWRRJlOSJp6G3G9TDTid5An/+OTISN0ZpTmrmBYjjDQ3eDRu4Jdxrd+y8i
T4PnQVwWUgZokq0HYDoa7rmUzOpBpJOEDv5xS6/pGKItr8stDVW4XHAcFpCNrWVT
crTLFqNwj26TBLMD9+gq0jpl005Dy6wGgXoe7ar5vaEfinx7qlF4FzpTXlodciCa
wANSQUpN0k6/9Z4zhJUYEH+txHrYDg2iKkMZkjVy6kYaGWFtSAFusdvUEGZY/8Zu
qlvDW8ijBJNCtTRsMkmRAwbFSg9CkcFvostPeYWJw1YG5sZ1H2dQnu+z0iO5VsTa
1ERxDyIg74G0qNJPqB9AjUVYZaBU+P6aOYHF/aN8NY9NiTtHJVvrpNHRPQEvKCsi
A/JqVb20AQy+b5Bka3h0aVAlA5Cpi/Uo7qpvijwpVem4G9CMIf1DQarRq/tCNKqi
ofRu8mFohcq7kHR7cReykyNKFEj8fa7zIyOel9vEbC+rSy75lmYFy2hCJC+Hj2a7
9fdu2cFJWjLo83G3/IGAHg==
//pragma protect end_data_block
//pragma protect digest_block
eO99hJ8v+iKlbH861wWL0MEG0Uo=
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
1R8sgfTxGtapwsAiku13eLtrBAFVaM+AzRId0iOFJhh1bmQpX0zEPKcTV61X8XiK
HLB5KWIvPA9BpVk08ZAkJVKMbEZbvjX2uvMhc4iPalfeNB9UTuAlo9MmKw3nN3Mt
o19MO236UEVeQhz+bmVGRj4/T59MSDTFEhkKKO2FkXuBVpjSgpxkIQ==
//pragma protect end_key_block
//pragma protect digest_block
/lXsT7U+U6WCepRj4RaX07xLcfE=
//pragma protect end_digest_block
//pragma protect data_block
Fda4kDLpybgayxLgYqV1BBbw6LIe29MNxNOuvDi6jycjXEEvzM3uYDSBSLFn7BKm
4lVAZeyZjCvYoUyrsaZb5m2rAuUrULhQ6pWZM5YGpiJ7jz2w1EeF5gk+iVKNx9Gs
ypuwAXGWO4ZjXC3b993AlO7nQzkQjoTeKWqtMImzF866fsi/IUuPLn3tnsmYNt+l
QZfvo2ymEfOPBC6ocK4NyLsT1X5MxtjRxcZ0VO2xtEqfjmR+ZrLS3q9NZdDfsMJs
jwy/Zj568yoZUI7LIwcjhE9mHkhJg0VCAmAOXEanxVxV0/rymJmbzHBNewqTxhNO
c/ismzlR6tdDZmvH9Y15+37vOgSn+baKyQlysZeQ9jzt//ahGQidQSvAIWfeArJl
xJALHDoce72HrbPEH0WaevWDo7kS6x70UoftU7SWWp4R6rhjrhr22mIxjn+Emz6n
4FsCjGYy91NsvskYi5U+NCMEtD7Z5GJI2tKpHwgQ/z15sFCFi+s7Cig7bGH9YoPy
9rbetFpiryviBOWjPEOi9EL+ax5ABzIau73ldEwcwXdaXGNHNOPoWthZhbPpYy2b
Y2IcOmTfz//178F4MxXhvV4oKJv7t6YG0sc3pqumOlNOzRO2fAomCXDxzOggOz4k
um/Aw2wIp1IXieXCx4uxq8Clfih7kxdT5snBWexLglYO0mKMW2rTA7CmF1gVVbtb
SselM2ytOmcl2oZhNeRpMZKnVlpaPL+pq5FZ5SDkI+1Jlu5BbMjgQR+v3ZU0j9Rf
mX8b5HjI3NcFloNfHSHcPRi9+SUSu4qrO1N971w3O08Y4uyMP89udc9aklm6BYHc
SEQZfXnxjnjr8mmIHDqk8DakCxbrQRF+nfo20I43dvmKaDPWIHxwbAIQ/VfC2C2U
HgQbAHyMaB2Rzk8KoXY2P/JQvZg4JpXAyG0f2lN5UsLR3BcUaPQtk7KBOp9Nq+FS
yfmX8IiAkJbfigNAJl3do4Fw5jufK11/NodvpgzZuUZ9Z8XvbvESdBTq2yF3p4Gw
HfuciL+T7CfFPO0MahE7J4xmAQD1LbIRpgU8KCAZPCC+/PX2jGIYCy/ZPUcgWH4U
g2ZMLnzcq9Pcpx++vRMbLhvWQwIUcuYciHiMBxgl27m0QhT9oTltHTVHqYX7I5Y1
7c0iTSLAbNL5eCYGG2nPHyrqu0NSZnKXxq95V0kOnb0PfGoR8RbF734x087q7dZb
eoEU31yYJYoO8qbgcV+o1Pi8g2uACOLzcM/C5ylzhSU8iZjV/UyAtxaikkM8G3GS
WFYpTJUQ1RVqEJfiYzGzE8yUCpm1VqQCV6vOrP/ASm9NaHBjkcjEHXA5HDOHnMKU
iOx8pmjdysFswOhjPe/yEofVH/laDoTWsduhPNDDtw3wEunHsxOmzRYd12/62EZ8
56pzRCBKYBrZYMhVRmJxL7FMzcX9oMT0ZlEoWSmBSMEm/smRpcD3BDxHf2GAQ9+G
hGu92O0cJLKuRQhW6ZKnEGdnQyu2Zh3J/4oqWjju5j9qfFdV/QDOD/vZaPk2Zh3c
28PtnoSUi2XGV68vSHrJDiw/dYwwL6cEKFm6ImUOpX4WtxlWEIwi5mLOasxWThsF
LKV2C+CMqe2ztIZbdnovm4kMiCAHCdcGPny9q/BvK9/fHL/lkIe1SP65Bd1ruyBn
t3JTsreB4EaZDmd0HuXCON9SJhgI+XPRhRSCt3DFKl6ryoMhg49mbwaP4NMxhFOi
ZuArxUi4CKkHdp60D0J1Xv2IfCrJIo1zvbnPQziWJuCEcVzTeN9IvIze7f6x5XF1
o9Sjy8F3umwQF7iEXnm+iqoRfEVNkBMRcen1TLKwvbNZPrqbfnqCf6f6QtSve6lz
jCDc+FNoDpwzZJ8MztMeFLaAIm3gmiWITPaUS+NImAlKMiuxEJEKGuFKJDFv8XSe
N6L0b2D10ATkz9EhbJg8FiKtKN/Xb7xCn9mVx6w12k/tv3bbPbm7ITzG2HkZsDtm
Y/+K1dF57mGQa7DbtVtr1YDdMiS6kGlJO4O1zqmR8GmHrsKiJEQz0zUNYrPymGFH
7tBdqXqDHl+efvQra42s2oiZnCXLQNu5Zpmwffe18Pwu5WdSSYxWCg/UpplgWwsR
4wbZRj37AwTK3Nd/2U3r2XFryuxeY302NeVrDb4qTD2pYtyIxPXwnmhgS3Qbbyx6
9Sc7ZLWFx6ZraU0PeilnNgeeSZtZpRX4Z/RFcRpMQIUWZRMR2HNGgq2MiHWdL80p
84EjuzjYAmffUuqKdEjXLAA0UBggTgjPI4JwAFN7oDKYvAQ+gdHXBWdFihboCdDX
ZC9jc3xvEcqcebi63YK3CRBfjlMZb9UeyQQ/fHRwxGNN8V6nfPlwHcMJwsUNEaFo
EN4glr6UeWgXBvPRA0tRf5T2HqwICuTsv8bkSZyeEzGGpO3EvQfcmHO6hhCKNqM+
x1UwGjzgCJN+RBrZN7hPawQYwyk5sZ5gSHphb1eqY0WyIrS7cqf08bXtB9CZ0BwR
KTmO8VWAN2v0kfnEcsLx5UdmgSD6sCRSBlRZwZTxj4fzPRTKQM+0SIN2wNfR/a6U
xJuw5lxD45n5hC02KpFewU4Oh0XyrL/yD+6bEMmbpM2HT9a/tgjPKpfAsHJbdXmc
7/5TqVshjp3X/KYlY0v3W5mvifCVMBdW961ZCg+WpEuM44VnjsoAqFI4tXRy/XJn
C1u9TRtUoDREM/gfAf4rbnrRemCjHMOYHGs/e0sRELc1ANe2Zs2VB89yumlLb14h
EXDvggQEVskpbVBUopNcwZc4WpuvyX6+0BmxUN9XEyIei5uKxSR62HmpqkUvSEhK
AYVGJ8CgLT8pt0Tt9rHwaerAhx3grU+ncsuYpKATfBJ4fH8BzPCgP+/gcLXd74dn
tz7zFhPMqZW0XH/VtYQuiLeDPIRDD6H2XWz28so21veJsFsMXthSQgSoXVqv41h4
0hfZWwCDMMDgRSdVzf22IaZIacVSIDapVl301vfpwPLTZ6FGBghREQAmjbozAERN
WJ4CRyg8pSZ98rgebgUo7TiIjhH5U0DkA+RvYtkKh3q0+DbC4jluDlVSNY1aYQFb
bUIwt8X6yXztmTm4LXaG5eWsx8HMUiDDoV/BgXcAMUnXphXOoeykt6ZB+REu48IY
+Yj5ygumF7nnROLVwimXR25f+nvA40jbqazneleUk3SgjpiujyDDErd+5gSN3E15
nTXJXZDubhakaZZlfBM+xyqAn+iJHya5RapFt4uF9Q+BYjqLpe2gr5FQdjpWRn1J
mWs5TFGNB0ul60Ix/FxAr0XQm8A1r5kdu6fzCSuSspeaFO+fQBUOMb+q5t5JqpJ7
HcGqStnoXTErelGDvLlIibF1yRJ7skJU/PyWLlo+56bce0CW07UgGYcSANx2C/tS
Scw2SQbAeuYJ/IH8u86e3GC5ssTbAS9S2/iIHwHPcGdDnoTrMDLSC2yJjU1m50lr
uM036u2/3ONPurssptsZgEYmoog7qcpCk5bZBvqKlHtQeEubhZ41qM++Ji6N6HSu
EQEBSMAr8euTtkbAxwWkmjQv5pxWcOeq46ZYmPU3Pdxh7RJ9mbWLQPolCq0AmQYQ
/EXwxoMWda7hi6esXsMnEXaauh0vXdUbAoT6IqAjrP87f9Axz9KSdtceE+BzNobn
xyb9uuGB4G+PygIUCJ2+wKqFJIVJMyo7EOWYz1b1WZ1/qHx3susGA7GFkUt9ZaEd
+I+RTOBf0hTcHmsV27DTB5PPciTkq9DFa8WB5mhIEYgv5+VG83gmuC5PRScK54sC
RdUKGs5VRyevL7q9Fez9ulaaWjg5M82IKxxkjvOdzeNC3kRfHcRr7KzeTm1Tyd3U
2ydb0GMAeMZjgLp4tTYjQja6q5ntUhUOCrcZliV4T+34u/J/cDMHkO9OgM8n00wz
WCTEru0S9L6/1qKipdTdqh/nvmx6fbd4Grja4QemzJG2avvu/DUfOYHUKW10B9PT
eKf1GgEiNBhik8X+79CpbyuGB+eoCPdZAzywUuvso77ViDR1TYY9EXA7FL7T9lx8
9M2gJhz2x/9r+hMd7mOCVhWiFilbIY+cBJ1Y61QCi3aou3ic+IJnuB9wzhAtEZdi
P7LinRGmZWZOnYzAKMnvOkvEk6tRNlxyAwehHVpkr1F1CLIzVQE20Ut7NmIQemkb
anEdd4SJt7rF4V0Sla0mnAjtJLPzkC5cbBcLvXJMAhRRWVwvsoT2ZL+n9xJ5rg61
x7HDScxCmN7DDMpIouzIxSoZE2Yh5fpj8TZvc2XKbFeEl6QZIIAnPzPsc00lxl0/
P3qSFvu5IG95GsaUZKmN4EkXAjAevMLioFUokwIh7U3g5SEy7cOB0hnZTN/kkBmt
CIAxCegjxnoknRq6nIDkam9G/p7y7gP2EroCciegCxoIpCR6/y2yIhwXG0Xw2DCG
V3H9M0kgJs2C6QF4AOfpLeTqOOR6bws2DzJY48KHMFps4wVcxcNzkw1sLgOh8dG7
WMHBF7gb2dtpQxdTuYcLwm2zic8zakC2r20oFN9+g/f3QNt1hERvaAR0tfm0hsVp
9p6C0zF17f2RHRsirQiSCHPw7/ZyB/vuw/66JhEGaMbjWyy6UjT+SzWkAdBM/ZDo
7ygc0hDUuMXeDyrzhn+XW1yWrmrx8ofhmDkxaayya+6bV0EMAUG3AjeBhiFyZ1Rr
RR9F8theJZ0KeyN06B0BPPb8Qt7izsL8LXLcFWaEHMdrJ3eZEvVw04ziLby0TWbo
xgjmnKvlyedSj1UJdl0dLVm+2sjMryUBqhhcDndB7u2t9c4H8RQxlyoJjU0DtxVi
O8XMGszuDg34GRnu06nL9L1IgW/CM75FmNN2z3wUz9HEXlJOrXfivIGIxfm1xQRM
nr+/XB4f+5e9zrhDw8CCWNREjGG10lkZmRX+qjoFEH54F/FdR0ACrAxKEAnLC47X
+mm87TY6a0q+Fb1N0R75kYCvUWQLLd4k5jmcVqA/+eMaLmqoJxv2VtysqPt7giCH
MpYOmbuHLE4unttWtNhV+rJXpcR+ZP463xmvex7htKUXNKVhDdIJUXq2XcdszmEk
dOeEwgu7HNMI7PQlp39c3UAsr3xF3yScC80NScv5UOdmYHrCn2KA+aia1xBPUOkc
w/Jdu6wWMjDb0FWxbAJ73IRjZ588i4n3fXL4aZPN0fvrwhmUSi1nKu6zcPDUwAyy
SC0bM/hCYcNquGuGmRdsQLDvY4LdxwPxg/Xw4X3XbMkzxp7DRnx0r8mlnTGjoj7H
XMU2qlkkzdtbjIFn73bR7zZhK13TkmzxuZFZCzHUzTFiLnabMSuD4G0kPWR74FTL
1xTD+2O01EmPl8R7rgTdErvC7oKqkB70Nr5p7+tuprdjE29oJIjtQzwYaDIAuPCZ
CtRlJbCgfZvy+FLf9geiNus35e8qxAibA95k21psWJcE0TFeV0GEcu4ZUCOUsbyi
AhmouLNhV9U+J17f6Zq/oVp07QoWr67knW463d9jq8lSH+TkGFqO3xR6FmlMZgJm
TqGi0enKS3cqBwPp2uiyXhBfVDLcbtB4XQx/4Oa5qrJV/ixFad6rqnWz6qAlum8a
iLm2QxThVFzb1TNR+bXu8qSIGiBQ+Mpf1MJ3cmhqHKHHHXnUALJOm7ejEsn56KtQ
2UD4Qo3SyYe7VN+xPYAXFbpRkcGEwws+MMsReVVyDFwQhjf017Uqkov9xS7MDsCZ
kc80JnzGeQGxmZUfHub4EPyt+h3+gAfjMtuYFEl7cGwhoXtVp1BswSpop0yeq/sD
XYu9gqCpE8JZK2nN3viRkz2uHGwhRz+14cmKs0FFpmvIoxLAV/naBnPdD61SLZwb
iLKpOXP8WRSR+nBpuTUS80fd9CwZK9whZuWU1p+aNhfazu6Ae5713YSxdJyc0gqM
js1V48a6QPDeI1Q9DUi+qBbUOc+u53BAfUIX/m2p5taFrkUDG7xKKZClUVHnZMNh
5qOvH1XwAWCDbov9KpD9FK9ebcngecv8b4tZPgNhg59RXWv87kJ3OMjAeaFaqU1R
oC9P4Kyw28JmjTKpHEurmv8yhaeSBuNv1G0aX89euuPCNansUJF8N717oNy/UqHb
ZMinIN4J8XmL5Q2GXW1/mFC74SuHNsZ8czvqtORKb1yCIt8/1+WTuV7yICx1v1HZ
aghK05UcszjGt7dX/2dnM58ar+KJAIKMwh27oA5vEQw8i4EezpQGm/7rO1aU3jka
TV4s+RxHV0ycZt0cz9eGVZ3SQRBKDd7RLYR6Iavhbh6W4NcLN1/A7+EZr/WC44xS
8ri54w4w6Q7KV6hU6jdlLKApo/zWEHe6HVqvAl/KYcB+u3N/spfuIdkX+1R8WKjj
FZy57xcvVj4X+ybIkiAicjX2qE0zmRxNaS/OADY7STrnEM8fsBbFjWslJMzDz5aq
zV2gP67Y17V7zB39dDKBwIPznqLdcEEy44FGm3dURMZfizelNIOOTop4ocfgKC28
u9jzW1ydAweT47tHvBl55zN9hb8h9OHRGqSUNaECT8WFSvrektCdCmMyP5KcUuAs
CgL/easQmJPMi9T13+EsLpt4uGhrqdl4LhsoK3YaYtQiryNb2FPPUIajctYvoTCo
HpkGlRZGvdS0cKbCdp5aPvGhvenuupyfpAPD9x9EqwGK4WMAEu5Vc0eahAOXC5zd
ScPsQKEcz08GZzW0iA9d1252bVtubTYNcvt1ofZ8DOobj0XccTdR/TijHQizjbQe
aFNcXrYw1qm34ImoOYOdzGpKQ3We9T4AAwhVAnouXr69Erw4YK15a2kM9xq+ExTJ
fSB5XEvZvJM6XNxdgrd4GMc3MCuVbWtZsyjDk11VAFiPRkQ6NO1QvIMSS2lPZSZc
NEnBD2GrSWk4gFqgDLDiVlH+LxKswQCan/dMxsiLcYa2nWYD5qb04BUYENmOvBFK
u9oY5u0fIXMkDPI828BEcxeb8G4e61CfbXws5DL0yGzE5UHNKaM2D739kXGcp5cO
rp09vzxFQegrM5G4caEx/Hbmmmh9SLqfecDkwzUy1DZGt9K7//Du6PLX8EDELE2u
RlV6SsIhMIYEi1FV4NnWl7sgqWNnZtfnLK2yE/BJx2y2sn7cfipsC2ul45aAPjs7
YllLqcUieetLV5LSHVb8BWEgi9iXqmXC3PqLcCeslHnXeZQlOqgznqGO0shn/h/v
0li5RrA/76dSRyG+y18GtlzkQtHNNgeHOdLhE2gJCJBkMGE7mjAiy3dBfkb6+Buq
OLNfJFUd+92aV6e8GttFzTAOyUg8vgItUA5GNGq57AQG7cTVfTiYXFBPP/w5JekV
7h5e+LOfk/+yvIr3M7bEcggZ8ZbWayUd5BHepgmS177zq614LEcngUX8Tx2di2HN
YV2S8UfJ+ujRhEYI73MV7tKumPXu9Lmv97BBot5CEOvSmb6FhhEeQuQtJ1Jw26Gl
KiJT8h82zvOnuJ1F40x1yVdLg8ZFIobaXbWDixb62gZ10fb7JWqXLrbExv9T2dhP
DaI0jjfRW7DxeBWOnn1GCvlv/NVlI4M2Knaq/BJ2QYA9K7Y/M1hzmVvlU+qfkJYf
z1H3XSALXde/Qxn29OR5P/vWzVS7pNr9lqJJ50D7f6b1zsVPbAxAHLQk3lEPv0qe
4xScdf4Nvz+tyIjIM6vESXzEOIdLc92QnHzV37VO4vz15b2nzOXCVADUSjffUHeQ
5832EJO3Zy1zuyLpxevByNnZ3XxTnS3UGHfoHOByuTa3ESUKqHXTxjQeF8WpdtFN
6H6a2lZAmpL+jz9ribnIY50pUHKjjZIIY5KGPAF7ClFVBrPxOicWkQDHHdFjMhbh
AnBTBCTWMbGIvawOCQrCTk/OsnphGl7UxHLkyX0Yb1V1FR/9BGRAaPi+bfzpq0xU
pJED2InkdScOYoAX0DD+hkgu6gIj/oodRvdDieyrgAjCDnwokgklA1u1hOP7gohr
vKMbZq9QHIoIOtXWp7SYtCXWBjoqHcWECNj5kq8x+uoVVFJZbKCUm7Q5NJ1AOnX4
MLWK3SVsojPQtelHVDbtW6uCY8VODfjYi/fi+9DUJmBCNzSnDDWYRG/HktbX7xfs
g7gp7QEMELQjc17fp6Zlhljhof+MqbE/dvgInKl0ijF68oNHEa6z+jhBxtzswdL6
dygVeLJbLHmJxl0gPdWeSDwQf80WsnLBD3njn1qdds0nlwEKslkTUdaFy7KwdyAR
VJbGU7hucm1aMKRmgWdemtrQwei4731BhlUQwGnEJPgJMqwqqID4fPw4zTnis5pJ
K0DcpEzHPXwWPkMgJWhawBBj+B1P8EmGuFwxydR2sqFv/kSrmXC5spGKD0RoIH4L
xIerfPgrJRkPP/UzScgcE3NoUMyJ+w3L/0Uf5uq8x6CrsQQgN6Dgce7rDHwDHw+q
8YX3nsTrWWWgCm+gNhZZyH1kyT1IdbhYoI/sYuPckJ5DZPaHvNJjpQgD/9q+Cu5A
IHY2ptoo/2tjEUTS2aMuEGjD2TKiGV8wtoXbn86wxOJTiDjsuaxu8olH7JWXUuAa
hk9uxUq5xOrUEPW3O5uau8CV6BimckoHzUzipgeDZSD/nTlUohxZ5IpmM6e5BUJB
y2VgENm4m0QeAKXkr6FFhRu4v9dOIXIBgXy5APEbMalE5Jh214m4blu7EPDSS1Ny
CxLKIQav+qD5l4+atNlRYoPMBYVCILFxh+rJiZd9e9EOTMgj0ZhIHfTXlDjUsWj3
l3IrU+J76Aaxb8QjVtGs9jwKHKSxMg3ifpUxaIYlos74NmxQUoDCm7DtouEtcJbQ
SSYLPCJ25meiMaSzf01a4Ntal8ITWILrCPLoAMHiiyA8OLbLEh88iFVf+4dY/Lsk
1s3nff/JD6RWTyqLiqEdBU6xmqnze/HRXlyky8MqPKA4zlvT6Bl13aabBxt0m7Iz
J5ey6C+S3R+B8UsXC+Lq/1X5DqbALNCmh7w+3Twlnmz+/DsoZrUGbJdeEV8Y7h9d
6vR3d17Or+c0PZTWAL+uWhQrA9KXKHjq5iZflWksQMvZgwWlB2j2SOyCS/X90iPK
CZuAeM+Bn9f28KeSovlNBmOl17FVLiEqCduIdYrOfUFZdlhYR8nldH81tJehDMpb
MT4ZOs7elXc4bfOMWAUULJGRAK4/CPQkc9C+uTDM3wiHR/I1muYIqKKEtyoxlaqz
8Adc6yE+Ih1ICSUYFhB56ncOuap7Wnal2MCm7UaUzqAqqDIavRRADx32J4Nv/kAy
rj2VHsFjT3fQArmbWwBdL2/891E4wzeaC89gKt/0pI+Y4ERElZVO7BNNYwCYBytT
AgpagPhJySWXJ0oMkISnhuzuJzRwVp8yr2Tq/T7/e+00SRZbWTcG4RIpeFA9dDDb
OQ5zkewkaRJ7IcgwkailVEJpJrpdPKg29dUNBFNkv1FrhGn2VdHk/AZhEDh2HjEP
/niM8xNL6qfj7LEdCdpP3aQtpYW3SvKguRUi6sM6zuyMwqR9HxNTGRy3x7hHoIp6
WEx0kiY7ub8CkY9riS45Nw6niQWUP7lPK6wpKRF+y4oCJNGwGGNnz3G4G5oVe6oj
g8AJbLpgYHjFKCIgoYEgiSy7ScztmnrsJC9EjfGqlTGqKyHXDHlo6TizMzimE+yQ
AiBRiJdF+hAiWneubAgWJk7qmXFLL36T0h6goMEhwW++ApFI7KrnyVEn6WBh8VLY
A7jiIGOB6K9q19Zf0Xcsj3/LxNgxqEQ0uXVJIkE5Ro+qNiUITMRglKZNpRSYhAcD
w4eYV1mJTR5Cj2EwsXE1L3b2e+fTFmuRq7GvF8a31N7tA+6/MjQ0OSKvzD55Om0I
yg6QhBBIXOdMBN2JXeAOVnkY2hIPPjLeyQr5CfNXpkiFBDjEqRgAgTed7f/9E/m+
rta91L7W4h/55bcEAwNrjL4o82qetVZO6zDGa+0LD1Pmk+5BR6VbR//JDuMdGQxE
U7o1RoshD1ymIfaF8Ta+xND4zoOuNJ2ezWNbSTFnvvcaRHNo9ZRUZHzuPQLbF7DG
9ugVHmsY4OK+zvn0i/kNqviPBkrDJZ45zyn+M6oyccHA7HUbegu+vZ6ENs9Lg1fP
PvAQEuQvT1w+EF6Ot26EV6DItfUOXL9Fodh5jp2t1RXgeO5mWbyGx9JZbczRXdNH
RM4x8PchqAS7uHc86O1cQhYiDALuqlA/6pu/j+mlx6FQb5ZpbXHq3LD9Pl3Nryfl
6MCrX5V5HmN8ctXWWLxdxSfKq2qtFAWq86/8zuDkwH2r5ntwsa6el+wiJN/StdWB
xx+BT75tqV25T0SWUu9n7+jPW6//mogdPrO0AROf6PtrelsOK8DaHbTxNhEO7WDd
wwndRALC4yUL+WPyzENer4q3w0jJGtmVQen55SC+ut+/8kpdm9O12CEOfwmGbNPj
2BgY3CKg1f8zxqoaogcKWOUAccrCUgoeRdJHiDYDCxWzgz59zTmdfdNwl9vsf2vu
OzIsLgm/gYdUM0Jlg1v7v4es4lQy7pnhVJkFjPJGu3V1sqscwT5TZ5OpCUzouKUi
VxL6DfjS7DxL5pIogFAlev/13n8j8MFd87/ClAn89uw3mzXNlvKl0ObgNyQwjkfo
UuUlMqkndA5uBRDBSwSt9Wr7uRcSqsONBSNAh4q/NEJZAisEkEuKbD6G1STCKkfh
F87b72/4dX7zkEjioOYw4f4lrEwcSWcqfmlToqmVQq8T4YEtZydxGQtBSgZ8lC5W
zasjnXjfWQMGoIbhF4J2FMnyR9S0Ml04NVoj/jp6OaW3zLPWHzRUkbTDH/lGKvEL
HB5QhxV8vx4/QY+9xJA27f33BTvmkuSS8i+g16yweA3C0ktTcOCOcwrHxpVZ6Oke
7xtNsLbKhmOcNye/Ntd2htM/bQockY0v2NSSU1th8M2+adQp1WFme3Lrg9+UK3JD
quuF3Zx7HQ3t9QWeE0agBMMOim8XqKJsLG0w0AzgclAQuo+hO/iLRVOuIutkVuMB
VSWHnOFKBax6vYQnBQ08GQ330L4OTjUikT3DvJEUDZTBBOYdOe1Gj2C3X2joHi4T
mAblXk8q1wD76bUjKemPBFsKybrKCfsX+yHpDft6WMIuGRisOjNCA03BwIrxJrh7
E9KzjC6H2HCUo5FAAfN754thu+yelCyht8drrjRtLY2ebKEYnoXcVLMp0vVVTdzb
52jFu+YALKN2d/EmPHp7GXvxE5XWH4tQ6+b7FW2sUT0p3V9TK+TxBBh9R+zbo5S8
O/6C9kWtaJQLQu1LGv+sZtWYYpkeI84Cok7gJxu/2NDjdsQYdVM+DkOvFdiYpGte
TTHBBs/REO39XKSiZDRt9YzKeIkQ+TSkQ3y1YlRgTd3xy6BY5P7d+5xrzVBIRpb0
Z8r9BNJhFeOyo4LaJUflBoLY70vVKy4t0vWanm/v/7KIK/DexMLXNFZmkMbLqaVD
UqMEj7qqcx5xXjFTAyI4xxLD9rof14E1m2Eu+Wr403V4yVu6SsRt8qQoj1cKqnOp
uk7e9dl+ETBwt/e2/+TqN0a444sUjg0Loh/h+5svq76txYBGJe9xqA7xX2MyRmp8
bMhsADXBk958NeekADRm3Ax9Oam2uk4pBmeAl+hsDtrcVolgi58mK2MuoXkrhi64
jsF1Tl5IC4fBFiXzfvqOydXYOh96570tEgxQvzFhAWHb9Q9bSzPO1H+QtGdaeyKJ
YYHAFyH2QhEGGmuj5Z/ZJNRL7U3LEr9ZHYZUrPswoqEuPmqDFN5YZL1+l43nlhkA
9Q+HqyBWeXsCSeIzcN3b0I4LgPy8aMv8M55hH+r3lrIOefrpiTDJQnO5RxAkVF/5
G/TbbKD27OHXY9ISk+Fo7UbGGLcVIzCS7vuy8z6cbyOkwkhkAASGDGapXLyLeHxS
rkRAoZjcFEATw6jNU6B1seZ2muDrB71yPsold5DNLG809SCB67DuV/N3IXaQj+o1
5I3HH89c/7ajlp4eC6NjsXUYAMTa4cboLJ6bFWq2I+cNhPAsvRsIyiE4LhXNb5GT
okcBV4PxsQKoJYlfq/bFYiEC6KO3F2hz2RuBEPbvB9NZTvQRYWIK3icoLQd/5CVX
12feT0yq5xawrMY24xzW+ZlEXoLeh4aLEiDl9po8i/AmOkLeiUn71sELl+nJB76F
25XwnWtNCwnDE+lMEpXnqNjzwqMKroLCC9oQZ4osx9BcMhKLGB29o6CQrVmGOAO2
uyVV72IDlsf0uGHkfHFqNbcAsdwA1TRB9F3wqGX6uugHEGtatkrpSmbF8CowauaF
s9CxYQV5iSDdQqrgsknC9+me5tyRvvDdBa/jEkzZR+8awCzclVIqiiENtqmcrgKl
vi5dHCVKNX0DveO5ekFkeAcswyisJ4NIy662Mm3qh7rk0/jgye0IlUcCF8pWnT/m
15F54msRMjGrw0LW9+gEJtBXQp26y12MqAmFyJcKWbCJm8pxmCfhzDGrus8kmoct
z0EJGc/IUHzbR1RBvb5PbIf+KvvQCVkJH7LlCfj+lFqlzwY4UNYl0TiwvXa9JcSf
C+Cp19gNzcGT4RxhpLX+H771uNCPCO99JWZdpAQcVnmLuXbelEzI0h6X+KTErIR+
HNX5E+flK0Hk6PcXNEAlBZbqUzsR4J9NsPRPHEyNo3pLKhQ7tJoQI9wbCnKDRGqf
eHb//53HcBV7/9D7Ev07tCuHz+KL0fIZm0wiUqq8EhnF7v6RIh5Ix524TcbyRGa7
0FXVTlx69RixBFO1AdZfiRsnPNOTjPLJg9F2izrVbUuOyMcP5snfGrW8un/x3lGe
wZa6qo2yGZ3eKSsF7vpI2lVQI9z2eo4mwCB7liTnDolDRlwkaXHYZ/BQgcXMK6/g
gnis3mMfb0zi8jth27TLBhexpx9H79LLn4+BK4vdhpi3PNG1tC1F621pXcTstl3O
6Iuq6NwlZetehIHuCtRKG8HfMaGTKtW+PbOyiOdKkGGUe6Eb7P1cDn8whz2SRfmZ
1MIUmz5yvgw+0TDlwlzMWxY6TWEvE5DdEBqOpELrezfuyMwRTLsMJQFWmwzE9Jig
zSo6C01taMocNtqCr/6p8rGD3p05YI1JHggk2J0IAF+QhoxPNGHCgJijNcc5pcCd
7WjG0Yjoo+Af2FzZ8RAneQLOh3jBmQ15tYgL65kkbzXNN/2ptbjq87brp+9yE6Wu
BLOEX5Ey8D3h4Xb1G90BfWs7nEOTPFAgSuUVlzfLtVI0Zh8qVW5n9NHeAFcMlY7v
ACr8YVPzdKb9lMp3fJAfPCLa3cX99LyXN5RJai7lkzEDdq+qSbMVbPrnHPQYKYky
/aDeGT3S+PJSly3xOHSuh62M40FigMAki7YUawBMlc0ER+0waMx8oBxAIVZJ83WQ
4JmGRNLWaaZg1APmMZr8EYM9xcAKJ9Hc1pwvbbwzLARmiL7jwQJW1MFV7W4/VTFV
PLUdktp/qeUjyakLoVGea4wHe1RIofqEbpgDAgh+fUYbyxrT62/N1WDO+5Fn4n7T
ZL/GqrqDo1fKPTUWvrkWuU2EQ/KOavFAr3LC+5O5i6zBgRniB9w1SkRGBSEOG9Yy
Ui2XFY6mVW6AGtfhhvLiLItVHOmL2E50brysIx1SgPZNfpDgMW+EqOX+qkIttBz0
ypZ0bUxP/XZOKmqySmeSDl2h4Sr1q9lvyFmiRrgXqqxSfHoAd6URRDXjglfOvHfz
wDaSqQ07viV7NdTusqTp9iA5st8ALD7eVscy17aw7RbNToh6n0A7AAFC1rz4mn5T
3xDuwW9OEuwF62Yl/XJehIDJyXmOPN/EC/vBrPqf/LQfhsRaCZu6BcBwbbKDXEFq
YsIwo5sZOBE1K7hHiudur9pmeQ/7w9SvxPOtEVxOhluNbEVAloVncNfvCzep/JOl
QdFcmv4lo9P+wsOzJ1D63F4sdlHmBGni7qwdTCcRTr8B9G0lM3gweSytRPHI6RC7
fxmerBczGmRDnaWy7e9hN+kTiZBM4HNCIXzf3cz6ZO68D+xQW3xQv2z7gw1DrVNr
StwK1KZC120t5dIccJ6vXi05GsUM0VPMxfyT9b5L8h2cqzGyZj5ZbWmRTWmlwR51
ouv05Nn09Ia2OsbPdsVUqIM4t/i/y/99jVALgOjglPdm/3uy7BMUgYGF+aE8KmaT
9gaqN5CNx9dRq6VysCEsEaUUMlk3Z9vgx4PIUYM7V+9IsLaqvDGo+g+Nc+zmY++/
KziyoJ9Ui7CjwlbQZxww+5giyr8t8+PSjv/sSLpYxrE3eo9Zav6xcigkUfQzgrmD
R8CBlWzY5YVdwmYvU9aPoKDlqEovZ95EFmLv7aiyDuGuh7S06T97/IoJud4Yrmf9
ttZPGRGsSTQ8XDoWnfhnMgepJabtTpWhYvW9NrVtmfKnb7cDAT0XBhbR5MdWDnJD
u6N+90ZxbptqBJ21lYwfrNEMLAgxU5oMyiT4votXpfWn4sS4qdQg4bM0WB4mudmH
tY5qcewzqcROqVYl3aKeGpdWFOOWUBdzSEQD+WF90yeLDPSuBRXy0WB5e0ybDAjE
IQHZZxeGoFxNh6SFdOUOxWQ9ZnTWhfdFKB1d1R84UJKJjdKj4sOz2lRIUCDBGP2N
LVsbH/9h/mEeOnYoJOH67FYt/9JyPcG+Pkqugf69C2EqsJijySIk0EUG3JKcI4mx
phrqv/ll8jjkgAiDdO89EW3bvasQA/nhpxeRPRR2BvDKUe6t6U0x3sSTO+rbag5R
FuBRC3/EaXyEdrCacN2mQzlxazXqhGGyKquGdgkU/9IdCXcNVy4E9S+HAZriAyWI
/hrJpLeqlCtIwiN2Cujrf9fLBk0QjX7syIft79TIU/F7/LEostcUwUk1bmt+FwBK
MV9QqbKK6Rk8NEybZNTwhEstsxMCc6lc7ugcF6E7l6Z43DD2jIv9sZLE62s0pasc
jO2Hu4OXO+u9OiS41ksUgI/1tuw57rNUTlOrVjg0ig3xwXkx4VVz+Z4jwLGqkUSk
E4/7QCeUYcg2RaPRh3IlUx9+cvSB7uXv4PcweHR3bPh5aUsVGfnkZZdFPBoB4Hc6
MiwQm5OBttUBgKkXvSBMcuoU9uixI/nDj7qjjzrf1zaFJYsaVlj3zedWHix06Vr1
Yte0WG9/aeLv5ZM6MOnHVF73uOuY8Hh9mMqqqbEjxUmpBBGoz6mL1gZ0uDEZ2CtW
wPleOrsw1pkEiKdgE8I6LFcWIBME0P0RXDNvwYb8VEtoNxmsHsF8C6pfrY459sfg
ziXYkd66sb+sYS/UlIkFMD09KiI22HsZvdtMJxncQ9D/waLoRR7niqdeU1vFWd3v
jiZHYj9jiyRMx6CYgVUtMDVhHKdHbgwSvGyDT0fPmx9ipAZJ4j17V9YNKuY3JcX8
b38iRTIXQXMbXUhlXOzKMcA5oX7ymh65jY5xtOgN2BBRjmwLp0V9r6LYx150Gu11
eM8GoI2VUv0il+lzZX79qn/2vGB9K8AODqfUC/ynxU8/eJL3946oy7MhnKnZ1orY
XbQFj99+lFTs0EoijAMgVPIAOZFfxuLx4VdEvOnlyw9djd9eqCxnO21YaKf0pDtI
4MQD4d0sJ1XMFSgjQygD6w4YpwKKx3VARK6nteVhg2P3+LSups+rjHoRsqSBQnbI
mZreA8uU/ApcvpszXT+W+sJfOxDwl6TjRYYrbEbNruAmEokx4FDWfrzcfaMysXau
HX9rJp18whStBZgPBNRDrZw+hO2ozAFg0AQ5JdKibYiKLhyEwXh906Kp+qV4GCyH
FaJzTTOVFNwxgDiQuBX8dhnHq+hXg0nR8fbCws7+rbInmlPUjbfvXrFw1qQBVOA3
Chn1tATX0omGgj6oHvykw+eM1UEA+3Zt9gRuMnolFQGyA7Y8XGdPtfyXzZ0jCeyZ
JeNSjtH6XyWzSZnwmIWu1nTQWdq+jpWkvkRMsZu+9GHRlDRNxPa06HrSoksyXhP2
Gb261LTW49ixJY3yJgAVA3EZXVUUmJfW4NGIQ7I72bKG3+hRi6461Anhfaj2r41r
VtjaW4OUwf1EN4SyooNJg5aBySLqy35DeGKJj7sEGXkZzxKlYRj0Z4IdG4IYv98p
CwjHJGr35kXsm+a7fSi9+C1PD6YinQGuWgTQX3Yr/gqQvz4gWhwJ2fU5kF0Mhkz7
2TZPaLm4h5CBl+RLP83Hkpl1wnUxzGJoaw2DsDm98Y5vH9e0+NVVkNKpUUzH/VyA
5OtVaQLMx2suHyDuJPdiICEXpgHc7WsKjKSWwAkkhwT+YOzyQwGgqKn8Sr2mr0ZG
dSu4Ku4uLS5FE5xQa8iuJ44jHtacQIUyQqazljcR+MvbvJmfkNvHUA16fxb4VMfC
KjXwuXly9h0ghEf/eI1KMUJlZW7sdURBFyjkm9+QGyjyncJ1Oj5XrLvENxX7gJdz
IAPONzk/srL84z0MbGO9IGpMUMCLoHvh6Ps5v84Q7QrmgrJEWJGVP0bw9fH+GsIx
ZPHyYXzOYZz5cfGAJ5/mtIpayUP6Z1fIalGQ+0cyZHIqfeEXVQttlZwTeUK3VkCM
IrXJgrEO0mLzCY9I8Wu43MMPuYfLbYrAZvv9bQe7bI8xZvMZj1SRCMVmrgDsuz6f
Uwo3U4P4k+gOkiMM77dThMDFo5dSdb96NJlOCvaRs8urexVZz/9GXlVL8qz0YKKp
smS8BW5xRzQVz5ufx+m66Egl8ISpZETYFB2vUb42cJSUrgvqrsVw/aqgJ9CKiDOt
7cjLIlphiVDTcI817GGxImxM/hSO7ZQLXxwx/WjEVgLJY2MoRMSh+m/gVtNFakf0
vSJckv6POKIIhaY+u9bZUnbxr/uR6oxHwteA41Mxi01cSRZ58lPdDxnczv0A4f3o
Wpt3pLekd0KipEj1WHerBXPNTFm0a6yDDMUwwN5imatZaauTFv9oAgaQC59OnZ7f
vWXeesDU96zwym7sOmvcYlw+7yEmptmUzcWDmSaV8D1t+Xl4AEuI8X4eq9qLBD4j
7dePUQ2+M7Nw19ZJl48kDxpE6aAz4nHoYe1iMiTTU5x97LRbq0o8IuOlMUysuAwu
LxZmtPmf3mx9JA1aa3BwXv9jtpLs2YbPrWAz1xu4RYCu7l3rpJBusV0EdG7bkf//
4ukUYiQUhUeUnn5RnNai6n0nlwp3B+xqLoe04aZVPxO3d9BPz9tVfoFZ4sU5lcYy
rZIAMRNPKxeSuCsgRTaQMkMf00bT7XZb9rDsYh1UpBr6XsClMRz3Amvu3eUSYkvo
nx4qnaxKGCagFJfLN+DgLcG/UcaPFiYNvCqWt9zb3NAoP7J0XE0I+8BXhBZPoHO5
JVQOwzwS1tFC+/tTHSRZi2FMwV0Em34dMAmTAg4DO15jMZk9lqrKyAlfhxVtPWud
gpOubAYanMGkOsfw2TatjH2fXtGE293LzdoDlL3XY5D2evONVeIG8Ezd9KLd4rOg
wfagVMQ+L5UPKWTtwiVlvJVHdLjWbeDVsiIkbOqQ/moP1OSzFg2I9SvZm5LzABS2
fpH/Spyhaigih1sLHy8RVWtFY8K5cxip7HXkS4LpBa6dUw7J5WyNxfcTeInyFyyr
X+ikIe1JtRLaeQbUe0XFp8eBohRLvreuIOnkI3x5LFHcqoDlUlTfZoXgNHW/jp8J
iYxwVN+F67vC2UUk9Wm67ruavbRndpfWvx41vp868KBe/P0i6OvwdqxXxOUynORd
9jwBnrraPZMcTQ9VvtsfslzFfiphhTbSrR+8VqN/U+Tay9W97rd+/zW0Li49DOKW
OQBwhCZJAMkOVg0r7klZ6nEpG3X905zqmVx0B7le5IKbHOiwefkqxykxcV3g+79C
mNX3cRT8d5XevxB8EplYCsxOeoSYsr2oUrnhMuMspFdQf1hdlr6h+FIAokl8Q3xe
TUVVhQ/nHgLwehgKJntlonOW807zIR4q2UURHf94z4/hEFODnRSWTGKgffmsARzX
vYLJUAtn3cy+d79AmI3bEpq9VmOKSq+Xw7tMN6O/6rP3rKQSHE0J78NDm1fAq92a
T26wuxQy2muyiWsHmqD2Ec+SEfLBbfNaWAoMXY4hclA6KoWeOqfwFFJaG3lrQRMT
Ue3YJefeCEopAEs9G/7fvvC2qohp0MZcRn+lHD3JRtrYAU+iMYRg1kYmpQwbplxm
uwrjVY03FeYKlUfERsIPS8gTajwSNjlCXpBGabOStr27vqvgAuHxbukekuRohNul
aHdaAs2HrTDL8iFb9Abtl1HRMds+hmIgdzPrdy9+yLvVESTuJ8hk+tIx+uRqQImI
EX/7ddbTuPCxg1e3OB0lU9Buzrp5ZfQAG4Gsa9a4/Y5LCQm1ngrsCejBaMO5y0xE
aISXmq0Nn1G8E3+Eajk/5JmugiSwl6zhR5gTtnwZZ9gaphNnCKxFyljOUAS+S1xo
Pxfrx4J5PIJa+sLDD050zE4SVOL8BqHT3vLn8gjtCgzqF4bspxi+9JzVPjwTJNfW
Eqd3ddTbeToABtXbIRxVqXlYXZTgfygfUTmpghwnz2NLRJ0W+PHdPQvvhRu1OXso
NgwHCQztoiPDZ5iurJTSZrf+jdr9zx1sWGIRgZSEduO2MYcooXtRfx8z0yyr+IGB
BZY/PANZ1H7zNuHxY4MQQuNy2NPmc7yC3FZtIrl6ksQanoCEli0AkzSDQd9Dv9Bm
gQqHesw4hYiufyd8Nu8axjypdHVSbweIA6bogL0UjndWb68IHMZ9SbpyRbEgTBPg
RmO5RkJAKMRG1ag2xCLPZt5R4IqZkHXkdS6eweu8L1yp2BQEE+xT4aOKrVb1QebL
HKFRKvV3YEjPLv8Ec/FeuJOEbMAvZANPOEvjUAnnUQhXOmZqFe1tN94yv3TY+vzc
XrRbN3KDgQA/d1M0I/VHxU55dugMTKsnA25CzPwwIG/3cTuG9ph6Iit4rUqnqPQU
F5dHuABPR8hS3/Fn2y9jz5gStcsmN+tVuPXzbjhYJdbsW752v+XTcYd7nUPryK4Z
/aOdBd2+KqFIK6mXd1FVKZrGNJW6I8qGyHeAnE4cHscFOPSl4d2fBm227nT4vTyG
OXBtrhLL0OA4ZIwVp80fQvY3SvWg5dqmOhQ4F6wR8yrZhW4dEFjXdGuFwrzcRBep
gp7ZcfX0hLCjPn8cXeou0eop1UnjzgHnGLPqmxdSVyTMPa7fPA9GbLUyVi7jSQsU
Bsk28/pxMWRF02gNvN4AQK0TEyw1CVCm6WmJAxZFlrXxS7FxVwo90nNpjuNhD+WB
wArgdMfNs2tH58lf0A6EfXTQyjEF3omO3+doc9kxvgwL5YE6h/xMWgjmizVyXXSz
f20xW0lXhZDEJ9HVG5w8FfvZh9LkpXsUaG6f7IQFYh4HU/bfE1aScm6q6toNmZSe
lb+q8PmT9xldDZzTtBQL19KaWoTjiGPsLC1Wf3G0zrVH132uy3Z2klJ8VGaIHsg/
tLLz4FASJWSzCfafDi0z8tX0nfQFL6SeAYKI6N5odJdAyj56XzskSiCCEsTqZiTF
41tiN4uh21+BQ3Z8Kf9pT4AurmxGxfceUehQbdKu/yNFuGKO/Giei8/P4qlEgRY8
C5JcozJcIeFtMY7ixVlmknmCUy9sM1N+rdfKsnYEhXbEJz/1GoEdhAnWOno4WBmz
dLfypyfAWeR+TMPq8QM16Iwr76yrw9sadrTRsoaLpvCS9+lGCFgEJ2s58z7va7Zv
12k0KullXUyBlxWga85arbvPGdP+IkTJZ0fbqVgBZmjq5Ej4oMkNhPIauYWb+IN6
CYOuAuZrI5NYYZMzD1dtHl8B3WIQQuyxCN16J6asO18Usiq4CEkzKcr5qj36V1dD
RGwbaxyYKC1bvNJAoATdEAsslwu7D6xBrBGaZY2wtPY00HwRZU1cbt2GXmSt8z8g
xYNib3hXAXkNAhnvZDPNYgTsqFwk0SqmGG4FbCG9UsIJS5yDPH8p5hBtJ3X4Gimy
YFc9YR1dCeeXtc5uaYxTkkKrpkcDhcqLiSKw15HRACfKLAzRMQtB2sDEdBLK4gOi
th5GMqOHqbfwU/xtuIGxBxq2dPOf5my+cEIb/09C2JufV4WQAQT/Q1l7Z6aaBYaM
agxpaEB68JmV0nSFvWQ3d8l0Aub3/3A8L1USl3SExvMDoZ3trkRI96xb/GIl8JcZ
iOqZh/02eghj0v/TjoFTxztUpRLstoNzEgIPgQD7VcMNMiXemviv4iVzmXLxiatV
xJk1V8bWn4Dk+djn/fsoeq4IONdLBJCuJT+ip7ayCeAGZNlLcnIovxuuZJnTXV6R
9YMCc5yB/4EEidQedT4iz8E/ECnzk+pVwKtWLvfh0kOK8ELilOohUEHU/BopEnHo
CNNlq2SM5ObhUkW3fp1NCrIBtibwqJmDrKzEbOKrD/MNY3gwBVILdNCWOeZqQTHo
8ErPxYmKpdPw6tcU/0UqHjduCodnCz9vumQqbI7IkTWIao+QY5DWWcujphZWqJGQ
ca/VleSUwOe/q+ee9EcoUIpoAZpECa1T0dle2BS/AgH38frISq853BGVgyXP5CXB
OoYK7eVSTIyHEUAyqDXrS/kDuxvZsvT5fzvMdOi+qGj+8WTYd0SRMCUvX5GXcpLZ
75WAYYo3mz5YirBWrjz5lafyLucZr8qal38pAEn1+9eg/zUA6rtA6F6PyY+7MgNN
wkolCOweY1vVFRZsLy+TYgQKeB/zsDMbfn1lvveBYWb6tvmi5Vwc8RtlMNopMTGJ
FJW5UZ4c82viWEA01TzHdCPM/QhFDafa53gVAtj04+A0hhyR3AHA2+Omf7574Tb2
w9i825EyienQAnnijm+f5Dl6OYLAe/cHFgC6ObwHLSFZOYnk0sT9xMHqB5s1dWMc
YW15vRu+DOnnxIosK5emkVtDZHVhvZGMeHLe3UEaXwmO64/6TYrNu5tTeK4A0DK9
GlNW19LorWp0Th5I5CbObUVi4uruzvLZnYu4+BxczuGHtJwU1r/ZcepEOmN55MYh
wVr42rpuz9cSmxjeAOqJVxjYGVoUrwGmZcMfep/kj8EX0pupLbEmwhrvRtue4+qm
pDjVkTvMywFZvD73ycDNVP05oxY8nLRY94dQTzcJfwY4XCdgmBIY62pa2lcOI0+m
IFTBHLnTsnPUF3xYEHgRIWSovhwK9enrySt2PrRhQmewGup4sHr5QC1h4/v+pRDl
8sHcHwA1JDxXKf2PoZuHM5htc/V7GNTKtvsInlpHbzMcU52VbnyB1LXveCG4udLF
h2atpg+floHUdg/Zx45dv18IkASfN7Cs6vRYVFfz2IDRD0faJaFONY9KO/iOXb1w
zTmVBwmcHl+cKNwBCRpo0lIRqcYScz1MbdLfTlYZ1ilDSkHwftrwYVlZgnz5gm1/
nSa3Ax0qUAweoaLQSKZLtVLJTO+EePCZqoDm0oc+5aH/BU16GJXO72xGUcHHlM/7
ZM5rfM6pl0C5r5iveoMFuXL9AiTeEpQLPdCC3E9nx5STUxeOxQTAI6qrxTz9+cUG
YTNEbLDWsK0Ti0m2yQ3Klwy7gvLc/ebtFIAJORD6KCgC6PB0UlDZalmgEbE+x/6A
SPZAjpTSRbRjW1dLxBpulhxazfd6kpElWxWPFHrYX4sqr+RbrGNb8ZQ885H2cDj3
+2xSsuS4gaioE2/oF2UuPT6unsuX0V2qygTMrBip/4KZdNUkBQLKUVIYJmGgdumd
kILq4M4md1C3mtmFUevnBKZT1J6eDohrVlLbKseqvvFjApLU9gqsaMsTeo3fN/HZ
iwgTGEQLjbaNHzn/A6NpesxvUE/w9tiWi2Y4RmoHl1yWmX+hdJVDwwOs+ILD2lDG
EEX84WX2vnJBW708TwiObzHJicD1M+VhwkzwZ7Wy2Ph7Uvqycfw088laIwj9jlU9
qDQLLQVwQuzh4wyH2NR24M8pFzhsog6jxYRggBf5I4teifz+ZHpDDVzxZlArE0cJ
OLYssGSpYV5q85DLgzECYqIDk192H8RDMNO7ntRCs/kaKo4tYM4S6UiEhagCtw+o
L+mpmAlJ9rXKwrEZPa+qulgG0Q/gTOVt/BOo/EVoFKv7JADF4cvT4pUVATlYnIlL
lGJXHbP6vajB/y5OL3Tr7g13sYfou+c+F0mXroTE4bjV49R/CjuJdNSTkEdhOey+
tKoWRdkE2YVmZO3KmgehoVaXZd0JtxRAwXSYUHQwvQVxal5GamFm3crdyhIEUIHs
FU4GLnsATrYHOUig9YA/wIy36fad8Inul2U2NLzgOpmn4hGBI9pjitHKipUVYMmQ
7UNfFKtHweNvoVnjlVa23DZfQqVLwulsO9cnSmbKpnpDFXH/ikK5MgkokxEZq/Do
leHknqMneuC83dEjnavexsTftLi/ewMZtZtKEl17k04V6tUVLE3SpSNlfbhEoAiS
obXwCAN+O7nMjSusb7suS1wWWGWtAwGpgRQlQ1WUJQlM9WEv89uBlyzrYFcCcj8v
ZUBP1H3k0O7jjJlDqF5ONztp1oHdf+2phylRIKxrCOi5+HinPobcBdklhX9fLnmB
wuZqc5i5fQWhVvQMXr7k4C5lgK5M93zuve4DPaEYrbiYu+SMnH2HilyK4rO2nTWi
U1rJ9ea2KuW/DzBluIE7jW2pGVH7xfLIlwtWh7rFy7jNZa0CqBL8DWqh7KLbGg4I
hfrhwOusDt6Ix0haUiupmnb6ndewVl5+9xvgSGWFtW+LyYOYd8xPBFLTyyf+r0N4
We4cyl0W4Sy0AjvsWPOW6BE4+IJP6Mu8w0bcmyLHmZtWC+6TFKei9jEC1ssKAjz7
T9RFDBIuSwMnzXiZwJ30kp24DxXD4jbFUajn0im70eb08Ug7K9ieutErlBE6YoOX
SX+aRCAiqtobDI12M1ModaQMdD5n+QoWm2ef/cAGTpl0fjUI0eexAYJS3ulmWnHr
/XSqyHSefzjriBL+U3aEUjlx1wTBbcZ2RtP+pdZ8aetZ2YInaXJJ3+zmHc5gs7Gk
apbaJmkQrnuKjNre7MeqIOQ1vaSTclbUinC4Lx0w6kwxv7jNUzpksr1vZvtLbnKa
ym/71rLYUZcJ4VdJNapYDS7K2053JeRCYceXE+uAejGZGONYXwBOO8QGOxC1LtLn
PiGYgli5J1+ldEecELtRuWoSFUtE5h2CKmBIUFvhx0Wi+IftBvkjJ50XbQHTVreJ
u4iYzZLIIk2nzasTrPM4/bX1mNwDYK+4drpf7lB7qXAVWzV3+PQNGByBJmYWIFAT
yUDf4kzAdHcYKepfYjnn7soqXOM1fr5MmAGFptylFzdJEOqMjb6TcVpF1+UVG1DT
Zx/oInRIDoFgTa6SLPwuYRcUPmF0/giF9KzinO8XJXGSbges8rLE0a20ck5avQqI
+SCSgwe3cOF7/4ywUYvWS44pyl3nbEI5yrS4NhyvP08oDqww4/MCus9Y1cXiAlhx
KAZzDmFiyewR/oJxz2sxH+B3+LlN8BZR9+uiCfRE0pTGKMQvAhK8ApUP0dOM++tp
1dW/x3xhRpd40iAHz6jfQC4FOxeuYuKNCN2euMfjsk5s9/ag55w+DC6krGZialKj
oZWjOcW757aRk2Cm1LgDnPTzWuHMIS6iqgI/E7iMDiEHawRsGPiiXPTGAWSVYqG6
yfquNHIbjgJSUnQxmNwDZ9Q5EZvgiNLIZrxf2o4aMJvl1eWuPvge7gB6fCcFlhwR
9hDY2QEWaPiASzihDXpFfAy+ANH88UCwvHFLXPE0LS7k+GWA3mkJIWK4mUfA+9gQ
hL5Wn9g//HDs10Uus47gg4YqSqKm46y4AM4Hm/VpFxvnH3XHRHWAeweHd0jCqIKF
ygoJMZ5DEt1dTcgYFSMw6rwI6IPRDIvVzw1lISh2MuWxjZpNZ+lJXIvGAW8uHwY+
RneNFslr6qioAETLekue743o6xH+I/SfcF8yj9w9g4F5EFGrC+uFwsVbynYQqNyM
rl1AoC1/GSHvDu+2mC9DjzAB72k3+8i75qzlQYeSiswXA1BauVG9QEMFytKVc1q1
thgOz580z72avaDwsn1KKpyLNfUoZyRe0nmFGHOH9A4xom1IXYS/4HVZD+5iqMot
JT7b1CoaDyYujUitQkOyv4YVZ1GKwEvdxieO/2o+b1ln/fvYDC40EFmX7hyLyEbb
lUbN+O2Yt13FJe3RcSrLx7fyIIyNcNrmNGSHjGCT4mN8s58Z/56zrzSLlWp1Drdh
eZBkAaJZpP1T7vMC9zbiJwDhFtTGikPStbiWduG2iYMh5jy2YHCv/BSro8I2tO1i
hsx4dKdvIi5xnemGjCr3tQRaouoPMQSw4uBIphVz5FjsY3s+Bp+V4KAABlMuLbza
7WSPz2MHG2DcrWNvnne5/AuoGV4hnpG/WSz6mjBlRhKU5iZoF0H02u2Afcyerl0P
r3CcXvxb0J/p2Ngv6mmA9pobhWaJXzs2Rjo0cLG0wZ7EaRGzLp6DQsNQVrOQM7Py
i5YbuhiozT85Lm/tAtQpMgDLYF9cTq7M82qqTsrqURLULUpwAm0d3379p+PN7eKk
W7vMdonCU6cgnPIhNlmluNTsoTMPRQ2/dIe3ZW9THmzT83mphfpvLy2PNXQvHYwt
D2AaUS25ZvFOP6CWOiHe5fiMCAQ+vRukF2wFlumoqsiS0aniQf8qNA9bQ/55iJ1h
8uv3EZ+Jwtr1sKyIhFLGweg6aK84xXDpO8nE5spsHpcmDcn0blNi0iUQ/IKt/uQB
Jfo78QScd9BngCO7WyP0Vf995w8mh8Txd5ajh4y03eIEwY9bCGPWNOW/sGuDVywq
K5N5K/Mr3vQ2Peyze3p93tOjwMUjPskmX8oABsGI3L8DA2LoW64zScKbzAEmLEj6
03Ju+SsxbRWFkAWKF6jkoKK7DynRXTzvlvcGZmpp/GSUuLQ4UuHVtPI9TTWCM+fI
SWE3IbFZBOHlOJ/AWyEZej6J4fJ6Sr4FFhOBwJJ7BvpWrGyXyxkUOzn+shKbzP7B
Kz1w8+Iw/Sb0DxUt5TTYbui4OOAoi7N3ZT3hvrfMt2iXqEd2H2jBOobyZdUQrEkl
MhVJPKUFASP5HD3gjk6jaYEXki4Kpkcw6Hy/S+3WYJztL6mlQ4d9LSgC+JpAxRSc
jDXKFows2t4/Eaak5uk1Rf6OrJkreKWbOTRSAigNoKANv6bRtA89J28MG50+9YxG
KFv1s0cBjS4uNylkWOYANmcLFVrXQAX3WD1IqFJFa2G56X0o2KMPGzO5vuwOQCcH
V8b3AqxZVLK+CEq1X9YqoQOqRzly0MyvchRxCba+w1wRXZwurCvz9zWAvp4aDlKi
B7N/0FI4siKYUHZCzrUpdiuR6O3PKebuRxL3onE8f+z3XA+jUOZ+4iTdWJ1mbIGc
19oe5SWugxLJciTg5ER9agryu6JlykOBMtiQxJmJwHS3e4yVs9/LcWWs3b/zIn3+
eRqq+2vP2OFV33k9Ztdb+xWcYRX+u+qUEU8Qzpz/gMPId33a3RAyDnNrtEUPmNiU
OgUcpoOJx7oE+WffnKF5yCDj2vX/2TObICL6HqAJfcfWBQkMJIzF9nD9ae9ovYvu
j9WM+PB7qhLkwX3+p/20ZQNun884ZtryA+5SwvQ08h6pfh+pStkrYS96SxYuI7Bi
ZcsUyIfjSFzUONeFFw11U6z/vFklLiMrIoAk6MvjJc8nPjKJCgWNX+XTRVH6CZEK
ibk0nm4bwvL+HRmgozFZ8O591gm33MShGMOnqjWDbKDJUSLeJFwvkUS59fx4J9+n
NyLrgra679oOQY1oLw++dM+YmoN7+uC4SyOQM2DP+yRyizFGPv+fD5aP6CyDjjoU
ot9o15++ysqHaWZwNVsKJJP2bIAULrqt538kS/50dqJcnMhpfTtEJ94Lb7Wq7ENf
ZyihqIcouVPgXe/bxyYCeTuMSvNqOLdKFk3jKP7co/JVDttDocLEEXLyOXmTjjf1
ScgIs/yVMCpKPk1jV1+z5G8XFZeoOCByh+tk/E1SpzoICg13eVICkHmAgXvQ2qPV
y4259uxNIdE4gAx7WKwixpaW8kXFFo8yVvqoiSXBPxEWaP4yuXFZLQFdu/DpeBlB
iDsVZc3jSfjV+NmCwUf9OgLoC4eAxuD4bWl7T7LVfCt3yGxHeTbxdzsB5RF4G20/
4QbtzzVFSHVgxxh57MzNyuFke7kgcyJrQM4Xu5up7vaSfZIYfVdllUNWkYfP88Xd
iSlTVPlrXct8Xrqr4LfVor7NJIO+kdiW/ObhDoXOTDQVdq2e85e4+j7e/AG8C+7i
PveQJmekmZJ/OSgrwmYnAK9oIgr7UqldT9K6cHgtlHImsNrR9a+tfLUh8myntuUu
SAVFbAztbfO+JSB6mO7U6KJRVhEH8jDCTTY2RRm25Bd6VSD4poNPT3iiP8nO38Yc
MsqKU59e3KRWBAMRCDHTNjHA8U59lFUeYPRFQ1WzqF947V/n/+TeekIuBIu8gg+B
DL3x4rkD2YUdaFoxWunfnqw4yE+t1eh5d08hp6Na/zzhhAE1LSF49Wx1fC9wWy5K
Df19g9CqUAp75E5O3U+efEMcqMUcoY2+WXaPQw3kgwflWYvdiC2NCC5zmG7O1ffz
jq5bxwA65o1spnWF6Y4PQ1673SK0+Wi2opTjViQfa7noRgV85G9aPM8KjDNEQemZ
Yr6mn9mfzgKpf3Ln+G7lPcDHearcTz7Gt49iDaX8h1ghiI6ZciC8dBWUJsbVVKE0
2NE0484lSd0WjuQuVdB7gUg20PVNaTZ2KuuUcVp/ADgn1XQqJ52Ie/RGic6FucqX
uEzARX3uiGGA0P7tR4LkP2fU7SFg6/KPdjf+lKETRagzyuiOYXN9yW+Db2SD5n4i
v+wSo8F6iWBcdTKiQ0/Lk0JDXDIIorHLwzqgIiOqzzndi0B2DBTo64JOjgp/wCu+
BXiTfK1Iirtbk8fZaYWjLmRd11wzlS4WSssd53MqULNS+Tw2ZDqLVxjmzV3T1aVD
LkwZ/PH7iD8wJdBTtraIWkkZVN8u8GUPxA7XvzddvBqi1Ka4tZQStWWHuA1qJfUJ
oeEn2VxJeru9FF4bHNlThfWsNbmVwnWJYwm+D8m/RnJtfcx9+Bs+sIn9rwmi72U0
XGBQ0/6pApGqglJr/f6TWUSl75jSNA9jzBn6vH/RQdBYxOw9mDxmQ/S/gfQb3BMS
Y/eMZZ8bLYzDE2TpiqI4cA3liUNNASD21y+bFJUAyErCWja6gKzNmLnMIDNoMFDX
v01bP+UUWr9w+3oiwZTQ4CQ0NJ7eQTK9jCesUNGz7INIgx7SGgjdKibQMnVnbhKE
YvQfeqp1ffnW3/xkpyo27CqNU94tXGjgkuDteeGEx92kGn8WwCQcw/mXRohninbO
9ACE65atsOnGiZwo0qS+x6zBqyLVyk/S2DJpeOkHtwM6CjZ3ed9nkb9FhEaMSbFn
Jcz60WHZRNpIvZ3kb4n5CKWI5w0IEoh2u6QEFZREGyb6rZ8z4E7kmV7qIr33NDn+
dCDc8Pry2tA9AqRZZHsvl5pnJtRUohTJTwwstO/a161HhBGe9NbbQOlZX2sHZHj8
JvG3ZuZ4EkKXtcsJNoRCM0oxEkivt1SToGTBckfD4pRUOvc4lDanaXuXG+7pjiIh
6cY5XY88DzB5GCFqYF6zF425wwlMBrhTC7JfEu3NI/fFmVyv/IIL/PXUI6BcpYzg
jPerth3mMUFZ7FpuquYe2AodnaCmuVZD+KHTFGXJr9t78eF5IMoVzqkoGK/gPk/9
K+Byaqb5YcfRaRtPMA6tozUFV3mXqzn08uEfc9YuaVtEk/9t/YiIIqzV7/ptPjUp
uw9QyiEscHVcmRxvSzY5/CRnF3IcEyv8FDQpU9be8dspP2vxPuC90FKa5HEPuOP3
RFA7OypKSF/zydN4DI4BO+1+Gp3r9a+W+LBypImY5j/5IeoFDONImeak+y4BBfR6
rlWMMhbc6O7bMs/yPEK/FDQ0487nM+udtpvgEoeONOTuUkuGvGlZPv2XUJHhi49t
cWewvQPPE6vTwP/Wh1jOAN5pE2F+ONzgNcTaA7S54qjdWjx6mU7LMdR0aaqeDJ/P
07IOahOpHYOAZoQzXGFgr832v2wtqYSI6FwhRalMKm8IDMZzmpP/izhT3m9YdICD
M6rOUOCmyal8DeZTWiLf4mhsvH6ae5EU+cbMtva0fndFG+g2qZjj10MUhAqm5AWG
VTDkZLQol1h1bCT3vLWCHEdmVHsynrq6IjEgLL6KFC8=
//pragma protect end_data_block
//pragma protect digest_block
CRAXCelWOMIySqmGaiCUSbIq42E=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_REPORT_SV

















