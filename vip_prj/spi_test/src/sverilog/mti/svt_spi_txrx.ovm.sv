
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
mUYxNxMjSQ8gaP2OYA1y/+o5yKJx/xkTeb67KwP+MnrI8yiJh+2pJETRw06KSaqi
sLxBlWDKTGwe4YBdXrVkKEnttfFhq1FfyZ9Kr7yBgEO8AJYnkmKXPBlNj3b61y7B
nOtHsRSa8nC3pmDlRTyRruapORH7uhGlnreCy4dxFoQ=
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
S59CLLoSEQTeojmRYOuUbUVhCG1uLGIQ1NQ3QoS1Op5KSq6nvgx8/K7IMeyBIWug
sW/h8+QlNhT2yf9uUg4IE6WE8mbbmdHBgM2FmmaC9rXWAe2NuYxybRixUCQ9U4pP
L7ajh+UxexNkpJMpYFupU0Y7Zf0hN6Zj9YtNasyeQF0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10262     )
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
xQgBsZ2oCDkvmw8BCZH2sQ==
`pragma protect end_protected

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PV4Ym9cexM88XQnU8TOckrju6saa1eI7iV+uF/Db9lynftJkyGGCWiUXqlraXo1Z
cU83a5HKecDHCbcr7UBVgpOXqaabaxvTnUbrpyN91EffP+M0uojoDkbeMYS0MKcc
DkyNEBMtEdGZYa3RD5cT9Nxm2QTPuzzjVA58C/NJ9FM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10715     )
PRhk6s5x52jrT0A1HXs1/LMwq2Igqusc22f1kP84oC+nXHmE6Y7nlT2DFya56n+t
0bedeZFjjgJ3XLWVinbjdcFkfTFXnVNb6MJa2NiQE0jooJNHQcj1/Rw2FaFa9rbS
jCcj75qAXI7OqmfhJc9p2lSGhLrmi4vD6/CBxV8L2y7TmahXobntKkuQj88y2N/k
c1DixkW6ILVjgkO/kgoglBJxo5T15kGDF3CN+6wtwchy7SWWmbBtUod591DhfPvj
O1ZtR/9dk1p2ZLl1frZqzuORqPNW7ICOBUxtT02x4xkL5+dLwcOyhIpwpaLNAhaD
sqRhWlerVxhbXraAqZYapsUWU44u/D5mso3CbZKJuK0lfRzLMtVEMLMeA8MBrKdH
MfvwPFHh2BSq0WrtmBOo5o5O6WbmAS71Y/f9+s9abUi1OLpN5Jr3dDVOEGmeWBPC
ryNV2kLoYPGlsEuSSt71+B44Rhp4bi2PqO7KgxZHS7u2evc00bgLMYFngHNuvzlT
K6OE4qnyDILIn7mh2NrVkewPfXb5f2zJXQ9jpZWE84q0D6W87gn1HrhOzVFI32AR
newQ25+CJmOazlUc0+Uwestp0KobRuheck//MtWWgUU=
`pragma protect end_protected

//vcs_lic_vip_protect  
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SNvdhp2Nlb4jdzd81ji1oZ7Ttuzc5y/9RGXpFpXSW6Jg7I5kJSeU3UoSFaXRrFP/
9Fc/Gg4kNr4v/LdICok/5s+5kkaYGchbSQx71nqMhro47iDB/LTugQ6RnyswnpPy
siJ9tn2b9GFAQTM8L7edp/lxnHtcIf9f/VZjaKWKfgE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25658     )
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
eA63F2kq9OWmpeVUUmm+9A==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_UVM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nZGldvTxwmFUxK14CimihhyeBME/mEBjoBigCXHK3nwWoueaM8heT5nF6esmjuw0
uC1QXy+d/fS0hMN2hKOZqEAiHgnPB24K7K1dTaJOEFAF/tr9vk5dH9L52YyrflbK
myQEmILMhqS0EC5YOWwW2Trr7SseiIram8ONtjn1LKE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25741     )
MLhUVrx4ciYuMQK6ajA35Ac0VSuYBINpqho/vdUdvfZtRHh56JFVV6XzEQUe6l+w
YTgNxAFJ98pFXqP0fqrJW41MI6bvPP3cp2yhlwx46JZIlJ0zBUOE9eXOIb0y26jJ
`pragma protect end_protected
