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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
G26j0kK28l/TZ+85unkkqfHC+w7jDLzntDLsC8g0CD1y/0jF/HlEH8AX4bXB6sfV
LagYkLMh91kXN38c0GShc1CwUdvmN8yIq+ssX78EkgFZD13oLgItzmFkMIthgbJ1
i9qsHzEQKq8ksMzscN1sbsoIf1m9E26qbWbIyj9SMqo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 215       )
OF8mtsDkwLSZhIPwvN4wWlrTTdk7bv7H8HknpIzW2tttfS7vKfhaYLoa+MwRbbM1
bE9mSeuuIt315YgKmh7XOWG9BaeJHmrS0fbyovxChZH1X2cHmVK5k5yNApBbgNTV
eUsRyCj7PpiSRec3jdjJBLbhZv4+vpC2IOAZwE6jiHjP9Pldte9O/furn0Obvf7n
EKb4IR2ISvrqcECraM68GWxI/FtH6Qp1NrAZk6vCLztznA48TufbkTlEejKHx1Ob
aqu+t6LzzO3g2Avj2Hk98UZP/HjQ2a6HVk3ILGXMXr4=
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
e8eQzMghuuLz/gKT8g6pj2OszX3MVOQLnYfwJT6d6RJ1xSWAJS53C+S1bON+aTXc
U4lAkVRmuJz3jkJfjbFBG+kI1JbxqaHnykQmxeBm8E9d3rIv5gG+/lXj/WdxscVU
KaP3BUHOoFyiNsf9tlOkFdg9kmbgkBRsM6wxo3aVe0M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10496     )
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
J0VKPCJM5HMadvDP88xhxg==
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_AGENT_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fNXCwlUbI1RMHmLW0wMC7NIxmeBuRlcZTGv/fFnkzrdOh78J1gu2hJneIklvKH7v
rmHN/1qyDTZ4EtZyPy/3dI7CzmMBhRLPr5sKqPDMKixrbHuknXw+y4rTDuEy2oML
IXKSUdp5CvUSWrmJnFTpSuIyL4OxFBE+XH65rElls7c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10579     )
KPcgr42Inq434P+QFAcNKdc44zV2xCsCncWMABmbcAUFO+KC7ONUUm0PBpOgoPB4
Sdu1ZcPvPysmWrW70012jE0pfkGdDC7mnSJiGpXNz4rVzJLbfR5MYwiOz4ScHHNP
`pragma protect end_protected
