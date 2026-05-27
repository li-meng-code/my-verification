
`ifndef GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV
`define GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VCiTL6QMglDfxJ7/sI0mdSZ+HJz2h4/h6xgCV4a+U6xxMEakIDCt8MwklF9F2/Ii
SVXBvjrS4KRHpWkTZs0l/QYk7ShNfqqYCVEX2aqMMo6H1UHM/snDzIZNH4JQRAdp
hRsfXtL1r52RYf4S/c9gOnh/HhT3pTx9iwlAAhVTo18=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 450       )
YkiOJATgIEc26jDOoaZZJ6HhJJUrh+25mcn4Reil1tDxNDQ9ndaKlf6Pu0897X6Z
ehaiAcsB8BLC3u3gM363gAfX0LHDp2zLFnvFsa+WIz4f+Q3b/MlyA3JfY26uPf/C
LsDIoz/STd1RcM6FDm4e7jshehYELdPRNfgxBtImCs+PWLs+p+f/IrJuYKXQA5HW
JjQIoxMFgtfoVNLpB2Ec/jEsiJPstYTlP8ZIM6H8UXr3IsGvrBbX9hyXQ2xmipZC
8s4D9pgnchIJuMwfMOXahXjDqO0nJAsdhuBU6ST78/eWu2iMRHvp9Z4EaRxgj+EQ
SazIL8ZGe69oB2n1BvG8gnrD07oWaOcSRg7ho7T6ySjc8sPIAuOEkRM2I3BaFXOL
hyEXjBu8dt0Wt8s+4fLpEWzuoLYLvlDffxccJDJqh0GJsmRNBaJ/7EIkxEfSXbko
EVzQG2LVOKEccgfBMdG83nemv8f0QGBlUvGDzqV78LNTyZZ5qkHf/XyhiUTSOVWm
q/WAXVzbQCIyaJQvnQUr/sMkIXWR89MigJGrhZ6NWfvbs/RMqMzxDFVsefEkBESX
/X94Qx/MQYCbyZ5XUut69k+hODX2jI2BOD4lQ169vXE=
`pragma protect end_protected

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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QsodFwBtgLGBiBLBz9GKzgZBkBUTdlwdt7yOsuu2s4pMLaJL/xY1caLK6+CW2cBA
LL5cieQPUuYZAZ6PXBWmJOH7q6tETyVQnpXoGqiVcCfuCWNvuBjQBAroC995B44U
5m/6BXt4fmvMloUnW4a3ZLGTTLEl6Cs3RRpOPsubOiI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 787       )
hzfBvzl3AjQYBVi3+HTlKZk+TLWMyhkJ53cpxGw/2TDzNejfC9JN9ci45uxKP9B9
G6MpSsDLfgVK9O6Kz/LsYZpXgoZITryxAV/ys9wCFmJ2QwkbRfzzni+4azepOGmH
BHTaAul0r/0TR6Ms+6Kx1xelSedgi0xaLWfr9bqQDVTmYlvOMtf3ZvSkZeJiPUlK
e06sZTZ33x5Z6+U7OAEt6U4Fu6WSQPzYm/xotwolICb5eq+t1VzjdwwGw27FtGxs
eMPRdufKKBgodWgFcZScX47VoBP3QmpZBPpfv8ezPsbRUXezW599K6QrfJ1MoRvY
vAv6uNu/aK9RuZLMjUvbwdl9WBpvWZq178F80KG5KOZjQfuo94usF8nmPDfGMKqy
J5KVLfyX5CHDIncWAcU/6p3SKKlZeskJX5/RCGImzqCMdLjimgXuHRi/9l0lw9iS
5xyAsOtve3IMsbpp/7Vr7Q==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
msPsKI4RxkvpIjurMqyQn92LMsVkpRw9Aq3tmiS5eZjIc6WmvSsu5O0SjtCifnlp
4M8ia9deNEM7Pj8toUsTyDOtVkV0ajuityq8CDguGuDZgkytj7KGagB0Jzy4V5Et
0FdwGKvfn3bPwyDv4GWp9+/40JSnuBDrVBsIdtdG11E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 870       )
3w6J5Vyiki89XmzWzc9N7HlqLz8vPZSYcQGn/zcPKSVP9wQT96em2rtuA14nC/k7
R2ywpNtBb5Z+H9+D7yLHhpGFtWDqgvaQoFi6WtAHFfB5k50vLz5B3EgfkryQKlWr
`pragma protect end_protected
