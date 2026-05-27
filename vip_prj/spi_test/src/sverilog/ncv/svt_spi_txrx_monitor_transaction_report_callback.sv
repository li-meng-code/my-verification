
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
 
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
LAw0Uz3Er/Aqj42AftGbLbKM5jS2OX5DSfiDu7E+oq/vKRpePHhJSxLi+veFslwT
1++EB5TV0k31lgsPWCKJGrRL3dK7pH6ebA1RPpBFMaweJVaA4Df9JlDcNSZhg5Q5
S9y8z3l9XtMLE2qkPoth8DSKPeemehegXcClNanTAVfISXj+3qcj2A==
//pragma protect end_key_block
//pragma protect digest_block
CcB5jfN56LKP0TAnFQmTfRZ+pUg=
//pragma protect end_digest_block
//pragma protect data_block
Id3t+bXmYJ8kDKuhUixJnreC6DxoNuqhPLC6tXyntV2J55jWh1eW/bG4BPx8dYKx
IAR/G2pe5PV9bJOGwnlWgu6bFx85tIDvGzSbAXZepE5IHC4243AS06mUKpr+I7ym
IzBbELBIkOJBDIENY9IMlZsqa/y/a8xaMVVrmS6qrsykWvRZRiKyryPnXDm9xsVx
SDLJZRKTu02FWRkI4jwPwtGOnrQXizl/JIQyoOxeXhJURnBMTbHmm8QK6I2lz+ZS
Ao3UaPNjcozZxg8loOSAH1uTRZ3DgeDYYiuBFY5Ci8fV46wgZhUSLbM3TpvXmxoT
gj2WX0jvTAJVBcpNR6UlVpkvYUanclgd8KntmqYEirH3w+gWc5rG6bwv/iU4lKx8
4NDMwjLBcN2VmO0E0+FcHYhvPa1ZcywXtN7wmsn27mYoFP3EoHsF4/4Yz6juOGdp
O7kcBgBVSzLF5hfP9Gv4J9b4d+Ao1/9+RPm1vDuArZxxdeqZSnOqGil9+ayTUTKI
hovUKzWnR3/NwXh8FBShj85PEeFbeWfuoCqUr3H/EqPvxdU024GPhpmZ7IHcqWH1
IT5+ikxEVydhGpOKnOvqhYSDOc6RKPhXeCiKgTnxvtfLP504zGQNl3PiDAmeqxrB
Z6a1XgDomHzH6furE50+hcW+QVy3YtRDu1GWXDT5+fdsA68JMJVKVEaKc88HzI7h
bh2k1Dq0AFQ8sbDYmz77RnyRv7gDFnJml+gYf+icz1ut1TkJt7w8KT16jZbgYJAi
pwViQvOMAId5f5I67dP1J0hio/GYbYV/O15ZCjlluR3QvkwBK0GhnlpxeeAL7Gac
4tAoRd4RfRbfO5YNznObxCO2GIuag2/Jeg7yVbAvtbQ=
//pragma protect end_data_block
//pragma protect digest_block
1ZvYaxNs0IfA1Xkq410DXXbqwms=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
/**
 * This callback class is used to generate SPI Transaction summary information
 * relative to the svt_spi_txrx_monitor component. Transactions are reported
 * on as they occur, for inclusion in the log.
 */
