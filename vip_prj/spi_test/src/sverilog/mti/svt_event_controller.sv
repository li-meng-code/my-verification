//=======================================================================
// COPYRIGHT (C) 2012 SYNOPSYS INC.
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

`ifndef GUARD_SVT_EVENT_CONTROLLER_SV
`define GUARD_SVT_EVENT_CONTROLLER_SV

/** @cond PRIVATE */

// =============================================================================
/**
 * Event controller class which is meant to be paired with svt_controlled_event.
 */
virtual class svt_event_controller;

  /** Flag that indicates whether this condition is already being watched */
  local bit active;

  virtual task wait_for_condition(ref `SVT_XVM(object) data);
  endtask

  /** Test function that indicates whether this condition is already being watched */
  function bit is_active();
    return active;
  endfunction

  function void clear_active();
    active = 0;
  endfunction

endclass

/** @endcond */

`endif // GUARD_SVT_EVENT_CONTROLLER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UvkbG8luiXmZH74oDfBVuLdlxTV9G5xmD4jXumVbDwvQtOcREvgw1RjhL0yh3z2o
rbcMBeA3u78n+P+qaUE3WSIZaQpaTo7IwP3x0X1JfVhlkwRDff7pWMudvfyx+aex
k/CVzElyozVlFUbCjd36kQhnKssk93zNbTuA2DibSbo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 83        )
Rd10umFoV4JJbyoJigkmVEYKkBd1iXa14Rhb6o+7e5ihqHPJ4gM0y3df2iJ8Csi+
AeWGd7VmBLzz8+YPu/kez/w+XZl/CUyIwS8ou6Tr2PlGkCulQqqAMjuBQ+RLOigN
`pragma protect end_protected
