//=======================================================================
// COPYRIGHT (C) 2010-2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_AGENT_BFM_SV
`define GUARD_SVT_AGENT_BFM_SV

virtual class svt_agent_bfm extends `SVT_XVM(agent);

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

`ifdef SVT_OVM_TECHNOLOGY
   ovm_active_passive_enum is_active = OVM_ACTIVE;
`endif
   
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** 
   * Flag that indicates the driver has entered the run() phase.
   */
  protected bit is_running;


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JjEkVV9yQLogk9oNNqAZpn74Zti3OeQsErQTIROohvdDsJmt0e3iXqGT5RcQv1ZK
u4wN54sqIELg4/XBItQFR+VnIbwVfYWvlcVOi2h30XjxdQuWdS4UYH/NbATPlpkY
ehUEYe3GvM3WX/DlISPXL9e5m4PfObrOZIo4k4OElEM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 662       )
9gEVAwVILQ5xDPrS6W6Kx1U7pu/qLGYvYfuHtakkvaDwWVNDIiQ81VJKFN9Mvqax
acKAWh1gfd1a3wnZpE0MOSk8QHnLXQkfkcZeBEDjafMwFRdZpN+yowo6KCG+4fqe
TaHCbtuMXyyBAlIqQ/kdUuEC+2v7Y6LGtE5hwWAPyIj87Aow5jzOe5GcIGAFYTRS
OOi0o9YGICEMi/5f443lM+qhqUpotpn/2tnrLHV/60cQQkBAWv/11U1TGCdV6XUz
FPR0fPDUoCO4chW7vEyXKR2rtyqbbtq85oxW1jmPkNmAm8vubJI9n5T6Cw1jkq48
OGI11Jdsxy1QrA74pZLv7qmpze6yuNlEU5xfGYFsB06zWsaTYZ4RHUBYSb/D3N3d
eGeaNh/I3p4QXHJsjEFT+fQTMKr2+8b8TJZ6Pw501+X6LwjBDuAjDOCMuPeCmYM6
u9x5J3YRndwe21l+cw8DAY+OnNWSNAa86bnfiH22eu1vzsLkneg4MFpVDH88d9m8
6v2kNQ2J17IitTFLVjKGdg6zT4z5g+hF75BKi1PgygiXsAcYxAwFZADdqNl5r59m
DI4AE2Nyh89rI6cYolDTAnQavs3zBhEUC0p/bXe2Dfvi2Yhr6r+zNXUS9+cbkO3N
YEq15Cej61QJJPgu0x+wXyrQ6hpf4kjzviyVKSKYNJmcv22y6i97crZOs3kpD6Xx
7trrzcRTEHMU1LPL/ahDHJ6de2nhx1k6/B99qnYHRG3HRCNgEDWmyi3moYm8zQr6
M02r8BQJJfiVWHaT98gTqppIfilRip/dHRnMuFfjerVFyIZ2HDxfBMLpbPLq+cYp
MdwfxHnG9l+dI9jV0UUNSjuFdBpMFr+aMtwH/UDu+GyB1gtLIDdy0Jfgy1Q+pzGX
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new agent instance, passing the appropriate argument
   * values to the agent parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the agent object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name);

  //----------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Cr6YJZLj2/GO0yy95x/nlcJcGNUV3IL/BTb4cPvjvKW/cHEd3WMA7QX62Nog9TY4
