
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
FP6vTPnvkzpegkWdwK9li5L1KW8/q9m+9WVGxSQlj07Ab5AA6BpLnSWC9+rPLJxb
dDxH+yUcL+PomjG6QLUTI1xFrFOcsgFrG88iR3zO3UgLK+m0HBpLoqF+QNw7bn1b
dayMPSskMGbfCwo5JDrKPaCcSrxyk53a/RBHgDTBe/Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3456      )
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
b9pD4B3ewHL+euY2xOqe/A==
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
G7iizsyVAyIlEcLgBmFxFQ+fOZy6hZrJ9SkrrPh2558HbtU5nmJLiHJHVi02Or4l
J7WuGIoqrQltmtkuHhbNeLZQ2QfRpIGQwK0Gk0X/wwEAQUKfwL5r2nVNvWKTVnf4
piozK3hBGdQwZn5yeqWaUOjCgpRpp+IOpU+N1QbMMYw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3921      )
RwKKuY2fCtZZ0FKcWqUBqabO53KJ2zBO45+gMiF7QKMW0cSz+IdV4Lf2ZgkiS2JI
xTl0jb8acFlakP2bmXyrNaUFnFpTqkvyBpORlbOJvvtIvn+XRoudpkobsnY0H8+2
eQdWAvnFpu2LTmBKJr5VNvRYA6OiiRzv+oQQzUiTAENrA4s2qnXlDyLcnea5xtZs
ZwFegr63sBGSAgcf0gNoowTsVHjLsWDJyJo/2bqcngaFNdGp9Vf2s6nQIFggtV8d
heiKPcQA96ziew+RvDKbwfEokWTa8qm/SF27cULp0cdGJJl1KtDKAET9X74n8fCX
kut5CBIbRQ9ocr5n54fBhr+D1ZrOL0gTZHEl3pD1Od2wHjElvYbzOnut522l6K77
V93I9cQRql4rTpLXkDGq18oMxK03Z0nd22zxu6zUc/cvrEW5dNp5ZOS0MuX8aUYn
I9gjj3/3z3nECS/c5JYsntO+IBKLCQWLl/BZuBZHZ/6h8icoE1YgfvwNnUvje8zH
/OtL4+S8neOmvvH3Pf/jshWwJq9VtehPY2oCyOZbH28cg3OSKN7FK3o3f881OUsH
NpiAWVX3bOLOCGFh1M88TMchcMooeUMlDzC7gKiEZu0q0HkUdhQYm5T6aaMmy/Kx
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MjLZikms1/wyE7Cmpr77oYlN/AEyh5jtcb4ICR4zRfCCGD1SuZ/GBxYcN9j0V9ms
BbCEPw3lgXrAAQqkxuozzgPyG9yA339oq5iwZ31ajUWqYuYES8bzai0QvorPm9il
Dyq5cRowD/8LVo6u7zmrMBBsZjOE3X2OjZ3LZ7GLLsE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17910     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Qj+M/YkJxZ5afQILNIvI2ecl3kPRYT9XhgFWmCS5KiSKMV4jxP8W2bdD8qiSnv4D
1gRDg5pBtf0Q/P8tCcAHvfKVvMRgQUWr2/qblkb/C0GkQ7LuY5/kBN8Op9tz+Cqx
EfAc9Bq9aw8F3ENY/2axf0tJR76Qn5IFYhlFf3i2gVo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17993     )
NC/FVgzBBKD82MNahjuJZaDyHg+BjjlTQgwDhdrz8sO72Sz37UQpin1AxyZeWDFX
r33Zs39VC00qdQbESVj5FZZOt65NAr+QatbhRWx8hbL+qOxuAliH7RfGTW6uA30W
`pragma protect end_protected
