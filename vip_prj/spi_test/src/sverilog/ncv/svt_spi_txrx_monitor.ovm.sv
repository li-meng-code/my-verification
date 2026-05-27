
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
JUZZJsB0GXoOFOHjetquy8xKqH0iqLhqwBF6DCqTy0gaePw3yNHr87KUQn5IA525
4UBy/7D7RMKfgXvZzAQ0VPzraILEb55jcFUe4QWwROHkn4lpL+BVFEhe5C0zb3gy
frTVFLjTFoopk212KZVAtNhTz0ZYz/HKt2oB3VQPtEdSFdBPJXbIDg==
//pragma protect end_key_block
//pragma protect digest_block
hitK7l550juiSfqhRHAYW6/HRvo=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
aI8ecWWe+IjLbf9lYL+qW66Fdwk=
//pragma protect end_digest_block
//pragma protect end_protected

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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
V1ZBNyfBKljJ5m2bYum9RV5nkJKF2oFK2aGS23OtAPTwdNun+BBcrdmy3i6HOcW0
IuHNzQULvs7ErKlKgP4OqGQ77SGfFlHHceYiU1mxSkoy93PmQGvrS9KNBqStZQsp
UdFtQ7+2CKUsWdAWi7AeuIR2HQvKCAG+Sz/7/hE322gdQ1Tu8OHqsg==
//pragma protect end_key_block
//pragma protect digest_block
E4RnyA8eJf7QpF2PrhOjib/reV4=
//pragma protect end_digest_block
//pragma protect data_block
o4ScnBOAEb34FIoPmTCFPHJNpwmk3zG0LxKpW8mcN+AAcAFkGS47nt8/TVY7ZpvO
3zaVwa+RuZJyoBOiKWkPLnsLwFE2+CWv0I9+I2qZ6Jd5klNnoyGuI6ibcvnjXZYk
Rb0B/vEfWwNSiM58icVmVyS2jN0J4N0kxfCGt6GwIJ7cO+w5Xzom6iXPvH9Tqg5I
6tyI45yCzeL5iZteEXhhiIL2uCy34ImULiQ7xICqn1wL4YL3umefGVmI0joYV8vX
hTrs5FOF/VwzXdcIrvAHWHr8pZTR+dizCB33OEFmvQ8gJIdBiq56zySbM432H2nl
snf3fEDHkgDs3YZid3qt9O3o6gyBb4PmB8kIjZjGMa3D77eQdeYRBhrchd1lNVGr
dra5C5hnqFX8o3kGmT29RuihQr8STCGoY3CgzRY03aFxA0PDLa+6ULRdlVdoQJYl
yDBHZoD50/opRJ/w2U53UVVPlvkjMPOX40Wi4wHDL0TEh3JqbNMY3oP/8uHypT0E
zaR8aiFvVr7dyX7BVN7HKnpD3XXk6i7RbE4uv+SZVJDm9Gv2vDh8DrASmrHPQ488
wMNBwiNP71bAUwPG8vB5/YsEpVqQKY7QyDuWbfJXqRbgDEwZI385V/9piltAPc1h
sBXJr/0g8OhEWhyp77jAt2UNSp0w5HKFMabXfVOiUWNGYZJbPsyWsF8FlIoP/h92
0R+g/6fX9hGiNnevHK18CKdoPAf1PA78gMyBmXezEpPYlGVQqTgstXO4LOECHbkx
/OBsu0FuFBqc5Ys1Ud3vRtLhsiJuaS6Pd/SMu9qaIgmVc6Qm/898FNMNGu9eY2ix
v07uozWNV3tNN7ftnuEjfg==
//pragma protect end_data_block
//pragma protect digest_block
PdH2rCeKA/It9nTSgZVNgf5/rMw=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
PGg/mVWAt6taA+6NuGj+I6YBW6HSbeDZbCy0g0bCZiXxBGNTfOmnI9lfo1FDBfk1
NPe7fyMa/yRxigHIDbRAkKv/t/5xwxczEMb0qG65GYz0v4lUIMP0MlrDNz91vKm2
h5ctBUf/lS4A9lcMaX3zxer3x0DJ9AGp4Xd34hEdkiboYtDS2qeUhQ==
//pragma protect end_key_block
//pragma protect digest_block
n/SBHhZ6QO8GMaxPwcStFpkIu0E=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
UiH27ZvtZfRH+8kmebb1bf5KkYA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
