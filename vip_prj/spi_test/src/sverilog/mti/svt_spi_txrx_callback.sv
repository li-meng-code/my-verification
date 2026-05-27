
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VgLdgiF+5mVU2DOJ/mIGJC6fYocI51xAPnn4FzmotdJsrBtHfIC2PpoFT82J6sCL
SNJCcOztJicGvMbJ7SV+EfGmDdscsQutZtRzGTS355PyybFsDeaV4d099RlGnysj
XwU9VEzK+zks6ZLC05sYDgFmQIXgn/h+hoOUL3RreCo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 538       )
UQplVVZzDKlOVNTbTxfZhXqj3Rzlv51Yz1P13yHvCC8Wko9TbYXMby7Uql4FjIPF
q0fKa+3fuxGTYYegf8N+aaDWrZR3f9/qQ797ESDcnIg6GOvzoj9hbzylcMsX//43
KRhkHxoUNvvKESmg6VNAion0NsKk1uFLs3QAdvczcQRXWvCqbbqNfUfJgA4mte75
31cKTkdY6CBdkZM3k+53yvhbw7WLl1kVYpYb1AEYB/jzU1k68DUpPSHEZUuIQ6wI
Dfl5cW8fg7egsdFZuFzKbHPqkbS3haXgZEmvpKF0oH7UHsM1EsqhwqDj1XvTxDpv
2VpGieIj4g9NHfcpE6wKY6+bJum9uutmSJ2DCnvKqAJCbKrYNAYGSWLRAE5yfal2
BG4qIudElY3JdVv8gNP+uX6UMkKqNLbBI4UyStLsfp9ZCi/Tny7VRprKzryER9hp
vvgt2ENQIbrSI2vtAuyMbtOQO8K+LJMTR+GPpbKagRpQxC+/C/JHkiNd8gE7jS9O
1Ha3mwmER8BHexNpSCwsLZ9SPJItCVwWaculmkff5m6OeWTjLP8HlIQcz2b3FZu+
Fx+YACA5exeLS08iky7rTaGpvySEn/1im8xFL37JRNMfJZTFDbvctGfujShrj03V
e/9Tv2Jj0d5mmqgxM6fddzpEiZUxavizm2Veu8KQGIPT7+9EDsBQ18nBwN8HOm5q
wZjZJtFrWGQ/ZDJGJIRQCQ==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
N4aBOMrtfihgtwocvRI70fhMzq1Z3l/g2n1xpr1AxXlvAzmDhD70cdhJcTDXb8R7
YLIPvokx2Tmo8gOsjvJJ+XjALdXZjgc/vRiqnbY3wFEIRT5lFqZhjmNHEZcmo5oZ
hGk2fbkT+z9tzH1Hky60JGAtF4nRSe9BV262aolN4uA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 621       )
5EHr3x79X4xXF8+Ou68Do+Lmyg+wu7Qn2zlRZAdqkclzHpd5rsLlhoKy38/PJih7
hnuhNGsyIG5thR38yt9hjRe/TgaJF2cnHJK+O0rBAQO/qJhsepRH2Av/dAYB7EiG
`pragma protect end_protected
