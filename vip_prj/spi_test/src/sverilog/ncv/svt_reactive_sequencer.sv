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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
y7+fX9agp1+RuFKSv+Msiy2RZf9+h126C4vXNA5RQ81gEoFjE1zvV8CNb/+EWKOa
/aqLjPCd5VmnUfDF99aFVv/egscyIMv3O/wPkDFfbElWoKX8jxwxqC/jiTOsvtJe
uD40U9tFXXPFKPqG0kFfdHMddlytbGwKLmA+wjD7rkpF7+iG1EAWVw==
//pragma protect end_key_block
//pragma protect digest_block
scqe8XC3yzdmHBJlWGYanvNXfoY=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
Ua86owDiyF88ATsscSlGw0eqTwQ=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QRACvqhIQjYLziyh6O8AdqwS+pp2kHKP4ACUY3szS7r9OhndZi4cCgM8irXC0MKr
lwIiJLUNCVE4/+Sg1cOsbhR0eiZODzjZH3dWsQ5QgIaUXplLm5vrCTHD0OKTWoE2
O3hGMTlNfx1oMyJsdWCtd4JYtpFfdDyhA3/oumFDVyAvAiokt2CTzg==
//pragma protect end_key_block
//pragma protect digest_block
5wcIG7v5h2kpv6Jjr3gD6WXVtYE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
7S9v/TN8kghjIgOH/oLytpoxg2M=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_REACTIVE_SEQUENCER_SV
