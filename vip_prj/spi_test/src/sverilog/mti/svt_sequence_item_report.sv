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
XfYe0OJeEuM6S/Jxb+/vgstzQrtAze1ldqG/5gSYOxjyKg7q4sFA8cKkjmCZy9J/
knFshBcIy67/8Ax96k7HrNF5Qnq9fZb2GdJ2MrdDbsemsfiwpDrHCzUuaQez/61R
gM3cBXYgjReMgbL5r5xdQhgWMbCIfuRmrBClsetiBZE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 523       )
QmjgZ90TWMeNZgcrvwg6JDbB223hg7SoXYF/9EwZs6wETToRZZoc4mQY9QNEoW+X
mCehH+45UGRizOU91Q6QtXKiY/qIeNXBs6/a5ZMiqPMe9BJSjsM6YKjsevtT8JdL
UrD4K0zC+igntKCnLksH3cU3yqGhbRIlN7g1y3/F8pRGYLjrL7NmaDA6rWaIrHDM
uo+6wjEQbaMUWXlQNYl5M23+4cH+RIjndUKlV5LjTDGMfGyh47YMoa/9mRa1JoYT
A0CRKOSz5M4i3+7Hd3Jgd28kFNrQ1C2oJqsL+VttJsjQO5Z+2g6s/VxLR97Z5Ke9
uUmgpt1smfC8cjf3stkPl/z0umDWYAoRBDMkBQBmdlH4IGtJlaAhyh4+c1MA+mgT
siJFR27UjpV8TocABdtIVP+2EY8ekjzXRm36EKDmqb7jboj5QB+kGYNheyd8Cc48
cxyF6elzkRposR+fodgZt9Jl/ueV3TK/exuQR1RfvE793yvJFbKsfF3WHQHdPdOw
KEn41TeW/Y+2VBKlFOlAGe1AvQt2XPm3B9RQQRA80E5nIMlUUwla+TglsqREyaen
plr+9/2zpMGGaY+Jok6zqse4fpHs8W564wFIfhnfIPHHgt/ZhjVw1fCrd0qpZ0TP
MESF2tSlaAFWMQ0UpV/pkGtsosdSyZMItOLzhXDsKLJeCletJ6PxLPfUQZ0q74ka
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
PVpiUXYzPJJCOeZ6OqCkL0ZEC1YrBiIMwSL83SU9fNA0HEZ/Umn6zimJ4dCd7sI6
hOOsHEZU/1jG4zPrdtzd1hcl1hnvqtGEHU9kT62z1caA4OjLMt4o0diyFwzMG1W0
t9xO9/qVOmpG9C+SJa1fy2ZvPPrvTlKSRWfMJA7iKOk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21407     )
PoUAVbuU15GJ86ezrgLriuBJg0sin6TZS5q/XQCvahOAbeDPJtPJtmLRwerx28t7
DWyTos+bNVkcC7+VSz1Z3SNGmKh8bvqIoy46eIXi2GDxV5VrzH0yXicISNRk/JAJ
TNPgCOpP2uvEGp72zi/J0SOgQ84ItYXyjxSpy89+1umYUt22LDhmd3vMsOXPkyg5
XmqelM+15VYOCSqWZlqFfc/wPT3SYTHD2MNu//0ji5Gch8BBxcp/czUazV34hp6O
dYiwgaW9MifRObLwOnACtIViB8/DDaaGM6PZXKMHD4dYHuAWpQwTcDjEFoldVzES
M8TIosj9tR6urrnnIqwfVT5waF9vZepttTyd+ng7WzFFoLVnAUygxNbj2UTfhmto
0GqfcDtxqVMh15X++88bjYV+KjySV0/XZ8yxCq5/ZvQrJ+im+mP208VqkFsxLoCt
DHosg5NZBC9YPAuJKL4j+bbg6f6xvVKMuUsOC+3fr1yF897Td6s+QPnkZGU9TZ9R
O0x5CC0VkXiILbtnNcN5M3ihb2pQpG0ERdqFIiNL6NUvfgB0y3/cTiP7ieiQ23G7
uSBNQpmZbaD76rVZ7UTr0pmcoviv0TPjquA06MmMEhIb15ipMR2jKqLNCvkOE3+S
2Uh5VaHims//OnHHc/PwT5tgDmD4zDj+nE9099fW7jBsOUz2Sa3IUNmEPGbMtpGl
z9uNn61MPbT+9+UntvRMwbSci7ID2ynhJ+qVYTi7/KretxYNMcYn7T0i2apB+3PX
Z6P0s9mlbqjK6BEleR0lF69Yy71lKR2Ji7H4UxrOKfCzjKZ6QbsNcmn0GBIXhmDq
ehjeIBFLzvdYRLrgY0TEEu/0kvQKwU9Jxytgweh5PA6nairJCA8+zzKLbDYQcMNe
Ej6/8Tt8A1zwmdwVtJ72NBgfJQqV3Okor8BGbimI9HflQCW2D5BRDkjJo6F1vd9c
dQPs5HVZt3mo/XT4KwTu/jIQfvVEyzvEs/DNXWooZpEnK5KJ3OkGbMRe2rt57VHo
JxmzhBLmZigxiVy497VClrT3X/wMl7j9z+Aqhn55A2yf16M67aAsLR93zVQyccrk
HTaKD18gV0lZkZn7ZGZkXsxbs0s2MKo02JxI4An02ebOCM7h6Pecd/gBUnVzj4OB
fm7mMv/Ef+HQXbGLPrUTeh/cRr/hOieVqazrHy+wVsvdyXegW4ebN2GbWEoivN8w
M4IEsrI2c6rHRBv5eWsy1P41SXjLJL6JLcYMs6B95v5Hgg3anD1V9Ahsw01UGMvx
9ASMWyo0onRxjfHN04nK3ghJUTeH+aTHF9eHfMcoFAigheLjas1g31SumeNmWXV4
puPZ33JqVR9c1u5hPFPL48Xz4DBTqQDDybiIikYoTSSZsmWdMnqLn+t2GXH7lecW
jFnFvFD5H11d8Q1X/DJ0kdr5FaC7z2ZIAD5dNXN8nTbIaoh9IBro/s+JKdi0SUr1
KuOb4F3hrfy7WFSDLFdPkfKNDOgNS9L4s1szsL3R4uquLujmX15IQ/hBNCHcPVQs
/R+9noMGip2oB+2uxFjY7Si2CO1EviDumjuRcYv/d197ZBWBu35sMR6iayy/FW2R
AqLgQAxIJQm6wjVT4LJgaEmi9S9t4r7iNDoUXLbKySRTMZ/YcsAndT/yseospSLw
oPMM4Clj8kqu7n/4d+vAO+8ejqt19ETocnIy+TqiVOvDqne3iabVMWVvlAZcORHo
hvFpDFuyd0wphALqsp9AasBkLmCVhzzxJzA+oAZg7B7BARFqlKUEImev2coHAme4
hggA57bifovOfgMBZLo8/nW7/qx2axuV19K/FfLFd6KdX0HnaGODw6QwzuInl/Ug
sVsI/QzJeo0f8L84xyF+GprOBdwW/4iwks076tyAPbQer0mMPNSP3Km7fRg7cmw+
zRliLkblch3OzZuFwQNEc331KFEaL8A3KLmIugAinK64DLhsman/WYo7vP4DQwWR
7ildQAy0Zmg8MnxHD+d9ybpOGGmP6UmIz5RyY7TWI5+y7Rna7SGKl/aulxQnlvIN
NjiKVj+q0Ld2/QHm8J/5LSIGvEjVysq2LjczY9PgV0J/hyK242UOUdg8u4NP9Res
JrJHNA+xSbHi6EwtwdUBPRtAMWy4s27iyKfTxfynHyOKlqhsFYqLpRlR/a1k+Ug/
ifN0gMTyM3vxNGUu31EE/zzvRkG/Oopk1A0Qur4cBeUsI0PRWrqEXX3TtwzjjOvK
yo7Kw1fC1REF+IbQIdqrx95i3SJGvfI3/99bZ7Nuqw1nahAYXJdK8g+YaMEPdCqP
RRIVp710RFboAr0enr01QHBrwcfsl0UsLmbT8xrhCGXpIoq7ord6yMmHbi8HplRq
75XtYzLqKlDz+AeYhuuVXRpgQxctimWdFETM5Zs3Cm10hbxrTwCcrQKbDQ72AFGw
EfvPMvSaPNuZ+SmfnIJJL/zqsR9oHfmZc+Lj8R8pKWqkhQMDksb7zDBx+QZPipyy
TgHke09Mq1SEZOeu/VlaAqP4UrAY7ducmJBhMBWlzn4dKE/pa/Xn1zzrjoLAOjXt
y3u9IEpVOnwhXbRx1AQq5Gk+LVqheLX5UfjqRq/Lb2OBwTgFhp15L78LwzRwx0k/
hFjIIHz7ShKZT3Vfh5UJ31VfTaO6iXd0Mfis1kzGX4jo9ZYPkRmM8eWx+UdBE1uo
hV9m6tAyPBFInG5pShzvGeTfuionIpAMx6fSbr0HBr3/ZZSyH7jidAwa0gHxuuok
q6Z9tIiDKefOgINYYkTk+KimkXkpxZgNuk5fd9+LU9iwhAhL11F1W+df0hF58394
yOt+T1Q9PRApNT9BeS2+UDMvM2jrARXsl3oOQ6wLoyJ3xCZX/FperJ/Ecu9Jotks
ObQ9/XcfK0E2X0uEYzXq1UO9bxZM+jz2tOyakKFykOphBrnhQJeCX74VqyzP/sGl
ip7Ao2Ix3tRQPoQ/UZAJUCUCcWP4IrRzwK6C9vB0hw4i/wVYjpWg7OGNgznDsy7g
UDzj0ILq5N4LIUGHDkH7vSvY1sEMM7xYY5++S2M/cQNIO3nR/jvv+HFhR7cwk5g8
K9eeZHE8QUdWCSBtrCujhMN1i+CCpsA9fOKQsPx1FPjNJEuUqEO0M0GNSfvgwiij
ojG4UACtO5T8tSzz3IGGhcPDioJpWufcTGIurvp+TiKXe5yS8wWP5shfNtjJl8JE
9ApcQK/8diWoLe+7U9V7IDPrfjvoBE+Qvihb1V25tJC4jH5F3QzKbhL8MHE1UK0b
8YGhFQS0wxLEesMD1Mt/XXLBHirdqEUGYjmwtgUgxpCFJREmoQkIxAkJhzn1gRFb
ecq9IBdS9rNvkmVhtDP5BLUH6vfOR+HqVOQZfmthzdWot/Zs8+WGIcg23Lc2DaoS
gBNw/S09h3r55uzFyRIakQOepVRwKtrtCAV3dqT8/oR8wHNB2J6lbkN/gaXW6bsL
0xbRWinZ/neNNelfJaDCHtU6sYOw75lsN7Srj0eDpWM/iJVGXwzfan84zHl173Mm
tfiibJ0rsSgUprnVLm8IZUy2yrkgKxRcYkxDdJ9pO1QoYxXMc+iwRIRV7S/MRQO4
1kAUXQKGJHQcc7+4YeVM4xTThBiCfj2hwmebLIe9hhtoII3wiIb3Uy0aUr4Z6/DZ
87s2SU/c16yK0NhxbXpT2nlCTvRQTo9wVKysG0AD7P7I7+jMoI/LCn74kB0bMTS6
w3ntpeqk1078etg+XbocoVkpGW3sFwIqPK2bOB3AGhJx9vu3esT+nLtL+uSGBhNa
WU4v5hg9pJskjJKzhcpDF7D+RXqCh77S39Jf7E9MOtT6BSfCzp0rzO/i26ubNjdl
grOOVyz4KmRl8wvXzWY9Fm1XXfinOrXKg3kpHpOK9LdhxrahWA8aT9JioCwp7X6E
4QGq3KSWF+XYGV6E06GdwECmF17P9RLGtmsIznGFMwotEa5ywonq/N0ttda2TEWj
uDUaqgv4rxdE8DeqeWY99bxwmYRbyhmW1295+U21YVWGI1DunNwDEw1CVTziFku1
udBA8lfu5wwXMr7krLNJW4mOIFLnzA9bqVKou1eXjMb8vDuoQ2ini0zf68R0zUmR
sGD43XMItmZ+eu9BqlmCb4y7y6zn8xc3rLlr2d9LfHGg3xhVJpdG9JfNEYnusv5U
qmvbrcUOLsbwwwc53ECrLpIkwTcBEVK6Y6DfEHfjU49exqxHZtg9djx+lM1WLRd1
imHmmjiwDo4J+KjXrt9V+B5fcXW0sc/oS/sDoJ5qbfTwHl9NthWlg6qLehjOPz2s
S1VOUPidyUSFlGo96P/ahXJwFlbcRaXuuT+4jbG8bidoyLLOB7aq9fJEfLGSnE0q
cRNMa3RNMcQh/BVnZ+Ws5F9ClH+JXrtneiZD4BuCl12hb4EmAoDn+uZkzU8ioQWb
V7AqOggfnY3B9KVU8prg5CXqapRKSqZDUJNMPFM1qXRzFFbhS++VTPSrbV8g21iX
zHqoGtxGqx0PMNbmdb4CruQUKopbSgSOGD2Qs3sAPcm8BnWFAXrO+5ItgOx+m0dG
5yYR5sc8F2bM/+EjV+KHUsNxYEVDBVnvzEQ7+8WQcNCs6oi+tg/OPk/68c15a92n
CqBhp1GzAQsLduVyGMg8Z154WmBvE/bx41+tbjZKBQvUmmyyvcq/KX693ff7jFLA
YnlSiCjwhQPUtS/317Mfgsmt348wlpo6BOWLLrmwhDvkUwGSxTO5+vDTIGc93k2K
cSWwDIoHvjPiCByALFgDh3cLdfq5vsTiNhiM+kCD+7HvUAi4/Ffr/LgDA8kdaMek
XFOdx61OE3inz/k4nnJHLrHMzR/0X+HZmKFRVaMXMoPXSwotjFT0u+CcHgrU76B+
pl87/ea++wyw7yMoGI9BQrhkxJcMWU6P/U4SkmqXKse0fTk+rDC8MBoYbhyh5WXh
CA3vDQM7hnRBXG2tZd27/mlG82PbOhjPEXiZgk8n9w1ohihH3dCRs1vMfiptvM4v
Og/5vqEDTFPaekdwAk4FTmbdh378ESx6pL5XQYXouTLzrFH6NkewjxYQFI/qALYy
r7sgNNzd0wil3JxPx1isQDTG0OiF+7oUge4r8ore4O1oAahzWcV8y5o60miBAdJu
v43HcpKUykArmqcvBlN2yWyUqdCJL6kpv03amDpq9Mb7+X16Uerflg+X0/Y8fqTx
JaeNPMfpJwhl/kXR2Ry3ES1rDCVb+YkIaB/h5Q0vDBtssLO4N4HU4igAoTS73dS8
VZBqc/PFTlbmfkdg/evRU9MmxFuRI0kqaFk/XImiNZlNhJkyNkK6cxaCTTqmiNEb
DterTQnSXd8wX+cxFEMg0vbv9tOpB7YfMouqRPMnPsQNtT1vaaE8KyotLW0vUiem
c2uBXCZhMmHQ+6a6xqyBvDMK8I2kQga5wtx1ziaxhOhDhcKIj1IuHJUBnZBFjQbZ
A5ccz+OrRQkM3WHQDJQL7O9kVHqVVlOdb9Re1pTi2BXF3SAP6ZdCuZe/y0d0kVDY
qYZC59ezI5NWI5xGsfl69XfZY6NZUEvQs6GOw5/z8bj5S3OSRWkMRCLOOvLGyZ3r
j0P2ZPTi3bWApynM7JEgTPvjuUeIFtm+Y2I1be47CSJl1p89EM8CbszLAYZI2hKk
h3XPMIWxXs4qIyrP5wlbk5RnZ70DMeb6T1w87C1fEtFn5mK9ZBMbxu+RgZJSh2/H
7hhgeIR/MCE/sXwDb9l/1BLQyMmFsxmuoscvI6ncyyK3ByJgeJs70DRYWdzsHu6D
/TT0fmDgVquXmHtzYkp4A1U2568tTQ9hvcz/kgwkNdaOm4Ge/OEaAfTjBulITpWL
yqswYkkd09JGQXuQ6OIUUhCXyOb18MOQrSZl7Jf8SBq30SRclpXIpcAzN0sJQGSZ
WRPSxcAizqWoOPwtNChe4NXc8VQhuQeDQQl5NIUHILKG3X8HJqGyA65qQRoWaMOI
Osq10uO9keQI+Rf5RE8GnWZsU1lFdFJbOpc4pTdL8CRfUII7nDFW7a/Zq/JmGteA
O92jQyuPSPmrKGmTJ7kMKFuhAIoLT/zHaO9xUVevDq2QhPOMFYqofBVcVEIezTpL
vgYdRWzkeF8illbLeeaZbP+n5IuVuyBTxU5+dXRP3lRIEudJT/3CoeEgof590bjZ
jlWediYf7KJClpQ0/c/+9bqBZioM1SJsPdnqcBpXtLVA5/dTOmuXaPwbAbXOCUwl
1fPzkzwlW06UDd6q/KNLI/tWGBHjtDAYfv/Xgadoara6uJICvvO/4AjnAcM7Vwf8
l+nx42jID0yIxkOGD23zVd1qvdqWh+S5PwfopRqKe1R+Z6Bvs5QdeYeLVPXIwP3j
d+l7GWosx4ggM4MHoQT5kv97k88OByd7lD51Ac4ykdjY9WrZBWl35U/L8pcp3OhH
zcLeNd4GcOayvL0WhXOQmhbzfMTlyv3c2cPvuxxQZZWu4KY5vMikYE7jt6DIPNBS
8Mot8+eBrqoH9uvad3UWtd9zBk3JPZNyrrbAKNcrsX/zdUdEyhOoC38uKkBvJU86
yM1LkQrs7EDw9ypb7Hj+ECgr8kEJG0RWE/xZabkLxXLE+zPwWsjjYyqeiPidxuIq
PE+w2quit0bChMNOVmEerkXuD1zA4HO5Xnjt/fY5Wbl9fJNhINTA5+qdisfFxj+N
jgsvYxXZKUGmnx9Syoqt6C/tGtG3HfzyL3LW3V4cfrNIpqxoER5smdSdXrqjgBTy
01TXdJG/BwIPb4li02z6BY4PEw+wfrE7U5UOoOkNzvY0/RR0wiv72jhJlTRmb2pf
hH+7jkFNraFP3SbbGHOXySnq+fB32criKhNPnxqGjGlXYIqaYH7qbewne9tPohrL
N8YD9/1CmXrsxdhvrG2qmvdbbarUSWSagApH0pwolC8bcFNfXNDIDFnNq5Ak3/fE
eTcaWG498K4p8ppSdRixNDqbGxqzc2BvFx3nZbCulJBa85/heY/QVxVstbcHHUhQ
XCDcqfU9jG/Bgq7xqxfB6n0dljtkrlkDc2ihJW4jRGBpSzfRK10nv8XMNjsmrNDl
OQP1hMA/MCCoZCJnepjswS1G7uC0FsdjmmAAk24WTVmWDfw42tqywmt5vKMkDtRo
Gf0+UdErNkS/F7NNb4PeXZpBgXsxcCxjnf0NqgxgbF37rCMjs8rU4HqPhSkmmwLP
9EwqVFeu2nxv5HUO5wS/KQ7fshniFIjpwRC+JnRuthSdNq34fD3TZwXeaVrBIkl1
F1jDnsud0R1a2xGToge6J1UemWzJUP6m2hQdEjyJ0A/qXeIhCZYM2HY8VdHYuf+L
sOsgNlM2QF2XC0+KpzzBiomYp/AgokqbKf8Q0ySnN00iFP/A191yWtDPqg3YMneq
qbMrNbuOmzBJU3c6L/ccgYHZ+soFOEA+pPyivLliz/P2kvpyxA+wG0p0MXG1Hi+R
frBwWv4UYevKJ7tmtpv+ARq3qPcY9aSSKE61IqIOmHVlajBURStMY12xltVBYRBH
bisRla4kGxJstYxSg/bfietuV8eQuGT7E+47sY+aOTYybBw5ujo4F65uJgItYUXM
xVVo2WRY40H/A4urn8coW5kPjOH9KgrHbaY+fA/enNBl5/Yz7TXr6DtKDszwbDZO
G349D2rcO7lNGh4yB9Dn6vsolLmR7Xmh1ARmlRHS9Ml8F8G+Pv30uEqWV3PhhZ9a
RE2xHNBieVr70x5BbBHCDBwWAlSMNI5pCGbz+i6iJwSVRucvHYdOXZoAAtgsS6B/
87uJsEWByutXcy5BzZ7XW2PgKYacSMUr1i38OgKTqZGnoU9Ny9DBk9S4VYg3jYf2
amiJjzEJPk/g/HxyPJuGQCsK5vfVP/dTnPGN5b4e57CMbhQnos0K9a/U3b3vkL4A
FYuyl3PK05DFS9Y2y3kO+AizgdD5Xk8kFvYJT5shtA9vhHtL4mbcPjKuUFnAPkUo
XEUnBpjoFQLNb02F9fegxfUgFxcTaw7lkI5ixR30evylzwtiYlmIolHzW/v5ZM1X
YhB+R2ylsBn7mU5R3WM1dVfWBWs+UCTk06xzaQ/tMWpuvynTvtTqZbBv7tWdBXfd
HUUEzVhpmt93jtP5lp2Z8HMOE9oLrQ7FcuKXxJ3zZVaAe8NkAXG929QpH5aAlxMq
Hke286Uloz0k43kPExmv7cEeWwEwHekIv/WZuqz5HtEjTBHauL3gatDfzfqSn8mG
bm32LOrwlK3GCdWAdHvCF0GLhRhuTDN8MctHZYx+C7kF/DiGIc1DxPf/wO8IlhkM
GyWEkmZeG9vCDt+1DwWp9Os6EttyWdDjdBkoMK5DvK6lUd6/dfzWspI3viw291mf
84VpJqYtMQ2i7sgrAw0LgrBPIwq8Vw4iLAxEEjy3wwRSF7+Nw2GJwKoZZ/Rm4sqN
ETuBJpGjkP49jwK99jdlCFwxqtPXGvYA4ah8hU/CnRHNVm7s8UIXDFsdgxEiPKw6
Q+NutdhSbXBiNyCibqiLwFn9y9B7zQrA6uLlVcH+djvItAhHTczFPD9/Oh6cLrVU
DaxAlDlggW6ZSov6rghkRY0u6CcFw2dx5SQDlAVepAaXNtSfqugcdXVD7QDQfskm
xDwbA7Blx/UgePa3yl7l2/zy21gHv+xQuJ26QXD9pqB4QmOczWufvWcAUTTBs+R/
14babvAxM8xcpFddQuut8UjK2VlwPq3C0d3AmjR6pDJ/o9KVKCvQ7baMJ5PzhDnl
opjNe1XpyKIuL7HpggHkm6DuXZkG01nA5CdPVhmF4NRH2EosqVlkuIG3lWCVLr97
jvQHwGmcw3iSGX9O5UKsdgHc5xofHnAnsbnmS/uJWiDniTB9W73u2EvbReqB7BbT
SrogFsMRHq2hnAMt7uz5vJIcFZ8989X19THSzt94aN+4M4NWu5bQmWvqqn5tzVTK
2BuN6ZXNpzCjX2HzVQKbHpfSrLmD8Udx62AIwFlRR/h0L5wx53HFYQrEkXlHFlt0
x0Pbt1gvM3tQQ/pT/K8E0jEtIWEcPigrG/4FWPq1nazBvo5R/CCYNOQqeppK8utV
kN2kQlYf0bgw+T8kfbzLukmWfShzxGk0kYqbgPO/QykWZoY6uRg0LYmFN6AePp3n
wtwuO3G5OO6CKZ2dv896fPBzxOE/JIGpJ6tcfBiLAXqMue1PfgIedBVslHrLlRZd
MUp0MMvi8WwhDDBmF25hucLndiDGUyhLu5nDb5n9O/GT4XW5ZGp10jLilBwSoEea
r/7G6tQRmUfUZr6T9Wjtytjt3SNU2t9YL5Ww0qiXGGy2rll4pKmOygoe96vv50Ng
h3np3DqEGJJSISeM4u6vuI2fFhk0vpLzEEssi8uOO8Wc+q92J17IVmHuA40viEI4
ykUSrdRZ49N2tAeTo3xfg7x+CVCfHL0TLM8FQQkcgG2qei42V64pTOY0/bVYc39V
xVe/ClnTjhM70yBoNE1qhXUMwPMONqUtGRQll+USmjLQtpPTw1Hw8laVSVK7pynA
9sIO87kXp02KN/J7t3HzT3fWkPEordk4H3SCfrsGavSxDzNUGq/Rnd9leBYV7L2f
9U3w7gf1pk/3MAhVu4rYJMLaZKjBad7Y4ebmZKxckSjMeJHBD7Ia3nfee12+Vo1m
WyoVCpmSmhsoQGw2yTC3fWKICgGCTu0IDdNQHZJ2LS3k61tYM5uZMsDA8ULBmh7n
uTRNtSON+9U+3W7c267/TEGB74Bjyyv/dF19zMFrDW1RzC/UEWUplk3B5t/3ZL+b
nVks074luP/bqa/GRQJ+BlanDDeDFqsGKqjSdwxDSF5a/7W5RA9ZZJDf8jFqDXux
+/I+KjmgCd4Fy2Iqpi2q7+L3G1PsyCT7cVHjg+f9TOnUG0u8QtZ9huEVy2IpICFS
wxpYcXUg166Vx5S61xagJpUmR7T3zKfoF/gxGOzvAmtQTIGULew+V5C7QGyy4XdM
ZIFr/nuK6WY4FmQk5TaavIBf97+7vPJlsZxRWsOzsXP4stCv3DrXKCmOmaah/nvz
htT2j+8fCD8bLJrN33wNXcpl081MohMmXHus/j9t6ngchojuygy01m/yrY8inTCR
vmaGf2ImMLK2NUcTvqtqTxnlY6jc3JSux950VN3TTAbd4svmW1SgXRGHF07PVABg
/q8Lz4qb7NRYVGL1DV3KT+INhNI2x15utM77TvHlJ0cFHJ0YA9becS4HB1t7bri8
22HTlHdRu+cEPwkPYgNKDJBK2fuauwSNZvv4ozjQ5IiCFscoArVOH9RPrj+6kNgW
ZPf4I98EGKcHinfVWVWKTLX5jP/Ki/dswn2qpzObRrzLxWz+Vh3sHuit75tlPuXH
3lz6a7GRd/9dORadH9M3EbHRJjMY2pTqpkP0XbuVuqSFcBFTkXoWNlB8yp4sJkNw
vlWG+HYIpMPMPhOO9oS16InBW/sbb6wiFDkN8aTHzZ4yHZHU5OnNq1FFZUncnRPN
egl12F9WxLhBvBzcrMPlhZTDXJRHT00iivn+yx4HWvXNrrVWplWrmqocQJzrXtKn
9bCIQYKeZEA39asdW9mxk+UAm30VhhzOzcxbV/ffVt8V3ex3J8gjpo6flzo2FUYR
wW8EPOIqtN/NiSgAEUnJfbB+hPgSk2TU2FBmUuC01MatfeL+3msLW2ZURT6iY98m
/NTXeMqv3MvUKlawh/iKQ3pi7znZoOy/a71wAEiHO1UR2s8voGfZAENuhmYo320Y
8rTnQFvHK8BpURe/hSxPYuNQNknVqnmLXnVqCa+IKOG+SPjt+mEzdUK5Nsoif/b+
FifTcN5/FDivnM7Lu7z4cIs/KwufuuQ8rrJ6PczlV8J0x0hwVX/HY9Yv4mJn+DJV
UZn6CdG3NGhYwLvalECULHRimhxS2H9RpWbxm5nl9Yg+1HXZBlNNLjBrK5GCYVvO
OQNfeD9BRzoJ3u9g4GhK0RgnOl1d9RfcqKxigsxcMCSDwM0dQDZdyZd8PgRKVEXb
Zz0/2XpnhgihYtYT71EA1yRtPhOw6wyfxUgFjR/vvgvTYwsi0pY1TFcGifMmLW8i
YsKbHruRvlhsINwGiwYwI8A5dzw/VVK6eFHzuLrirhgdMxHH+ErCSZeueqPdKjEi
rIBizsYQBOpFtGOONX24JgZG3G+iDGy/+zMk0Mh6brExC7+CJTdBNtD3hJ6Ol873
McHS90D7iPaeUr9mdPgcMejovVCLER+YGydsvBtqazR0RJ5/u5265WMD8OecJw29
0SgNiHg2nd1Kbm1KRbEPVtJ3HtM1vrEz+ECKlUhudzuhwPuNEJo6yOwX7NeAU6zx
Ju6aPFcyUw2Fgk4tuq2FVtgWLZI8kBCoh9qS+n8hPo5nJmFa4P9D+Lf7+ueHWp7z
7mHbQ54Zws97t3M1eJNFBXG48tdO+/VibrTpIXufrGWwxsj87avzQQbSGKDagKkH
OLQMl3MZ+geUBYFuxzm4PmgF4vEIGV9/+sfLyoGCxGNmt+l/uDbP9Pf3YeDkMm30
LYfEq6WCno8BQqLx+TuT0YmDh1cdC0KuHA/z6fTgzbch5FILE6SjAWyOHQX5CuSD
kSg+D2v7PWA95/SqHKQL51KWLZVajGztfkMqUx5o3oopLzDaNbJJBw9UpSZ5svGK
sC9Ei4LDXnBFb0lRgeojLfVLFlmc50fvh1I8kTsbfuyP3eTn+BNGIRgnWqgqjBnP
sm2eHQsBWwqkGrl7xJ3VIZuP9lsrAcnraLd31LWlw6xAUcVdeDOgVfdndsEOCwqi
XnwEm8VZYwv3xb8pNRg9WQBwVFm8lVP3vQxGLlRoqMJ9oonEoMabqzwg3eO9RGLR
rWQVBcVxo5NIiCwM6PPULhB2qSKzjRf5nFu+LWCLcv6c5SO62CbivEZ4a8QKI748
LDVKc6nMwY7PAXTwZzdtMVWc2PasPqcRfW0k+YkC1A+HsfBDJn4NaROqaqWiT0do
vMGZz5s/zs0zeAkLOcb98p4Br35uN/KltA91Nr0265jCdv3WQ/nEQ0NxQ3QH87O8
P/OCNZWd6sHs3AOYKEjw/1I9TN/KWWfc++cP81u6Ou87kpSww9ExS/boV/LMxhTs
fNZYptse+XqIEEW9efI9fGYsUgatMJr+w3lzNYTzIwNTzwazi+hXgcy0dAvh3mLj
ljneDj8GaiDCPoH9zxfaDBKAZkw6L8AcR5MW+rVS4c13iycT/Xxn3XHZOwBihCmm
eby9v0ZVhvIldO3IEdRgK/8p1Y3W6v3AcuePVPN75KGEu3QbdhIk/p7oKMDJ/MZT
aT/5WBVpeumYzO/CTbWVX/uVee2r89jusVI28lqwgJJEmlH6nk41xkul/KsfBTkp
r+jciUI4SR6zK17tKhTqrnXp0/+b+xUD4fW2p5MPwIP20cMiWKpgDw/N85y5kVLh
F+XgxUhhipCTEnTvdhlY8+pvNvqMJt/XG8YGMD9F7e/26PCQT2yZd5GzAWWDOppD
jn02VUYnEm3uDHpk0b0P5xwvazqhsKh4a9CKYdDFAJLz5cDky7qnUP/M4GIH4Tfc
kJa4uiM/3WayStkbwDscq8/ejM9/0lSi6PEAGT9Ab4SsYfvZEqByuA6uSRYH/t/1
hrRZM0aEz9On7qSH+CfRAo2L5iQtPswjQ6EtHAKUiMlLi6ODdLkmW3qomJhjmICT
anluzWy3RU5+xbJ6xongLwiUiwelxylvmviHWotWY9EttxsGdlSXKMsUCb42KCJQ
Ftyf0BWaFtZSDpb6M6YsnBBK/8SrpCH0/fv9OnqxSg4RrQTm9iVf7HJlLyij8WR0
Sf+1Wg/7L74/76RGzwRSR++slrbFu9TBk+J2LYLjCpL//sxW2Y7VAfLsIwLZG3lG
IW7oaj0wXWRp9aQqkJ7wWt9DKivFs+qtT1C4Ebr4mxRxKnNIuGtBNh0MeQWxJxtn
ge74JLZKo8dhlh9wYwTCLSwRkDfrT1DuEU4ZzInbYAz5CAEx+IWK8QXW1gxm0aeS
xwyDuqaO8zZNgkkE5YZjibsEUGdlUKXwzq8RpO6zjkZYc/+fVKlCFQclmhOs8RoF
PYt5uzOKCUmAr0BC742mb3RnHTBjlkhnQuSSNHY/WPcOuXvc3PneEYf+TgFfBvDG
NZ/sxGK5XW6hJABnd0bAcTHJxC4kW3OZ0lMD1zFiXXuMsCEUb0GZFoUGFb7GdAUf
QsXhMgPZT91Hx+F4toeWf1kROZK+vyEAf4nYnyLN7Ipy6la7Ls+36/KxUcn3/2jq
7Vj3agD/4t4B1eIT3ICBAVZEAWzhFdlEdJMdPKYwOHZ/P3YchwORfhfMtUJIwxDJ
u5e+XNwJ3hzuh4aQ9m6HPG2EwCuluVfs7XYveF1pHXfrNInRzFu7Ne5T7dB1t/rz
VD7SGSXRm0+UbsmNCLdwzAsQsAKZBhyIHOXPo019qh6vzac15R46XbWJ0mFsanK+
1NMXG8sfuKirUcF3wrrRLqhgyAG+hpvQPEG+4vri6B9tX9cGvzpEHnhKKzJzze2a
z3iJpxw9FBPTGKmafLguC8MHlEgisBH6ZlpO5FZqcltzJf/wl4cyQ5AzEC8WXsc4
2sUh6UjpkmB8g0Lwpccy4BSIMRLkGyNt/s7CsmxBzQJhPPkZzuR85Zz5BrbhVR5C
EmUPH3JGPnCSRLO4g6m6OpOQbzIAx04C8yNWMgJtVDPTrzQ0GuqKLGcHdeoOnubH
XdLHb3Wz35IPWqKoJ3cU75/0u3/cNSN0WZLxKrszBQZlT7795IHiE50MO9t1TctA
bjEEhK6Xtesk6X6EPu4mAHRMlFbsx3cE5Pfqc4scCxDNt8LMjkPdWaBsuR1s0xj1
2xOTcdN9+xehnQrsiNHQAMtSQNWaNm56c0PneXOzHyFMcJXUCHco/MRsniiLtygg
dStmk/UIbIPwEzkBxdBTLfHBm3Rn1NC83CI1DakNJIaKtEybbrqm5TaJ/2K6uBNi
Gv10MVUJNxTdiWWdTCQLDoMiGEQZB+8CFV3FxUVoP1ofx86HBYavsI6bZ1OfF2hX
V6rSewf/XR+CAHuaux4OngqkWVA+gmnZwov213li7go6T6javkZVAQtASABiIrZs
sUnSZz8OG3TTgTsb2IckkxMUbx3N6SeISY7AAYBsftXEQK77cQwv3+l7eB58hD4m
E72A4kwJZM8BFshAvPYDnxyE8OqxiD6uaW4siAh9RAWu0EN6COGHLyAwvtKg7zJb
rGLoiTWvPRO3BT1nOEBubHsTbk64l27+p0jgD0Ibrba9OwUNwNHHEkEJNbkHNcDo
/8HRjdWGOXwNvBZvoSjb6ojYcZ6Y1cW1bAN+DRMiqJ2HLbMH/4qCq6izj8nnl/9u
GgujdY2tLY4UiK+JgrguBLgUljQQIX9gjBKCnk8AquzeKSKTjB5uOIWUD3iuWIFF
ehCguhqtzgEerAAPRzZKm9EcC6/CdT/fx9t1vmDbiFEpejYNjC0M8YcLoo5brlab
5tk1I6yndbPkDNJOd1QDkc0H1TSZAC/9B9IF2KrWyExh6fOloLB/f0ADNMyn8D3p
kB6uPy2dPCN31Rurpzaj0S0nhHAEbyrVAZ6f3jiVoNfCdAtAOfHUoabzlVauZuMq
Y+zKvQi1OwAeJWktgF7Vawohb4HuzL2h2lwalkkcxKNteIau6yeleYCcXCUhEb1T
HlM+Cbb9ErUySCY4FiWfm9Scg1ej8Fp9M35oSbKXXFU/YCNuXhtfVwd/Aon+y4tT
2B9Pi2GGAjNxPBjhsG3QrtW5CGjPlYnjAibR6sBzd6+wTqLQGzMKPHxQ3WttCYvJ
1kxON45WnLWNxLj8wY027XEICf4yvJRaXxbRS2eMGHoLXpyZ+18IscZ6o7Wz/KQq
mVMimki0DVSmE0xAe+uC4EZ4yWfn7SnXzYMgXy7+J82ZUNaprmW7TGPS0O99vLu/
8bCk3VqYi+/QZ2o4JdmlRMfChsGZVRJ0TrBLPIUiEwen0lE9NfO5R+tPntCLpRlY
2n+soJ+8DsNFBZ6K/jhGDSrbRaitUJiEct0Xdonfr4n31i+e8Dw1G4Olkii8571I
ZbRzgvbx/uXlPtdjvFN0MHZEFudRuEl54pHzKlDoOUq6lYWkKMKG+wttH92ddF+J
Igy1HSkqK+2Wd++eOWeWoEpI1tQ93pCZMSykp2/kVijAC6iapzwKx6rdsBmwhP9N
8qlL8bZrBi+KZQKOzizHC8l/d9fKDBleScnMhWhq4kgT8UwjfNi+78nR/VjxnfkI
Y8HfM9w25ER//IF2ZIPclEeSlUbzFiZRQ1DmrwqMxyyGOf8DpMRXbRHR8NCvckeC
3RTydsPDiv/RRYa5PXRSPCiaeobt6FYu1ifHKgPtreCnRuaQAZItZ1rTF7q11vat
i2bM/BqxtV0dslSpNVNX99jb2OX+eti1zSua3+ituXpkfpZe5yfJlS7+81tQ+wns
yEp2KpU3weHb0tRlbb+M6rrw2L4x70XzCV2dWpIjUC9ijHqHWluYimPn/DKkIC7v
Lhou4n4+efyiuNqah1Xc4kh7RdxzmzUyhjiuv7kT9Uf5EGC1751AJU6BXUv+/Ca9
3TMtasrmtw/tr6KI9gIMtakSzi1cNiYIrLT0di/Zwq5PD25k4NdZQcc49QPTUwJa
qjO7eZ9YYxdkcQlkRD8HJEOpB5mA9X81nHBL8UFHqaWwmQQ5Cw8nvgy8we4JTkia
ZhW6n1W4exI25T0aEkmPI0a4Qtu1/tPmiBKsb+E9BAZpX8N2XYQ/nlfCHmlM9eGt
TjWajE0bD//k/063ZUslbCCk67xm+3vxbkXmN+gsQy11Zp46jSePGYJBb/KJ8cll
SKfGUJWSIC5QmoGFKAsUxSazPEMSTzlLrwHZqqdyN2/K7DzeL+6YEhMuv47m2W20
0/KX55IgoK8LPQel+aIkVdclr5BJxvHzFRIy/VuyvRKNnu5wEZ9luUzURlVVFBJn
KRJgtKsLxpN33AkWtFlivbpQgd1Ci4hpKJWo1aughzVrg7COr/0k7TMA2kULBNkA
4RW8xV0m2mcGAu0C0KSv+C9iKngDeKjgaWPUxwqacPb8VoBg9/voH7A1CqNVNtyV
lgdBvWSdjj5LvriuSbgRpqt8saobhwJIkbRgZ3LFQOv5RlOCpuT+uSSLoFqvRk6C
5g+3HhMVwB34hoG5h8gTARCYkN7EV8R0NhAOY5w7a76yc+cV58bpHHRJ+15kVrKu
sgTm18ncHNDK1FVgldgKQFGzwHOcodDEuM9PTTVec6WYmmxUZsy3EGWBgO4qpDtP
B+Ouc2HaKh2/xP0FuEtxMsUYDlXjCY48Z3JTKT5DeY5em3FrjdJhUZZr2uCYUWGx
uPlPH8jCfNp32UOf32Txd5cswDKK/mzg5RSekVoXrm221ZSyAtPWnv/yoWbpveTC
Vb8Sy23HLS/K1iXo33tO+kBLWT86rQ8P0lH8lRweX0ftQFvfX9kdiFmLFk7Z04hJ
U2ANo3+Q0C+w9bxmAwKTraQ2ulCzpPp+DPy3im1+zteG67CNnC0IhaOpiYTguz7R
wxziHbA3vTM2hchIRhQVnZK1fPatq9TMwxFUVxn5PHCIPGLpd82xopkScwDGv8GX
5CvsjR6ABiefXAwkN6qnEt0Sn8LHE+f3p/9+haeMXbZwLuPcGVhEBRRg1odE9xDf
4kitWK5vwJ7alSmyX50reVmEXxor+1Oq/I9+eEE6SJZpRNrlewjy8Fpo3AYrapci
pL4kCr2E2SIqnsTa8kcaoF86Lk5oOpQYBAC+uHMnu9xZvTPIAj8cGYImwn9KLHCT
hoakcuFtyFs0jLQDlYhIA+LRjszNBrpiNUnXYdG7XlQgEWlwP438ChChJCpfZpq4
Yfa7scZwoJMyzxiowpVsPSUtQSND0ulZ3CNFoIEyQpfa84kLp8UXUjIfx6mx6jhJ
7c/79Zu4qyiXrDB8omllQPmFvymYo+ntoMt1eLkB5tutsSYyGDZgXyov1ggr4hI4
0yHOmyN6/2f8Sy1ifC4RjF4dbIh/C76k8MkpsakrwPfe//keVHtNO8I4QqoU8vkp
xvyKnvPctzDVg1xQ0UC543ul+OqF1Mg2g80awdG8g2d7LAHi4wNiM0clE9sF0Glf
03V9i3VuqDn4wk5chf96I3MyzJgERCzw5bEAryLXxBK45uGsgLzHzZhZT+mEZPc2
8MstYupAQ30J7yoSRbPAgQZDmX4TMvN1FoTgGOREUWlDCSbkFPjSh17fg0woN1We
lh0EiGyUrQkF0GihJ1VLPfwrOFP+khzP/YPxQ1ollX5TQ0JcPljl/vo06ljofha3
nfz2CyNYHyqkm/xD/fKX5xERU+8XT0ovPfmply3p4eUNotUQr2BJmXcAaYsVvN2C
QL9cb6YS9CM0SHOrftB7yfzJ7WkMtHC55zitd4v6+1TqaOQGc1cS6EO5BV3o87PI
czMI3EQirdzG+LFpuYNlwySb8rp/qf4AnX9HOlRVdd7hRoxntHrrcPEXUpI/THgZ
sIGmThOmZNcHmx+xM4MksARZeVlDCkvNtAmSc2j7YI9aESKxJiJlff7vAFXN4uIv
fsJFxY1ffy/DVm8mlv/5hSD+9qJcO+mrn7nrirjCd8/YTHDJRVbcnpAWBBPpTJ7Y
/RPaXC7ux3lmBjdfd/zfj8fwlP9vuu7iFcaf3K6pOsYztxKChe2ucVy7yxadLdqB
kWZVocZMJ6p0QP0RRKHPQceBa7AHKoc4VMnZHtH/vzLxZoZcWXqG91BwdRKI4YDW
hBD0Qy1adPAKiOUmgYovATOZUygpF16odCAwBTqrCZaEqM5MYKN3VLci1wpjCNEQ
Ws6rCUTmPwY++0GSxj2dLAIhlfF6DMOWJzBr8sFS2xmH1l9HdMs7R0FqyOjIxWWT
VLQ1CNVT04Tj+ihTA21ClBbeviKPzgCRjEIqpqKfeyDMKPjJLWx/pwZLTDP8pLMf
0mtkNiROYDAyMIeOf+SNIpVJIkiwEkJ7bOIZ7D/+mqOGYDIwHW/CW6Mzqei2eKlK
4FLfRybaCZFi7h8UAhXQLw6+p3sBAQ0kwAD7F3UeYzrCw/ZBID32xCx8zNRvpS4n
588TAz+vOstj55l9ZYNJ84hFeyu91Amws3mG/dsWX6J9z1HpX5I42JBtXccg3ztF
P+aX9xSzpY3BogYAq9FuIBcTGZ6OWL6UEY9kppwsVTnO+WfJIi623uEgHmpu/mKM
I0/IOGpcyKCtbZmWhIHZ9DDWgSgWUNwd5EC9R5DdArQZAb/kjoIKwBcwJTqFXzn5
fs/K2Da6lDmr4NVW9adWE90PYl9D7UWgDzJb3DHYCgw4NGH/K9dOATDSPzPKQpaD
IYoZ3UuqkTMPAf/j6HMY9ydhczNPi1BSqx8pddFmzpMSJCdWp/PSmICVl8b8JddT
YZIBtTHO3C54qDvojoEGAA2Vqt91O57rM24zE0/3KbH28snq0Ue+ykSnyBR1o5+E
aQGzMK54tYj/AgAqwFxqeteynlCv2br4HM5plP/HL6POdKhlOk6bXrkCUZVLypuD
LLnTWeys2S41OTWLYTwNh3HFlHtjMUlN+B8RG4ThWz30Vm9LuGmGE3mygSryGCc3
DNmvaegrKVZbBD+7S4Nxgp0YnIjzEV+VCvuh6tAL9ycXbPzk5AAA/XujDJY88J6I
kmqCcFQ4TLNZxM0ixBtukDOvMqPEgIIOlPG7msjtWsBloRCb2WEm1vruN4lgK1kc
kDe+MNI3GIDy56SoyJ1kqTg9jlIgQiEppEd7aKwSNAgFk7NHqcOLS9QvY8RM0V9H
Z+yto++O/ArsaZI+t6u3Zmg8sT6IUbhd8saHKibZXVfMeMg2TfucWdHm392Xj0Um
DgENA6e2JrM0vy9brDOixzDvWIqk5G+Biwblch6Ar2IpoOz+cuIdRlZ1JT1n9MiR
m6iTggqwaH8zCC9bI+99EGELfG2yFWb0WdOz9Md3uE5uTkvrYx7YuH1vqyKVSlf6
czzeT3Aidpl6QqtO2sahIh4daKDwx/68Wo7O0+jHLfP3eBNWr4EmEZ5ccTdf6VCJ
kFQVTneQDd88jHqdOTYIGDi7F1vACUz/7+7QDuNetlC/+uRu90vTq8fWYdOhb9aL
BxRjp7yBJAFMYlwzSFlOewOlBVOSQTRgIMvKWeBVMS7vJzJkqF8UvyGll0bbZbA5
odPTwoE3Zcl14KwfmLPAas9cOyKxK80WBPxEYoXWJ1nbS7IKL5Y7TR0o5uC0ASVr
Zs8sBqbuhbWwaShqYQeH1KyKXSes5BZAJNnT/LiDj3IjMBZcWfm+NhbbgwPwNvIU
C0/vHeFcqb2qEUPU5oOi/K3amsmb+PgXHt9q74TUccNMCZGj77FQwBzACCY0Tdqu
82yYV+Rp1TGs5rWC1QE9wRre1iHqEf2aEE1RsL2jQTe4ZNaPyV4jWx9LHXVmBe74
LpM4HfVLAOAEIlJo6c6kKUIzf/A/ffa4NljEaYwsEN6M2vLhsmW6hnflu93FkWVy
SERix8HjFxluDlLK88Acree84FEecd3+33WOs+SMG4dzMv1FFZN7e/mnII/GpbuZ
CpAknzS7zC4IdKTur8YV9pjb7/aKmzh59rpXh0wUWsV3fqP5lfCChpZoLyl/Qy3R
c4xgy/k3BBOhq/HNcqCE9iYQrBLG6FrsaAe24q00K0y1rd7PaF/f19mVjGrw74zf
LqJ+qUJ6pvq0Ap9d2mG16TS/iSw0f0xG0N7vrrjYgh3fOwW+hENscmkWSv/ybqhg
aFQfVGTyQOP5XeXzXHS8xnibvB1g1ZvaAK10mq0BBW1QwyQGUyXGfrsUK2veCS1I
NNMbor782osQzynqdCFKz0xfmQwl2+ltaJCMP2I2yKjFkkNqloZluzD6D+mLqJc8
O33rZ2VrD1o6sBMeHJSEu0UI34azKDhR54BnzZKke8yTAFlafH54sxDvRyi32Hd9
rICLT+jykZmH67i5hh2JAs7d1oEn6e5ByrwIo1aJr3kyjnJ16ybh3729caf2LOkm
DDQUYjy/0vDBfHybxRaOqXhOVbyNCPiUnbu3fBLhhuKwd1v9ylEZENUe5A39Fpt5
WrFKut425DFmjvXbfYMhyXi3hBZJ+ZDcsIudYb4QDnI6X55VEAtK6ASzhNmhLLaj
E9YPoYDaJLzTYfkFX3hUqN0SvE18gYqYrBhj4Wh7kyU8FlK1dtYVaxetfSX6SW9N
GnXIyT41gMg784viyvz7WKXR1FpmWCnk4/bI3D0d0CZwJt7saQ6s45O7LFtG37bq
0I1IpfhwhW2slRjvJ8+8M29IySzmWWiHZdmBgcfnPOj4nhx/2291HgdjHQAxTme5
4MmWeEAV/+7lkHwhjc//B/Pef0kycXWNqPYU514UuVVZZ2/KcuGeNOJBaaSBRvpo
blVzVyYlXK3Q1TY1uomfhcUb8Virkop/UMp/xwnCvMMCsfKWMVPZwZw67mnj8VHt
rI4KKfHni/0cgz3GbTGpcpbz0EXGhoeUfUYjCK6tQXJPNkDaWHsNM65q00vbEJJZ
5dgtSVO2py+7A5T4A+aA4XSzCgdpWSqEc9yaSeiqh7xwwcFW68dZd04CMfRSD25Z
dTYwmoGvfHyMO/KF+SNdlUuWYQWGlAWTd4FtsYWoGkE8Rae+2RKI4U4cpZl3Penp
P1L0oxbxqWSfU3TI1lGsdxVlqfpoY4EHAjTHRjJB5AajKsZZbTNURd2BO8rpoq6G
aF+TdmwU6oB4safNZJ3zQVGQXsqL290tjuGh/BxAT71ZNd9P+MaH6Cf/FEe0yGee
uJ9MT7G6bqM3/UanFfqdNqCAojGpk2cL/wexE0AdqpN6upTZpk56MOGdryFVHhxA
BOVU5UJ62YkUJtDfR2Qy0DGIdbkYKj9wdCy4dNk+QpWdYjEQPoiUQAu2bSEnXdjL
3zLEGO/a3r20azkRGYqMRglJ4nkxuD9eztaATI845hH7IYITf8lUeGvfR4fVKgW0
tw7zTO1h4OYjPkfODlpOAE1kVrUZ9yZAhLWCfzobi75b4YmZg41xljENX9mByc2D
uOW4Z5mtdh76lIqymYkVTNVw7kJWsoWrx/01ps02yhdWyfA8Ub0cUuF9bE4aFovA
GEjw/W5CV+A9MnnxntxaZQpS0kcKiW0yB0UGWwcxm6lH8/YDV7h9JWhOV9ZraE30
RBInq8WwuhSl9xMSkcNY7w0TZA9uqDgLTMAxoVnYC77ssAH7b/A8Imk5JfrdOOmX
uLg/801cEde8pzbWDcqYuU+ZIvlVm+H9QOxVRh/z53vPOtwfmszkyP+DbFWwwP6E
Z1VmQ6MTqeYwK4OB6bF8D0sWqOfUCZY+eyHXNH2P6EPNswuc3dHfs0DlYbSODCLx
Mtt7zt+YKTseF/6UwrAcDFmM3kmZOOvZyQUbUdTAlhpCoG1ZReOgbE1GoNWlksiG
3MoJTv1Q1FrHkzmXa6Heh5dmkVmNRuX4Xf0Yyim4HKDtAKhSMoWoE5KgCPgASYiz
22o2XEU4FkTK+bzLeoAAn5SPlMXtfh+NdTVNUWclVLh89i6+RhhZu7TWmlujePS/
E30B9332F39umJ6yReE7lJgAUFmA3aBCjXg1NW6uStPUCpddXyJHl9j/b13nuMmi
t19Qp87AWPDpf4cNcKW8LM3ZG7f6sYyDCLN9iCMFUkifQuJQpZUYYzDBJ5p5Fn2d
rbtHZtb+glZj23OqWrIrNyvmv8QXOVPB65kuFV0/lLKPCV1Ebc+wIqZuM0ipUGaR
6MCbdJ1g0OFg2Fjlq7bl7rwLecYhsq0ywHf2IczOKSqqqcu1U6Uz1TJ0s04moerc
+/zT9CD/fOBafXrqQ9yLHe9pTxrXM4f+n8ou9DbSDfugbPL2CRfwsthQ1zNXbGWB
8YOAj4HrTxv9tW5Ug2WSforTXJXUbB7wM/idOHvO2+7c+WaSB1s/SV2YNbp0DvLy
JXlaI5/r5zM59L+1+7mvj3hQHbdlO8Et+P2+ihA3KcYi0dG5cfUMjXPOdAXKinQQ
xyMkhU2t8NQsCT2gYkpWE/ijqjK95c/I78tu1Y5fjKH3KD8ll2e8FPaI9A3vjSky
spxVorn/ofqWSdQCdKO2Qc7mApqiQ5wCMcznLTpjDqhk6GjF53aPkoM6pO/Kq7g1
OHeqpgq6D15/pPY8GiJq+16SXoq4kW23Sxx2fuCZfk5bpWCYeOxMMzAjaegeiART
Q5dPKwmmrLqoK8Mw23UBLqSgoIexIgK77eSNb9KvGvPO1RrpDijDi0VszjzbZru2
q6Dihi8LmUMG0Ayjhwiu/3Mm+UVtL188R1mhLMgFLHoZdw3wk8NChqQalGkHgt/V
RfEKcoqcMiYIX8qA7UdniiVFu4rQX5CprrXk1hy3ouvRA2fMVb5xDFu8kfcQDq+q
yvFPjNkoewaBiJOnGNofezQjOCjHSqQ7ZyNS7NMvdAPYN06z1iyakYepgQTfuNm4
YET6sFu5BKDyBHm/48pVlYf3vCpkyDnKCXfepaTL9qDO/sb3p1Kw+14AzLkCqV8o
Aw1PZ+x9hcEtvz1v/XzH484DIudF8Irl7qgUkmHIPoflaxVGZGIwRosy43jcLy8/
QCOHKNRfn1992FnszL3rczYhSQtKYFuMeBj/n0zL7yMeQeCdxCMgQCZoq7bzw9Bb
6jBb7a7Qbz2nuM9LjEbERa8zr2sostnI6buiTcm1bFMZag/D/vY7JJMzaxIRg5lZ
9mncjnUzCU1ZAEqUrqPYSQZ0kLSywJJgWA8dyEo30qHbA+XrC9KnO7VPuhvQ1Vxi
GEZk5kWU3QaaJxOmAptjX9ZtWWI2FxyTcpmqOn7QzXDR7X77jTtA5GLf6n0ONdeg
bCFl0BsPtKiYrIDW9G9REvhtSAzG24LVxR9VCNHFuzYgG2NkeNkQoRza4IWa8Q4d
kleDgvG1C3I2Y8Fqay7Z+fUnIEW6r2G+NiA+9PgiTn1Rf2GZkLvQoms5GIJY1TlK
O7bXj4K6Htx70fGxiVS/04TRWoQNTWH7sU3/cgLUb917wm11DcSdIh/wIIs4a1l4
R5/LoS87h272SS4XF9vem2JI0aQVQU7OQqx1U0IGokIiokQ4zU4NCf+vVwpbBQ8u
xp6enUcncQpqdZK9jTQsqEbpjNG2cKBYSw7wkmLmK3NDi1wips3dU25oaTekDwRN
xWDKlIBAR/TbhLOqkDhhfRs7DjEg3Y7dYHvfJbgZ0Cg3+AR2VrpUgaDP50muc2Xz
CbsIZAK0FyrqAs0V4//KEJBptoVfIhYEp7SfXElbNiV978tvAfjyOQTVEHRfhPXl
cX9U8Umjw1+J3kB25ygF5hMg6Vcj9P/unBMbfDOQTLml1G5coiqc+PYU39RDpIIP
7QjTj00KkI59A/PS0t7oqYYVjyRXV6xYO5R7cj8yqKgQlqGCjeP9otLNdmaeUp8a
khSCzyRD+J4wnzTLCFmsqT3KlzTvTkkllaTIFKgL1XTuzQLePBjo20/lVkelNR1S
9pcTIGUTbOO5DxrK49tKoyNPfpAMdmBg3si+C2ldk6sK1LMHSpAo8k7AVTN44CbW
sqNZ+zKvvI9rZXOuT1MTP+t7KW7N2/l3bMm1cGjyKu8TmsHBxVIRLzCW8xb/uqEi
LFH/YAFe7YzRG/urKMnOkErjvlii4lzZiGyVFsT0cVnevRZceQM2b3l4iPU/dzJY
TEPvl05e5hfOx7c2sZ72mAdr25/4O3qmW/dLbu9Pidr5lhlTQfYkW9gT2roYKIb7
bis/AH7uswkNt8Mece2vTQSuYqnzo2mvccslL7M0P2+H+YDjTXKbZWvqttkvH4uK
WvyUCtjg2unlBjwCBHpcLS23EEj2uw4OPe6JkdDKFNcBvnsaHm+HtYE2N0VszXtH
ZBvJNGm8Q7u/e0EBEbcUCj3u+Gnnf8XQXnaT3euYivjAVscjSQdiF72nOGWfNT0H
jywAvJuUD2HjEnkkBv9bqCXfJgg+Z5D54RrN4x0o3GxKnSD68oXC/wO6h3cq+okS
FmV03QPOwLJdn7i/BAIIb9iy1EpuWizT29aEkKd+JrM8RvY06pqD6tgKzKt7zafK
WGsMFE8d8YYTwSX80aWGos3c7A3X/9DZqgm8VmsQp0EggtlKenni5Y+ANE5FgKb0
JMZZAAqT34162t3AIKKYAzIZ0kNU6Wdu7cBiN5YXdec16lr6TC51mCPOXlnGA75w
L7EMrM9tjx0zF02Lpu4MKGWlUC90lSlwpI3ZA9P59qBAzOg3iE9ADF5LZbe+kF7U
KU1xOI/cmMpD200kL4q0HauRRRd9ZLnhd40g50JP3Os712w/kwCCx4tEAbfLO8RY
wCQ0RMa3vZK+wtcbLbNGh+ObWHMHztKc+0HAZxZs0Z8AtXVeQh43C03UgDlFlSHn
XPGm6v8sGz2qSZbMwRO5fYMovVjEGWM4X5ssUl/DEFVvv5+45BbPjzLTfjFCUoxN
63Ouk72v/EeTOo6sHD97Ayz67ZLd/sgHL2UwDb/uO6ef07YXjOOxyysmzUMy2dj7
ea+yLMCvWc/s5PzL99asVqdY5/8wor9Lcu0RIz9iHgw0uRjz04REDp1KW/4hNTnh
fvOPOoyf/mTSsVa2EjYWZ0J/8zjr+fQ69H7gFbJQCbyGj85wuAamumw350cCosId
Cb/ZlIcO2S6yI7XdJ/zUd+6iTYy2cAxAO+amQp/cecue9MhXEbel32KbbAR0/ZEu
1dBoXYqGR8qF1SUe7+ad4YD4kHxCFRjRFEGFX2Dlz35fk9fMfHR7KmsWJunG74Bx
KLLglmopTxzMxf73jEsDxlJQ8HIFAgEdEI9E5Xq/ICQ09p5fNmFYBFQm9BToVNxV
od6o2kWJpqOwFg8SzfjBUQj8u3myeC45UjOYJWTftWo77KsbImWQVvOnpvL3Qr/k
9KuI9jNA3vAod4OW/A9GJ8TqdrU75B0J86xD2Jm+gprpqMBVL98EKriij0FjDtgD
M/XOiGn25JVvo1XO1AMYtRg7Ts9239meA0K2Cjm61VPIyakq6zYSfXfkgkUhMcsJ
m0ImJSjuT62HsNo9mTC4Xru9Aj+aFgv0+aTkNQUd4kG7imixWXbmwzul2r/YmImY
d9spKpGcN42dCSEXwys6VO02sQwOdAkZjTy/QIDVSJC8a8hCZG+tGrWT/oGLgeyu
PznCXar3uIdO3KUcl9i+e4tOzRIWYWl/J2OeE1FblKDOrfzsHqpLtkmLmVyeqQzp
u0fypX5VRkQY9FASxzKPt14v2L5LFnbXFZ7XDtqcUE9dREQwY3k73p1pO/jZWxrP
vtxD9qYYO5XvaxyV5YFFCIuhgAClgZ6R7MpppHaF2+9YH8QmZocbPXxZN4n3/NZA
G3jdW0+hU9WJdZ7QgHD9vLiercfBKqj51GZSutGmOzCxrSn+coFQJJ8apqnQA9Ll
Bym5qiBQjeJ2z3Us8ciysF+okgh5G5msH0i1lOjVWt44BfIVx/Mk10DxmfiD7kjD
lrLeyuwP7DYXxLBksp5qd+CAjY2HglkARdnjI1sXO7RudY68Dhvm6x1wy5I/x1O4
E3rjn1KQkZSzSSnfipTTt7Afb592P2Zkj/sSoL+TmVTo96QHRVy06mC7HIK3yG9p
iDX8ydElev+X/4w5GNpto3KmmESnajGNL0DosdeWBBcywTe/+hTXNlcfWnyU9hbK
y+fD+DlSbQWXxYcoYIij5+f/OKMbP9wE+LL+KrvF9tPS5ZQ7zyWZpCqoUPscons1
1+qvZkpKnd723iHa0n/2ukhysLE6SBEjLg5kbQur6Ozf629RHj8QvPm6E3o/LPon
0JTgy3Aruwym3Ehon/ZMJCQdDDQJ40OQbsTDrUdexnc4YySwERD3vXQNP9ZXM6nf
y0j6e1NCkiMmPAU+rwWToqUlXUT2meCK6+wSDRVaCOiWQ6EwKdREIlPbkGc4snev
Ln89ICa9Ut9SpyxMBxhSqivJ0Zy3fzRj4uXrI8Q+e68HddNW/HU3Wc+IFWvsWNz0
JSGF+sP+B+ldM9pCDEF+X5cFHlMmVA/ANCflFYXzAs3WoAWjS6vgLW3oZMVGkgMn
Nj5ChKCRIjdJ3pBGoB4vh8jGouBCuzjkm/7BHmrBYZzPtYfrogpJGtcUjunQQdkO
TfNsuS/Wv2jrAwOX2f7GWJ8y/tAq1IWBJa6vMoiWn4kPkLo6vv04K1DRM6QZgu9W
iUAUIc58sU/QrFFLbYNAXW2A9pbLB1gW8MjQVibvzaab3W3veOMDMlVKmBa1y1B7
D3WwCETvngTTP571X+ysWUSBwrUDMl5AJQoU9OwMGU+oZVEVr6WGds/sCItp/61M
VkaQCyTxAPQ1UykIrVJYkUTSJN0wHdyevyFJnkNRsOt79kgarYKbSl8e6Hld4WlZ
E3odgDJCrwRg8kG/Zdrs/NykahKXKEeaeayVeI+VifazpEYRqv5yWHp9Vd9oySE/
iq3VghVG/kd7GESzlb+FKJ8O3295mnS7IXdTAopt/gKBseyabj90qjaawE1y3HaV
qDjlnptpETaxHbm39vUeuA3+EdCPY2N9V0BxgJvo5uYpXxghheqT+XUeOiGBqIOr
eojMVGueezZfsS1JXyv9aVfw1j09NxM++vq0bm3FKVOivvl/hhL4h62mANcF0uGj
SJGZqFUf0vBwf7Eq9wcaZCMY/Joz65wZTnBPYLxjAEcgND0SjcX1EyuoBj5MMLLI
mYo+7x+JfL7qBH4LgWNNIWwu2q38etV2e5zT6DVpmkScPDs7BsE6uf+ZXvJVPpiL
lXhJqfL+qocS2CUfnsThy8PIQLmTsB3iCyiKOAtRo59NAdPnZeOF2eTWMhMnRpoM
nEEcJ+fhit2Fbb/S3WUtd8zlj2mQFccXicvRuJBAO+MFCHCzbC0z7tt019PsEPkS
yuWflLVWWVDpN7ot1tLGNw5IrOoFGhfUNT3k4wI5uTfspZlp1q1OhLBenu2VlIaR
C3EAMNFmIwj7WGWueptDOZL5qDIZepfNLmmpChtagTJGcp9REMniBSYC6dne2RuF
rY5gf9bwoUgyCP/yw0son6J6Cs0gtUppPhHLPYpZZXzOxx7byzuwvlhQIZWKJ9kp
IMgDwbr4K2uxZDnbFXRka/Z59b/mU6qANMnIcJYPBufanJcv8NZNA/ThcXCiTL3n
TFPnG6gk8MPd/psxaQ1blt3ZjXgbDMap6Km3KM4Ztgc0q/soqPcvFtz7iwMkif9F
4JUDM6nkzmRcUw8GeXU3kU37CGYDxrUZTU35h2OsATUy2ASTaELRd1i7V3p/bqUR
nyYSujtsihSzsg2UfBqmV8SlDhhre7ryFjY0Bb5K6+Yv1U6HuAJhp+JHeLN6gZKq
hA9yGQL9oevVKGE3QqSkwh27NY9gqoAsmbDvhMj7W2iqQ7N5k/FRq8wpzr2mAm0a
6vmrn5c6W6oLgGEobAG0gVoQPxwY7K4qIFspxNdcaiSs+yysvqC/oKHt1xDKZKbB
X77MuQk993XBsGG76RD67T3HvGy6ROsSBSQUSm8YQvdSm6PRSKC0F+QOYN8S/kFr
Z41pUt6MCGTDjSquZ2HxdTARJz1X+wmmsKroPmLnIIL1ffDDnb7p+JiAvULJ3Sa+
KHGGPH0Mhgo3TXSt/S4JgPcfdQMFRVMRCQcCpn9jqve8eUBOKRT45GXW/J5S0MLl
ipLMu4L59avUFTTH7HftwM7c7mQJKFwJq8wifxgchkkc81D4sZOqRdZxJbV0Dmlt
uGuexcBGuj0w7yQRz9P4TgaTJb8Xl75hJBR/Igp9s2HKmW44JkNX8xUq77t4zvkH
xsVi0uW8IeYLDUqfKAjqXTC9GeH38e1rerrWjnFLn6869hN+e1UcI/2tIrRXh1JB
qvIIQW5SLPfAdv4sO1WXMMsxCSsxI20UTlFu6E0VlBht34v9QkV10amsbmabnGrZ
gX7PToUn6dxONmpdCUTa7VZStlBCkhMlHJu1NW5rToLUczywC01ImCDNqyN3jB1V
xgSTb1byjhwU8K9vWMv8uA==
`pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_REPORT_SV

















`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aVI7ZF28Von13XfVgQ9a82sbfIulDkfgRkJv9Z71Tw6Sf2SY6GOYx6UaQx9d++fK
acf8xcpCmM5asfoiGXrekRANhuWsUQKqUMhd0kIaWOiQdeClPIxwQvSjat0cffgA
xi4gGFMI+4HfFIRHoz2jaG+i2WTPANpiMcsjRqed3Mo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21490     )
yxWO5PiVQtBstNX5zR8l+JkW0YSy1PfZVb5hnITZ4ZPH2sG+dCYoYl+ZQB7qI2PU
3RwFlonxqVEUFT83IE2JIZAXCutU4ob0jFl5UQyIQt0rbRzavna2gbfXJrIz2lQU
`pragma protect end_protected
