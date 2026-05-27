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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
m0kGSAI/tyN9z2i6ZFydDCplmrctH2fwvtHQBfTCJWQO+/rbMdDHOAOc6udJDEjP
xwyYybpRTX0PT0PQPz9rPOyPYTHhaqp+20Ujh7DxFR/sO2589pRRz4dkIFFr4vzW
7ndh1ORZDBLxl00fBluAVcshOkHpN7KeHx7kfHjXGqE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 528       )
d5ngLbk3NZkfXnU6izke6+a4UvxF91aF2ComPSqkbo9DnZ19B3QZAanvwFi/4ABZ
XIQZUNX4VpmSEU4R4l8upfwDUrO2wRWjVDiHGEkPFOt4A03hdgR07cGfMXZLVOCM
Hf24jKt9hGl56+fNysOeSqokL6BYNWm33UGvB77KW7KVEQhC2intkG0szqdlgDDK
fXDiVzIITfjsR4FaFW6DDucBhPDi8qgHgYJ/Re+PW9+L82oy6VV58+2HQzHpJSrA
sbLrIN+b0YhqFNxN2IcU90RIEagiARtzfnVeY2bXli8E0Gyi07WjoNZ8JgA6UobK
0V0JKqr49NJAGZCNto2wfS38TngjDZBByw4onZ0JxZB+hvq1ihXSDa+o4HO6yLBI
LBvm5jgx3QxMgcArUTo6MNUZt9QXozeTz1+bB/asoSZPuv/slroeBoej9yFfs59d
YsmTbPlxqZyGB1Zx61lyHmlBUQmvWHW+1O1tJnQX+rUj4Ft4lFV4zKsvj4UTkhwD
tPO5EGi8EpGdsj0rkIppzuSHpPcLfbvsYtZu3tWTwLcgNRf8fqGmUZXULHRXcGcd
+g6y0rwpTjvYANQr76eqiGDise0rH/kRExSBO2HnIBOeAumgceq9fmlIaoPK/5VN
TaSLvi59tZ/Vu+hiS7x1BqSjU5D+4VxFCieoBFVc0sTQdVMl7RBd+pvQG3gmNirO
NKeBlL8nmUw/zTZiv8K5fg==
`pragma protect end_protected

`endif // GUARD_SVT_MEM_DRIVER_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Etix+30Ko0E+JiiCBRZhCpTLeXdXLPSfMWQorlITBTKSNdZ3V+MKZO0trP8DzqdQ
/fQ0wsUCuVTY0e/N8bOWxB/ARxH195MZsEf+1neIWGIdcZJ3iNeI3uj87DUJCgIT
6RZaUtm4wh2tnJQiVW/dgpDAbG1NXo6Rg1N7uU5A0G4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 611       )
upGzOVfzGeD7BxOfGiC1lIYCn18bcy/s5YAnVZxX03dmnqYXd01ktl8Qq6eocvQO
KugYbvpgTiFSHCd/Kwt3C+sztJCAEKT7TunaTI1Oj9RLZfQTXsfYOQd+bj6o23CA
`pragma protect end_protected
