
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
HW+ait6vOSijbrME0twsQhFK6/jRstSqf2MQyrqdgweC133HoYCwZr8G3CV35Pgn
oEhVcVTP25ylMrIH76fKVBj6k7nZWuGDd+m3zyxcOtnD04foxVKLU+gM1HXmaCnZ
Wis0BQtQ0v/P0sWdP4dC0YL59Vw5U7HmKUfw2Io+UHnYxY5c/b4Lgw==
//pragma protect end_key_block
//pragma protect digest_block
ftZsciGd2vJ1aI+dnCg47ADpVOM=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
YGwhqR+4TCh8Pqigj3hCqdFR1jg=
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
j3DBWTiWO9o1+8fBjNaWotEsYMSTDfOH+jNW7wh6AHTFZCqbnOT2mZSEB5N7X81a
g7p31YT0xWvVhsSdBrnPOlz1xiVOC7YLgNXU1kISK0JHUr8G1IzUKNrImj/21jvk
yu4H9buCMWRUxThAJsrSvpPGXK2drF1OoEr3HSTCngNq5xwbmEuzXA==
//pragma protect end_key_block
//pragma protect digest_block
AFWR6NvsOpBbkqikfszVAM/MJ80=
//pragma protect end_digest_block
//pragma protect data_block
XBP05CrrApCIL9WyKInhJ75kgL8IMrsskSyGrGJ0ZUDtbs7kysy9hPzlucXFr2hZ
nsifCxcVHb8bzJX4KXT5pXQLOsA9CvhvY8170D2CP1mdjdMLakKE7LrvcUw2Zxiy
haa/dnwn5P/aUn1KHBMIfMp1B4Ou3iU+CuwuaD+oTzvNH6pia+mNow5OzbB5Gamh
6opm0Z56OF/QYHnGvNgeQqj7MXLoK6rDBeXqV7UTgKkUkc8HNTajkE3VBWFx+hux
QwDxi65pWfsYCZ8wYzwSNSBgLvZhX4PmN8FrF/mKV4yDxmqQZOM/hQ1dASMmhOeE
wFjNI1WSCqJWXDZZM6vsEs46uESVJYrZ+GuzmHAJJfSK9ILq7ceFXn1BpDrAcYRt
inpMbdd6BKQyR80/FS9mkmYPGDCDLpypfOn6iXB2ECcqDwe5A5TFrz0wEqkpFetn
vYoOPt23dF8v4O84EtvJ3+hVeEMucTgdrTXtvBdTcg+W9uyFTQUSE6lTv/SgTqrX
lTaaoqKuo2IvbJDZwxPWKF+iJh/bGv6buSrHauVUX3wTjW9rYBL0ba92/2Ixc62P
mf+p/JOfBnyMGR9dj6z2Yw0d/MjCqUM+SUtvVgNggD+LYD1J7kVVY0C/moCn2idF
qfUSmb3jaNO+tJKtXcuzz/Md/g9Jvcx7B4EAUL+paDmHx16n6PsIkcoCrcSnBnwt
w/72Nqg29EpWFpzDO06M8Eo9+By1RdmCFcaLtm8JU39vox+O8FlYqUYFb4Pog70N
E3IJghX+IFxXq88vUdcAzYHoXie7xjSlP2hXgxdTBGVp/cNpn7kn2Vlfgpl3RgFv
WP761rvKogXcrHlvqYkw+Q==
//pragma protect end_data_block
//pragma protect digest_block
8wdlxmD+0nunk7GW54zRzGwl3AU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
jN0rwt1Abv4DEXQurN94G+DcdUO1DT0MgLDa0U35HtSFzoieH7Vt3FB4ko51m0iZ
mw4T6uYIYd9TSJfad229pw55WZG52RjRYOuWJQOnWqh5bXVRm3a4rBi5rFJQRjuP
VyQUUiftM4SvtKyrJvjyMoe2wX0+KGm7jUkCY8UMU9P0rIQiBW62FA==
//pragma protect end_key_block
//pragma protect digest_block
w2aV9jsni88DBHW5ChLx5ut9oO4=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
ObMae8Y4vKAe/496HWw10zIxnq4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
