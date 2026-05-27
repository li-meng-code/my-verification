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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pgHRfDn4YWWEZKzNoYtAWwzZzq0lvQ4Yj7JVRwikWY+9SK4m24wlizsEkosyWDIp
qOKkve4Eddh1nBy2JVyYRe0BAJ8Qe/xRqTyB3ztqzHHwd5wJJLJG6CaOiLUIcb0y
+xYoRS2jsklYQVME1nfpEpalHdRoHEktxMvZrpRVy1Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 527       )
nv3I/YIx4pLXlvmCjQUFDb3vaAuH4PjfR9i+CujVPRT7+nZsopUuzXBq7z6mdRLz
/J8KT4RAk2pWJHzOq3FVEzj5n8AjvOwX1B7VRbKm//m0/zV5xMI0KBd2ZHy+5KN+
7LzFISptQxXpQAj6M/odUXY4+osm9kaJ0OXDVtDP/nwI7/Th0IWs5ybQvtyFHZc8
J9Uzsi/o38ZP+zsKORqczDmZ5IuBARNl5RTlOFw/kEYFa78iN/fYJsTEHTdI77k/
09+LKoLxgfUStOiVoHFAydon73zMqhygT9W6y+wTHxl3o8/eX5bvlzH1Ggx7v+Ka
RvX4RTRlrQlQ2FwLyjy/CHOtjqt+CdXFJMdqZjwm/heyj2PHL4zlFrycCjGFyySW
xvjstrOrEGlRlqW4QL71nTOKpNGai5nWHH6n12E1pOCjjN7zVuKFrKFPZ12xiqw/
k39RrAmCIfHE5NbqZND+E/zFqzK0BVxz/LZwp1N6Vrcsw7FkZZewTDG4Si4x5T9q
y5zDp6JvFOCH4Huoa8NmIV5VYERKRgT+dkR4x7UoI1DSR3lM7+gONks3qd6zlwRe
tKBaNoJEfAwt46ThqkO6IgHaZ+aEOy09PzvIik9nqU+0+rPa5d6JBRaP7XgBtWPl
CIbPHPy00N/WQUzox9DELowcjgpEPbKCPMFkE7YMvP76Oe6Qn1vWOcDIprw8/jj+
`pragma protect end_protected

// -----------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CnFvCOrPGO/QxptLllt7O1V5pRaaCbh9PAifSoShFGeL9495diNRthIahGfPU8+D
y3xDkIIqEJbXIkb3P6+8b46rb1M9mT7z0xJVk7oXUtMMHLlJGdUh96LuWvctcL7I
DKYkErw71Z1+ZzcTfOdv29SH+fPDFr/s4XxuKwxHwJw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5591      )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_DRIVER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Xe2QybtApU9Sa45y28QAQ2YgrewUJlQ9PFO7aKiWWLtJbdZq5AvHTynzhp8qNbZ0
g08g6iRufTqM36HUkLDAzq4cBPYEE7VT4SXiFt5/3hm6tu+5HedztyUsLhYkApZG
f4v/nSwAKA2yoMPhN2vQAhBJvpYyMy3naCp74MyUmUQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5674      )
pLACvpW7wTHOgywWIBU81FdSRQj+mtXcMRvVE5rTjW11ZnpzP+7be3SPLXVfoMxU
gk1rxeioDt5qaZwZLlDvW2c1CRlMNZgsQ6/5qDMwFlobzG8FR6wyB4kzZrL9apTH
`pragma protect end_protected
