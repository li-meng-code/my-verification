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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
v8AI2uUBE9lch7R71ce/CpVCrRRbZbNdgvuhNMMB4Rt9uLAjxKZ9gsW0yt+QGQHm
+Ln93Fs01CCUnGWiNmlYpTSVKFEorOrt3lt7JAj1X9W1ImluAn+q6oxNn6UDggbq
nUl9RzQzvQjwzP4O/jkd5E15+RLrF7xBSSiS6DSFlrlSvK0IwwaO/g==
//pragma protect end_key_block
//pragma protect digest_block
5fpcnhpsszQfKH3CX2DWA3nr5+M=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
G8G/j1LDbscQQXIQ9YL1t+za1m0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_GENERATOR_SV

