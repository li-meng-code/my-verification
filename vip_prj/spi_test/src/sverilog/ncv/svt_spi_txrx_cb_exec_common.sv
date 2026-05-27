
`ifndef GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV
`define GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HhVhcebLDTyfxy4IF0GMBwX1gVIEk+AHhMYqE1eWHFVIvuB+UAREI1joiYzmjw2J
2ymRKlsDpcR3poxkQNErZHxmUjvFayhsxZOtm0HtMOgNG01zPfk5r0Y0bu77NCMv
VlUI48tisg4Blb6aSSKLurdvse2G14A7Lh/yjQoTclHT42Rg67K1eA==
//pragma protect end_key_block
//pragma protect digest_block
8TjIefI4oV8mUMi3SU8fTYZspnU=
//pragma protect end_digest_block
//pragma protect data_block
o4g0u9vXutz+vv6smaiUcJgZFEB2FHRZESitcEdw/kZ/5kcQ7yQfehZtF/A6CiZ8
Ldp2BnqZGt3nXdlLwOV6qXGP4/d4z6Tlh0gz3uBx2IFrSiJoHrhPol7A2JgNtYZf
/fjfukRF+51X4z0jVxfXDqCzviI9N0Q+fw+giOQgxoDzh88z39J2cSyjDlDn7qu6
mJFeDsMS6gnvEqDsuelABD3ond/1/nYDq4mFAewkauuNNYbaevf/KmB/HRcoGEr+
gLqBym9y10g0WpELeLW6oSlMnA6SyPJe+SiEjOZvERb0pOhWIGqDUzpnacPH6MlM
3GvSsPq1B7OpRb6E/nb9Ij+ItuEK+ln6IlI/TpoNDtVnPu6OZXGWHL6kWYGB3K1T
BU/HELmLmlBreUlnWO4+M+taAp+U06zlGUpDFamNk1J8kPXBAvS9iChHLP6w8OGG
VBrLAJ99ClZVGG0B0PefBbOb64KLkUs9Gh4hINA2ttsgOzj5IEEWqMkNjtSe82iv
CTvgq+gID3E15Rqxl+HLp7cEE8FSlckqn2yPW72r6z7G0GE6q0cn13z6J2vjax2J
jkpoz7QXjjTR19AAEHK5M7SsUbQlsc+k+lz2jp1hMAd7nANTwALwviUG7a+qN/0h
rKRwkyUBI7QBRtDsbWnxzoYFGqFp0ZFtwRPxE7HLo3+93Lqnz+F9k78ikhim6d/u
p7vf/Fpv2ugFoEmEZpevJ22VXjefYkCri+14LB7FvWAiCFelUpqNYRChrhlGwBF9
H6El6uoiwqkSdgb7/KVFPmj45ZedHjlJarjFMCtWxO4IQpBUz4h1gsX6yXEP11+o

//pragma protect end_data_block
//pragma protect digest_block
jlPBm6UE17JYaUZrHofYKZVmGQE=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
/**
 * SPI TxRx callback execution class defines the cb_exec methods supported
 * by the TxRx component.
 */
virtual class svt_spi_txrx_cb_exec_common;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   */
  extern function new();
  
  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction out of its
   * SPI Transaction input, but before acting on the SPI Transaction in any way.
   *
   * This method issues the <i>`SVT_SPI_TXRX_CB_EXEC_COMMON_POST_CB_NAME</i>
   * callback using the svt_do_obj_callbacks macro, as well as the
   * <i>`SVT_SPI_TXRX_CB_EXEC_COMMON_POST_CB_NAME</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual task post_seq_item_get_cb_exec(svt_spi_transaction xact, ref bit drop);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_out_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_out_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual task pre_transaction_out_put_cb_exec(svt_spi_transaction xact, ref bit drop);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component after placing the SPI Transaction in the output.
   *
   * This method issues the <i>transaction_out_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_out_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task transaction_out_cov_cb_exec(svt_spi_transaction xact);
  endtask  

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
   */
  virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);
  endtask

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
   */
  virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);
  endtask

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
   */
  virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);
  endtask

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
   */
  virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has finished tranmsitting its last data bit over SPI lane(s).
   * This is used to update the data content dynamically while current transaction is in progress.
   * In Master Mode, additional clocks will be generated to transmit the new data bits.
   * Data driving to remain as it is.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * This callback is currently supported for SPI-Bus mode only. 
   * Only svt_spi_transaction::data and svt_spi_transaction::data_frame_size fields are expected to be updated by User for this callback.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */  
  virtual task load_tx_fifo_cb_exec(svt_spi_transaction xact);
  endtask
endclass

/** @endcond */

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
rrJlo0fIrkrQ3qGIoTekWq/kEqqJsqMOuJG9f3DBz9/SSVa3xzgqZJ7nrWxlTXjg
9NlRBXcAhudXP0pxZiF3BeG2boXZUK+Rfh5R9fZUkwLyFNm9VXH+7abVk9yxhMap
7QFTdAXO5gtHcOApCxnVwkgkUAsLVEbCwqoCwkAAc+LPzFy3JS/N/A==
//pragma protect end_key_block
//pragma protect digest_block
vXCfsu1KsesD3Rs33SCwOX+Fw94=
//pragma protect end_digest_block
//pragma protect data_block
YSdA1psP7HMOoJLApBQ+pH21o2mXRRJTQzqnU1hKm35Ugb94/Lzyz2fIk2OLfJWL
O0GUsuBH+5vHS46jAfBQ923EsVzN129TOSdEdmAoIY3oInmxRVdGvNGqsImbzNcZ
S9R7NRF35z9e7tZeJZ7m0OCtwHhYpJp+2usnRPrGkJ0qiiCIribMtXMOw4BTjACh
ah4Hs1Iu0N4TMWJjX2oO+0+cmj4axpEM8VkCoSL5DrMI6eaJsu4sBpwmgkRtzX3o
wxQajw1FIt2b2phCCndMAlmnI+cghd8tBAXzbBAGGiC/WijK6vtoxoM+uJYqrQ86
pVdPidu0iHHGzoRBNk8KLufq5LeEufuJD+cbYTKcWiKuMsS3SladpFMbXBDcNXkr
ypmKtnYocvKgfFJ38ycpP/kBTxaWyMBrsHkw/aGtwg9MgznuZZh/1f62eFCMIfNE
PG3oGcmpshWijWQHgDcu3aX8qQHLsbHRnHU7ZTp/Pj1GhbtInzfSMrMYqoNTgeIL
pphpob/kuYUqdwE88hpuvPUP3tkVhB0J8KT3TghA3juCUMZOrsEQTDa717DzdYio
jFYKK0jXhuLXID1dLDcfuZm3NhBn22JyQVIzgw6XUdx7uAjqEwKO51BtXngMnwXG
J1ZSIg+2SL2/c0RMXI89l2NlMJqEJHQY2ZSkwOjT7ss=
//pragma protect end_data_block
//pragma protect digest_block
K0xHeeiUAD3AaoJol5sh2O4h0aU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV
