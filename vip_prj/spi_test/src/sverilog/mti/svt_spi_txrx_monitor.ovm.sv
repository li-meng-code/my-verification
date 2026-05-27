
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
typedef class svt_spi_txrx_monitor;
typedef class svt_spi_txrx_monitor_callback;
typedef class svt_spi_txrx_monitor_cb_exec;

`svt_xvm_typedef_cb(svt_spi_txrx_monitor,svt_spi_txrx_monitor_callback,svt_spi_txrx_monitor_callback_pool);

// =============================================================================
/**
 * Defines the SPI TxRx Monitor, used to access
 * traffic in the TX and RX directions.
 *
 * All transaction, regardless of TX or RX direction, come from the same
 * source. In an 'active' situation the source is the driver, which is
 * processing the data up and down the stack. In the 'passive' situation
 * the TX and RX traffic comes in from the analysis ports coming in from
 * the lower stream layer
 */
class svt_spi_txrx_monitor extends svt_monitor #(`SVT_XVM(sequence_item));

  `svt_xvm_register_cb(svt_spi_txrx_monitor, svt_spi_txrx_monitor_callback)

  // ****************************************************************************
  // Properties
  // ****************************************************************************
  /**
   * RX SPI Transaction TLM Analysis port for Monitor.
   *
   * Provides a mechanism for retrieving RX SPI Transaction recognized by TxRx
   * Layer. The handle to the SPI Transaction TLM analysis port can be set or
   * obtained through the monitor's public member #rx_xact_observed_port.
   * Used in passive or active mode.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(analysis,svt_spi_transaction,svt_spi_txrx_monitor) rx_xact_observed_port;

  /**
   * TX SPI Transaction TLM Analysis port for Monitor.
   *
   * Provides a mechanism for retrieving TX SPI Transaction recognized by TxRx
   * Layer. The handle to the SPI Transaction TLM analysis port can be set or
   * obtained through the monitor's public member #tx_xact_observed_port.
   * Used in passive or active mode.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(analysis,svt_spi_transaction,svt_spi_txrx_monitor) tx_xact_observed_port;

  /**
   * Blocking get port implementation, transporting REQ-type instances. It is named with
   * the _port suffix to match the seq_item_port inherited from the base class.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_get,svt_mem_transaction,svt_spi_txrx_monitor) req_item_port;
 
  /**
  * Port to obtain the response packet of svt_mem_transaction type from
  * mem_sequencer
  */
  `SVT_XVM(seq_item_pull_port)#(svt_mem_transaction, svt_mem_transaction) mem_seq_item_port;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the transaction is first initiated (TX) or recognized (RX). */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED;

  /** Event triggered when the transaction is completed. */
  `SVT_XVM(event) EVENT_TRANSACTION_ENDED;
/** @endcond */

  /** Event triggered when the SPI Transaction is first initiated (TX) */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED_TX;

  /** Event triggered when the SPI Transaction is completed at TX */
  `SVT_XVM(event) EVENT_TRANSACTION_ENDED_TX;

  /** Event triggered when the SPI Transaction is first recognized (RX) */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED_RX;

  /** Event triggered when the SPI Transaction is completed at RX */
  `SVT_XVM(event) EVENT_TRANSACTION_ENDED_RX;

  /** Event triggered when one beat has been Sampled/Transmitted at SPI Interface */
  `SVT_XVM(event) EVENT_BEAT_ENDED;

  /** Event triggered when Flash Command has been Sampled at SPI Interface */
  `SVT_XVM(event) EVENT_FLASH_COMMAND_DECODED;

  /** Event triggered when the POWER UP Sequence is completed . */
  `SVT_XVM(event) EVENT_POWER_UP_SEQUENCE_COMPLETED;

  /** Event triggered when the POWER DOWN Sequence is completed . */
  `SVT_XVM(event) EVENT_POWER_DOWN_SEQUENCE_COMPLETED;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  `SVT_XVM(event) EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

