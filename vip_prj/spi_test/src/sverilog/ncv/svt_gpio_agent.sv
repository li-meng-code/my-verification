//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_GPIO_AGENT_SV
`define GUARD_SVT_GPIO_AGENT_SV

// =============================================================================
/** The svt_gpio_agent operates in active mode *ONLY*.
 * The svt_gpio_agent is configured using the
 * #svt_gpio_configuration.  The configuration should be provided to the
 * agent in the build phase of the test using the configuration database, under
 * the name "cfg". 
 * After transactions are completed, the completed
 * sequence item is provided to the #item_observed_port of the agent.
 */
class svt_gpio_agent extends svt_agent;

  // ***************************************************************************
  // Type Definitions
  // ***************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** Proto Driver */
  svt_gpio_driver driver;

  /** Sequencer */
  svt_gpio_sequencer sequencer;

  /** Analysis ports for executed transactions and interrupt requests */
  `SVT_XVM(analysis_port)#(svt_gpio_transaction) item_observed_port;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
/** @cond PRIVATE */
  /** Configuration object copy to be used in set/get operations. */
  protected svt_gpio_configuration cfg_snapshot;
/** @endcond */

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************
  /** Configuration object for this agent */
  local svt_gpio_configuration cfg;

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Mysb/5gwPaNCNSE65Q1af8yBUTyX5RxMWyyEilpdRw5EIqHNlIl68Z2tkxLTZgD/
aHAVljrXj3wXO2dgJg+7hgMFwn7bMuvjnGvuccTppzFR5WXdbQ0YoqH4Cq40dt77
SMRi8mPQKBYy9LkLCDFvHVf1iNFv0mnwrVclZrk5gMUdVV9Li8S0YQ==
//pragma protect end_key_block
//pragma protect digest_block
R40o0dqQwNpfDy6Hi/2Jis0Q2p4=
//pragma protect end_digest_block
//pragma protect data_block
gMROABXPE32U8iI+oedeJOu6Y9hzjpqgdMM/PRku5zDBgrFDzyRCM8DyBG2PYKKM
uz6StpMvG2J7Bo/XWOHot7pDxVOU4XULDrLJKFCugHjYaYNYlAs1d/qHfACWICau
ZNr5WO4BO1pHXFr+vCjACYJqwNXGjIOwdFIdmLVw5myGwZhNA4Iva8uqvr9yKH5b
PaoE4wyklk8lt4oUV6QL4ZStJxiFHBDN1QGxQlx5UYEWJHEqEqq/E93cZ+YLmymY
C8MIXvLEFVt8JghxfuIc2Ct8poviXL/30PS+Q4xfzRsymxK9rDeo4/8hWzLHIZ2V
K8ea7b/PMqeEHosedjVm89TqVDXMFm2bn9rrbVSv2y6+Gxsh+1iFoqtQWiRkcLkt
Ro/zVPS8j1CjVqbFbF9tSFSAeFxUYsG10EmPUw7qEJMGIp+PhSpsGOzQ5xTssxFD
AC5xpqKKS10RDByzRgTFI5pNPRyGy9UeEn2+ToN+gMEji6DACqR9DhhTmeTp/GXE

//pragma protect end_data_block
//pragma protect digest_block
sEM89MblYSZdSQvY+DXniyeWrFI=
//pragma protect end_digest_block
//pragma protect end_protected

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_component_utils_begin(svt_gpio_agent)
  `svt_xvm_component_utils_end

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************
  /**
   * CONSTRUCTOR: Create a new agent instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this intance.  Used to construct
   * the hierarchy.
   */
  extern function new (string name = "svt_gpio_agent", `SVT_XVM(component) parent = null);

  // ---------------------------------------------------------------------------
  /**
   * Build Phase
   * Constructs the #driver and #sequencer components
   */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void build();
`endif

  // ---------------------------------------------------------------------------
  /**
   * Connect Phase
   * Connects the #driver and #sequencer components.
   */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void connect_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void connect();
`endif

  // ---------------------------------------------------------------------------
  /**
   * Run phase
   */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
  /** INHERITED METHODS Implemented in this class. */
  // ---------------------------------------------------------------------------
  /**
   * Updates the agent configuration with data from the supplied object.
   * This method always results in a call to reconfigure() for contained components.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  // ---------------------------------------------------------------------------
  /** Convenience API */
  // ---------------------------------------------------------------------------

  /** Execute a WRITE transaction on this agent */
  extern virtual task write(svt_gpio_data_t data);

  /** Execute a READ transaction on this agent */
  extern virtual task read(output svt_gpio_data_t rdat);

/** @cond PRIVATE */
  extern function void configure_interface();
  // ---------------------------------------------------------------------------
  extern virtual protected function void change_static_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
  extern virtual protected function void  get_static_cfg(ref svt_configuration cfg);
  // ---------------------------------------------------------------------------
  extern virtual protected function void  get_dynamic_cfg(ref svt_configuration cfg);
/** @endcond */

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Eeg59pQVIH2UEWeEZv9JdgPxLpnwZ6zEzGLhbjVJidweRBcW0t3yBpdLYM/IOV9K
hnmRGGENyev8NlE0KOefGZap8vVM6NwsvBHsnaYTeVgfpXLZjeCj9m3cmTPWXjf5
CehD/KOPbRd7o8Ji3ER2FyTH8/ntgF3VBikKAYeoEg/KnjTm1cT91w==
//pragma protect end_key_block
//pragma protect digest_block
tjduaWH9U/uVaRT9sGHsalJfBmA=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
/2AUfjDh1JBJ6FOsG2ndT9I7Z9A=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_AGENT_SV

