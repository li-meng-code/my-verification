//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_MONITOR_SV
`define GUARD_SVT_MEM_MONITOR_SV

//typedef class svt_mem_monitor_callback;

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT MEM UVM/OVM monitors.
 */
virtual class svt_mem_monitor#(type REQ=svt_mem_transaction) extends svt_monitor#(REQ);

  //`svt_xvm_register_cb(svt_mem_monitor#(REQ), svt_mem_monitor_callback)

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
/** @cond PRIVATE */
  /** Monitor Configuration */
  local svt_mem_configuration cfg = null;

 /** Monitor Configuration snapshot */
  protected svt_mem_configuration cfg_snapshot = null;

/** @endcond */

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new monitor instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the monitor object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name="svt_mem_monitor");

  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM build phase */
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  //----------------------------------------------------------------------------
  /**
   * Updates the monitor's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the monitor
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the monitor's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the monitor. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the monitor. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the monitor into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction : get_static_cfg

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the monitor into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction : get_dynamic_cfg

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
RFwmUA14sYJhdtgnrSTdvMl0Cq6PR8UNzulzb+fBxVFf3K4dRW0xiUgPpm8RDLbR
cgKPlAl8n4nezS7EARgYIOIHAIpYr3Ef4ClsE2N/n2U3SOTcKpkVSjchvVtGBgeZ
nINdE0MktysfONtDf9DY9Dx1LlQ5wfdU+iNtyfmB36w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 132       )
W8adb1G3KkEpR+KT2/FfbY5k0qFrsv/nyaoE6euRxmuzyJnBHTcVMK0DQ44K9vJo
pMXanMEYXZ7SE5dmNbl3K2CVFqamYRKsLQaWrtYZ7Df2TdPjmjyUYq+Y54X9KLa9
7Gc9+DKyLfzykxx/B9JQZvKjlps9Z92iLclg8q5vv5RL58bkljxw90LwzgaodT+/
`pragma protect end_protected

  // ---------------------------------------------------------------------------
endclass


// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HdPgsq2f3tybBiXBq+OmLqoahdM8TeUT2vxZFCRQs0J2bJYE69NWGuhmah1aSwuU
yJrH+H9ktMdkOuOlOxAQeRPXqCVXGCiquP+KxgUjJDgFowoYLq4xGY9YBb2SQM4C
t5lP+5BemfDm4IYAQN742JdCxQx1DSbM8DuZ5oQUXC0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 445       )
RQgX4LZ8E5zyrkucoZIiKMMmToMHkIn7/70/uKMohXySG1TotAsipViT6ldqE1OP
ngsY/ZmAwpiBQ0JTH7H03NMK16936BPPfO8GmRyRPb//tuDtdKTiBpL8fafIuGSk
gQYolOdyuNcO+0nhanrDjx0bpUN93uLqCd9Bof8+XzfF+zAFoZNMZ+EWFDHgu2UQ
EU3u6mIVB51Ekl0Zf7R8Y+0HlV1XbnIBf4EtxaPVDGaCRINYnk53K1cG/Tx0HNJm
I4fD2ZBsRrWs0+jpdbBbldhenyC/JoFxpHcGNbr1wBRTF6lXaOWyQcM9wpLYQ6vs
rUfme3yaGiYxKUgz+rMJKqBInrgmgWg5prnH/BgR22kF7pDq6q5twK7T2YJDGC99
fpdfY1kACtr6aqDTKUig62tQ39QqotR9vSAcqzzXQ9k=
`pragma protect end_protected
// -----------------------------------------------------------------------------

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NaxcOqKB2hx0Z4i3BdE3aZp8nrWV3P8YqunSc8wbTV4okay4plhKdQ66aGrScfOt
eo0ZItoww3lTWXbDDJ1MAjchIz+cCRl7FfPjx/IFiiJhEnA3cHhltiwS88X9w4FV
RUTbV8YnrRo/fEBFvtB+ywLsq0/9EXWQ9IRSTr9FRwE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3145      )
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
YeSkcoqGQK6ebJ0Mnomhgw==
`pragma protect end_protected

`endif // GUARD_SVT_MEM_MONITOR_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bnvMiuNr810eLnW4Jdq7J0W/mltBzg5PZFVx7HgskYHpac70u2phYFQsnuy4EvU+
bfkJQkfYibzmG/LdR7VfHvdZOvCb/YgSvoDPUD/AtCLaUIJ0bKaT9ACGubno1ili
l4m7U4w+EzUT7QZY8bZs/e2w+ZFkA3VKe8w8L7Jbi0o=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3228      )
fIEtoG5l3Q6gtRLafHgSraqw/VPt5ywJfEsRacrFf7132wOTZfWbfYufPYHDcKgz
WR0R+TjAOfE7WHkrmHUw4HHRtLgFdhXVEMm6Gv7dsvliTSHWU2CBmXzXcUMPnWh/
`pragma protect end_protected
