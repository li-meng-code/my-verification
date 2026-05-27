
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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XpbSxk9Po05U7/sgKeGVG/9nQl+ejs0mFlc/z+lFDx9Y/eO/4glMs2kAZpZNcJ34
m+mN/DuTA/SRWNpXS7x3X9eBb+iqrzAKE0WHunyOumF0yuspUmU+DsJqRWWp/wBm
hv37yt3nZ1/WJTKHgMP3ZHiFXZJR0z4ShuDCpafGyQ8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3098      )
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
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Mlw9pCvYf1T0LTVm3t0ni/sS4hgGKRIyJUWjwcPILgXwucceBB9dxrKQ6yLhE3wT
i7rJVf3T2JG+3SsnLrh22VJOXB8jxjFubC+ZROBGbqvGnp/tojrfZuYk7VqeJSkT
J0gekzR2gvQ8gvjLddN2fcZPiInvCdNKnTotlv4LJEA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10262     )
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
7icgI3Mu0MQd/9PXwosF7g==
`pragma protect end_protected

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YgTflRZKJNmDLgHuPN+/oOmvZdmLOCi4eIl+mRh0yYAl2tK7HPXZKItADRNyNI6z
b2D4lDnZiNudnyRRrDyFyn/Jky85kjif25g+GxWA2PeeY/tIsv1JpWJ+Xk0c5sn6
jyWxRKtPa+MrD9UQ14vLPFSaRKrscyNnz9YO65sDE60=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10715     )
/Ded3TxL/plw+ppJzkhREO1I42KnT4sMeITn8y8hKyuP0nM22QF4S18vOIlns1ZR
UPL+5yaRURUt5BCzC81e/JS1+TTNvA2J36BWs6V+lGbH12Tjv3J/BazbWzYDnljP
QCyYK+KxPaIm0aiP06mkQDa3xvKe5V8aT0Q8S2RZFgbDbYKRQeWns8VDLL8ygzsD
dK17VtlOC8d9SsXoEh5d53UQMah3ssONZMpMJVvscitBwhEOVBTm8lmorHcT7gej
fLCkLTrjMsT6t79ZnzdjH9yjBYXdSRPwu0lLm8YpeYiFXUwi5sAE0o1OXObmMiWQ
O2iHGD5ptnn2WyzQURiA0hOxMRZk9C54ijg+tihdPuddRepcSc7/WkfHobl+sXEK
ziUWm9qvtGzq7b/Pr2gQbsTX1HRjc+sq8pIYiu2j1RamR2CrSDobETm7VkKyTvIO
S3Fu/zrjBsw+MPtBdoJi1NL6OSKCwZHJiJXMIcSYw2fEJFq1EGzcgbBgF0X5U6ce
SH+ZxQrGxFhLi+nalQqyf+rRpWYOOKkMKdJvqpErPyPSZP0AHmFYnB/dSlvlntp0
Q7mrnGc7jFVe/dH+Q4bh3ZxIoicJcplGWtgirlv2N8w=
`pragma protect end_protected

//vcs_lic_vip_protect  
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
L63VAEsAFmxsAD4FvFaAP5Z9dUIyoU1UYFYim/tAtGhR+EVFJWuCFw20GUEj/gr1
1Rq0y3Cyx30TirWw+emhcuEuo+EzSn3L2h9lvpGHcaHl0hMzpdTrZufbBLF5m0Nw
hTj+4wYmxVKnlF5usAz0MJLwDEX4ToyiCzHdxDCGKyw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25658     )
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
ykZNnXrqo04NM7/vNLJErA==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_UVM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
C3lc0A+czY3zUbv3+qo0Y4Nc59nWHwZ9OtuiVbV2U0E+lJhE4GzxVUEaW+rAoaMM
54atw0y6XAchvKyKRJ6VToqjQfTWxX9+VKhgmGkKBOs1vC2EhnaXLJqtJgnSHdAs
SJjbUBsCyUmTRuAx8//s2KBE2zNx2oEQQ9IDGCjKj1w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25741     )
IamVuse/xbUZAdFuddQUcnzV+UGId3xNVtc19zwdKJs0hNk2j557I8K+UZW67Aty
cPvW5hjTgl7HrgAcXMBjhnOtZHAxBuCDv18VEfx0V9bMnchkVoZ7bYxGHbZPMo9c
`pragma protect end_protected
