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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
k6EggTHPP/W+o6FyqTOX5lMEqjavng4R300v+F6I1v3wtnHE4iAQhEimf7ym85P6
3YCa+Q9CNG91eMG8BchA3ygu73eI1+FDOxsIQ78SDkuKA+cCpNGGfsO0LVj6Rn1/
pG4zaZ5P2WvMxhaKlbQNhiT9gEEr6zab1Pe93A79f38W+1SFJZFqQA==
//pragma protect end_key_block
//pragma protect digest_block
/DuxRrws7CX/dJ26fVPg8BhyYCU=
//pragma protect end_digest_block
//pragma protect data_block
zmf35v0ffe1sLbkdedgaCfZeBRN1MratyTfHnM1eeFRs8R56HizERsOK39kIiZ/5
Ms4fzD84Cq8UZaIdJqaXZl02rRaesoz5ChNTyIkFgMIukbvXt6yFTOg1tDIQsEef
dYkWJ+11TT+Qbk26AmBIHJC6p/zs9ZYpTrLbr7iNIB2w0h1KiNxYRoIe+AG10v0+
cjNRkk6Ele4AxpLr/eeplChC9jWJobC7WKhV6bdl08cZYXjj+apZajIRqUscP2So
tH7SKZUUMCzWFmO+hXd1eIN6IbjMiYDD8KKD3YjJw+lyKHka294dlqUSnOAuJf6e
2NwYv8DYRxYI369SARMQ1yNGRxc1T4kfe2DUhCqGsn1bWuhHSf+gRoTFW2bYJP4G
msmKng31903HLMg0ByQdb48Sq7lOIWpgb2sMVSt9A1mOzYabWVhB4qtD4vA7kCzp
2xHY54FB+whMNT9D72IDAbZEosywEdm/ghQNnlpehpuhKiKz8nYOgsUr/muaK5xQ
Ng5BK6Pqkb+8/zdc+Q7GLZxFatnBMD1a7r77MLn9IPOQK7whOZP13IXcEUbZl06H
/YIHIQRdS9a+xUHBRcdLvwZE3dRPs+CL0NYtGlrl6KOjXKLSFnzzdgeB28HXgyil
ssOm4oLX4/yJDmyw8RuE+9y+LM3A1U92v6FrdE0SDRdYTaQL6H1tMQiQBIMC2KFd
l0PNATXf4zvO2okq5DjUTS1efrZwFITAaDmv8TeXWb0=
//pragma protect end_data_block
//pragma protect digest_block
XomGqPmT+6tyDRtMURB0CmOTQug=
//pragma protect end_digest_block
//pragma protect end_protected

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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HZAy7eZUkJsLvwZ/pic9N9ZiuTeumyL1GIOaPaf+EB0ALFAb0MOqRvyRaCb4HxcT
eKxUfCExuM8n5AmDRPrPnR+oDYCTCrBax15NjRkzJ4Bcwt3CkhUkb1/yRgVBU3kq
p2c54Cs8a1yBeuGDCdpiHbg56GGcDbq21KsitOPPLq9/+U6Hb6PTOg==
//pragma protect end_key_block
//pragma protect digest_block
XiTIHVpv10zIsbN2/x5mtxgeLHE=
//pragma protect end_digest_block
//pragma protect data_block
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
zx9sZN8xLZZlmYdjAlvV0Q==
//pragma protect end_data_block
//pragma protect digest_block
MqY3mgIq9v9RC0qC0jOoDbb5sPE=
//pragma protect end_digest_block
//pragma protect end_protected

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
