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

`ifndef GUARD_SVT_CONTROLLED_EVENT_SV
`define GUARD_SVT_CONTROLLED_EVENT_SV

typedef class svt_non_abstract_report_object;

// =============================================================================
/**
 * Extended event class that allows an event to be designed to be automatically
 * triggered based on external conditions.  This class must be paired with a
 * helper class named svt_event_controller.
 */
class svt_controlled_event extends `SVT_XVM(event);

/** @cond PRIVATE */

  local svt_event_controller controller;

/** @endcond */

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new monitor instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name
   */
  extern function new(string name="", svt_event_controller controller=null);

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_on(bit delta=0);

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_off (bit delta=0);

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_trigger();

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_ptrigger();

/** @cond PRIVATE */

  /**
   * Method to implement a conditional check to ensure that the suite specific logic
   * which is used to trigger the event is only initiated once.
   */
  extern local function void activate_controller_condition();

/** @endcond */

endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XRs1RDBixNAAqwgGLVdcnkPvcf+8OxJkl6SZq+8rWqQmcypMZnPXucxmxLYobVdF
peCrtGvxQPTlCw8jh12KU21e1qetxSLimvQ/rSMaWzjrvngXM1ay8gPyYXU58cTN
vnw+YPxWGT4HjulJqzrtrlo+Oi1s0HxtA/moVri9GmU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1880      )
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
uO+x9R99bsQG+jN35oQ3xg==
`pragma protect end_protected

`endif // GUARD_SVT_CONTROLLED_EVENT_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VtcWMJV+qS4PK61jE49+sd8s7m5SB6agdIjhaDnbujKE51rhygdiixXLLUFnx5i/
D11phLwAuT5jAVVEE2e5FB5U/JJgzH52ScXrqCpFCs1U1hB6QdU7MRYp2Ovpmoim
RTAP12iptMMXUI2QPmbwey57YWkUR+J4mIm7BWKLXWQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1963      )
vkeDkmMfDsSEPQi15UzbBe0rDWA5ktOMxtuweo8iPPLl3yCokYzN4nl7WUgODbb8
ika5g1iHujD+NmAaY0daugwNJ0lXLT+9DZpmvM/LDYbNWAz9ULEeg7RGsZ8kB4xq
`pragma protect end_protected
