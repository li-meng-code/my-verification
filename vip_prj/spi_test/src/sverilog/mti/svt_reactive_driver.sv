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

`ifndef GUARD_SVT_REACTIVE_DRIVER_SV
`define GUARD_SVT_REACTIVE_DRIVER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_cmd_defines)

// =============================================================================
/**
 * Base class for all SVT reactive drivers. Because of the reactive nature of the
 * protocol, the direction of requests (REQ) and responses (RSP) is reversed from the
 * usual sequencer/driver flow.
 */
`ifdef SVT_VMM_TECHNOLOGY
virtual class svt_reactive_driver#(type REQ=svt_data,
                                   type RSP=REQ,
                                   type RSLT=RSP) extends svt_xactor;
`else
virtual class svt_reactive_driver#(type REQ=`SVT_XVM(sequence_item),
                                   type RSP=REQ,
                                   type RSLT=RSP) extends svt_driver#(RSP,RSLT);
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
  typedef svt_reactive_driver #(REQ, RSP, RSLT) this_type_reactive_driver;

  /**
   * Blocking get port implementation, transporting REQ-type instances. It is named with
   * the _port suffix to match the seq_item_port inherited from the base class.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_get,REQ,this_type_reactive_driver) req_item_port;
`endif   

/** @cond PRIVATE */
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
   
  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************
  /**
   * Mailbox used to hand request objects received from the item_req method to
   * the get method implementation.
   */
  local mailbox#(REQ) req_mbox;
/** @endcond */

  // ****************************************************************************
  // MCD logging properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance, passing the appropriate argument
   * values to the uvm_driver parent class.
   *
   * @param name Class name
   * 
   * @param inst Instance name
   *
   * @param cfg Configuration descriptor
   * 
   * @param suite_name Identifies the product suite to which the driver object belongs.
   */
  extern function new(string name, string inst, svt_configuration cfg, string suite_name);

`else

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance, passing the appropriate argument
   * values to the uvm_driver parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the driver object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name);

`endif

  /** Send a request to the reactive sequencer */
  extern protected function void item_req(REQ req);

