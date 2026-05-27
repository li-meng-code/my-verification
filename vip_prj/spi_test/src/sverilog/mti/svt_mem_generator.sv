//--------------------------------------------------------------------------
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
//--------------------------------------------------------------------------

`ifndef GUARD_SVT_MEM_GENERATOR_SV
`define GUARD_SVT_MEM_GENERATOR_SV

typedef class svt_mem_generator;
typedef class svt_mem_backdoor;

/**
 * Callback methods for the generic memory generator.
 * Cannot be used directly. Use the protocol-specific extension.
 */
virtual class svt_mem_generator_callback extends svt_xactor_callback;

  extern function new(string suite_name, string name);

  /**
   * Called before the memory request is fulfilled using the default behavior.
   * 
   * @param xactor Reference to the generator instance calling this callback method.
   * 
   * @param req Memory transaction request that needs to be fulfilled.
   * 
   * @param rsp If not null, response that fulfills the request. If this reference
   * is not null once all of the registred callbacks have been called,
   * it is used as the actual response instead of the response that would have been
   * produced should it has remained null.
   * 
   * In most protocol, the response is the same object instance as the request.
   */
  virtual function void post_request_get(svt_mem_generator       xactor,
                                         svt_mem_transaction     req,
                                         ref svt_mem_transaction rsp);
  endfunction

  /**
   * Called before forwarding the response to the driver transactor.
   * 
   * @param xactor Reference to the generator instance calling this callback method.
   * 
   * @param req Memory transaction request that was fulfilled.
   * 
   * @param rsp Response that fulfills the request. If the response is modified,
   * the modified response will be sent to the driver.
   * 
   * In most protocol, the response is the same object instance as the request.
   */
  virtual function void pre_response_put(svt_mem_generator xactor,
                                         svt_mem_transaction req,
                                         ref svt_mem_transaction rsp);
  endfunction
endclass


/**
 * Generic reactive memory generator.
 * By default, behaves like a RAM
 */
class svt_mem_generator extends svt_reactive_sequencer#(svt_mem_transaction);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

/** @cond PRIVATE */
  //Memory core
  local svt_mem_core mem_core;

  //Default Memory backdoor 
  local svt_mem_backdoor backdoor;

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

  //Generator Configuration 
  svt_mem_configuration cfg = null;

/** @endcond */

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new generator instance
   * 
   * @param name The name of the class.
   * 
   * @param inst The name of this instance.  Used to construct the hierarchy.
   * 
   * @param cfg A reference to the configuration descriptor for this instance
   */
  extern function new(string name,
                      string inst,
                      svt_mem_configuration cfg,
                      vmm_object parent,
                      string suite_name);

  // ---------------------------------------------------------------------------
  /** INHERITED METHODS Implemented in this class. */
  // ---------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * Return a reference to a backdoor API for the memory core in this generator.
   */
  extern virtual function svt_mem_backdoor get_backdoor();

  //----------------------------------------------------------------------------
  /**
   * Return a reference point to svt_mem_core.
   */
  extern virtual function svt_mem_core m_get_core();


  //----------------------------------------------------------------------------
  /**
   * Returns a reference of the generator's configuration object.
   * NOTE:
   * This operation is different than the get_cfg() methods for svt_driver and
   * svt_uvm_monitor classes.  This method returns a reference to the configuration
   * rather than a copy.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * perform svt_mem_core configuration.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

/** @cond PRIVATE */
  //----------------------------------------------------------------------------
  /**
   * Fulfill the memory transaction request by executing it on the memory core.
   * The response is annotated in the original request descriptor and the
   * request descriptor is returned as the response descriptor.
   */
   extern virtual local task fulfill_request(input  svt_mem_transaction req,
                                             output svt_mem_transaction rsp);
/** @endcond */

  // ---------------------------------------------------------------------------
  /**
   * Cleanup Phase
   * Close out the XML file if it is enabled
   */
   extern task cleanup_ph();

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oh5jdm7WEUTs3OdVvDjNkerQ3ZmUsTZtW9QCKTEqiBbHCMt6mGA1GDrHxmikwBZe
vr6n9uLPKuXxw3WGK8TCGZYSrsnyUg06mPnj4c9u6PsEHwnTJxV4C1XuKLJn4nf+
njI77AAcXWo4VeavsbIXSl/1Z9iAuqd2OoZM0FGcWxM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3191      )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_GENERATOR_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
kLaKaT/Avls0NYpKnCIf6JQKYDoqfG+Kya+eq7V02p5HfmuETevPXFK3zAS5OXqu
Kvw0CiFdRz3xSP1grcnPfRrLoRDzl1Td+og0k0l0tW25mpUadfJaap6bLUafYNHp
eXja5b/Qy82BsH0ozbDhzMPpPdQtPdJJRVxZZEA4qUQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3274      )
8HPRQlsSUrF1m0H4IRfYAVS6UHrnffPyKX8fB+2wWUI8yIVilUni5PsPvPkcnW8i
9wKz/dztk9h9SnM5oeOYHkObe9mKG5hBzK562XN2X6hnnYO2z4CZf43AXvmvVGY5
`pragma protect end_protected
