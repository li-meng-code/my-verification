
`ifndef GUARD_SVT_SPI_TXRX_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_CALLBACK_SV

typedef class svt_spi_txrx;

// =============================================================================
/**
 * SPI : TxRx callback class
 * defines the component callback methods.
 */
`ifdef SVT_VMM_TECHNOLOGY
class svt_spi_txrx_callback extends svt_xactor_callbacks;
`else
class svt_spi_txrx_callback extends svt_callback;
`endif

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new();
`else
  extern function new(string name = "svt_spi_txrx_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_callback";
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after pulling a SPI Transaction out of its
   * SPI Transaction input, but before acting on the SPI Transaction in any way.
   *
   * @param txrx A reference to the component object issuing this callback. User's
   * callback implementation can use this to access the public data and/or methods of
   * the component.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
`ifdef SVT_VMM_TECHNOLOGY
  virtual function void post_transaction_in_get(svt_spi_txrx txrx, svt_spi_transaction xact, ref bit drop);
`else
  virtual function void post_seq_item_get(svt_spi_txrx txrx, svt_spi_transaction xact, ref bit drop);
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual function void pre_transaction_out_put(svt_spi_txrx txrx, svt_spi_transaction xact, ref bit drop);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after placing the SPI Transaction in the output. 
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_out_cov(svt_spi_txrx txrx, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been started on tx path.
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_started_tx(svt_spi_txrx txrx, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been started on tx path.
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_started_rx(svt_spi_txrx txrx, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended.
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_ended_tx(svt_spi_txrx txrx, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended.
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_ended_rx(svt_spi_txrx txrx, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has finished tranmsitting its last data bit over SPI lane(s).
   * This is used to update the data content dynamically while current transaction is in progress.
   * In Master Mode, additional clocks will be generated to transmit the new data bits.
   * Data driving to remain as it is.
   *
   * @param txrx A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest. <br/>
   * This callback is currently supported for SPI-Bus mode only. 
   * Only svt_spi_transaction::data and svt_spi_transaction::data_frame_size fields are expected to be updated by User for this callback.
   */
  virtual function void load_tx_fifo(svt_spi_txrx txrx, svt_spi_transaction xact);
  endfunction
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HMCi/+FdSOcEZlM7I4G08G/oFliZQ09lTD1N9j62M1te/Ky15IlhpwpL+3cEXpO6
ElQGLclCjihmWUCVsJV8M3S2+K5R4Qhg89rZQqJ1P90s2YgZ2L6JjnEO7UNd+ndw
KWIHkbHFM5jvk1HayzK7VZxWpCbFlR3DrPhUrCYi4JOX+brMfZ8bXg==
//pragma protect end_key_block
//pragma protect digest_block
FLZEMCebsiqjfeIcje0CtYrjdl0=
//pragma protect end_digest_block
//pragma protect data_block
XrDbnQfGmwNwSM5ZRhnKTAvlDpts9kEcW4oTvzMIKXRkooD2eJCYvV1GMF0P0alo
LJzYO+i1mq0ePEiv4b+z4S0zHfes4otefpbcQ6D3uLnLrFIznkuZHloBI8Hw8r6/
BQPTrTTIkhhumPLIgJ5osf3yj1INfkpjzGXkixuMhZBJrpfjpJReT/rH06WlmP96
CuBhNWxbszEJ1vfUsYvCszLKr6Ufnyt01rWMo9kGRjK8wF65G7wkQmDjDbFth3YG
2ZobDuoAZSYteWcPAFRZP837mGlo4lBz3aMaUMyT2mnXZqF5hDFBNGmjP/kg6EXR
d60vBUst0de2oRCkUJVE+PNslrlsZmVY1GkGYkuDDrokMk7W0zMS0+fMbaYm0Xw2
hw54Zyu9XXyvL2Pt4iECDh2xXIZoxgsM246Uqn9Go03ue9c0pBUy43sqIQ7ptQjq
wY34XVZWTmAUE0rn1hsFpBCYP7SegeR91XjON2XiAu3ugXN5vD6OGk0hWLnDbm/t
tq92jQio7zGBERbEQOnhf7cTTBy1Kr0Qfp4/JhnqAVJDmrZuUvJ1wO9x3CGhehsE
n5PJpKEcJnjnfZYQMWWT8Uw5Wfgz9qd9dyIaD58UxALIUYCtk0t/oOKPYpwYzH0b
nzyGW2v/lmRgsGaYKkLh13XIbaZCope9BVoEtUpm7R65tzqGK78WWasj3jkXPfIh
XV14Pz7Anr/EFeUySfCp484e488PsjLFD0JBClo7nAzakg672e5ZHU20V+Xlmb96
XyGj1Qj+eFSBA/G7TX1ThrCNbUXnGkIJJTh6YbBlRkca2sJlYQfW76D9YFFft0VA
e911zCg51/kcLO7Zyef7i20IFv4rumbJ6pqBGPvyAXrfj60waUpVWkb7nX7Jy9K+
zbq9sca5VPGsPGnzUychdDxT57ZvPZMqsAkscWM7gmI=
//pragma protect end_data_block
//pragma protect digest_block
LO2M2sIi+ZQOnz+EFrYxBkO7jZg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_CALLBACK_SV