/** @cond PRIVATE */
  /** System configuration handle */
  local svt_spi_configuration cfg;

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_configuration cfg_snapshot;

  /** Shared status object which allows components (which each reference the same object) to communicate state changes. */
  local svt_spi_status shared_status;

  /** Handle to an abstract common class. This class is extended in two different 
   *  classes to implement shared functions between the driver and monitor (in active mode) 
   *  or monitor only functions (in passive mode). The containing agent class will construct 
   *  the correct extended common class and assign that to this monitor.
   **/
  svt_spi_txrx_common common;

  /** Technology independent support for the Transmit-Receive features. */
  svt_spi_txrx_monitor_cb_exec cb_exec;

  /**
   * Response packet from mem_sequencer
   */
  svt_mem_transaction mem_rsp;

  /**
   * Mailbox used to hand request objects received from the item_req method to
   * the get method implementation.
   */
  local mailbox#(svt_mem_transaction) req_mbox;

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************

  `svt_xvm_component_utils_begin(svt_spi_txrx_monitor)
    `svt_xvm_field_object(cfg, `SVT_XVM_ALL_ON | `SVT_XVM_REFERENCE)
  `svt_xvm_component_utils_end

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   *
   * @param name The name of this instance.  Used to construct the hierarchy.
   *
   * @param parent The component that contains this intance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_spi_txrx_monitor", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /** Build Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void build();
`endif

  //----------------------------------------------------------------------------
  /** Connect Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void connect_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void connect();
`endif

  //----------------------------------------------------------------------------
  /** Run Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern task run();
`endif

  // ****************************************************************************
  // Configuration Access Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

//vcs_lic_vip_protect  
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
o2Lbx874IvfYCiNBszZfj5zzPV5MV/5cbPkF6pSYWFgzBN2dxQh3IZuVDfHxx8P0
D/+np3qcBWO9r0sbxPIFHHxetJ4p6Ep9E+Ef0sYKPGE+TnD7bNfBMnzvuwgcvkHE
pNB34jHE0vofmHng7bwftf7fQy1F1Ft0Zk1/RfjfAng=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3456      )
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
oM65iqZaGbsiL3aI5VhfJA==
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_observed_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_observed_cov(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at
   * Tx port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_tx(svt_spi_transaction xact);
  
  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at
   * Rx port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_rx(svt_spi_transaction xact);
  
  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Tx
   * port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_tx(svt_spi_transaction xact);
    
  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Rx
   * port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void beat_ended(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void flash_command_decoded(svt_spi_transaction xact);

/** @cond PRIVATE */

  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_observed_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_observed_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task pre_transaction_observed_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * This method issues the <i>transaction_observed_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_observed_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_observed_cov_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   *
   * This method issues the <i>beat_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>beat_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task beat_ended_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * This method issues the <i>flash_command_decoded</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>flash_command_decoded</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task flash_command_decoded_cb_exec(svt_spi_transaction xact);

/** @endcond */

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
I0+YtX1XBBEWxoJbm+8KLqVpvHuusHEe6ZuO6I66lZFElo+llIWIrJmaKD1OtZtx
AuUyqoOSrE6BdG4yXgeFyWkV4gcsAZ7JxQcGJUo0banh3zWmEpRKrSmGQGKNtzz4
ZzOL0Dzo2948f4Xwrlz7Pbahv5XV4ci7D9dAZU+YazE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3921      )
3dBSNv7qaK7kTWyI8gxWBiaRVaf976oSfte0KTzs3Uzmnoldildp9BOCXsx5YmqI
7JFO2QCNvI07cIhco0F4sYWjApCIVoc8qBPwC9uX6jDjsXHXCJ/oiaWE2PU6HYM3
GMtkX5v+o6eAR9piaYYUFa0TRAitmB+ZV6e6FKJnlP/iTwtGKJ/J7H4lGrIYV6vT
bokG99xdQ9x6//rcawZbjDPJvxcIa9xJXZkIYpfUbg+oIutmnhL83ZsrJJjyLU6n
uA0uNfRE4ZQ3TWEN6CBe5XjaCM8ViXD7UhuE6oBq11/CSi60JbwAo3Gl4CwcUMwT
zWaLJwyIXfSsqMAONmsJRRq6Nruaq67SvsDg3QT2KVpsE/5Yra/0Q4qKvWAkDRf5
2mdFWgRL/KkDQ1JRzQP5X/j5fOKJkQhTraRmh7yiaScBR07PnHfrw+TEk/Dqsd+U
RQt2EvdpnBna3n/PNSRJbZkBOKE0gtk7Poj9b6oYn5mXtV/OA3pv9z4s1LPLL7zh
kmg17e2EXNiIo88MDTSrv7EMG543K6U9RMvbM945CCAmZjQPCJaq38Q9IEYwtoNy
N2yxy7XrzD3S/P1T0AdjyTTX6mDQuW1wK0X62fsgmKNbms5jAaFwANhnSwoF1WW1
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
d3bxSUUyVrqf9OaMz3Rte3KVTCPvB3eSclMoy4bAO3+o3MiEkKQnqgU0WgAV87Kg
lDOQioOS1raRJFwor2kZ+b+n0bm/e+98X4/Vjeul9XLtlqCcIePUwEqc2qc8oxsq
7m49vMkLCpqjOMxUmtANpHOByTEbiUh5JBFWZX3PsE4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17910     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nga5sExvW14PU76Z5EZWUNEuroCMoPTVvVMkJGr/Me4u0Wwi4ZWX/ZDOcHObjnnH
9ecxMzu8z8So9ic9Xg0gZdY8Avus0cfttUPnthaSxnh+Zf+yfFNScyTv8YfCc+QD
Mnprtg37wvQmHpwlZ967Sgrc4yLNVrd8CJ6SxFOWRu0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17993     )
yUiLAlows9re1ikACJlByjEgZjU/SDWiBZwGzDJVs+a8G0vExdExGE+eO0HmdO6J
s8GrMqAsYPYMMO+neZEomvESv6dfItezeoo4rgjHJ0mKy5xTg12Xoi5c51Az97ww
`pragma protect end_protected
