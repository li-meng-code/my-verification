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

`ifndef GUARD_SVT_SEQUENCER_BFM_SV
`define GUARD_SVT_SEQUENCER_BFM_SV

virtual class svt_sequencer_bfm #(type REQ=`SVT_DATA_BASE_TYPE,
                                      type RSP=REQ) extends svt_sequencer#(REQ, RSP);

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** 
   * Flag that indicates the driver has entered the run() phase.
   */
  protected bit is_running;

`ifdef SVT_OVM_TECHNOLOGY
  /**
   * Objection for the current SVT run-time phase
   */
   ovm_objection current_phase_objection;
`endif

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fQDHn0vMnievEbwLzg0iu6vMcYRJQjyzNQvWOkwErCShqdcWWMk1jNch/Vo2CeGc
zKN5l4RqpcuoVh4ySCn4uRmQAtVbUDPmRGy6CRXgXgHmoR3ZfBWJYsGrxZ8IQiL0
dDawX3eduo3fKRxVtGl/ABvldEVIsq2Mq5kOqrtNsTw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 386       )
8CGhUjOWN+lX62c2pJFRTd9tRNqGguM9DJnzm1hzZEoQlpO1MHoQ1rpu/lxess8f
1SulGoQeSiJ2AC1dQlepki5wmTXQC76tTb/1zSuUDTnTVOLs8GmmZHp4Odu/fL1v
aZd91tfk667wPhMvZXe/TWKwFsfEsqk850MtdzvwSTJn4PmjXKmBYtM7CP3Wsin6
i6Lv1SnLHCwWXam5URzeaUvevLcdFrtAqWlzXtQ+mRG4fxyLJYBQpqZ1vOvnRzZM
pFrAhxb6dFXpr5HzA3YFFOsvLswNbFZjO3PWMNR82VFcTFzvWTTSj+j45974cXhU
pev8I1hfOrde1nHmBEApUnfgjBr+6KMoY8enWgXIXhlQYGPk/7iH+fGsbsO+P1Xz
ebjPcWjSwo5iqe56Gb9DL+TN1jnQLseCghm3we3DHiSLWH7lYr+zxV1hcD3cljew
0HUtXFXdigt6Cyg05Krb6eqUaYjQaWBqXo8jVN2Qau3w6hBdR9+keSL9YnPbPyEz
lr5NNXQI7nc+RJrRzS3+yQ==
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance, passing the appropriate argument
   * values to the parent sequencer.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the sequencer object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name);

  //----------------------------------------------------------------------------
  /** Run phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual task run_phase(uvm_phase phase);
`else
  extern virtual task run();
`endif

`ifdef SVT_OVM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  extern task m_run_phase_sequence(string name, svt_phase phase, bit sync = 1);
`endif

  //----------------------------------------------------------------------------
  /**
   * Updates the sequencer's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the sequencer
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual function void set_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the sequencer's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the sequencer. Used internally
   * by set_cfg; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the sequencer. Used internally
   * by set_cfg; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the sequencer. Extended classes implementing specific sequencers
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the current setting of #is_running, indicating whether the sequencer has
   * been entered the run() phase.
   *
   * @return 1 indicates that the sequencer has been started, 0 indicates it has not.
   */
  extern virtual function bit get_is_running();
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cgGQGbyPL6ipVEuE4OYBNtQXc+OliNFQY1871PKLDR51tHGI1E5Zh0fycLtnimwX
n28q+1eX99/VsWRgGl/3Rl1LTImpTDpF41C8ybcOscmKQVdt3NJ24ylglHj9RXk8
IhZGXY5/s81OCNBNnDcFuQg6jpFQGLgb4PmucQ/QN8I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 8532      )
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
`pragma protect end_protected

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_sequencer_bfm#(type REQ=uvm_sequence_item,
                          type RSP=REQ) extends svt_sequencer_bfm#(REQ,RSP);
  `uvm_component_utils(svt_uvm_sequencer_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
     super.new(name, parent, suite_name);
  endfunction
endclass
`endif

`endif // GUARD_SVT_SEQUENCER_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
We7JffONdlDMU81w0oQN2cNUFDk214B6lNaCAJjLj+z1Vw+FwcH0bwfQAbYAbqBY
qwaeZYrmcZaygrh+hsGS3yE0lwSikjxWuQ8taYQMTiQiHG6iqF/TJ4yYmH0IPSmj
wRDqfQRDJbPI5BkRSlUenusH2ZdwFqNP86v3aIgSPPc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 8615      )
7e02mEXZRnaJqhJhspSbFdzWv4DcYWYBuEkaQiTYZMs3ul6jCUqKndTxBmLLiiwx
f2h/8erUgQSMQd0PL+AZK8xuVTZlVmWdFSvPDpmZdNIAYR8QF114XZfu9toyxVBX
`pragma protect end_protected
