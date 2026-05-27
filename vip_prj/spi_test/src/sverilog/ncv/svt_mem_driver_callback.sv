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

`ifndef GUARD_SVT_MEM_DRIVER_CALLBACK_SV
`define GUARD_SVT_MEM_DRIVER_CALLBACK_SV

/**
 * Generiic memory driver callback class.
 * Defines generic callback methods available in all memory drivers.
 * Protocol-specific drivers may offer additional callback methods
 * in a protocol-specific extension of this class.
 */
class svt_mem_driver_callback
`ifdef SVT_VMM_TECHNOLOGY
  extends svt_xactor_callback;
`else
  extends svt_callback;
`endif

  //----------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(string suite_name = "", string name = "svt_mem_driver_callback");
`else
  extern function new(string name = "svt_mem_driver_callback", string suite_name = "");
`endif


  //----------------------------------------------------------------------------
  /**
   * Called before the memory driver sends a request to memory reactive sequencer.
   * Modifying the request descriptor will modify the request itself.
   *
   * @param driver A reference to the svt_mem_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param req A reference to the memory request descriptor object
   * 
   */
  virtual function void pre_request_put(svt_mem_driver driver, svt_mem_transaction req);
  endfunction


  // ---------------------------------------------------------------------------
  /** 
   * Called after getting a response from the memory reactive sequencer,
   * but before the post_responsed_get_cov callbacks are executed.
   * Modifying the response descriptor will modify the response itself.
   * 
   * @param driver A reference to the svt_mem_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param rsp A reference to the memory response descriptor
   * 
   */
  virtual function void post_response_get(svt_mem_driver driver,
                                          svt_mem_transaction rsp);
  endfunction

  // ---------------------------------------------------------------------------
  /** 
   * Called after the post_response_get callbacks have been executed,
   * but before the response is physically executed by the driver.
   * The request and response descriptors must not be modified.
   * In most cases, both the request and response descriptors are the same objects.
   * 
   * @param driver A reference to the svt_mem_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param req A reference to the memory request descriptor
   * 
   * @param rsp A reference to the memory response descriptor
   * 
   */
  virtual function void post_response_get_cov(svt_mem_driver driver,
                                              svt_mem_transaction req, svt_mem_transaction rsp);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Called when the driver starts executing the memory transaction response.
   * The memory request and response descriptors should not be modified.
   *
   * @param driver A reference to the svt_mem_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param req A reference to the memory request descriptor
   * 
   * @param rsp A reference to the memory response descriptor
   */
  virtual function void transaction_started(svt_mem_driver driver,
                                            svt_mem_transaction req, svt_mem_transaction rsp);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Called after the memory transaction has been completely executed.
   * The memory request and response descriptors must not be modified.
   * In most cases, both the request and response descriptors are the same objects.
   *
   * @param driver A reference to the svt_mem_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param req A reference to the memory request descriptor
   * 
   * @param rslt A reference to the completed memory transaction descriptor.
   */
  virtual function void transaction_ended(svt_mem_driver driver,
                                          svt_mem_transaction req, svt_mem_transaction rslt);
  endfunction

endclass: svt_mem_driver_callback
   

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HR5fCbXxrVvnZqxkDFSFoYTKTrCoe6QHWyp4VJ7mlGrAuvhwtJSvHWVDTKC9Pptd
2VZTA8Oxx9sVRyHydLzAuZplPzMkGu51umwwYZtUCZsuvTpqmIm5dR53hYIdgjWf
o0cjQukXayLNkFkHp60WNaUkY+23RmlwRRWH+jrjW9jUt9isWJSZxw==
//pragma protect end_key_block
//pragma protect digest_block
drqBluWMrZruoiYqo0/+Hh9Yd1Y=
//pragma protect end_digest_block
//pragma protect data_block
DcXD7j8UDjHF+8N9GXANOSlJ1lXs9l/aTXoZFpzOv7+3MmIuXkAeITZwC7fHq/RO
UzmnlpNJaXcN/Ypi0Us83/9LfLkbUIK1fiVRHg9eg8yypigmRuUwD17L+seXv0cI
iXG7urT3c3F9JfETs5B/w7PzYitLIWhtmDNsn/oDoKbMFj36tLATcfURHFIKSz9t
LdE0dkcDQXYu2ONJUXVq4zrmMUkjIEcUZfTd3iWpQaL4UZjX/XzqU7td2Vbnr+oX
lraXH97Wq28ESP6HtIZCE9dEWRDWbJMuQ9sswCqb8Hdt7MGciYPujjQP0IOsxwOW
AzUtZBm66MIhXP2e7uKS93hf8By/ej5bL9wSEoUo/Q/7Tx1QcAzRgv7XIiyw26nM
HqL5k2TdhNvgJ4l7gJeaPxxSCEboTBiqFXlrAZKJY7SC0U0Pe8EI2y/hfExKTeTx
HVygoLNv3/LpJ3r4JzeOEXIvsjk4KYzYGq2P6AECaT0YhbCBGYvbq/l4mTIfiPrR
HzvrATlCf2bF9lR+Dr4Qsl0EzrQYih7zdwIwEDpVcVoZqivz0gnn54bHpewYvIqD
0GCeN3RF5xpvwrsqYFZIlP7YBFDBR4P5KshfOx73wzsuUxKIbIIs9BHkm7haqi/U
JF+GKplXnmeONxdMSNu0VmxjSIkvxczvVxDjpDZ0alO5SY+0KX/QBc/SIvuV7jfi
5aegSIvuoHFFEABysSiM4ARsXj6SYEgBQDyfL19FWJ822BOUmMalj301NESsXcQ8
GOv1yekmmQh0Mt+b4bauD0P5EkH7kSpGAGhvQcdpspH+3yYlGhvklhEUpYYU7tFt
XDSsIo8sm7IJUxv70IfipbMqNiZU83E5wpv4XrgxyfgruvKguL8qkV80Wg28UekO
tDD+gVYy3dvXU61K2RVEbFuQNAQnD4LCVblTST+me24=
//pragma protect end_data_block
//pragma protect digest_block
qGPdoSJXCPp742wlvIHOfz7l7Kg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_DRIVER_CALLBACK_SV