lqxYMbVDfIU1l/Kzu8CoLEa8g7vZgZUmRQ1YahziCpXKnrEcsswO+lUcX/7ibcQh
rQGNkodEkpNjcVfaCyqtncE1qmMIe9EQa9AkRBNLU7M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1024      )
dSKPW70nYMoTrZD2D7H5tPuec3K+LFke9HYj7AKgJSgCb8LzpCxR3Y3sQrPfFkOx
2Z8XhuT7njWeJ04WRCFSwftmmkwUlwzm6bXBFX8WFujxU7X6no8HDvTpYdxapvvK
6ybHAB9Un7fAD5Sd4Pjk/k1q8qTR9QzsYyO7pPVRKhDXhKL1fRLoYZ6SjvmQHgII
ybCxjEhpC7FH2N8oqW2DwePjoO2Eg9c5mLh6QRGgqKqWspc5bf55PLFp7LY3/+E/
8JRIvSgD1BaQgjB12jGDK3SblRMnxj4PRQviuK7y9fovUF23oXc8rUU8qMZ+LF0n
zT9qOtiVq8b5knWaztOjRFYuW2TGqSOcscYG0X+5YdDuUd/Iyx2y2At94rDRb9t7
234RlicXLm4/BNRfoy9V4MFXJf8dw7W1/5LwFnDXsuTuiU0iQQFItaQQZrK3c6WX
UFZSUtaWFaGa0oTDFteuiGGLwujxX5i4bjKb5rGdAbU=
`pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HIlR9BPCSMyYqigBbDGCooCaaD2s+JljQ3sr6hVQPvCu4OjTWFeoRTTq18Utp0xH
TY6FvDwKyuFoPtH+mLloTuGibPH9ZnGOUdCDlTWeD6K5WDHZX8473L0CNLcvRe2K
+JZVjFaT/mTUqcKuJz0zFmAzLzf/joz1wyNS401D8DA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1348      )
LgrwkvxEU1zH9VWwuBmNQWwiFM7uyLkC5pBS3l7nyI0mrdr/9vQIpDcbgOb/kDPG
nIumIacDDmelcvblJqXmjpwmciiX4LPdutJP958hXg2STffydbBCyO/OhiaRMYqm
kLa6TVjRl8qpztjoZmbSjPiJ272O095Mj1ca6kQyxSHBbOScr7lpv2lf+90hSUco
WGMJULoctaOmOVB+mLN3vfrxCITZSmoh5CYCgQDi9o6Mg+3kxU5czSg4p9gMdeid
s+/CNC+YBUscwRR9dVhs1SWfMBxM9crn2QRp0fqcZa5+5vLKOnzj7d9eDLupTNMa
/GRpOuDgOzbI/fVCQa5ABwhrvU9cbVNZoJpPdSfR0AbjKlIh8+Egn3SJWcO4Xx2q
9Ncm0LFfZuO0d2sEk/Yk5bqEEOCLf7D0tqxfJ7D6vBLeknpiT7vJO8QuEGLVOnLo
`pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the agent's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the agent
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual task set_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the agent's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual task get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the agent. Used internally
   * by set_cfg; not to be called directly.
   */
  extern virtual protected task change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the agent. Used internally
   * by set_cfg; not to be called directly.
   */
  extern virtual protected task change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the agent into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected task get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endtask

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the agent into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected task get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endtask

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the agent. Extended classes implementing specific agents
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the current setting of #is_running, indicating whether the agent has
   * been entered the run() phase.
   *
   * @return 1 indicates that the agent has been started, 0 indicates it has not.
   */
  extern virtual function bit get_is_running();
endclass

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_agent_bfm extends svt_agent_bfm;
  `uvm_component_utils(svt_uvm_agent_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
    super.new(name, parent, suite_name);
  endfunction
endclass
`endif

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Bb+7ecbLFHe7OXGVKpY9vIqhI46HIFy5tqW62nX98O6g/LNA0vWdHjXNnBfKL3re
kOQSXJG5SXrD1UDfid/x2+2OYjPy8MuBdywrSElzAknjyEAoUGf29918CkJCOpYf
CPRrxFw/5tSYwNUnd72+zD0XHyA/ryckzFvKYArYiRs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7509      )
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
`pragma protect end_protected

`endif // GUARD_SVT_AGENT_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ooEBKFWqJh39Mw0+ijQ4MIcWch+Q7aCQrd4+OloNMVZgharvSr04ebAGSymxzoVn
nhKvL15BHwL6tRxM0JhGx0qxZCHeq4Opgl6JFGcdrTDhpy8/hFVHUSy5TllurVkE
A5IDfM65HNlaiezfeWpfF06wY1axgPH+vugMwKMTwDY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7592      )
DDeU02Fqp4F1JLnlUzX1NaXi34RVnZmuS4QBfavSdLb92BoPr6xf9MBXzBBgNWNV
uOY0LoLmU5kKUfDjdS2g3dgiU/qk/sSS0hz48bpVQMW22E7PR+qhVocix8L8ZJlM
`pragma protect end_protected
