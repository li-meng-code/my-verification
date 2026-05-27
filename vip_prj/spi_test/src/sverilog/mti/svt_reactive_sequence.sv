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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gkdhTEJT+xoM8KdQ+imjv1uxycq3bszsBogUtmZ3T9S9h7gS62Ry/ym797Bsixae
E38YTV1s953pYxCEIgAayx86A+nQzKUdWFT3j4vtHz6ftCVVD+0uKJQYUu3VX9EM
+YIIVgq23T8yk4RgjQTA+pdPV+5tlBkovsmrFg30gEs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3214      )
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
`pragma protect end_protected

`endif // !SVT_VMM_TECHNOLOGY
  
`endif // GUARD_SVT_REACTIVE_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bTi2XS2pKTGt7qAVMlu8WSk2qxlLq44ZOqMdnbNz8t7E/fQGJ0B1gMvTX8iVeyBJ
4cB0Vva92I9cIUDP3w3heOzCKGfCaLw7/+N5kUNRJjU54O7bt99WD7fjeFcbew5j
Y68RGeNJAinsrrQgl7XNyRvMgObuiyE/7WmcC+kGPYg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3297      )
KpSuX8YwwMeelznDLIw+ufRiU0Rp9ozjG4rYM91ga72NDtTawWn1HNvd6ZBm7PTV
WKLiiotnYMynYkpa/4HpXAbKhFj1qUdXIbbc8em44mN2bcJz+bgX2rGRh/2aipuR
`pragma protect end_protected
