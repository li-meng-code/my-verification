//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_REACTIVE_SEQUENCER_SV
`define GUARD_SVT_REACTIVE_SEQUENCER_SV

/** Determine if set_item_context is implemented in ths version of OVM/UVM */
// // 1.1b
// `define UVM_MAJOR_VERSION_1_1
// `define UVM_FIX_VERSION_1_1_b
// `define UVM_MAJOR_REV_1
// `define UVM_MINOR_REV_1
// `define UVM_FIX_REV_b

/* We are using OVM so we must use the workaround. */
`ifdef SVT_OVM_TECHNOLOGY
 `define USE_SET_ITEM_CONTEXT_WORKAROUND
`endif

/* We are using any version 0 */
`ifdef UVM_MAJOR_REV_0
 `define USE_SET_ITEM_CONTEXT_WORKAROUND
`endif

/* We are using any version 1. */
`ifdef UVM_MAJOR_REV_1
/* version 1.0 */
 `ifdef UVM_MINOR_REV_0
  `define USE_SET_ITEM_CONTEXT_WORKAROUND
/* version 1.1 */
 `elsif UVM_MINOR_REV_1
/* version 1.1, no fix, so it's the very first release */
  `ifndef UVM_FIX_REV
   `define USE_SET_ITEM_CONTEXT_WORKAROUND
  `endif
/* Version 1.1a does not have a specific define called UVM_FIX_REV_a, so there is no way to distinguish it. *
 Therefore we need to just look for the subsequent UVM_FIX_REV_b/c/d/.... */
  `ifndef UVM_FIX_REV_b
   `ifndef UVM_FIX_REV_c
    `ifndef UVM_FIX_REV_d
     `ifndef UVM_FIX_REV_e
      `ifndef UVM_FIX_REV_f
       `define USE_SET_ITEM_CONTEXT_WORKAROUND
      `endif
     `endif
    `endif
   `endif
  `endif
 `endif
`endif


// =============================================================================
/**
 * Base class for all SVT reactive sequencers. Because of the reactive nature of the
 * protocol, the direction of requests (REQ) and responses (RSP) is reversed from the
 * usual sequencer/driver flow.
 */
`ifdef SVT_VMM_TECHNOLOGY
virtual class svt_reactive_sequencer#(type REQ=svt_data,
                                      type RSP=REQ,
                                      type RSLT=RSP) extends svt_xactor;
`else
virtual class svt_reactive_sequencer#(type REQ=`SVT_XVM(sequence_item),
                                      type RSP=REQ,
                                      type RSLT=RSP) extends svt_sequencer#(RSP, RSLT);
`endif
  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Request channel, transporting REQ-type instances. */
  vmm_channel_typed #(REQ) req_chan;
   
  /** Response channel, transporting RSP-type instances. */
  vmm_channel_typed #(RSP) rsp_chan;
`else

  /** Blocking get port, transporting REQ-type instances. It is named with the _export suffix to match the seq_item_export inherited from the base class. */
  `SVT_XVM(blocking_get_port) #(REQ) req_item_export;
   
  /** Analysis port that published RSP instances. */
  svt_debug_opts_analysis_port#(RSP) rsp_ap;
`endif
   
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  bit wait_for_req_called = 0;

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance, passing the appropriate argument
   * values to the `SVT_XVM(sequencer) parent class.
   *
   * @param name Class name
   * 
   * @param inst Instance name
   * 
   * @param cfg Configuration descriptor
   * 
   * @param suite_name Identifies the product suite to which the sequencer object belongs.
   */
  extern function new(string name,
                      string inst,
                      svt_configuration cfg,
                      vmm_object parent,
                      string suite_name);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance, passing the appropriate argument
   * values to the `SVT_XVM(sequencer) parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the sequencer object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name);
`endif

`ifndef SVT_VMM_TECHNOLOGY

   /** Generate an error if called. */
   extern task execute_item(`SVT_XVM(sequence_item) item);
   
   /** Wait for a request from the reactive driver. Returns a REQ instance. */
   extern task wait_for_req(output REQ req, input `SVT_XVM(sequence_base) seq);
   
   /** Send the response to the driver using a RSP instance. */
   extern task send_rsp(input RSP rsp, input `SVT_XVM(sequence_base) seq);
`else

   /** Wait for a request from the reactive driver. Returns a REQ instance. */
   extern task wait_for_req(output REQ req);

   /** Send the response to the driver using a RSP instance. */
   extern task send_rsp(input RSP rsp);

   /** Continusously wait for requests, calls fulfill_request()
    * then forward the response back to the reactive driver */
   extern virtual task main();

   /** Fulfill a request and returns an appropriate response.
    * This method MUST be implemented in derived classes
    * and must not be called via super.fulfill_request(). */
   extern virtual local task fulfill_request(input REQ req,
                                             output RSP rsp);
   
`endif
   
   
`ifdef USE_SET_ITEM_CONTEXT_WORKAROUND
  extern function void reactive_sequencer_set_item_context(`SVT_XVM(sequence_item) seq,
                                                           `SVT_XVM(sequence_base) parent_seq,
                                                           `SVT_XVM(sequencer_base) sequencer = null);
`endif
   
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AdmTFLRbsZpz0elOWMXIslObZ3NIOf/Bja2OhPdTCt1jCnM9I79uPh+xuEwwBR/p
knAAKYmjy6zW9xJ/1PKjEwWvN4FUXoYue6i1QaU8ndmEf4VVa0rt/beg49qmha4l
o26qM8e4rC0uwu6sN+OrGRkWmZe2Ws30uqNxLhquuBs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1883      )
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
dV44fLCOYXUDNpoUVk8OFQ==
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
kQs/jAsfqKV3JxF6wrIKTS1/d7Y2TeoALkW6MPtyMRB+M3XCxf2a5d3Vw7qQJZvS
1JJ6QQo6KraodO6CSGfdtPoPd4gWnf90KKx9mfJC2Ky9Q8pkoYQ3cjAw9Q+8ANcf
LZlsSHvjtdndgJcVqkUHwpCUS2q/F+DxmGbRyrBAFfg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5023      )
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
`pragma protect end_protected

`endif // GUARD_SVT_REACTIVE_SEQUENCER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QwNHdbmkSTwvalbl1qRDqNyYzkCwD9iAZ9ZAZOUmEAz3f0mxk7KL6HReaqWgitSd
n18hiPLgs86k9nst59HBBbRlbTitmMkoB3l2RkJjsMLEqj3kzSYnSf9YVnf+BROt
ChcKSo+lvEslzT/S3W8jGHmBl3GX9zU/oFOQPWg+tog=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5106      )
raQSwHJoZMAPF/dVVkOOIVTNRQ8Nd9Fb0AwlwZDbFfH2+cIDtPK8Td1HopA9qN2f
izZKFDJ8vFVJ00RqZL4PivB0psqQh/Z3a7LZ1IoXs02RBP0HpvD3THQD3j4Nh3+g
`pragma protect end_protected
