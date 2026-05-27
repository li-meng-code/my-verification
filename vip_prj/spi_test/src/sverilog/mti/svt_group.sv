//=======================================================================
// COPYRIGHT (C) 2011-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_GROUP_SV
`define GUARD_SVT_GROUP_SV

// Only compile the svt_group if VMM 1.2 features are enabled
`ifndef SVT_PRE_VMM_12

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DlGKA4JNp29c4aUCw/hkWcEdsUlm/GMdmvhyPVcUTbnHr7W35I+FtMMDuB1WKZwd
WVyPreBgTyOzhNM7ot+XiTnPsVrB6O/8xm+V5F6i7nh4/cCWTGBEUDDaizpBRf7n
GX9OQswEvQWoS+qxyBLB/Hk010ODtMRzTs1zlr4l2T4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 242       )
WwdaOf1ecm45Gy3y905PR7kOB1q1qyvMgBRGA1xkyQzGH/8I0Wmj2P/2uOfKVx1Z
LRfulBZPqPlFe4ENgcTxo0Npu5HVHq/1ROWMQf/TiotkekaYLxuXtFthoqJVdDfp
Dps6L2aePJ3QvqQfS//gs2VU+4rne5zYlmSNK2iW06GGFkDKD4lLnZlT1/um6e1B
JFWNS8ErXXb9m0BSIo6xCZ8nHTSRq64VJaXLjQbngsZe5wEvH8txyyNDexgZbmIO
Jfku3ov8oEPyv0r8ZTKz822cLY+G0ny0MUTyyNJwLd2M++yAEkMjJ+LZgrnhsibe
ZInOYouMEU3hAiuM+YISnw==
`pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT groups which
 * are based on vmm_group.
 */
virtual class svt_group extends vmm_group;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * Shared log instance used for internally generated data objects.
   */
  vmm_log data_log;

  /**
   * DUT Error Check infrastructure object <b>shared</b> by the group transactors.
   */
  svt_err_check err_check = null;

  /**
   * Determines if a transaction summary should be generated in the report_ph() task.
   */
  int intermediate_report = 1;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nyPr4M07lkQUkqDT4IecMgvnNNql9K1sgvXZOqTaj9IxuBzFrF5d8C/G5gavCB5d
1W/TN0EPGMZaWIR6ied2yCYXD28P70NBqtw6ipp0fsYhhA3r3VHtN/jQKMii+3G1
2/eY7frRtqCfJrP2Wm9+CornWZNHnDa2sWRdblTKKD4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1392      )
8GhfQ6YR/CuenBDwTtesFs+ERXL2ljBPRw5i7Z200jvXIgQoY5DDVw+4DtCBqfPY
+nvVdKdMuoJkGu/zUYTPUm5ioOhRkcJVBTjMYecjYI0kuzUmsxfNuskVnkr8vmQv
1tpITenJ0QaJKjF7arFuGm4xsshlaQhjShZ7jAjsTLVhk3KYBF7ijudQit1WTCXK
njgUWkADGbJUiDTihB43DkzNeNFXgE1xHhLNQEFF/wdikSvcjX1FFy05yTEdhxfw
6W1TbpKa69EM8S+lXm+rvYN2WCCIksgTYrLEpc9aYNOiaOUwQOIWE/eLVw743COg
bjf7Qo7zM4ediCHNJ3JO1qTmQS5RCmQSgx+wvR8d2DtO1ELi74hK0RkE9ZpbzLt4
YgXbCyO/6XPuGnSFmOW+9sGBmrUHIpeJez5rGLKp2XqoOPY14yoWPonX4NolM25F
DxRTZkMy5bjqHnJ/4ZaStYdpZbH0mcgGFyPcA9ModK/XYY67vWuPCMXcIg6PtC7h
qP3BwPA0IPsnFSxXghYJYzQZoDwYoDyFR1lcMxU+PR0TUTyIoK3pmwANFUxbce7n
+i3PBGwhpc+FRWTULMPYCFRi4i2T2guICydwZFIz+ZXC7xeoL6Aa+G0h9a44E9WZ
X2Y8JhT7h7+9tPuD8wJjeTUmhr2xOA5ilAF+qqIETUJ1+wJ9ySGb31QPbXzlTazq
BXKpgwsvTwQdTM0sDm+DS7VTilIZpZZh4IvDE6mP3U0h2QQYdVpsMQ001iOaVgSi
ZP60TmP5Va04V075WjEJEa4JtH9QRD7ZQhgFlrUP/akBCMsV7bf3qAVTqKSWGQOi
Ng2vQoQsBxJHb1t5vzS2MVQNvnt0lh35XUQ7uWJnhXXHZTiiyW5ANXHQsi97Ppkq
ZLsa1hH9aKqw+TQ1CaR1iZQ2SlaQySeNE9+J4mLV8OxGhzzVRXjYpFB1TtrbywZx
0CRXlpvxM3uiiaS7JRy+3LC7uiBh93RYUeznelHBQltMgG4KkBGbvDGBRvhJHhDw
wZhcGkoZKAZlrK/d7RdcMJixmsH94ycY6ORZdyQqed9O0ADke1QXKn+Api8vmkdt
cP3qsJrUBd9tyOEgxZJGZqoj+EQRPNEERrHDI2cVWxsFPHrfjp8Ul7V4yRcqI5HJ
IN+RpHS7KJWqGp6AhYwWE7kVHx0r1dLkBe4kNNdZdOJoqDdgaLy/wwYGm/VCj/Zh
dNVdqyjQezlrxZjZVum3qZRrcoL1D1L3BshqpnsooUXgsVe73q8c0dnfR345wj9L
JVmBNSeq0P8b4E+fghck5vYGmcywOUszF0sn9kgiHKpPPMZyuV5gyMen76y+vX1m
4CXbdn1Vzo31/rHDcJyinZkweZFXYzs9ITuK6A47wIrHDdKJ8hAThynwD815eLBK
B2DsexN4tL0VChhClYZ6BQWgYjNSTS6k6uX2ZORNcbeV7dbLEOZnUGR7OxEtSiJs
n4nUXA7y6Fh9RbCtTQBq3xsCkzr8PHJC3cCpdTkt3Cch9WE/3jHnvbiZgFYPVGYy
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new group instance, passing the appropriate argument
   * values to the vmm_group parent class.
   *
   * @param suite_name Identifies the product suite to which the group object belongs.
   *
   * @param name Name assigned to this group.
   *
   * @param inst Name assigned to this group instance.
   *
   * @param parent Parent class of this group.
   */
  extern function new(string suite_name,
                      string name = "", 
                      string inst = "",
                      vmm_object parent = null);

  // ---------------------------------------------------------------------------
  /** Returns the name associated with this group. */
  extern virtual function string get_name();

  // ---------------------------------------------------------------------------
  /** Returns the instance name associated with this group. */
  extern virtual function string get_instance();

  // ---------------------------------------------------------------------------
  /**
   * Sets the instance name associated with this group.
   *
   * @param inst The new instance name to be associated with this group.
   */
  extern virtual function void set_instance(string inst);

`ifdef SVT_VMM_TECHNOLOGY
`ifndef SVT_PRE_VMM_12
  // ---------------------------------------------------------------------------
  /**
   * Sets the parent object for this group.
   *
   * @param parent The new parent for the group.
   */
  extern virtual function void set_parent_object(vmm_object parent);
`endif
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
az4SwKfx+7YhU7b+HFIDPbivEC3MDb0jmYjD459C0YQeZMYu1ogr/NMFckaSBJq5
u0l8g/p2gRtfAoODwu9GF9j25TPAWKUe6tj/xloD//I2dN2ky5CYf+CPkEqVq3Hp
Q+L5SfHojqAA6VlyjB55S3kuVd7UOL6t5TO0nT3DCZs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1795      )
UyvMWOV77h7Jji1j63RC4xwBDyC/zLZ20XGlJTk6RZQcS7K0xgCmgQcWUOpM2Yhf
+a+0PQZ6lWBByB7kSw6zuaKNXNvconZ6FxBUPQu5wK3dkU+Fh7itJ+nLNkVGmi+u
j+cqo4l7oVmpVM2ja5ywlgAnZrvFdH37eaPMaWXYURa0PEvzxZ2pz7MteS5PpKhC
Dhn65qsHAx/CdyXBHwWkZQr2ckt9vF4U8crRVgWn5xM+ERZtj57dwa3mDmZqJJe+
zqVW0Uwb1eKxNaclvTWT4p/mJN29cf6xISyMgFxPJTi5wVQwj5ltrGN8Mx4wfA9W
6EEsOyWrNFRQoWVItJzKEqeBYo2rNb3xSBYyH39bQ0sNFgQVKH0ZVjx/aBdajWHb
1d9tTSgzNhsGsCRwanPPkJ1g9UAhwIkeYqYRGTklZlJoB1wmEzKr3fnNtpNsQ85j
wfQE5Z1D3gqU4GuYXqI43mxi2/1JIoWp0AdMoTZcL/Ai4dQT2mkCSvg8AomcV85J
T5g3GhFre1kNBqQuZ7yBZLpbJFg0p4JfaintgaMkSvw=
`pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QyVMt6gKfaOGpzvHOYCx4dVhcZwUPJ9NGfAah31pTFPZkO3QcrbMFUHPt+J8BUmL
D3Al9Bh6MXZ1oHxwrdOqZDdsBQeyKszYusWnHOpZzL424GVJ4uGWmkVCfbNnfYqJ
GwQxCt5H5cigDAwOLfmm5TSoNVKjHS8iRvf7xw63iGE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2098      )
dukCMBYPjQ82VljauoGWgQkd3KBr7+ecPfkdu1QZHeLQ4WMDE2I8MtcAfzTui1xR
7Fx1YDEbRQ/F470SQcbTna5TMBpMU7nFkYQeUs9/MEf1WY+5IFAP5JgwgpxU49bf
k7Hpd4D4E6kU/IA9nsWXpcCt+gaQeuzB9fBe5K6nszVZK3oJW0tf61ZkxtdaZwgr
duOUL6UlfTAm/n6RrT8ncRJs+x0fu6FyyFVgpf+pqZ+X2OZwZGtcdin8P/Rhyauj
1eQ48T3W2QheV1c6bQmVqQTBnQV6piPwua/A+a5/Er2hwd7+4yYaq7qhaWGesXmT
Pjzgk6Hv8YGw5OaKq0ifGY2965x/lVx1pt6xBOxa9+sipxBF/rYGj4s5BNEcR/qx
dYqqgsllMfSkb9XBYiUsOg==
`pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the group configuration with data from the supplied object.
   * This method always results in a call to reconfigure() for the transactors.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the group's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_group_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the group. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the group. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the group into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_group_cfg;
   * not to be called directly.
   */
  virtual protected function void get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the group into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_group_cfg;
   * not to be called directly.
   */
  virtual protected function void get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the group. Extended classes implementing specific groups
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Used to identify whether the group has been started. Based on whether the
   * transactors in the group have been started.
   *
   * @return 1 indicates that the group has been started, 0 indicates it has not.
   */
  virtual function bit get_is_started();
    get_is_started = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * This is not part of the defined VMM GROUP run-flow; this method is added to
   * support a reset in the run-flow so the group can support test loops.  It resets
   * the objects contained in the group. It also clears out transaction
   * summaries and drives signals to hi-Z. If this is a HARD reset this method
   * can also result in the destruction of all of the transactors and channels
   * managed by the group. This is basically used to destroy the group and
   * start fresh in subsequent test loops.
   */
  extern virtual task reset(vmm_env::restart_e kind = vmm_env::FIRM);

  // ---------------------------------------------------------------------------
  /**
   * This is not part of the defined VMM GROUP run-flow; this method is added to
   * destroy the GROUP contents so that it can operate in a test loop.  The main
   * action is to kill the contained component and scenario generator transactors.
   */
  extern virtual function void kill();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void gen_config_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Enable automated debug
   */
  extern virtual function void build_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Route transcripts to file and print the header for automated debug
   */
  extern virtual function void configure_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void connect_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void configure_test_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void start_of_sim_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task disabled_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task reset_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task training_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task config_dut_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task start_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void start_of_test_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task run_ph();

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task shutdown_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task cleanup_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: If final report (i.e., #intermediate_report = 0) this method calls
   * report_ph() on the #check object.
   */
  extern virtual function void report_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void final_ph();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AbnCNZxMFPfZaVR4q07sERe6m5n3Tkta1XO/D8t2Ng9A5YIBvGsi08huUA4Yhzj1
HZp6zqybEbUBOsTJBarMpelfjrmo0SILsZQm+Iebapp09UqAILNZd2yOzi1R4AfA
ot+lfz3R5d+SU15PJgykZgXGR+aV+lWYiwP8cL9xobw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2620      )
XRoh70odZeLvICUfrybXxku7uL4mrQ5/vaNMaa65Tz98NPuTnkWxoFA7maH8dDKs
cKtvRE3300JgJXVFryDmrnbowMqcfcdCju32I1bqNMVLpLJUHOzRuZ4YrJihf4Hu
KOA15LbO5VyjWG2x1bm8SH8QAGHwrBl7FM9ETVEdsbbuqqMSZNyR43U13XKckbFY
iEpI0TqVapvYUCRaOOJOQE5T3hQ+4xcdVE/B8qFxHBbB0D2kgFEG987E1uhFMfNc
Bgtg8f6hJsW9AydZHUPnza8SDpI/qEWPvpbJWQs0gtYmfMVfL3/O2z17irW8OTAa
PPsCG25wzu2UeAWjU9YlnynQMsiSgFICmvEE+0PBF8i+f3RkV086f/7owr67GWcS
l1jiynzWN/LM/yHs4esSqomj9iKRI2qIs5YC10zdANHkREo6scwc3qXkZVXq/lGd
Ah/vgtXUp1DeaupPK3jj93dQpmOkU2Nntw3TdppuBxlV1ViK2q7l0EvVazl48Zsd
UMhEyFKd9zrT6z6ATkUdDe5iwaqmXTyyyXiMD+IASzWTxQfUFAq+ywMjTT2jGxOO
27ju/LsoNCH3D8ThBmyAldnM/foFFXa47X7dosW0x1BtTg8Lx/kyYxtw8AyPYM9h
3ANCx3iFZPYySNXXl/xSZoYKC4Z7lhhSFHPqR7k8BVq0cgfVFGIogwRZ2qJm9WvZ
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * If this component is enabled for debug then this method will record the 
   * supplied timeunit and enable the configuration properties that correspond
   * to debug features.
   * 
   * @param pkg_prefix String prepended to the methodology extension
   * @param timeunit_str String identifying the timeunit for the supplied package
   * @param cfg Configuration object to enable debug features on
   * @param save_cfg Configuration that is to be saved. If 'null', then 'cfg' is saved.
   */
  extern protected function void enable_debug_opts(string pkg_prefix, string timeunit_str, svt_configuration cfg, svt_configuration save_cfg = null);

  //----------------------------------------------------------------------------
  /**
   * Function looks up whether debug is enabled for this component. This mainly acts
   * as a front for svt_debug_opts, caching and reusing the information after the first
   * lookup.
   */
  extern virtual function bit get_is_debug_enabled();

  //----------------------------------------------------------------------------
  /**
   * Function to get the configuration that should be stored for this component
   * when debug_opts have been enabled.
   *
   * @param cfg The configuration that has been supplied to reconfigure.
   * @return The configuration that is to be stored.
   */
  extern virtual function svt_configuration get_debug_opts_cfg(svt_configuration cfg);

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dLtIdeFHuPMRQOTXpClmJWRYS5V9H5hOZ7Q/8/u9dIASxFUHZlvVJzs0QWCpG96H
G3UUZnwnVzFmS6nQ1McWhB1V7cT5f7cuN9qfDXmzqlxxHDKGz5qUqnRc0nZoPGXn
h/w2EidkewpFmcCyQd+5Mqvq7X7cPkuhhjZp71/pg+k=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3937      )
eb9VEDqGe1R/Nh7PFDSKXFJI0fPfoqCZ4G05+KRrofVn0GIBKjQN4aPB8TzEECzA
OTtyCPQ51TcwPY+ReuQUS0sqDUDzyszUrbYKQjagi1avMVa98Hmjmnaze3BmBHkU
jPNwfFyyQp9KXZKjjVoXJt1UNYx+oJeGMbJ0iL++hPesg/abtpaSH/nzvlbUyvIM
ugiV0FS5FV8TGryf1gdx0ld2oUN7RZ7o25vvSigHSNTwAcRtqSYD9nR6KsMpOzEJ
EhMV9ypZF5F4fbidD9r8FOlmnpsNanZTPXufo09NGQaWtiH5UNyp/0VJTHzr/rt1
yItWVMPogBZz9S+7WFAkC9n1+S9zHl++AZYWLuvHJLwdnVcTCOfSdWSNBc+aWzYK
w2cgQBqmMUu7F2g5tSiI5XN/yXy2IjsfPyFyymWIHrNfN+Pol/B9s89KT8Y+rYYn
FaCt3EiXwPCdGBmUaC08CPW11FjZHql5NfhqC89GS3jKcxvVU8YHBnQSWATNfrC8
7yCd30RED3k5kGq3pW5NBHzbhuJOO6y4PZia20D+emHC0MBPkP4a5hfmQ9imbdh2
II1N24MsgTHCVwy3r2J+BSRx3kSKLk9/qvhJslPGysnM6Henr+Z7Y+ip7nUqhYH1
zn6GPoWlqY/tXBUV2iNV/vKmkf65ClYA9FB/smZeeELLauHcFhaO7rsqyGEsnEw3
kouRF1bESfu7pai/gBWPzRoXbirZDF9wGn2e5gED+/RAbu2PayxG3Q1JrOv/POpA
GqV3o/kWuUlhQTj9n41DfUaHYsbYkDz+pZewgxbCnHveaR5OUIv3aLRoiA1EMWIQ
g/UH2nPR7FWnC552jdONCMGRBXFQaogiwiV0QO1N6aDKxOlgukMdlo+qFjZctK1V
J/cnua1DNaoZYmtgyDjABRep+KRnVyTAigz3MZaMS9K10dFKJZXMv6miLh5xvnUV
1qU8kw0gSTSj+CDFhBC1CbWh0R9tII5uKmRCDyUiN4/jXaXirCsuGoOYXeMgyxrv
ulSCG+Ebeg5apeWkj3D5mtTU5bxWToItP8PyX67okIWxicYd9IO8qMdOYXG8z33W
EMzxYmtZrhaoXGXETbd+ipPS4GLNV7ZTZGNsEpow+hsRc49EvzNAYmCSmKxwb7IN
xQf7Pp100xKwPi1P54rYtxd0M90194EMYcLWEGGMbx+y5Oj1J55Sc8KAhBpbukW/
ReKjR8h5VeIwp3NUZqy9Vhc5rCxQhTJwFRLnsmrv78AqKlWVKdZTGRym6hvIbgjn
WHfllCBIm21OMiFGZ5kVxKjOrVl6OX5l01BWNWkLTpjvrjZdWiIgbNL4kX7gsYr0
FLLn8RDW/nEIWuSO/ZFxPjzGMA3Qn4K3IvPlPfOvdbqlzlEsCVyv8wMFN17SKuAx
mi1wjpxAUPb84OeVm6L7SzTD/MSlPx1nHEQum5R1u59ftIz8PC+cib4xCE+rW7On
Bbo/MsWvSbGh/5ybpt84h1fFcrrjq3N/coaK5KkzyjAfgnTX1+Osmew2llUMApjI
GPMSJpkp3ubJJgE4PR7ZVkEQsMYjldnBeZQjtyS8fGE+Q4OU1kphilp/fvM12OyJ
8QbnPJVemb5dTSMwn4E3iO0Z0gSNUloYBxDsTs4ht/Z+VSiPC5tDKl8sn4UxWh0h
SNolxf2dMJPo5lvfERfFdn2tlRMimLVN3iHxg5fO18u3RhcYTm9KM90dPmU77Gvj
CozSWWklsFxwGzMYm8OlWpfRQXz1qSHKrtQ2Yfl+XYM=
`pragma protect end_protected

//------------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IUSB1OzqfHlyvARBwmjZuvCoXwoB07M0FM53Rgyk6JfCMf9IOYmbU5Xqxv8Ncblg
wLAcUE57i80ElpTOj78ul8S7TsNsNv6DT486KVEXIquRVFXlOZzR1mqdAm7Qkd9M
H/QDKOxM9uQxuOzUrFuGx0bQHlVGyWeMLuMRlsQtEfQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17080     )
kuWSgJHMXJOzThnDmhWgDzZkjj+B9aGHWO5UFYINc+Is2F696LJvouUiD9B0ZG8m
3NHNo0WihwBlT4uLjgRelywYMjz9XGcS2LNEGRgGobU6Pji4xiwHEZ8MtxYPElEE
RoxqPQnkRn/09c96gXubVjq2LJ3J9P1J6kNoBb1irOmGhOyn17hReIvICrDrINuN
wyiEY5cftcJCnVqysKbets3axXzt94GPfcRsQWZrHIqgGEnP3AO4/fIqbSZZ0pdF
shGQkhXd9miIr2muX37GAS3V4zQrPJG6eOs/FGfPuukjjy7I4zmDRTt8+pvMFcJZ
65D3n55Ov4Tfig0WntwQ++K6uRRbGIgUdYeHMNem+TsOuy26xLc8PVJ96NuKeqyD
Vkmr84FS9/r6nDZrVhOPo67jRlATz/AqeHLaCGgb0eAGn/68NcxekKVwW9kukKUm
j+krRa3zbaYbSwevNXEE3epLVWtkYZGFZMRB1hFLoV9zEvdT0RLfvLUVm6Xw0yhK
+f7E2n9L+XNX2x+H9OciD976jYqQsB8CPLd9askl7KH/jqz11jo85B/DMhgrZtrH
E0HaSDAXBDtWCUTd8Mfm7+BVsAyrSDsCCoqTjtqnmqRXki7er37CHQ/5uVrJxZ0X
pCvUgKnFguB+W2IUA9QjRpg6KY4zVXJerr+vLAcpOJmDMYepjEQj05HI9AIyfuuk
cDicgCqR4zVNRooQj+aQ6aGul6hsror9p0qJihH5br6i5PfkcVuhsbc+gXAIjzBE
/fI3f0EyuF9wHhorkp9rF9wCpdjJF8jALC29v9XRqxMg369pcwcDEX9O1hgRRlUA
bRgA7OY5l2r1TZ3RSkJ34wUySDhbIUjCeuXkjJ31GgjM8kLdHlYKfm7K3p3120Qs
mEqxfsBR87bchnIesDk7szzx4bKDWVmu3rvOEw1/7h9wESQb16n2o0ataWCWcZVF
GRXI2ya8ENQdqYH2u3KUi8fTFonl4uQlqZeGPaZJJyP2Z4lAvuo/37/OyQ9XRRlo
JnJiuFNgdBY8zNtSKUOVA/GWm7vlHBsja8726Difsg2+WawnqT9S40mM1CgFYKuf
fcjXdkCvxgT3dTrF6OWP1G8HAIrUkLtrXzOqkXWDUCq8LHFNp8WPEINHnQzZEQIj
EdpD461s4fV8iUlQEtEPMCRwz6pZgFt8GpNFbNGedz0Kye//0Lzmt2PjmVmffc8y
7jjMWP5Uqfg7FFiyDgEW1rlT9geYYvUMbAxWlVFbYARdLXTJ2iXSpcpwYn+QU1/2
ZV6AGC7QGxJ9DqO3yrb2qOwZxGS56Ux5k1y68JW9kFTlO/k7sMdSu1c8s41V2wbP
4fEq9KC9OYhSygo92j5WQDtR9Sb9OVrMNhFXFf1zNBInitjZHk+gpFrwoSaBP6Dg
fzuxb+Ajcgvk564xHHrw/uAOfDM+osjQb55AVdzM+5Y9x8ojwSO9SZaa/ciR20Gf
n/xOgeoiMaY6f9EHJVwTcJNmXxoW1iXaYXZxtOkE6q20tGVA64ZjWyh/FFNzl5PZ
c46JtSBXPNIEDcoqglYV/tpxPnRJzvcUEGHKVZcG8OjFNsTRVPBPSUadBFI1UAao
f7hEKmPe14iv4REnjdCVxh6SbmOahCYBBQea7UaLCbViEHn0AHEO+YSDXSRwtzV6
PrERtxgdGixhlQ60KdQZ5sEQON69GgcuqvBxI3dgf2ZGiFssp0A6jTdCA04d9r7v
ltpIgOa462cWjTT72pDrF9vKkWdJyXJBPZ/M2eRtAkQXsS9Rk9/9VCv9tq66DE8U
wu7ebn02e8MS8GQc60TbigAX0ePRi2YAwDbej5lLJhm+2fPJAAcQcZRD1qNOpEex
lLe3gkdLOAsJXcrqtj616AxVpOUawx5FSvvaoRF4UknheCYf34YlVJkFctq1DmCL
/oMhM+/O8g2EVxTaFHxnM2oOCKE1SJ6tCdyA7RJbIHMr/xKfypwDXhs8CtMBLsqo
sEladCE06ReE7NT/B6qNvxsmWL88U08eNGSqnCTL1aZB8H+lS43OchLAZMfKJwQe
zEwOxsjpwoMBBklNR8y5Aze+aALuL75xpt0M17VzPIPMW7RyLsXZl/avHbypqddq
/XC5L4XXVmQyjATU87xPlweZLWUAVGIPHJOQgZpLrS9jzNevUIxBnX+lF1da9uJr
KEtrMX436JXYYmy0teyb89KuyJoJRcjFZQ6zfMZzZFGBHKFctIwFc6nQ7hUHtim6
9kAGYoRYvleQJI7bB+od5jV58aeMf8np/wbRO3tyo4DMcoldVt0GdDikTl60AbHp
TSkiJ526bR+exnH44Ex2YNP9y7cOazcluXdQBqKrOGVXSEWtmvX0DBaL4PylBuT2
o0Ef1cA4YE+oqzFb+BXvE1HQygyCk79dR8AULZkeoRKW/POJBPtK9pQaGXRfU/7K
4EARgLszHq8jimhJfA1oviL5S+zEBZJwZuMKtP7Ao0OsXrozGWJNMYEbq1O+t79M
mmqI70pwUUFdjPFhNLclf4LEypmAlYgOcggNu6ngoObfhJPnr7q077DZvXmhVLad
zsLFBitpMCkcqWuflTVRbrVhTAHxwqWgUOF/bNkPzPNmtlNfa7ayihtjwX48drR1
zKixbKKARsP6KsxlAVFohFAivDKVuIzF90Rt0SHWCZ9whJyJwKsk8eRksAqms6HQ
XD3goTrOCjzoM2JoUknqtOR9CmeVpa5w7B1W1qOhqFEt7qWdiUSogysRwzbcvL+8
Zo1t2XCy5OiQ48nEBGZAQ0ZhNvch6F8DwVFs1zS8sGCrq9ZxNzbUVf+B6imPX7K1
ICqo4dpMplUO5o+8v+furuGIVs2h/RIO+Rs8YNTpcrvqNaTeud9KoVeNckmYJvhb
DSq9C4cdE40U/94lxnd1C8rJxQIA6U0ZErl3bFWM9AIRnQmunON9PqMBrZFHv9LO
1h4meuD91/TmjnV9qFcl4qItPeRgiVDLbTo4SgqKuIOZL+f3voy35DePVVw/4Evv
esbEwSrNIhdJvbMKrDjySZXoK7kNREbRMEkXNlcovrwhssw0ZoCJt112WYBg8BRb
BA0ahnDDpN0fQLjUdY69KaJXeQQ1y5spbHz372zS7TaTkXkCesgM+cO6bfB6pt80
9o9bNNzI7LhJkh0m6yLuIS5aomjo9TO/A/6JuBsjfeEYmpYCFvjQvK2H3Hivi8UB
v7fv3Jezc2VKSYfT+RlEwsf7lyUE2W0Q/JWIBTje0KQqGvxwDi+SvEPL2tdzSXap
JjU5Jb/RUE5SeSt0gDiZT4dU+ESK4VtSEw28gfogCHu2JqD8Gc9zVfSaat1Vd/rO
vQpVRgCiiE1w0P56RY2dy81zJN6qKu6O8mr0OeHnmq0T13fIe93IbfJeML+phsB3
vg2Cng59f1zv2QUvWUuJhGWzKi6HYmLMsz7tlgO3tFuMXPR/2zpcnTbd9fwZlTC4
jvu2Jqg90y0wgA3dIFQe9d7rd6qMFSuYVNEQXD9NMjzk+Y6vIOeehAOTUnJm14RY
3PONbfwQXy8cL8TVaRI9zoHIvl+uW8TafsEWUQYTvDzs1DMLtA7szTcqHd/KAvYW
8Y5qCF2XP2e6pDrIQ1ZgIEZ5b2D/C7biQv8vhPGpQ4jbzsU6je4FPfvGowDyukCJ
F5gSQVS0rCKKUCBLDowaon8+nSrzD7ItMJIfllIvgmGCdXUno9QLK9GbbQcw+hvL
x9iA4PDnrY2Lyj+aT33fjQmkMdPhIzItRxLjjvN6dDQat23zgwtjlED9u0gnUuQJ
0R0LlPNTouf0iRhAdo4sGw6ev7b02xam+Nw4ayqtioMeOk+tEOQjIP8JtrJIH2nW
sDGYPx5MmdXhYixKFbVPM+NvCjLSXBbFU4vP8JpgoWI5US1dUGL1NqZ9Qv+dlDM/
4dKZJeC5d+2Ibjhb8CqrDCDByi+kzChwOdzGMRc7xxSq+RQJQOn020eggIk6wG2B
RT41T/od4tZlxGBYru7B0z2x9nz9bS5sTNTIo8FZ/8hH9uVYOaJSLKWC2r5/f4T4
oZVhvNuA2shpaVTzbjJJ55if8xGinh3elu1QOkxWtLwuBGkMyAvCcCQ2bNtbWfwz
WlIzVosluKfjfbpVhmkhr8etPhQBcmsySol7Obwq9kAm7Tfk1ESyLl+v92wQsgS/
MEDTyXkqdQ7FpOT1oaZJE8Rj2TuXqgrIY6y5n3+vcaiFFkNlOLAdVey4oKiLXOpa
+dP/6uTfdxERbPMYapau23XDDjbbUvtkEVpuULqm1XfOimmJHulF0P5fjItZAqrZ
s+5jsUl8HjOfklmqwoZl0t6cMMSs+5Bcf9oCS4HcjGohNC8qTjhjXoZhV0ZDWRZE
Pd9eHX99bgCIYq3ND/mzs77ddtJZhlQCuODSKHWnC8LbgaiQpimyPb1xCn+AIRsY
JqoNFpIP9JvgXMduI3LQ01SlWWQVAiCkjeq+7K+H3baLCCjw7HCet0jAXg69TKeV
+b8XV1+WTTxXp849apUR5YTnbAJA5CH0WmddfrMWSwIcDoFzWw4rhLjuLVKDHKmZ
E4dcrxZ/8GwUvpM2E5R5uwd1ZaqpeKlYET7enNoGcLWXSMCZDDseJBUr1VVp/bSU
Jxuh2A8olr+zzyfzWvif+d1+gDjpPjjL9N+xl71Q/NxDpilT7rBkU9EIutewNaeJ
oW5e/Wlao/+ed9xtpvFmhj+e5o59hbP8xAc/AjWno2y94C+He/aQ4zwHvK7Z8Hd6
QvAAYGcCAW3NF+QNjCOAcu0oMitliXzQLDQdggM7Uiht6tVBQloU2UbHtr0Ir9bH
fsxRM3+4IN4+7VIcio6W2CUxfX7lE4pLn6lyFNbtqe/+780ivxbMEE1a+4WCr5qk
kvR7XQ8DqL75LaTfXLfqAto+tfDDLOqlKcwB47xZG+3pSX9+UXWB+2rQ0oCNZA+J
CdQzcT5BLiA+XHRQUHbg+8ySVWx5KZG9Ib5H+W5nBG1sGWScbSpEfHXUzNxd2tZ6
p8baRr4odYjxuVrRZhYrqGIJNqxpodt2vpGRL+CeyWKIQ0IvFMdfmY6UEY2pAwsK
O6N1DC1IltQzNdB3E6R5WLXTZPOBDjEwqXHbRD3Mh1ero4SDbmDR0HHJW92krjDl
16mcZet6chvNzyEoIBfVgPsaIvUatPNCdtfjzx6cuAwck2I5Pbx4tF9TdJJlt29j
2ke+ZbiWETFAnAQc0KiA5Ce7ZLkaX8uKpB/388iNzpID8QZpZWfPcbPZYPJ6r3Gr
MuFkI7aA42YSqFRO3/XAesK1PDUHfY8PyoRLwTtBsGxcNTvX4hDrhZGfXmyPJNq5
FLENtdGsH2uMOHKR6ENIRfI8wSM40tTbjfwmi1+E3bbktYL5qQVqpk8GoxKH8mYI
+I6PhK2M9wGfAeNQ3DVqRfnrZp4cWoz0x8V9Vao5SPxwqTDWLFl+JRXfmHcCTmxf
csfTWJUC1YwP5EDJmVd7cLtXxn90JqSe/wpBerpdzS+0aJcyg8WsMi3exulgSJHq
ebNEyESGPj/XDJ/7FSYKr+VSVmfLik9qgA5x7eq9FjFiRnWpLNxqkvcyIXpnGjJ8
a3YeySuWFpjusTeYhd/lQp0MEztTGnkeaZUCy23pdJL9tOCs7J2nNfctiDxPONBd
nMosttX+nrPIK5N4mKcnwMPvkAFq3SdpOXMSrERlGfcNH1S9N6EoQo/co8o1Njuo
1qyrxptLt6buF5L2pBic+AuaT8Za/dUmtNIFOxd7hpBKYQi1fo7YFWpP8TiUWdXw
X/Yk/9j+3qO/VFDJNQDWhg1i32D6grFvISa0FshKT6hFM7K3QC2ut6cA+6MP3FAK
BEeFyBC81KLT8+R/quxsZjn6G8qkTwWwWhbaCFxu4P4yQnfGpLnhiSjN4lY4KLyb
bYBqGikNqv1zJ2KP5C9gHcYxIsrmgtTrJFXL8Xr/9tFvcj8PZIXwrIPkwE2FKnVa
PRPYOOua8Ie0PD8bLs9Bpoh60pAskO2hKbwyTCP1/a13UoytNI5Es3A3vNo1d/lu
ijh7VxEWuIhvjdsuQuoRJPGfIjM8uuHXZKR/ocFs5peugZG3boAx0itg3FIz7414
JXKyuZwkh146RY3OVfI1J0NNSdrC12krTXkOBpFZ7zo+S/zuLxkccbg/Gj0rvDIb
IJECCWe5aVmGwNxeX5bo92VLsqJqIWlZtimK9almEV7l2/OVCDyAa7c5s60s/6Fc
2/s6UmBbSY0Ypsar6swoeycSV5M5L2Z1UScd20HDgk0UCqdsxGmFyUjmg9gxqDqV
acon1TA7PXa9cji2xtqzOWCbep2hIyMmwGipVAcGI57fsK3H+diIjs41TTc6bkWg
ZMduHJ9OwJrC/KppLDg769380Q2s2H1RiWSq2ZiXHYq5Dc4BNmXwsbsZ2Y0Va4yp
LadLnJBFDnrn+4ZiX5889PYO9XEcCZKBnSr0G0B2lHyk3+yTd4Wi876q+QqNigc3
gVuNR9e7uSqMVXS3rOvxMaz0eEmm2Qd2LPs0ZoRnA0bClczJC0Vw1IeBGsG3C16M
Z9B8IOKbMzz/PoUGLwbx5Q0iyk58vdEtnQH0isrVqTEuweVwVO/SYyNw7apId8Yn
IFnWF0Ixh8PgTuL4GPl7dcHdcLxs00vzlod+A+MkjRv0iXq80Sz0j+C3NZSh6MDH
VMlVS4C8b2IomBqiynJEi3SdBQ6FgVuO4KAR0gl62BkOz4rNgghFOLRpBTSvx5A2
Z5bmDcbIcQjo9dduBqGi59g2FdxbEcxKcz5MrBtKObF5W8zsiCZOtRirn0GLfY+g
U5kYw1EgqMwVK5EV+TdZfVJI7QgVayel40kZaFvzRhZxOHS9VnrM6KLn+dDndp57
o/Q3wlNO5itgzxa/0t23cSpmouAW7ebaua8G9g72P9A+HYmOy1fxn5g7IN4/Okz0
BTaDONpbuuV4ldvKTK9uEqhYh66Z5/TQhiBg1kuqQTWBZD+/oI2S215ytEK8U0FI
SX8468/zWcA/pilgnDa7SUB/ybe5DyFlAW4KI7Pqm3ntT9a3brYZUll5ZepcI91A
wmCuB5apmz9HIFg8xFlkJmO9sz0DEPr2uEcDWyloAWanpZA7neu3nZjhpz4wK/bZ
XW6tX19SNTWH6NdViQMUqCZbm9u9NGbIlFR4oM1u5h7+xGVDJoCrZoFg3ORTfTXD
ceniLrkIQ79CnJUqhwIJYHCg0gr29dG0p34I+lrqYGx8ESywbwsr0X90qS+YUtKU
7K2HR2aBnZOKPHAqPNp5kCZTBAElcllcZIaByjuibNAwKqlmITYeU6e/7nz/LCLP
8xkAQmhO+2HAScEv8xevkhJhdXC1o3/hyKewuotbXt4ZtnS887wbo8NfFDrS/Lbt
nYWgrs/9hhJryzeQ8/bIHkPb7yjRq6bHkaBlRdX9TSkCWH4TWrJqTKyq0tzernA2
6L4PXCeayDnFceRZ6n6VRaLDucnUcUHrh48HU9yCaL/8sa5a7ewRksfxEYzVgA7D
dFdQw+EMbYXTxLwCPPxbt+GBqxMbJtFlnLex17sgo7BbviKuHjuR9Np8HfgrThND
kgxVuNAJ//VVox29/4+0S2264s0pDpprAlCB+K3sYPw8slzgjTKfUouo58VI9hHA
2cMaD4/6xRmVFNROOFkLUT3XBRoGORErfdx6Ipc1IeIbOYDm0aHLUIW4pDljReHb
K9rueKjierbqxQIz2DHte0mEn2WwpkNA4LOtFlgBkSRo0+58Ut49J453gjMJdS19
XLZZu7Nu2JAhq3J+x9GPWKYcTekywawcO0uV1y0oJdHeSG/V9DqnuJqTb2o8HZX/
1oIhDfdtINJiLM/eKkVFpYl2BOCmTPrZybL1KKuDeLQeruoAjPrJvmJMewoACHRB
imc6QopSbuKsyLzCQ7o8L+VYPO7n9WeKKIrjfLGo1+etC1ORSII7YNqYeT6vMtLb
oAkUjolheeDEFa3bMJdBW/08AB/UcCwf44GRcqnv+dyCOKVrwJcqGf0/TjRU9JV4
g8nMnUugkCm1Hel9Ua8GdXen/wHjKXJ+Oyj1sGeKZnSiYtILv2UI8Bqzvlz+3Uwa
GFDyHH4FrAy/3mtVQmN1R1yQBssc9AJSLrxCEWtU0Cpnv2MGaJPnalNw93Kln8i1
lh7SA/om++ML+G3vSONquT/IAeJvZErN96zpxTbZnazm3OBATYN6LxFE+9sqkLrO
r2rJPAAdGYy75fKh/cDP7z58mOuHqIe4kFhN/627zNFsibuglNrs65+lhM3MNc3X
NAvB1R0Q/bqB3rsDMpezElcyQZJ1U0IZxkoXSugO1pSAc+1Wu7TeuEn3nPJh3pBW
mxn8JUPlhWVWtxsykytiBHpQEri+UgqG151mFPyX25dFYm9oVMGROkqVO7YRPzT2
DMOeiPXEFmvSbPx6CKhCcXeeHxoTYSO06pNZV26K997x3eCHvhP5jQPut0uB1ByO
aZzXLhjQeeVkbx7pZZkHsPETJTQwlAMWQ/4pTBjO1CwLXcZeWfXUiBSLmlMhGsZw
YTfN0aplt6lrVOMIJUo04dbB/Q0qdFfV2y7KJEMnDLXSJacfcQ74rcNnT2/Rlqxo
dOEWiTb/EPctA4NbhDT6tbtPJ3q0uSF8V0p9g+fVDSW7yfiLPjJDow0jf3oV0L2P
yi4uxMMO1wYM3/VkRRPOKsU7fRGeHSYCDQU1SRVrDFauCY+HFtcmK8TsXxc/mdp9
3EU550mfZv2o5Q6GzN6fOx4o3rngsoyglbnQ5btDbb5TAvcUYIekr2e5ZGTPKrb3
79kHp9XMj7MJDiIOI1Y6i8APWrAn6J+dnY29BR/lvfFhRThjLpKnZVZ1m8VcezgF
0WthcXRjz3QGJIRG7WmCf1TRappXWm5smHNmCiiO2/mj8hfcnu+IVFAtXUGNKRU1
5wBS7BnKPp76bGoExnW+T88/jRPQg1o+kis+G7Bg3JDT6/Aobx9RRD+zBzpiQWPP
/ZyMPNZ+kl9SRxTwyWwz8FpY6Yu5KVy6FpAtQCu0oo1+9Gjm8Lysq1xEFnmg3Q+i
Lbw3HDm7+zScsc6IC5RqpWcjy2xEE4Vl3tb4uZCZrqxHHbSBlkqN8xrKizrzq0og
ZktXZC2hROlS0aoN/bNqKQ2MMWWYi+FnJZiDtpUqNl1bcTWpC93OpVWzXIOuR3QO
enC1d31WZfhWxFPaGuSX7x6aLYb0TpShGGr9VORyj+JSF8J2Zz890oXbwJYb1rLN
pUt4EAarxUJB1GhexlotRyd0HPm5oa4Jr/6pFNITnOAuQ0JDi4ouw/IKaQOohceI
UdTQ6OW56ZDSYrWFDChxg8qVFs+rEu+6I97ufl11Q8ExLur3w0FJDJLcIodSU8W5
WrrcJXt5OuJ4x1Um2B87ab7Abi46AsWV9fMBHfwqlm9+Z5XOVoUExZH/n3t37M5m
d0Qs45a8ZHYHA7iZl+qQXzXyQkcRV4MkObayo702b1oibPaS68SPhkSj9BvXR+74
w0GoYRj+I2n5dpzLZQ0XlZc5FTuNQkMmtf78XykYDPocDcCoc0WxdCZFcrTwqibO
TUxyxhysWALcrGe/MWkL2MA1sWNieRogrp1RFGm1utpmaUNy8Qrdk+mtoAPSm+/t
xj4cnWENCHN/S1v+28q227JIbDc4VYL1X1vLYa4yE/qXCXa8tjW1pfE4Jr3yapy+
hH+QtZUh8G+jHTnlXhVEkMQWhSS54a+ASQcvID61CZ2mFeD4rwOEWOOfJbfWAkbG
G4pgadngrAF4kDPjHFZuwFVZX5BZXvDnVERg+BnTgdhEbKvoUbBKg13BnjnUb4AJ
0n+ARRqwV70eCkJQ2Um2OpEavh7BzZh+BJgM5OxsFGNAeiFbda3VRsykCkMY0uOP
OR8rzr9ujwIt9NsgBGSPkBG7EBt/FrNHT1OUadc1w0+eSjvuGw55iV6bMBBRlqUl
HvX0/manc9sZ5q0zQNRTW3QJnTs5DOsb6OZdG/IXoqwbC4ipooM3CKaOyZHsbGbE
dM07DhZP2BUV4tCzq+yX7dQ1qDaxVcfexR67kfdf9jLwPwOzwLa5qaTXCwTRYNgK
tL7a4mtmL6U+aibXEIY7B7lD2mSv71/v3mpH1zheFU0sQ6NGnypX92jaXDEi3+xy
UUtJCubt+ESyvrHLnyOEHO3KTsJAE4VZ6rYSjycVDLt05vs6g39lygZ9KXTJ0hmQ
R0o+s1lFoU7cBoTn/TbF5jVbGlczCONkVPF/dvZdhffD5JWqaZdzSRo4ih4TjGmN
svjgFMgIHUPC289bSWWndfXfmy7/8QSgB3Xpu4N/XQKW3gRTtWAUdLmM9yKZ2NV1
E8Kzu90GITHqNlqZRgJvhHXJJaKR9iUw67TJPA249fkq4LNmxtqjwYTYIdItL+gX
jqe4WXJ1jH16QTRVUQQrsL0fP9nvA+Oe9WwUeWo39fh2uMA2OCkXblY9u0nkk8T0
EHDyhlkPQ+mqu/l5JakUOR7cax54AtzWZfjlntGQIqabbZSeQb5KOUK05XZeW2+u
+hNtACC5/QWVKqNltIS92xrMFVeyc5PLQl6/CJ8wkDcLZTEZW1kSi3+pMwVYjQeO
jwfu9YKMdGOxHYPgk4hv6NQmVGrVXzSgl0eQnfRJZpe9++UdV95rgwSL7n8GQVip
SNVpO8CYIgtHa7WnPNdfxdok0wXAmBzZa2isaLUrwP2UJacPWz8ttRCMK/G53aE/
MWsbjxUKn5bDWqOr4hEELsabgYKI8kCAukzA4jpi8f+edKMKcG5wPLK6tyUzoYai
snUily2NHCy8j9uVqW5nxildGKMh0Hg1YSFfKPPkCl/FWhXCrH5snK0jdIwOGcpb
BBC4HzvQBrJBTBNpOxUi+9jnI3rSHSS/wrixnOL/iGvyXox4L2ly3XHSGJs0lUbx
B9Dk2QcflUJSSHJ8grFWY87JIOMrJdl8UubW+KKEut0OznMSUdD61Xd7GOuYRIcH
AGWVAj1Mr+iIrVGEqm2hAfjbTC8Ba+Fk7QRgI6orgGHjZfj767U4LgUqWfYH/MMP
xXrxdDPaoTKjDuTSJLx4efggMNhst0b8x24aLOSkyUwRlsALOOijVuMyb2aGX62w
IGe2lk3Oa+h7M/Qoglf2mVzyDMdZOHXmcywq8Bdl7C5wxOdpOavt+6zKV7ydeh57
tNtZYnAKvMaQS+9Cra2kdXMXfANXKKrMLiBYrzChffuufOGhO94tnt9sdYE+F7Hn
WkpmmSS4uRF5mfe3hr5Vi4biU8sUZGf7tYc+F4VfhDVIpLoPxEhT9qnnWf4I3WcH
oYdN1DhYmWP4FYSU+az8uyk3xPrdQetQRA2WEti4BJJO/dWsMMeTDQOn5nSMOQBP
wX/q0BqL1ZrXJ5gliEOMAFQncObTCIV4odeTL8avAY4hHFra20ZmmM7/DhcDLpwY
fMFrifow+LaTJH84SGOAaLZ9G5xLCd/HRf1aZKbRYU80UXN3/AcNGS5WP5kxbieZ
L8cKawN+Gkksb75CW2QNwTVP9QzszA+MWIZPTrRhlnBLcpJpsTQlgoA5tq+qY97M
9iCeqLX0Tt4pdd1Op0pf72ZjuFtjBE4KOidbdUb+8XWYkCjSQNUKLdxnZGCiok13
nnHgIFpjHzIN151Rd4tJJZ5bAUOSD3O70jtEgqQLnNtOyp5GF87XsAfLUx8lda/e
P28aQ+9tq5ZtHIms5HFh1xJ6PbHzLvYrOnzObgrIjDvfBmtXoC00t0thG0e5SuRV
MlwZRjAJoPF8z/GglebjFRZqbRi5NeJoBuACHbv4ZQMtgkLxf3eS2ZjizrhwDwFF
rGKCQElhE0ltSibDxzjLi0JZDLtgTwwNqKsBy+X82mHpxFW9N3lrASgKReA47eZb
jtx/IVnxF2OGc9PepsD1ZGP8XVNd0kHlCvzpBzS+oohircdjY/y8NH26PwT+PKBP
sAJeiOuwxTEDjx2vZwu5ZQzlq0Xy8lw5MqLa9Vr/qMT8ABJYKgSHcIFMONYOCBaj
IKnpwEbMAQQlqSeQjmZ+QrKegzpNP+8C7F2NrluZQj0MJ8R8G78hn/XB4wp249Cn
xYN/5l9hbl5Z8Z6dgzss9XwFZz4ot8fFwso5eHigfviShEgH5hflegmQGJVkVor8
Ss4zTC+tZ3rYpoV6JRCl0fkvxQIxMREBUOHoKdZxOly4T38DEDTWf6rWVce8HvBY
QjHl/CIWouxkYOwLYlJlu6ePDLlqQXPn0NyTKZd2s63vWKDvViv058Xu2gSBZQp9
DAtLnV/rv1SDd5CNh4lLw5Yv/2pXsLQu0dqLhXqv10r0qeHhYlokyxVavV49RqGO
+cYlJejogM6IOYfdSSTTu1nXXNkUzkWZUCFkc+nvFPuqlxIuqP0goQ72jOD5ibl2
zE3RxCLCTmZ7HvImnq+wSRdAavgK8Ugj5c6DRznhc/V0H9/W9jt3VaMmXEjf/B6V
+mia3q0Kf08RHSMtw6DjUiY9B6RTylpQ5Qdeuv3nv0MhpkXaaD6uGUJVGgF++03J
w4TvhymdMX80u7Qpf6+swlJ/konmFfoPviO/e7JyvhgakHwWmruUDma72mf/7q/F
V5Yeii90Klc1sEYzNZrNk0gPZOUSpNorI1xHrIv5t22AkKDGUERGFRsQ4EqXwzJs
yGb2hXUE/Ugm8394RonxK/sHHyYmvfWr0n0uKuQssck1YQvL8diTO4kN/DMQlgZe
UlLxEmKWDl5L+hsKAWUrJ9gdSwvLiOLR0oX972R5JuQFyck/GKwVfyCPnoH5oQbH
WNRM7uk8GVqMjwz1Qk0h9OE857XWvUr+qRwzA90FKzztUQljQuC0dFfvIAkCUWTu
M2XxoOBLW5sSv2JzeBCbPbtZiv+fIlTYQCLCkhErRE0peYicXpx5qRRNq90a1kUX
/6sOVf5Y9X5klSZ5ujfXxUHnERAH56zvvIahlSCcjqlLPcPw/iRtO8ARXrIre98/
wYxqNfmJhJJZT6UwrMhY/livNdFwiu1UPrqz7w9k/tax94T4raAIbFYJcXVEswg3
LcYaAPSVCfqTTrFm7FSavy4gfTyMV6H+ltCJ/0bjqLQ5IX98MlJZUtMPZdjuIHXf
ewDA1z59szmPcM52u/NzR/V3dPZ2VE4OlyaXkmIQ6IdcssESSjnrQZtoCB4OFGpI
/kHJ4GnzXeCAnETsJJcr9i69XuX0Yy30b74iIyYRaiQrRWUtPRwg6Jst7h35V3tP
TmYeOB8W4yFOM/s+NRsMork77yG5/Wf5HkTr7ytnL/EhlK3AOXMF2X1r6Esl6t84
b4iOzLvnJozoa7hmqZvYihFXixH2Y17izpJ6tJ0Ph/DLI+ytf91b5T7w7kQc1Bp+
NSLSUKCb1K3vezN/zDXYdzjwFUuYG/bh3eEu6YG9fhna3EOkNSgkfUV7K5mLO/0/
H5FyKI38QrugDg9RQtR1zM9L3/Gvm3exVnTYZHIW9givxOSCfr+6mAQKneyvVH8A
toPa7jbMeV2IeQRvchryxjLu1kdgocoU10VrW1VUjMTJKS7n5I2sNCEA559CFUZ9
dTEN1fvOdAb+sGpjA9tjxKtBdSCKZX1YI6ykdjZblxwDoQRZxLjLuDzZ29W83jUk
J5kBZQsy7DOMlG62L6m3DX2Tsd4g75Q7vSF+p7IcQoXu/ll7reWrnWxOjTmTxyVi
ai5lsQ/pdjq8Y/Ghpgio/LGj59tTKnVLpbT55VRsoLLX31goV0bQwzBgBgQi37AC
E4glBggWoPBfgxrsFKH8kypYmFGsneL4/cxv87xrC4bP/K4whQCOVTY5ckHnlEme
lTy2NctISI2jFKoQDS2tB4HfGW87polZ984etV8T3etr7qaFC7IImLA8KtctgE/L
w/NK9G1+iX/OfUg2DFdzB0H6IgjvtOiPpEFoLkUvHsu+joMjlY2MT344RLWn7KDc
Ihzb2fSjptXm8646VJNx2fm/soD+kejhnvMAilzqDZ/CuFwEC0sqXnD+1+zX9zwZ
ZF/9JMZsiwX4rWjrHqSVGAJG2GeRfZkQarm4QTVZpdinUrPgNdkSgzZHv53ILJ0G
Ejwk/IzaP7+4u/OEUAB5DOR/uRDlor8FBPwWLdzxoHoYs2fOaQ36AHfdLgPdIVxg
FME5p7+vjysQCA1YQZ7EdT5UvoRRML+QVpMY7DO3+Cdo5nrXu1ilgrNe4X8GwImA
Q2npfYraiWO3PC+kLtRoifjSwpAAUAxBv4JFQFAcx3YLaqRv4KDy8Naq9yuZiaWg
sQ3KJjMgLLhBsxGtQwNKhtq2NAVQ5cXoSyywzRWajg9OK1zUZDYUsueaSJSFNoaI
QF98N9Z2J/dLXTsPRDfzNNjKQdD9SHxiibqRGvIs0hSeFf2WU/4ZhtLLGNF6r0GC
AF6P9BQuSayYZBE5FKT2tBx9SynilZFYx5H123eBzimCu29DTnXCQFydjWbHftcM
5IkA+xk2rhzbEF/Ho/WryKkdeZkpsCPvGhTSwm8NIRzIdnlgCjGxeTmxXYh1we9r
ZTBya5JqKPiu2GfZ8E8Q9gaIjpbPz6AwxFgqLgHadFSi3jCW99BK3/RIY8jRfaXo
6bOkgeBh/06ZpsUDt6b1DEOWyrqaIz1nGXsuYbxsUnuiyGnJ689u5pkGowC0IsYM
ZqBP5AG8ZpDuJhBuKR2uNTqxSGoLFaiF9Nm1ILCpT4axPY8WX75F+bALUMU+I3Vk
k9bhC1N7CA2xjNKEX/u3+Kqy6qvwVXjWCEd/WDQYGEjaIneN4ab0MZDGOUK/OIE2
qA7hYijs0mCfPAwGX4A+57e0BbLbrhuZPNTv60+35LYutyFt6RuQjmdAPGsvD/vU
nghbT09UyY27PsUoC7wpQ3bqBJ9r0nmSgf2cIt3omEbGqaY7Da50SdXW6rxuqkpF
n+41S83kjvi574R3nSbxl/mC3+4lZ60gqeBmIUKCsKuBlYpIfa+w/Wsc+4Q65xgN
hWVoPfv3G0mRC3u1XLlQKmhAiJb0daoVvIH4SyCses9sdN5jXfHOyxsDzf9E+ruC
XAt9FfWzTeR2isrsNY1mr0Axly/TPGU49avgQPq1p+B15OhWui1qkPzXmRAP+uQw
gwUyy2Q/lqqOCkJCln69qgb7U9R2+xvzjS5F5fvzo8VONG4TDMrQDbu45hOzHQLP
NF6YeYE76a55iYYA70NS4SWB7KOpLcIBgtrvF0Aog14TIv8Qqf5WhE1/VVkCnian
UEqioTahXG2nEwS8mkd4l/N246fRd1kAV2bo1tEXidi1zo8LN89YvNPYqTVAZiRl
h368Idkt3Z93r+lNVmFCjGfVUNZXp+bs6GZPSIsHZNXQ6h8ylxAngPGGvAmVCscS
Ea1k/81xErcMEOYZf+Z1nY2ZoYUC6GPDaCuZUdtjFVdysmYaaOt4LPniOE4ULO7l
IsJ1CVADUMLw64cr6pQ7vzEU6boaMn2pOHyUnKPc2+NRGd+jktCqjbXlOzZvJ5lA
RN/V0e4Vjebk2xdmw56Wch/xk5qQqS3OXb2W2OzX6HP97xeEg0Nx4zB6cFCe99y7
XrtBCebG7rhkje+q8QXufRyxGnFk04aW5sByj16HclkHR8cwxoVAY8rFnggNl5NL
iPdIj98zshlAatjo+l5E2PtPVqi9gfxaUeoN4xkYadg0Joe4ykkF8ZdnXj6j4fES
EhPLLIfn5oE5WPEeEM8eGJ/8u+fPVxTVd+4bgEHH3H2+W+q7GXrws59+g6Q0z1Mo
ANdmQ2x/qYomqLlp8bbbaoo55gOm9E8Ve2I+Ot9CwtIpDQ8W7OEsRA7iZJe+65rA
HvZ93heUpX0UVpqkMq0tiS31sVOwrK42s+WYALqOeu4Kyxoyf8oYlBb1VEkqUHY1
DXvwBjeXXMKAa7cOT8ahY06YmzYnH/ppqZ0GUDrkKd4TrPClXczyViPAPBtvHVJ3
dXFiI8boXkiXNFH7YtH+bYirq+3IEgEiwyLwdgMA5A9bzFFCm5EaY7mv3joenKrq
Ie4PauMIV13LeU7EmPGb4JgsBKL36xmT4rGxOlKyAqd9NvGjXo41Ws38Zg0A7QOC
dLymrtli8BR0jArPeIIMm8pDQnYoDLd9qn/YU/hLU58CtZw0gywinE+eeEBsUnyR
IoF/LaN/74E4GnBYBmfek1+ORx5/ycnee3mYMVirlu23APLamjFvUnzNtr/jIu9U
1TNF0FwY0ZyOftYUmCYtYvKvK+Tw9sr5Wl+C9DgJobsJhnsGEYF4wOH+a1rah0Am
3qPI+fF/F1vtMxd/42q+VLtvARuDMNhpifvJaBZh6JdO/bj2xwOyxZ6Ur42hPC3S
dKggl9dOwHvaUNkw1ROH3i2LF7p62YcdKm1Fstj4xCJMqHlFnrzD/hTRRIp1Q9Tv
MEYw+zLeTjIJNiNmM5JQOBCT6QzSLxyTD3yjglQ3TuYh1l6Is7soO/U/lbbH4FAl
oAqdPtiBVvocPumnysW9H+a2nSUDKYOGkbIEcLOdR2jIlz6nk2mQuFKGVPp7dHZr
G6dBZi5UzfnOKU9ghgD7vnsJTHIG4f/KmC6X2+DPlAjzWtpmDhAPxztnt+Nqz7+v
looxeZRK+Hj66mm2xLK3gZyAi+ApuP4o1pbBnwnmgquaNHOYfFzAVXWbc1/2ctoD
NlIRg1y7l56MPW4GBxpxF0ueCYz4bqDBnQzsr9klZH0s8w5tP5PpaKSrqh8KWI6N
uPP6MqqUOow5FzCjleFhv7NSvwdU3tJcO1dlKVm3k9214Wk9u7qYuuz7AOb9UF3x
DM8S+7ATnBGHgTsLEtIFi6awBlozcbJ3BqkWrJikXKlYUsxitB5FY3NwQAqw8+sw
g73hcVbKRHXx+zqsLOegeEGprvCm0lWUyJwzmg9rg3JQ7v/0o97COakXkJycupbq
NsExCdniVOL1oW5886wyCbFoeMsj6ITEDkQtv9DYotEChOeSMMRYM14yQLt4gfmn
xh9UM2kJLJX6cqjtsVW07r3/Ezp0TZ3My8oRS4CTJz9mR74ne/gjD5sBFfoNd4qv
C1LB/4osSGOsZ2q+LA9/7yc+44TCl8wv1/fKiJbuuVMvvSR0Cg5i+BdCDyef5usG
ctplCa8e6++zbS7ehCnXT8q+w8laNeNnIs+Q0lVd8ZcUFa9bvkk1fXi7A/gS41Am
U8tf5Bm7G8poeme7NE4RkqgxPLbtVGJIJoZ0+YFoXpOwU2Azc0la4j8gSw2+QXMZ
yiOQaY3qP0il+UR8J1zEJP7/zxWdUh/VTjDT+2FTHXnL0eUTb6TzsaSmBZtA0qFr
v6PHNsZd6iPkmGQip4VwHQP6TA7X3OdGKBqXc1V0R7G8Adj5jjqwWT3fLIUafQDr
gqXCjGmuhUYPzeCgc+nZQYeG49YY4TIV9EDg+SJIydG/PF7yf8ZJVVAlpJETYMMN
t4xvIoJ/aGBNTfJD21VAB3DnOX4eSGlOqTK0MzGP4gHda1c8Bm5enKZALFECmPc1
5+GTSc/AUCZBbrKRErj0tKFcBf8jorkuK1ypzlGQDc/vEnOwE+RG61e2kxgo+J0y
v5maPzE44J/dA75t++/5Q4RyJJc5U8il0s3H7RFVu5WjxYD8htOjIO+Uiwua4cMO
`pragma protect end_protected

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cwdXThUkab5j+58g3oEevqHJGB4X1nZDziYCH25sowhWtBifnVXiUFYFoS5e1WPw
Kkx3AzcEEKAlyGkrmb/g5c4K5mwBflIqzkQCm5HRUHma/mbSkp/5lKJhVmeMUKXG
AXGF+b02gk8VINVeS7PsCKbzaJ56K0ThaxTCSsL/i6E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18275     )
DATv13iOE4hJSBvdSg8UyNDQ6XItNF+rtjedHGdSVA6NSAYXWSyQ0YztoplBD+Vi
SBNi5r4C036KV2YgyFY16QSQHZf09QNKLXsxBz4XCy0ql4aAEHGueBnjNrz2H6GD
04AcCGQfXGe+rcu2fdDTdSZHIHbBP6LuEbc+c7wJV4035dyA4SYe84bLLXdeQfP7
C+V/mRr1GGeNr1Kx3ZyeLLE6Aqe1aSr2st20cK+CNaJdyYS6LYslMFR+CK+ZCwEq
AUgI1WamYFqvXLN2ko1wuuHT5+wTjWUmL+Mz9SRiH4HgJ3ArknL9rmMe0iz0X7Yj
yQgoZeRostsobDzVdW7pSW6IEiy2NTfm6wJe43yTZsIH6dx+tKWHUlq988GQEPG8
7uGy8SSweowP16jUWPuwBA6mgSacSB/Jmqde2sYwErEDjS9Xa3TyLG4MTpVM/DUN
8LBpR7f6MApLEK+x/t084BIYkTpRVwMos2aZYdRML0h9adYIGvCjdsEWO0kpN9te
7m8DYDYmzs9QobdB8Q/Acvfz0VSchgr6ybp8iPjHeHbgkrB+7w+cvzc9Yh5tUlQq
VwJmkepPvzidQbQa90R64uPkWCB9qOg2idtn5ZCd52PO7dcNZ1cDIYQRrn+XvxBn
PF48geMot8zOe02Xnr79MabmTWW3WslChkBUh3M3Fx8QfwCvImhewJIMoqYRZy9d
llHvSPvtAkkimG6MN783pMlI3o67GitBe8tw5B6DYWQZki9OTO/52+k3eRWRmlhO
dnerugOlCxBjSJt+6dJzYR6jFAC2qg4cWtD+gd5dsKidZxdFDmDE3FTQLlf2Tkv1
yQNCBGXYXvJ7/zS5/DsJUE1IlzXuZA4HuizkZ7aCzh2P+sup56mTpDYe822FVzq7
D3wfnNp9vyGesDJCiXDlOU729SYVpwInBCyxq+ebKrxQTlC0Ooqg7T5lXc6Ivd8E
0+YNX2zCheUS6IVJGi5Q4g7BgMbIPmN2DqCzbo5j4STvY4ZC64n6FQjTdJ3+ePFW
7uwKfx3H8WAuGoKzReIR0LaV8W8bulO/kQES0wfTEahKDCJAyXQ3uNUTGOLlGlRk
wcPey+82goSLVSwF9lFL9BeOG6rn/vvYlH2HR+hipicSXufVSzqMzp5mNdCqeBZS
d4/X8+SAwz4W49Qyvhv7LF341ewl/htG026/clJtnpohQZfWqE/9fzK+jEtK+luz
5PFvWNRXjW1I+n1wJkIsNSv8le1/zH7pyjyA3cd3OZjUVzUd2n5lYqKTJdu8Cfah
khJ6hAAVL0vRDNZDebxzkV3kV9paAecfnJmJDgjHJHRzJVcKTLk/7gnV4Qv0RCnh
x7ommiDZmSp96R5mpgR7EYjzawhrcyUVMJXTzgTbXJQf9Ny+UVLFWR+DrZU47Oi2
lvbnZyvDzLRU3daiLIYc0CwQEM4yD66xoegCmQRlSPsHOMu1dANIQ8gVm3awp39A
8xRGHhfRs3JrRFE1fZeOuQ46S/PZMGWjMcEL+B7OHD47BfeNvwiCHuAOexLXf+Dv
t/SlKOOqXxjSI9FR2gsU+dI1/6pmA722DUsH1ADDwHnRaTlB1JhdFxC5W3Xz6p6N
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
d1+aVmTmWt7aoRPkg8+czHWCnF2pfdsUHxX2E/QC8OAalFBNIWQZt0l83eYpbNH+
4b/Bc/CmmNnQ7pYbelmEgXtLRfM9ng4r0C+M+CtrRZPDTK50Mf+8nihUuJfUAzEq
4UhkLTXz0L4qIA0jzlNMu4VUG0uDVSCgluqKU4KuKUI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19727     )
yQ4Gz6smOC5EagGjhGT3Pffef2sI0p9iGU9+zVvJWBWrz75ZWEnA5VIWijjQP/82
iPhhYBrHsQ0//k68jycORl6cCHoW3xna4M+63EAbNTiM3qJwpC10c3eC66XDovVi
rafPEm6vAkUClGpIJbwUwaya+3GDLbHSEPai2TZdir1iKvH7FFe9TuLJkIkxCDOO
vVV3k4xVSDbzraKXsBWTT77W3kAySMdjprt4gdBajGUpRD+1z0+WmXEf5m6Qup5e
mqVtFCW9ganHNV1UzbZh3HM8zGED2m0TKalBiLuZlIJW+C8tozZkCDg+t7F3bk3D
I5ojOkAJKG9Q0bmd7dWPMuxzSw/oDYWthJTwKCNc2fvy6Uq1lV9iU/N44p+ogISV
efziSzDP2dMMm7gdOMfs0wVcjj/S6/46uOUIfpRgOahIWCjvCMcgk/bOMFx4HPiR
Fnmi0pj7paF+q70xA63JH5bLfbIv3vQ+RpA3qXRacrgMn9b+ylAZ+mZts+Wej24u
loO4r9EchGg3O1dqLRfk6nXjAuPllj1xBd06HHE0wJFf4NzHf4olaTHTIYyNlx9C
/LUXEmfANi2hYn5kn6z+kOUS3tUMsW53T3TDombc14aQndL/A2DHV9wZ9HQZn14F
AtrZwhCQe/9EAwWlSWjrtVP4z8K1T5XXJH8JrhVWjd2RwycAO5W+FJJNC7VaJYNy
unNxYe/MigTjpKJv3Y6juIRVyJIAS3jrN+qU9IP4X3UXyuq76YfxesmxTK6Z48TP
qOWB5GE8Lv/ESwcdwPTtuG0JwbTc1ZN/ku+LrNNiZ5BKy1zEm/f53mKCqsLGZKTo
JquWvzWvhiAaChpkdqb4oF1uA7H3sbNDQal182Kd6c2owTbJDrgkmABx6iiWdGfu
2G+J1zc+43blUKgkjVv3+Wj19ZLB61nEXKpBdGiyOrgODEWrfZhwqiwuoikXdgkP
fM4sdpqkP6hAGFYFP/rKcmVMm7YUTl6a/5oTPbjp9BwXAePS1OG04Pjuyk5H7gzu
2/1cUoqPvJ10fDkMj+gHOXQp60E5+t/QNekz/CUlwkkGuxe/j6PX4V8F9amF0Yez
IVpHecQuGXUkFkiwGll43QQQGjSEud1yozdEJFpgdBAgEgp44SfRGUux38gl/ELo
Ia4bHeuqtFGtLALSJV+fnPEvCA2hfOnJbiDzjLas5QLw0rWvi6p7RJEvHP0DB6PD
TeEXCxIiA3kL2f/QKseKI0e0i8rihDu4ctQoXL0NIQHLYx0KjLOxElLrO7XvSJCL
ePOrl07TB/fz0TJTJbMYK0sbgJc1oCHbZi+xJD62Rc6ZfoK8vkwVmD6qqhZeEq3o
eDnf+sKzZDOjDPWX6C0zt+2YaNFVE226DQXLNAFQwMWucHRRZldYJieMARfvdafg
o4SCyi2PzoB8qm6dSf0xoRhcGppdjfSacPXB5LlDJOLj3ZYVYcSvo9J7InQ00r48
FaL90NzHYGMzTgPE9IaIlIo/8jYVdm7KR5yKI1zcHERWRWEBknP2GHBoZ3gyuZfn
T2iWCaiZqSXsQzVm7h8KuFQjyGU/J4s6SXFE0Tj0R8NnvtqQS69REsPnLFoCwKXa
jevezqfuxKjBEWF5dAO7O9X8n7pIxkUBtqmAUVdLSCdvHQeQSw4goNOvlp3TEAiV
AxzsJfWYVbub1VNxWVe9nplnXKjRr8RA3wEIg4btntLQIr0uxBBM7nLf7IgLxb53
NJSH/Fe1Nx7W6mUxuUfRgwYjEdBSp59qn5aEyITMTI9XbRpenuZ2IhN8BIBcZqUd
ygbngjoJH7I/BJwhZuAIOamDp/bcE/JfLmTFgQ5Pq7aVnzaCBnVLUOzxJhp4lGEk
UU9eQqcagr3Flt2V2q4+QAzqEcihti3BZgGZYyB4pTqDajEfiGdpdIY2BM9T/qjX
gYbMwVJWwuitqUhXyfJWkw==
`pragma protect end_protected

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DZXIMnu17zqBsHDeN1dpi8b9ky29u3e7dW9dzvGroDVcHalRdVE0ObRlhutdxDAa
qzeLfYmHAps1ZLD1s75URyDzxxotxwlceiqs7hRUeoWLoO0+jBYKV5yo5pWe1REE
K4rlH/wkGzrDrHx4z/1+GPtRtzHG4MCfRp/t1pAuT6A=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21002     )
XMJn+9zS954+JFXrRp24rVNAZ/CJqT4qtie3iamoH92ECy+I/FTUFK6js4T3qbUY
UkbYhaYSil28roQ72aC/QNpmRVIy2xfVEsSq+LGxJf+7j9pZxu4XmwZQXXXGzuIv
1Rjp1gBshSdJWe+xNGfM6fNvdck+4YQJZzmbXsvpwxsZMwlr7i3OSyE91jOoOO/T
vJ3em1GHFT//eZhsLS6f6UzNzEW/LxdVhsvB0sv5/2yTgEEyNv9dfBTzMVMnx6IW
R5AWLli6t09CiQJlaKM+2DDBV0MDMT8nwHGFJY0AVxTVYPnPJzz+xwkUJ9FwLi5j
PcneBW2U+ZPR4Pzh7y3zCYHHoCRkyMYVCl2fW9U38zXEM+ChQMqUK+AX+1bK9Iw6
aJxYgDYXiZQnhKP85xDGiAE6OYqBZHameLCyyZoncEMeUcUgnwb0IxzRom9lIC3T
vGFq+kolnhxs8hRxVwh/GG7J6aTMG0JS6GWNwe/DJX7S0EHNMEXYQePfnpBjeR4f
hHy/d2XIEDEzFsiuK0gUDM4PBsCP/cLRRQ7nCSHy90YMPNKnf0uxjximXFU+nJ+M
jlXkxMJMdjbDbIlYsa/gHh0m553ZkruobmQZilHW6ToGwFMOSVm03GkuWxsILPoD
OgAqleg68+WloV+KO5ARFAYhora3fEaYK1x2waBKjJA8ZIC6HtrnFqZU6PCEO4PC
Jv2Ep+KoDfi3pEnR5MLf6irkkCS0U/31dNJ9c7DQZV33AFFFih3R7hC1ZWVRibcH
ShHG+XUz1ute7Eg5zSnjzr6M5ViTSzKI/UzxoSsArIX0wdChQPXKsKe3aPKRBigp
m+4WTYw6uieolOyehnjUxaYXDRSQcOgeKKKPI+2F30e29o02Bf5AVxojaKydX16V
vcnVFg+qnZtr/W5M8eQy8zpYFYZMNQuGrcSN49gIfAbv06rVm2CNLA9h52406zkH
Sv7wqB07ap9jRYRDMEOZXVKaEnpCRp9eusR0YJqBjC1vCV2Pc1OtcehQ2Ogm2vQo
cM1/acQ43bR/hEAr1TjVD99LFhyWR8nMxBHjeLOUxvi+PpGmd1v9p4fNzU65lWSu
xiuj27drl5qJZXJpGwYT7rcdDEnJLQZ/yHNuUeQ1Q+YN75xCTqRH3KE89u870J/7
AzUZAU+gDUroPxvPgm4qGM93ARAf8BVG6xKKwCv2lmPKzut5hgwrnIUB6pZPaOJs
zGa9A2YTgo9vVlXgYZ9T6F0CtFuusz2tOTVd766IKxFxY3M7PRgNaPy3SqTIXZYY
sP2QspMHSojq+llH6oQjFYKHlVP32OtqWITzyOlByDaGCZ8SJBUOVSVRk+wU5n6J
F3SNMjWHKbqfAHwRCDEBp/20efw6/aejxATGHYxvgBhvCEuPeYvY70tLzzRRIa+9
iWRe0hTKnOsZkNpMIOM4n1EI2ZKclnquQqeUTxTr5NvKh9imHGZxqIVAZwOCCR87
OlLojRIeDsuBDHbkAtBXf1SSqQ/UvW3KWGq4CBhKlHRFP/vJn04zaOlAaC2QUcZm
1yCvBUXiecGTo8rrhPbSVa9FAYc5kkWZJfAmKYFJkmAUBWRgEIiLnJ/v2Yu5M7ys
8R7hQYGvgC2n98ovScm+mq/zlJQb0Gy3BOReVzk2B+cjOuosN2P6BXCBrME1r7hU
rimMVpESc++G45dkj4H1NTvja1dNiVzWhNxl2/92K9U=
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XDljtcQqcsL+IRYDaPra3zj+ulPLLoRQDPKrGjEXoye7DuAWKBaBgaUKVeEQNfjC
FKt6xB1e5Lkaku43jfyjSF55sBHRv2zhrvh9zimroCa3FvwIRUyjsPdWEAghC6+0
9wYwAQ41M/VQEYU26Bu463byfuY4BcNetX68bSf+BVU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23416     )
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
Kvpi79FF3PFCmSa3+B7uGQ==
`pragma protect end_protected

`endif // SVT_PRE_VMM_12

`endif // GUARD_SVT_GROUP_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aM5QoYUK9EsU1TbWuEggNJWuWmt3WKctlcrY4c0F3Qt9MYzcALtHAxmzDkwKualT
rP4P+Tj2ldQt0HpEziyZXClX6JXcAy5lcnQLI1mVBD7Gb8A1+sD33dXLKOMl8GX6
1eT0jTBoimph1fjxWMQjyUE+YFlmsq4bjUd8HgHUieA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23499     )
cqblq2Rnd9QDwnfY7Ai5VcySKnN7E0p7iV0LGlX2E+XiMp1uQfQVK2KwGiMb8Xe7
+YEIdE9sCH+eOnZSxrHfL3c0KXrGq2dN2S//oWG/XpxnzQ7FXCEtJr7LG3ODduTR
`pragma protect end_protected
