
`ifndef GUARD_SVT_SPI_TXRX_UVM_SV
`define GUARD_SVT_SPI_TXRX_UVM_SV

typedef class svt_spi_txrx_callback;
typedef class svt_spi_txrx_cb_exec;
typedef class svt_spi_txrx;

`svt_xvm_typedef_cb(svt_spi_txrx,svt_spi_txrx_callback,svt_spi_txrx_callback_pool);

// =============================================================================
/**
 * Defines the SPI TxRx Driver, used to process
 * traffic in the TX and RX directions.
 *
 * For the TX direction it gets SPI Transaction from input TLM port, process it 
 * and send it to the bus.
 * 
 * For the RX direction it reassembles SPI Transaction from the bus and
 * then delivers it to the upstream layer via output TLM port.
 */
class svt_spi_txrx extends svt_driver#(svt_spi_transaction);

  `svt_xvm_register_cb(svt_spi_txrx, svt_spi_txrx_callback)

  // ****************************************************************************
  // Properties
  // ****************************************************************************

  /**
   * RX Upstream TLM Put Port
   *
   * Provides a mechanism for sending SPI Transaction that can be recognized by the
   * Upper Layer. 
   * The handle to the SPI Transaction TLM put port can be set or
   * obtained through the driver's public member #rx_xact_out_port
   */
  svt_debug_opts_blocking_put_port #(svt_spi_transaction) rx_xact_out_port;

  /**
   * RX Upstream TLM Peek port.
   *
   * Provides a mechanism for external components to retrieve SPI Transactions 
   * from the TxRx. These should only be used when
   * the TxRx is the top layer in the stack. The handle to this
   * port can be set or obtained through the driver's
   * public member #rx_xact_peek_port.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_peek,svt_spi_transaction,svt_spi_txrx) rx_xact_peek_port;

  /**
   * Blocking get port implementation, transporting REQ-type instances. It is named with
   * the _port suffix to match the seq_item_port inherited from the base class.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_get,svt_mem_transaction,svt_spi_txrx) req_item_port;
 
  /**
  * Port to obtain the response packet of svt_mem_transaction type from
  * mem_sequencer
  */
  `SVT_XVM(seq_item_pull_port)#(svt_mem_transaction, svt_mem_transaction) mem_seq_item_port;

  /**
   * Port to obtain svt_spi_service object. */
  `SVT_XVM(seq_item_pull_port) #(svt_spi_service) service_item_port;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the SPI Transaction is first initiated (TX) or recognized (RX). */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED;

  /** Event triggered when the SPI Transaction is completed. */
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

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  `SVT_XVM(event) EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

/** @cond PRIVATE */

  /**
   * Response packet from mem_sequencer
   */
  svt_mem_transaction mem_rsp;

  /**
   * Mailbox used to hand request objects received from the item_req method to
   * the get method implementation.
   */
  local mailbox#(svt_mem_transaction) req_mbox;

  /** System configuration handle */
  local svt_spi_configuration cfg;

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_configuration cfg_snapshot;

  /** Shared status object which allows components (which each reference the same object) to communicate state changes. */
  local svt_spi_status shared_status;

  /** Methodology independent driver for the Transmit-Receive features. */
  svt_spi_txrx_active_common common;

  /** Methodology independent callback container for the Transmit-Receive features. */
  svt_spi_txrx_cb_exec cb_exec;
  
  /** Peek Transaction */
  local svt_spi_transaction rx_peek_xact = null;

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************

  `svt_xvm_component_utils_begin(svt_spi_txrx)
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
  extern function new(string name = "svt_spi_txrx", `SVT_XVM(component) parent = null);
  
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

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

//vcs_lic_vip_protect  
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
F4YThiJQaz1qFau3nCvE1wNDkIlFRS1l9S+wBFc48ps+F1VV2W/6UBWTairTYhCK
JIa6MJuwbV1IkthdaMAmKCTjGhWW5Xjom9SH1bnHbIwbwNDxHz9nXA1DCAO2Ml6E
uhUlatbM0tfBi1GEf5ZdYiklaw5P94kGUcj3JL6sXqnBsKscn3uHUA==
//pragma protect end_key_block
//pragma protect digest_block
BOY5TDKiD16onqWGb2KHjX6gGF4=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
tEhExjpw8yW2QESrshtbRcO5WgE=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * This task gets svt_spi_transaction sequence item from the sequencer and make it available
   * to the common driver.
   */
  extern task consume_from_seq_item_port();

  //----------------------------------------------------------------------------
  /**
   * This task gets svt_spi_service sequence item from the service sequencer and execute it in the common driver.
   */
  extern task consume_service_request();

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction descriptor
   * out of its TLM sequence port, but before acting on the SPI Transaction in any way.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void post_seq_item_get(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_out_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_out_cov(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Tx Path.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Rx Path.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has finished tranmsitting its last data bit over SPI lane(s).
   * This is used to update the data content dynamically while current transaction is in progress.
   * In Master Mode, additional clocks will be generated to transmit the new data bits.
   * Data driving to remain as it is.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest. <br/>
   * This callback is currently supported for SPI-Bus mode only. 
   * Only svt_spi_transaction::data and svt_spi_transaction::data_frame_size fields are expected to be updated by User for this callback.
   */
  extern virtual function void load_tx_fifo(svt_spi_transaction xact);

//vcs_lic_vip_protect  
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ssdjBwIzbQ6x++qAVlh9X8KL1KIVNf1neWF+ei1SmV6nY9GTRt4CpOot9OJlhszI
j/yIM0UjSk/uHpCR5gNuqJm+3TxkHLdusoCjDxsm7/gqiK4K1Tn8XddiYtb5nebN
ydyznXmaGjwAUm/Qc5XuSGfKBfyXvuqWzgSuaQJHzFOOiTF23bjK4Q==
//pragma protect end_key_block
//pragma protect digest_block
vrY6H8h6SBGNmMJqqvguKyPhV3Q=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
3pCHmu1k+5MJbnW0kmog2BN6CEo=
//pragma protect end_digest_block
//pragma protect end_protected

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
tXokd2jXjCwmEDAFOL61ktvhOzaRdLZPIiKSbSe41Q5I0kiz4xmUijpLy3MLdQD0
gESIuOOGU2ldZwx+c2Bqt+IZQh1Z8K581DTy1owNp9+Yp+TGuCizE1Vm1nC3TYd4
uErzt2Hz4UwAjr343CYDcvfY9nKtr60c3vdMWLwc4y3vmV6S1T0DQA==
//pragma protect end_key_block
//pragma protect digest_block
pjF7S9By7TLZ7KkcvDj95QVonQ4=
//pragma protect end_digest_block
//pragma protect data_block
4fftj2zbPAtustV1CVZZNPpXTwwTbzylApYc287JO7abuYQjdqUACt8uWu5W/C2H
gLViDj6CDWF/40mHzEHmoYZU3MR0j+Cy2wwLAYLjWz8AWNDPiiIrRnetLcD/RAgw
sITo3VYKa+uLCEO9bHd4bz2RnpDWGrk+csp77nQixTDuGtR386c8durCCrFjbBFG
IUlZ91O+MJ33g9a+H68l7dbtHqugczdWF8lInzLNF/SHl3uqz0OQaCR+O80dWi29
//PuPADpTnp7g+atWMO3BLap26dP0K1FWL0pcERLGJrQcsPYzENfR6jT9KdY1Pm/
mJwXTQ8dM80ZluRhbq25IhQlAKQZUoyubnJWGZ3NAuliqdA0Y2kwkC5WmO0jDp33
Sr/g2C0dkOPADlpSYFxvX4Qixya5d207ZR9hZsexbtzgiM9hO07oI/Ojokk7Jsvt
sDeBqSyh8oZow+y5qKsTxJO1iy6PaDYAZQ2T+o6N3rc6+gHoizV3kE4dZZdss5L+
SmVlH3tyfsw3abwLk7vE2KgoZHdmI4VjkM7DZbi6NNWiQnv7zM8OXB7LlksRCbP/
JKRLdRib9ZDLaWXreqysKkms16v0X1x/IvcGBc3k+IqxvS140YPWDbUiETmSdUMT
Fllysl+e1lnYwSQWg4gEPp9pjmX0prirHVRF1b0f6igCIc3xRUUsUklF/YGWcIjY
akgpUFy8zZbCJGD6r0q7+GCW4F+bKgmFCYjzjk4lY4jq0c1i4VhIVYf6e1M8WYCX
nNyGtq2AVQ5ZxUGl+IGQNISfoMMBlhzpM3qPCU0ILMlGKIw5dMvpm8TjOG7tgjU4

//pragma protect end_data_block
//pragma protect digest_block
90ey3OfXxCOTmMi9MZanNWZ6vj0=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect  
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
8GIaiKM1UyaEtkVgn38awZF5N2qC+4oR3cHOuJh/+5569JpTzHk7nWaZKVApvvAB
Piu9gxm07emwCPs1Np7wM/3VX/8bQO6QmD0dkIkCeerbTInCupmriFHt2jAqMwCV
FKdcEcvwq8VvAfmvqrv7sCM++VyqmErOmyczTEc/COuL+uobzkWPBA==
//pragma protect end_key_block
//pragma protect digest_block
6WLM06QUo+JLIb+fB9gg3oKd+YM=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
3pf5Kfqr3bpHvvrKcYnRo2boLgw=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_UVM_SV
