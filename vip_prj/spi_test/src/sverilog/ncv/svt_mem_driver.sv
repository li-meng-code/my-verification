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

`ifndef GUARD_SVT_MEM_DRIVER_SV
`define GUARD_SVT_MEM_DRIVER_SV

typedef class svt_mem_driver_callback;

// =============================================================================
/**
 * This class is a memory driver class.  It extends the svt_reactive_driver base
 * class and adds the seq_item_port necessary to connect with an #svt_mem_sequencer.
 */
class svt_mem_driver extends svt_reactive_driver#(svt_mem_transaction);

`ifndef SVT_VMM_TECHNOLOGY
  `svt_xvm_register_cb(svt_mem_driver, svt_mem_driver_callback)
  `svt_xvm_component_utils(svt_mem_driver)
`endif

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************


  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  
/** @cond PRIVATE */

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance
   * 
   * @param name The name of this class.
   * 
   * @param cfg The configuration descriptor for this instance
   * 
   * @param suite_name The name of the VIP suite
   */
  extern function new (string name, svt_configuration cfg, string suite_name="");

`else

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this intance.  Used to construct
   * the hierarchy.
   */
  extern function new (string name, `SVT_XVM(component) parent, string suite_name="");

`endif

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

  // ---------------------------------------------------------------------------
/** @endcond */

  //----------------------------------------------------------------------------
  /** OOP CALLBACK METHODS available in this class. */
  //----------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /** 
   * Called before sending a request to memory reactive sequencer.
   * Modifying the request descriptor will modify the request itself.
   * 
   * @param req A reference to the memory request descriptor
   * 
   */
  extern virtual protected function void pre_request_put(svt_mem_transaction req);

  // ---------------------------------------------------------------------------
  /** 
   * Called after getting a response from the memory reactive sequencer,
   * but before the post_responsed_get_cov callbacks are executed.
   * Modifying the response descriptor will modify the response itself.
   * 
   * @param rsp A reference to the memory response descriptor
   * 
   */
  extern virtual protected function void post_response_get(svt_mem_transaction rsp);

  // ---------------------------------------------------------------------------
  /** 
   * Called after the post_response_get callbacks have been executed,
   * but before the response is physically executed by the driver.
   * The request and response descriptors must not be modified.
   * In most cases, both the request and response descriptors are the same objects.
   * 
   * @param req A reference to the memory request descriptor
   * 
   * @param rsp A reference to the memory response descriptor
   * 
   */
  extern virtual protected function void post_response_get_cov(svt_mem_transaction req, svt_mem_transaction rsp);

  //----------------------------------------------------------------------------
  /**
   * Called when the driver starts executing the memory transaction response.
   * The memory request and response descriptors should not be modified.
   *
   * @param req A reference to the memory request descriptor
   * 
   * @param rsp A reference to the memory response descriptor
   */
   extern virtual protected function void transaction_started(svt_mem_transaction req, svt_mem_transaction rsp);

  //----------------------------------------------------------------------------
  /**
   * Called after the memory transaction has been completely executed.
   * The memory request and response descriptors must not be modified.
   * In most cases, both the request and response descriptors are the same objects.
   *
   * @param req A reference to the memory request descriptor
   * 
   * @param rslt A reference to the completed memory transaction descriptor.
   */
  extern virtual protected function void transaction_ended(svt_mem_transaction req, svt_mem_transaction rslt);


/** @cond PRIVATE */
  // ---------------------------------------------------------------------------
  /** INHERITED METHODS Implemented in this class. */
  // ---------------------------------------------------------------------------
  extern virtual protected function void change_static_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
  extern virtual protected function void  get_static_cfg(ref svt_configuration cfg);
  // ---------------------------------------------------------------------------
  extern virtual protected function void  get_dynamic_cfg(ref svt_configuration cfg);

  // ---------------------------------------------------------------------------
  extern virtual protected function svt_mem_configuration  get_mem_configuration();
  // ---------------------------------------------------------------------------
  extern virtual protected function svt_mem_configuration  get_mem_configuration_snapshot();

  //----------------------------------------------------------------------------
  /** PRIVATE METHODS */
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  /**
   * Invoke the pre_request_put() method followed by all registered
   * svt_mem_driver_callback::pre_request_put() methods.
   * This method must be called immediately before calling svt_mem_driver::item_req().
   * 
   * When overriding this method in an extended classes, care must be taken to ensure
   * that the callbacks get executed correctly.
   *
   * @param req A reference to the memory request descriptor.
   * 
   * Note that, unlike the other *#_cb_exec() method, this one is a function.
   * This is because it is typically called from FSM callback functions.
   */
  extern virtual function void pre_request_put_cb_exec(svt_mem_transaction req);

  // ---------------------------------------------------------------------------
  /**
   * Invoke the post_response_get() method followed by all registered
   * svt_mem_driver_callback::post_response_get() methods.
   * This method must be called immediately after seq_item_port.#get_next_item() (UVM/OVM)
   * or rsp.#peek() (VMM) return.
   * 
   * When overriding this method in an extended classes, care must be taken to ensure
   * that the callbacks get executed correctly.
   *
   * @param rsp A reference to the memory response descriptor.
   */
  extern virtual task post_response_get_cb_exec(svt_mem_transaction rsp);

  // ---------------------------------------------------------------------------
  /**
   * Then invoke the post_response_get_cov() method followed by all registered
   * svt_mem_driver_callback::post_response_get_cov() methods.
   * This method must be called immediately after calling post_response_get_cb_exec().
   * 
   * When overriding this method in an extended classes, care must be taken to ensure
   * that the callbacks get executed correctly.
   *
   * @param req A reference to the memory request descriptor.
   * 
   * @param rsp A reference to the memory response descriptor.
   */
  extern virtual task post_response_get_cov_cb_exec(svt_mem_transaction req, svt_mem_transaction rsp);

  // ---------------------------------------------------------------------------
  /**
   * Then invoke the transaction_started() method followed by all registered
   * svt_mem_driver_callback::transaction_started() methods.
   * This method must be called immediately after calling post_response_get_cov_cb_exec().
   * 
   * When overriding this method in an extended classes, care must be taken to ensure
   * that the callbacks get executed correctly.
   *
   * @param req A reference to the memory request descriptor.
   * 
   * @param rsp A reference to the memory response descriptor.
   */
  extern virtual task transaction_started_cb_exec(svt_mem_transaction req, svt_mem_transaction rsp);

  // ---------------------------------------------------------------------------
  /**
   * Invoke the transaction_ended() method followed by all registered
   * svt_mem_driver_callback::transaction_ended() methods.
   * This method must be called immediately before calling seq_item_port.#finish_item() (UVM/OVM)
   * or rsp.#get() (VMM).
   * 
   * When overriding this method in an extended classes, care must be taken to ensure
   * that the callbacks get executed correctly.
   *
   * @param req A reference to the memory request descriptor.
   *
   * @param rslt A reference to the memory response descriptor.
   */
  extern virtual task transaction_ended_cb_exec(svt_mem_transaction req, svt_mem_transaction rslt);

/** @endcond */

endclass

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
8VGfzU8UqxAihPqsbCNIkpXqJjL9N+Z79cm0OREELhd9upP+FLHbNsUCJOK6tR14
k9TkqFPcGajRRq1Md1z6Ng5eEuP8ayXFVdXOninNkZQUGMF03NxtKhVzzBygKxGJ
V6LbHIfPTzdZUL+4civqF6JkMw4xXnJUqkKoPZ4G8f8HuiXWDJMGtA==
//pragma protect end_key_block
//pragma protect digest_block
jUP885VlC2URzVsiuBh3CyVE29Y=
//pragma protect end_digest_block
//pragma protect data_block
l+p4j4X6XhUSUvduqGVj5pckEQvOTaPbzcOhmcJIGwvq2d1j/IZW5ZDU9zXr87CV
vitFPf8NXqTQ/dyWEQIgBHsy+skIyIeVLkDJQ1rgsPlFEgE4K1zzU73vLCU61S//
DquiMj/cLe30mNBRNsytLVuuGsMWgdrJigKofPfaAklV/ECziwF5QbrY8Ayi++4M
DD9jxgaM6dFPRCNEpWuQKqeYm50j8Rrq+aEPLFKtmbHQ2WSDzE04O+kE3iCzL6sx
PQrwMI9IwY5qoWZYGiigz4XyahhrTgCqS7qVrEliiTHcb0VkkJRFHmzQpMocknv2
PFkurWjlDSPYKx29zkrVxOTC/WAFka2m+QCDEHL8T2+8VUCPjb352KBytAtSGTAA
Fk00PwGPHoEawKNerOONTz1XWRl3sIbHaqZTiOapW05yXOIs0Q8IiHcrUb72dTY8
6ynmWIf5HyzjNfqOT7QLj5mOUeGGqV/quarhwDDF1JWPqTsFcpXHFT5hk0ZXcAvv
zLoGHCubwZ0bbEaSrpJ/i6HcUK6Imn3ITmQNR1tXYKigw2CnD+gMdxqKIYbP1yF6
usbPfBT8Urt1hvnl3/6R1R7CgVsUu0jUnn/NIVr78+AzKbGYjSZC8J3aGKcJaImM
Lahiksl3yApsVPHkKiVq5Ku2S1Gr9tvOwrT/Y7ER0p3MlT6w4uco17+3ECQG2OyF
yxddRBgKvc8NQ3lRJhn3Hdmzk7JSnxh5EjGO8PXaxMIyvUfr7SDWPJ5O0Romp3Wn
PZvVR4p6V3UBf5OGu5FTuXRPx1jO1UfBLVqx8iniPQ3eidtM17Sw9ZVwCU4VEBxX
Cd6wGSPCUKHnJY0Imy1fktyVGIFNXhau9PQ2+PsZgMsWIxd10HTDIInolAECbBn3
5C9Ibg12dQxZlhu1mzwwcyJrJmO2j4j0qLFXZ6f9IOg=
//pragma protect end_data_block
//pragma protect digest_block
cb6TGxX8T8jiSivPec9EYwJQZBQ=
//pragma protect end_digest_block
//pragma protect end_protected

// -----------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
o5+H5g/5KUXs/35wLPbtMX7SvdfTlEvvwMKSrs+uLyHzfJhqTIs5azGyXx+7iIII
DmzrTSFJkWc0by4+DqzFfYET1h1NPtU9c//tVsbKs8tunQjN5BkY6C3/QQqxVWxi
H5AScKdNPAkH94axlhXcTc7KpiFOwDsxpL0CPk46eqe/d/HY7oAtNQ==
//pragma protect end_key_block
//pragma protect digest_block
GkdDrbh/ZmY13ZtIfvFzsmFRtSE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
JxkY0UKrL4YNGfSbkNuxNLMPiGc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_DRIVER_SV