class svt_spi_txrx_monitor_transaction_report_callback extends svt_spi_txrx_monitor_callback;
    
  // ****************************************************************************
  // Data
  // ****************************************************************************

  /** The system SPI Transaction report object that we are contributing to. */
  `SVT_TRANSACTION_REPORT_TYPE sys_xact_report;

  /** The localized report object that we optionally contribute to. */
  `SVT_TRANSACTION_REPORT_TYPE local_xact_report;

  /** Indicates whether reporting to the log is enabled */
  local bit enable_log_report = 1;

  /** Indicates whether reporting to file is enabled */
  local bit enable_file_report = 1;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ----------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Creates a new instance of this class, with a reference to the SPI Transaction report.
   * 
   * @param sys_xact_report Transaction report we are contributing to.
   * @param enable_log_report Indicates whether reporting to a log should be enabled.
   * @param enable_file_report Indicates whether reporting to a file should be enabled.
   * @param enable_local_summaries Indicates whether the callbacks should create localized summaries.
   */
  extern function new(`SVT_TRANSACTION_REPORT_TYPE sys_xact_report,
                      bit enable_log_report,
                      bit enable_file_report,
                      bit enable_local_summaries = 1);
`else
  /**
   * Creates a new instance of this class, with a reference to the SPI Transaction report.
   * 
   * @param sys_xact_report Transaction report we are contributing to.
   * @param enable_log_report Indicates whether reporting to a log should be enabled.
   * @param enable_file_report Indicates whether reporting to a file should be enabled.
   * @param enable_local_summaries Indicates whether the callbacks should create localized summaries.
   * @param name Instance name.
   */
  extern function new(`SVT_TRANSACTION_REPORT_TYPE sys_xact_report,
                      bit enable_log_report,
                      bit enable_file_report,
                      bit enable_local_summaries = 1,
                      string name = "svt_spi_txrx_monitor_transaction_report_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_transaction_report_callback";
  endfunction
  
  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity */
  extern virtual function void transaction_ended(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity on TX side */
  extern virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity on RX side */
  extern virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Return the current report in a string for use by the caller. */
  extern virtual function string psdisplay_summary();

  // ---------------------------------------------------------------------------
  /** Clear the currently stored summaries. */
  extern virtual function void clear_summary();

  // ---------------------------------------------------------------------------
  /** Utility which produces trace short display and verbose full display of SPI Transaction. */
  extern virtual function void report_xact(svt_spi_txrx_monitor mon, 
                                           string method_name, 
                                           string report_src, 
                                           svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /**
   * Controls the implementation display depth for a SPI Transaction summary log and/or
   * file group.
   *
   * @param mon Component reporting the SPI Transaction. Used to identify log and file group names.
   * @param impl_display_depth New implementation display depth. Can be set to any
   * any non-negative value. 
   * @param modify_system Indicates whether this change is applicable to the system reporting.
   * @param modify_local Indicates whether this change is applicable to the local reporting.
   * @param modify_log Indicates whether this change is applicable to the log reporting.
   * @param modify_file Indicates whether this change is applicable to the file reporting.
   */
  extern virtual function void set_impl_display_depth(
    svt_spi_txrx_monitor mon,
    int impl_display_depth,
    bit modify_system, bit modify_local, bit modify_log, bit modify_file);

  // ---------------------------------------------------------------------------
  /**
   * Controls the trace display depth for a SPI Transaction summary log and/or
   * file group.
   *
   * @param mon Component reporting the SPI Transaction. Used to identify log and file group names.
   * @param trace_display_depth New trace display depth. Can be set to any
   * non-negative value. 
   * @param modify_system Indicates whether this change is applicable to the system reporting.
   * @param modify_local Indicates whether this change is applicable to the local reporting.
   * @param modify_log Indicates whether this change is applicable to the log reporting.
   * @param modify_file Indicates whether this change is applicable to the file reporting.
   */
  extern virtual function void set_trace_display_depth(
    svt_spi_txrx_monitor mon,
    int trace_display_depth,
    bit modify_system, bit modify_local, bit modify_log, bit modify_file);

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QojOlYcGnjkiFW7KqPuPPgroXX48JRz3xqlMzljpG86gdyX5HMUoXh/qRfpoVsvV
cbU2PCQkABUieFc4Xvy2rpOqYu755xLw7szTvtzYBrnrOU5k9nkDC6NiBQhzaIvg
oxr7Os2hLeKelw1W9cAn9pT9LQJqhPspKLp2ZfIRqvN1lpsn6t+FoA==
//pragma protect end_key_block
//pragma protect digest_block
xww88zLRNESAy9MKW6pERJbALwg=
//pragma protect end_digest_block
//pragma protect data_block
M8Gbb7REhvm1v6TwubNTI35VH5X9jnZH+yG+YfslmJmDmGmft/Lg1PJGOxWSYZ/2
STUnTcLUxez97b/VCxWfdgFsOfB749yP/a3zP3ItvetFRukQrMv267UGocelGzYO
+iDjXgiFywlMgwNnAUipy8NKZlsAjA22Zf2BdfFs6sOSoucTPmNWjync3G02E4lz
SbVFVBOWKmDMzLvfeZchE34u/7hq6ALhtgedbtpW8B5JdAAuMYH5a77gDfz7ooKc
yXvrbt9S65wtzqG3NYOMRoJRpOOANVTXXip/4T1M9XLKmkttTHACRzyWXXwlz+4M
DP5jj1MVYJwv4CXoVQFGbob8Kf8dauLX7JrdjJ4ti3BGhGETuBp8/nbUvZYotVvq
qNTMscADpnZp1Qi7YMq2wRLd+WExH+nZ8OJA8eXb7SrqvJmOuYdAP1JRAp6iwv3l
KenZPo/aOPMcAiCyD39EgYcrwSC0UYT91ftHvlI83OiTxbXbqIcIvrXY3UwEhfVE
ED5czRx75LyqLSN2JLtP2jGbMm/70SZUFcdgwM3aOuxsXnTkD93x8cq4UPSCEtjk
4Wz7611fIoT9Yb33/wBO6QJ8R7Z+95bNw9SUVQpm+FKWvXhl3sWm/iocxXiRmWTv
hODrH9FjFc2pQGTsXDNwfjyu1y8YB7rHexTQCOjZnBXaX/sNvRL6vWsvicZk1rsb
Wl/XEDPQbnAA+6NOwMOKGrsPPSVkQFDbBwT4II03KfDCrNJtn7VZep12GOza7T8j
pHVnuerbu2KemaSBggPPUun1ccL89eLD6QT1RHlibTUvQqwaNkFZJiB0cNBQ9GiD
brJr8UQQlrCWtUpR6enIPXv32MbUW4s35pf4Y2rpHP0MQVXcCzAN3vskhZA67Mva
ZjfgSY5S7EcSEJTbXgDPdwXxeHkPcmif5U0E/VYKSVrC50aRn2TFsCsRNsSm16n5
3mQpZp6RLvR0ExEBU9YgEwCjG9ZMsaBMOeBxsHAPC3y4EKMEXkr8XMyrlyPj1wjc
JBdrFT0t7+GZOKGWmnzN2OLNc6+9Nvxb4+Btn7xTcYGxQrt7QvlXPZmGoVuoDcmF
Im44UWUUFlbYL0UwwwEqcjBqyAgf7SY/DhG2odVCPfUL7QlnlLYa6nXUvU+YsoJK
R9CydeFjufVgjRL2Vnu8eUIW4FZ9N469d92ly/Bq5wA9upx0+UMaKSsXXA0Xw+d9
DSt6kU6BgzXn11bn+y3OGlmYBcSGKLA0u7h+Q4ikXoO/E9+Qv4QcbSxbXxEizqy0
J69b1EytslSjpb8SHFHrxXGK2BscrwHm8bANfb4w2aHkE4KiFGfPlap+tIpxF+rP
xv3QUSmE+q2vdy77H16s1ldFOxjzS8eXTXdjM+M07FLY/MVqnwP1wFhrwtvo1uDE
v9cXMvMjPG+yjar/r/rQ2a909yST7XBu+CQdBUR28LlVpT+7MQCH21FawAVPQG3k
x2p20rL5/j12H0RYoadfjUVR9I5iuNbZz+OY1dQ9h9qXLjERd3OCAByw1LdJQXjb

//pragma protect end_data_block
//pragma protect digest_block
9fX9AgSvLwm0q3BNGfEO6ikTUts=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
PZNtJJmeR4wdbHieue3BPR4jE5uS2OK1Sf86Lxnt9aoT9wmzspSK6ZWyUjR1mGqP
L17JYdlt8yjB7IxIvDElNx/fdrTbwW67c8pot4s5tTV08i5WL2eRtzy9eJJ5egjb
JUC+yFZ1qMCvUIWNAxLWfg5zgI45PFW4WoA6wGGI10IiCb3Rzzs+fg==
//pragma protect end_key_block
//pragma protect digest_block
NwxmNoCWrYWq16JqBo3ch8GTVWc=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
qKLqa217HwUTrsSIEMeeveVIiXE=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