`ifndef SVT_VMM_TECHNOLOGY

  /** Impementation of get port of req_item_port. */
  extern task get(output REQ req);

`endif

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QDfrmyf1eNURthw4aDzNKRyfumY85VMUc1/ktmPs++amrIlfvLLq4Ir6H79moWC1
zJB9eOgxNmq4zaO37hYh7m9PckByEFoTMLZuXMOwVrK6saCiPH/epKMl4ImEzSLb
h6uyNsRBEK+2/095XNovpwAMiFrCM8P6NBY6Rukm9DI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 659       )
pZL23DQAky8zDhNQgz/LKK3LV0Gl+VOp41b6Xo8PuztRPMLaEgGCswgwjT6xiq9g
FKxlHZiMzdptG28cRqCgoYArePhUDxbqAmjOUlLAWKnqWgTp9nve8uYcM6Q1A6Kt
sLDEUw2TGKZlghrrjF1PDvBgGtPgYCsNnQyjngEDUIJ/rRCnvaF9fo1GXBPSK4RK
YrqSdPhP5J1mRrQDNz1D+aBkEsxRPaY/1vj5HW2M/tLYHxULZZe9GM5nC+n8TxpE
0F2KhzJoTYzndbw8F/FRXHuI93JxYMF6F6KtlKdC7RYtini/OPZArIoxW1jkAsi8
UaaVND7AAZbnFTRRpbFgCN80DbyuYGDEP0ESIXQElCaSjUHmOsGn5CgVvzLCCHm0
qehDy+bms1CgcZ3DNylQh72NFvwrqq15D36ZljTkNLeVj0PjDkygWJN22Pf3fdab
cmwzRnvUw317zC2MzcbhHM3f8R+ownMvj7RdIwSaxq+E/9aWpG6DjrMDMTXXuAkd
r3vYCCkJWARdySYH1BPOWmaJNIxVEvehmz5609ys6wRSQoMOyX/YNMn9nNYAHbm9
YGuxNxiJ5CL7h2ra4E1lAgM8vzAV6zss2EwEnYYcd5v05D9BQyLC88bf2niC44fg
Jb3hp54kJl+tgJrHh0KvpUZ84GPLI/mjDtRxckp5UCtdbqdo0SEdhF6WvHIQsgL6
kKwQ/3aJQQ82IUidn0iT5wzD3C8NuRDL2NUy95s8vxrhBoJ/2ZeILsXPTyGpe/pJ
P1/yw40fsNUqdcRPlH0AiRMUWDKTG65jF0xMtOdHEr25mfJH5i2iTOzHEoQVJMuK
BOVTnoizB61ZfZqviCD++DQ/TVK3lLpn5gyQK2ihmhDPvaPQth94CoHlUOX+Q+9X
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
l+t9QbXJVHHPf6nevAW01jzK1EGywtnjBhoIMukqO9+TGm22y1OORaVHGz9qWJ+B
e7fmYt/h0DOHb8d12gf/76Qp6x52PO0IuKwJlvAtQFz2WtU9QSDHmL2lVKnOX4wO
nb+MIgBNO5//rdGFUa061Tjs/ARP0cJ/SVx7HfTgXWE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1395      )
uX8M0dwjPQKUXyPYjax/8Il7bVkXUyh0FzHFPLjzf6n4HG0Prs4aciR+4CDnNv6G
vzDvp1Mkx6MPD+XNYXHTkV1yUrIKRO+/xYI/J+9tFGGHuSn+JaSIhvYAbLbIQj38
9EiGFbkWe2GTLZpunuHMiBdUY659S5UFikHbbXM789vYEPkvCXAO5nSjafzJt34M
7fvshQBG2M3soWYCIZsjz1d/QJMKsoTzkq/13HpqNLU4CE4I/nLvYzyxhMjzfoQ7
EzrtQEQ37Ky5mTuAI+tLsrDyTrXqk2AIGPUDA3U+JS56J8GOPSaCt5oeCY5FaUCV
z5wA3BdxpLL8C/yYAdruuQ4hMqH0o8Tg/LIEKVg53LB0a1URXSAB5biEG9zJ3L4l
IolCHgqaD14273r9KM9M7WlKnqfNu1fUT53hZlCxN2dVu95qKSNbirMofFm0eoYN
ZwsIDmpVC0difn7kvnLQt79ptBMiQx9kXkyjJ2k561HDyYU8Lhaa7Et5Bj9aGIuS
CmSVU/Irh8pP9bQZPenPIgaCSfUqqTfx7gIUBlkRAFLKCq8MYexgJ5tsBi9C1/Y4
4Q5AY+rupdKhov/dkneSQ6ptZmVNZ1yXlBvL+GMxeuj8w8dfVWneOE2D+nym1+qj
8rmjIaY6FPqiDbFk2yiWMEGbsSpOs/Ybytw6nckAjUSSrZb3Ck0j0jWXhutmoR6C
RDo32HmMiT3IQM2wlMLnXT6ftpzXOxnWX+hfJhNMJUM0+OP0NFcacInOo+IQuqFu
j7RRBRzMgvcLd7ve8gf16UblHNk2XaCs54LrHzTjd5yYvxAu0vOWET9rFO6KmB/h
St7Y0DhbZtluolgyRB/z4GSKaJMZXvYpwWitffvbUPZxhlf62iVcJpNR84+qhtat
YBC+BQxhtbXC5RhNeh8nN/PkrFrpsB8cJBCRPFPmIIcgUF2jkjm6FwcmET/Of22o
90BKmNCOrp9Tlfbo7NxCAMPe6ZkCSjbVEWSfwtEIfgc=
`pragma protect end_protected

`endif // GUARD_SVT_REACTIVE_DRIVER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NDtLSe+Au7mrsJ5cjuiHoeypWea7uDZAu4XUNIvHEGGu1U12YYckvC66F4hbqILa
qIv4e5l+KgV5D1S4nO63sc6Wr/rIdbHV/YwovG6y/FFSLrJBP0fBtMYWEw0L4Jwu
PRsX9L2V6fZgZ5y6I5tRFhIpjDTtI1GM0EaAU5g9kfE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1478      )
VMGZL+CqSF2WyX5PyQ3JwEE0HNaIlUf9j0dX9/9Z51/8g0vbEsv0RrBQ+1detBXo
IQ8xMngPCouwqKZ8W1yiMAl/T4I4O/2jjLVaiaIy1gs55Ds1DO7LK5cFlhdhil0X
`pragma protect end_protected
