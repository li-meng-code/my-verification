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

`ifndef GUARD_SVT_REACTIVE_SEQUENCE_SV
 `define GUARD_SVT_REACTIVE_SEQUENCE_SV

`ifndef SVT_VMM_TECHNOLOGY

typedef class svt_reactive_sequence;

/** Determine which prototype the UVM start_item task has *
 * UVM 1.0ea was the first to use the new prototype */

`ifdef UVM_MAJOR_VERSION_1_0
 `ifndef UVM_FIX_REV_EA
  `define START_ITEM_SEQ item_or_seq
 `else
  `define START_ITEM_SEQ item
 `endif
`else
  `define START_ITEM_SEQ item
`endif

   
// =============================================================================
/**
 * Base class for all SVT reactive sequences. Because of the reactive nature of the
 * protocol, the direction of requests (REQ) and responses (RSP) is reversed from the
 * usual sequencer/driver flow.
 */
virtual class svt_reactive_sequence #(type REQ=`SVT_XVM(sequence_item),
                                      type RSP=REQ,
                                      type RSLT=RSP) extends svt_sequence#(RSP,RSLT);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

   /** Calls sequencer.wait_for_req() */
   extern task wait_for_req(output REQ req);

   /** Calls sequencer.send_rsp() */
   extern task send_rsp(input RSP rsp);

   /** Called by wait_for_req() just before returning. Includes a reference to the request instance. */
   extern virtual function void post_req(REQ req);

   /** Called by send_rsp() just before sending the response to the driver. Includes a reference to the response instance. */
   extern virtual function void pre_rsp(RSP rsp);

   /** Generate an error message if called. */
`ifdef SVT_UVM_TECHNOLOGY
   extern task start_item (uvm_sequence_item `START_ITEM_SEQ,
                           int set_priority = -1,
                           uvm_sequencer_base sequencer=null);
   
`endif
`ifdef SVT_OVM_TECHNOLOGY
   extern task start_item (ovm_sequence_item item,
                           int set_priority = -1);
`endif

   /** These functions exist so that we don't call super.* to avoid raising/dropping objections. */
   extern virtual task pre_start();
   extern virtual task pre_body();
   extern virtual task post_body();
   extern virtual task post_start();

   
  /** CONSTRUCTOR: Create a new SVT sequence object */
  extern function new (string name = "svt_reactive_sequence", string suite_spec = "");

  // =============================================================================

endclass
   
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
SQRBKjCOSgHQePXxF1RP9x1FxzXKTf4BlssNhVQODXGdmE6z8PrX5Eog7AuN44gb
WlXbhyD7Leobx7MYh+rozkOoDnnyqF+PjalD2jiz0FfdiBPw1Mhp5dh31JFlZAy0
7l1WWOQUxcGogLrs1zZ6VpOGjDHSjkIZypKB8F3cB0iBgG0mEwbwSQ==
//pragma protect end_key_block
//pragma protect digest_block
Q5hLHMJgNWr10ExiTzAFQT+HG4I=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
lHFmvrp3uRBO7c6qZTBwe652pZc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // !SVT_VMM_TECHNOLOGY
  
`endif // GUARD_SVT_REACTIVE_SEQUENCE_SV
